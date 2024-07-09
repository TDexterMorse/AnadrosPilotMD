/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 2015- The GROMACS Authors
 * and the project initiators Erik Lindahl, Berk Hess and David van der Spoel.
 * Consult the AUTHORS/COPYING files and https://www.gromacs.org for details.
 *
 * GROMACS is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2.1
 * of the License, or (at your option) any later version.
 *
 * GROMACS is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GROMACS; if not, see
 * https://www.gnu.org/licenses, or write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA.
 *
 * If you want to redistribute modifications to GROMACS, please
 * consider that scientific software is very special. Version
 * control is crucial - bugs must be traceable. We will be happy to
 * consider code for inclusion in the official distribution, but
 * derived work must not be called official GROMACS. Details are found
 * in the README & COPYING files - if they are missing, get the
 * official version at https://www.gromacs.org.
 *
 * To help us fund GROMACS development, we humbly ask that you cite
 * the research papers on the package. Check out https://www.gromacs.org.
 */
/*! \defgroup module_random Random engines and distributions (random)
 * \ingroup group_utilitymodules
 * \brief
 * Provides efficient and portable random generators and distributions
 *
 * <H3>Basic Use</H3>
 *
 * \Gromacs relies on random numbers in several different modules, and in
 * particular for methods that influence the integration we both require the
 * generation to be very fast and the resulting numbers of high quality.
 * In addition, it is highly desirable that we generate the same trajectories
 * in parallel as for a single-core run.
 *
 * To realize this, we have implemented the ThreeFry2x64 counter-based random
 * engine. In contrast to a normal random engine that is seeded and then keeps
 * an internal state, ThreeFry2x64 is derived from cryptographic applications
 * where we use a key to turn a highly regular counter int a stream of random
 * numbers. This makes it possible to quickly set the counter in the random
 * engine based e.g. on the timestep and atom index, and get the same random
 * numbers regardless of parallelization.
 *
 * The TreeFry2x64 engine has been implemented to be fully compatible with
 * standard C++11 random engines. There is a gmx::ThreeFry2x64General class that
 * allows full control over the accuracy (more iterations means higher quality),
 * and gmx::ThreeFry2x64 and gmx::ThreeFry2x64Fast that are specialized to 20
 * and 13 iterations, respectively. With 20 iterations this engine passes all
 * tests in the standard BigCrush test, and with 13 iterations only a single
 * test fails (in comparision, Mersenne Twister fails two).
 *
 * All these engines take a template parameter that specifies the number of
 * bits to reserve for an internal counter. This is based on an idea of
 * John Salmon, and it makes it possible to set your external counter based
 * on two simple values (usually timestep and particle index), but then it is
 * still possible to draw more than one value for this external counter since
 * the internal counter increments. If you run out of internal counter space
 * the class will throw an exception to make sure you don't silently end up
 * with corrupted/overlapping random data.
 *
 * <H3>But what if I just want a vanilla random number generator?</H3>
 *
 * We've thought about that. Just use the gmx::DefaultRandomEngine class and
 * forget everything about counters. Initialize the class with a single value
 * for the seed (up to 64 bits), and you are good to go.
 *
 * <H3>Random number distributions</H3>
 *
 * The ThreeFry random engine is fully compatible with all distributions from
 * the C++11 standard library, but unfortunately implementation differences
 * (and bugs) mean you will typically not get the same sequence of numbers from
 * two different library implementations. Since this causes problems for our
 * unit tests, we prefer to use our own implementations - they should work
 * exactly like the corresponding C++11 versions.
 *
 * The normal distribution is frequently used in integration, and it can be
 * a performance bottleneck. To avoid this, we use a special tabulated
 * distribution gmx::TabulatedNormalDistribution that provides very high
 * performance at the cost of slightly discretized values; the default 14-bit
 * table gives us 16,384 unique values, but this has been thoroughly tested to
 * be sufficient for all integration usage.
 *
 * \author Erik Lindahl <erik.lindahl@gmail.com>
 */
/*! \file
 * \brief Implementation of the 2x64 ThreeFry random engine
 *
 * \author Erik Lindahl <erik.lindahl@gmail.com>
 * \inpublicapi
 * \ingroup module_random
 */

#ifndef GMX_RANDOM_THREEFRY_H
#define GMX_RANDOM_THREEFRY_H

#include <array>
#include <limits>
#include <memory>

#include "gromacs/math/functions.h"
#include "gromacs/random/seed.h"
#include "gromacs/utility/classhelpers.h"
#include "gromacs/utility/exceptions.h"

/*
 * The GROMACS implementation of the ThreeFry random engine has been
 * heavily inspired by the versions proposed to Boost by:
 *
 * John Salmon, Copyright 2010-2014 by D. E. Shaw Research
 * https://github.com/DEShawResearch/Random123-Boost
 *
 * Thijs van den Berg, Copyright (c) 2014 M.A. (Thijs) van den Berg
 * https://github.com/sitmo/threefry
 *
 * Both of them are covered by the Boost Software License:
 *
 * Boost Software License - Version 1.0 - August 17th, 2003
 *
 * Permission is hereby granted, free of charge, to any person or organization
 * obtaining a copy of the software and accompanying documentation covered by
 * this license (the "Software") to use, reproduce, display, distribute,
 * execute, and transmit the Software, and to prepare derivative works of the
 * Software, and to permit third-parties to whom the Software is furnished to
 * do so, all subject to the following:
 *
 * The copyright notices in the Software and this entire statement, including
 * the above license grant, this restriction and the following disclaimer,
 * must be included in all copies of the Software, in whole or in part, and
 * all derivative works of the Software, unless such copies or derivative
 * works are solely in the form of machine-executable object code generated by
 * a source language processor.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
 * SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
 * FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

namespace gmx
{

namespace internal
{
// Variable-bitfield counters used to increment internal counters as
// part of std::arrays.

struct highBitCounter
{
    /*! \brief Clear highBits higest bits of ctr, return false if they were non-zero.
     *
     *  This function clears the space required for the internal counters,
     *  and returns true if they were correctly zero when calling, false otherwise.
     *
     *  \tparam        UIntType  Integer type to use for each word in counter
     *  \tparam        words     Number of UIntType words in counter
     *  \tparam        highBits  Number of bits to check. The template parameter makes it
     *                           possible to optimize this extensively at compile time.
     *  \param         ctr       Reference to counter to check and clear.
     */
    template<class UIntType, std::size_t words, unsigned int highBits>
    static bool checkAndClear(std::array<UIntType, words>* ctr)
    {
        const std::size_t bitsPerWord = std::numeric_limits<UIntType>::digits;
        const std::size_t bitsTotal   = bitsPerWord * words;

        static_assert(highBits <= bitsTotal, "High bits do not fit in counter.");

        const std::size_t lastWordIdx       = (bitsTotal - highBits) / bitsPerWord;
        const std::size_t lastWordLowBitIdx = (bitsTotal - highBits) % bitsPerWord;
        const UIntType    lastWordOne       = static_cast<UIntType>(1) << lastWordLowBitIdx;
        const UIntType    mask              = lastWordOne - 1;

        bool isClear = true;

        for (unsigned int i = words - 1; i > lastWordIdx; --i)
        {
            if ((*ctr)[i])
            {
                isClear   = false;
                (*ctr)[i] = 0;
            }
        }
        if (highBits > 0 && (*ctr)[lastWordIdx] >= lastWordOne)
        {
            isClear = false;
            (*ctr)[lastWordIdx] &= mask;
        }
        return isClear;
    }

    /*! \brief Increment the internal counter in highBits by one
     *
     *  \tparam         UIntType  Integer type to use for each word in counter
     *  \tparam         words     Number of UIntType words in counter
     *  \tparam         highBits  Number of bits reserved for the internal counter.
     *  \param          ctr       Reference to the counter value to increment.
     *
     *  \throws InternalError if internal counter space is exhausted.
     *
     *  This routine will work across the word boundaries for any number
     *  of internal counter bits that fits in the total counter.
     */
    template<class UIntType, std::size_t words, unsigned int highBits>
    static void increment(std::array<UIntType, words>* ctr)
    {
        const std::size_t bitsPerWord = std::numeric_limits<UIntType>::digits;
        const std::size_t bitsTotal   = bitsPerWord * words;

        static_assert(highBits <= bitsTotal, "High bits do not fit in counter.");

        const std::size_t lastWordIdx       = (bitsTotal - highBits) / bitsPerWord;
        const std::size_t lastWordLowBitIdx = (bitsTotal - highBits) % bitsPerWord;
        const UIntType    lastWordOne       = static_cast<UIntType>(1) << lastWordLowBitIdx;

        // For algorithm & efficiency reasons we need to store the internal counter in
        // the same array as the user-provided counter, so we use the higest bits, possibly
        // crossing several words.
        //
        // To have the computer help us with the dirty carry arithmetics we store the bits
        // in the internal counter part in normal fashion, but the internal counter words in
        // reverse order; the highest word of the total counter array (words-1) is thus
        // the least significant part of the internal counter (if it spans several words).
        //
        // The incrementation works as follows:
        //
        // 0) If the index of the least significant internal counter word is larger
        //    than words-1, there was never any space.
        // 1) If the internal counter spans more than one word, we must have one or
        //    more internal counter words that correspond entirely to the this counter.
        //    Start with the least significant one (words-1) and increment it.
        //    If the new value is not zero we did not loop around (no carry), so everything
        //    is good, and we are done - return!
        //    If the new value is zero, we need to move the carry result to the next word,
        //    so we just continue the loop until we have gone through all words that
        //    are internal-counter-only.
        // 2) After the loop, there is stuff remaining to add, and by definition there
        //    is some internal counter space in the next word, but the question
        //    is if we have exhausted it. We already created a constant that corresponds
        //    to the bit that represents '1' for the internal counter part of this word.
        //    When we add this constant it will not affect the user-counter-part at all,
        //    and if we exhaust the internal counter space the high bits will cause the entire
        //    word to wrap around, and the result will be smaller than the bit we added.
        //    If this happens we throw, otherwise we're done.
        //
        // Since all constants will be evaluated at compile time, this entire routine
        // will usually be reduced to simply incrementing a word by a constant, and throwing
        // if the result is smaller than the constant.

        if (lastWordIdx >= words)
        {
            GMX_THROW(InternalError(
                    "Cannot increment random engine defined with 0 internal counter bits."));
        }

        for (unsigned int i = words - 1; i > lastWordIdx; --i)
        {
            (*ctr)[i]++;
            if ((*ctr)[i])
            {
                return; // No carry means we are done
            }
        }
        (*ctr)[lastWordIdx] += lastWordOne;
        if ((*ctr)[lastWordIdx] < lastWordOne)
        {
            GMX_THROW(InternalError("Random engine stream ran out of internal counter space."));
        }
    }

    /*! \brief Increment the internal counter in highBits by a value.
     *
     *  \tparam        UIntType  Integer type to use for each word in counter
     *  \tparam        words     Number of UIntType words in counter
     *  \tparam        highBits  Number of bits reserved for the internal counter.
     *  \param         ctr       Reference to the counter to increment.
     *  \param         addend    Value to add to internal.
     *
     *  \throws InternalError if internal counter space is exhausted.
     *
     *  This routine will work across the word boundaries for any number
     *  of internal counter bits that fits in the total counter.
     */
    template<class UIntType, std::size_t words, unsigned int highBits>
    static void increment(std::array<UIntType, words>* ctr, UIntType addend)
    {
        const std::size_t bitsPerWord = std::numeric_limits<UIntType>::digits;
        const std::size_t bitsTotal   = bitsPerWord * words;

        static_assert(highBits <= bitsTotal, "High bits do not fit in counter.");

        const std::size_t lastWordIdx       = (bitsTotal - highBits) / bitsPerWord;
        const std::size_t lastWordLowBitIdx = (bitsTotal - highBits) % bitsPerWord;
        const UIntType    lastWordOne       = static_cast<UIntType>(1) << lastWordLowBitIdx;
        const UIntType    lastWordMaxVal    = (~static_cast<UIntType>(0)) >> lastWordLowBitIdx;

        if (lastWordIdx >= words)
        {
            GMX_THROW(InternalError(
                    "Cannot increment random engine defined with 0 internal counter bits."));
        }

        for (unsigned int i = words - 1; i > lastWordIdx; --i)
        {
            (*ctr)[i] += addend;
            addend = ((*ctr)[i] < addend); // 1 is the carry!
            if (addend == 0)
            {
                return;
            }
        }

        if (addend > lastWordMaxVal)
        {
            GMX_THROW(InternalError("Random engine stream ran out of internal counter space."));
        }
        addend *= lastWordOne;

        (*ctr)[lastWordIdx] += addend;

        if ((*ctr)[lastWordIdx] < addend)
        {
            GMX_THROW(InternalError("Random engine stream ran out of internal counter space."));
        }
    }
};
} // namespace internal

/*! \brief General implementation class for ThreeFry counter-based random engines.
 *
 *  This class is used to implement several different ThreeFry2x64 random engines
 *  differing in the number of rounds executed in and the number of bits reserved
 *  for the internal counter. It is compatible with C++11 random engines, and
 *  can be used e.g. with all random distributions from the standard library.
 *
 *  ThreeFry is a counter-based rather than state-based random engine. This
 *  means that we seed it with a "key", after which we can get the
 *  N:th random number in a sequence (specified by a counter) directly. This
 *  means we are guaranteed the same sequence of numbers even when running in
 *  parallel if using e.g. step and atom index as counters.
 *
 *  However, it is also useful to be able to use it as a normal random engine,
 *  for instance if you need more than 2 64-bit random values for a specific
 *  counter value, not to mention where you just need good normal random numbers.
 *  To achieve this, this implementation uses John Salmon's idea of reserving
 *  a couple of the highest bits in the user-provided counter for an internal
 *  counter. For instance, if reserving 3 bits, this means you get a stream of
 *  8 iterations (each with 2 random values) after every restart. If you call
 *  the engine after these bits have been exhausted, it will throw an
 *  exception to make sure you don't get overlapping streams by mistake.
 *  Reserving 3 bits also means you can only use 64-3=61 bits of the highest
 *  word when restarting (i.e., setting) the counters.
 *
 *  This version also supports using internalCounterBits=0. In this case the
 *  random engine will be able to return a single counter round, i.e. 2 64-bit
 *  values for ThreeFry2x64, after which an exception is thrown. In this case no
 *  high bits are reserved, which means the class implements the raw ThreeFry2x64
 *  random function.
 *
 *  \tparam rounds  The number of encryption iterations used when generating.
 *                  This can in principle be any value, but 20 rounds has been
 *                  shown to pass all BigCrush random tests, and with 13 rounds
 *                  only one fails. This is a very stringent test, and the
 *                  standard Mersenne Twister engine fails two, so 13 rounds
 *                  should be a perfectly fine balance in most cases.
 *  \tparam internalCounterBits
 *                  Number of high bits in the user-provided counter reserved
 *                  for the internal counter. The number of values the engine
 *                  can return after each restart will be
 *                  words*2^internalCounterBits.
 */
template<unsigned int rounds, unsigned int internalCounterBits>
class ThreeFry2x64General
{
    // While this class will formally work with any value for rounds, there is
    // no reason to go lower than 13, and this might help catch some typos.
    // If we find a reason to use lower values in the future, or if you simply
    // want to test, this assert can safely be removed.
    static_assert(rounds >= 13,
                  "You should not use less than 13 encryption rounds for ThreeFry2x64.");

public:
    // result_type must be lower case to be compatible with C++11 standard library

    /*! \brief Integer type for output. */
    typedef uint64_t result_type;
    /*! \brief Use array for counter & key states so it is allocated on the stack */
    typedef std::array<result_type, 2> counter_type;

private:
    /*! \brief Rotate value left by specified number of bits
     *
     *  \param i    Value to rotate (result_type, which should be 64-bit).
     *  \param bits Number of bits to rotate i.
     *
     *  \return Input value rotated 'bits' left.
     */
    result_type rotLeft(result_type i, unsigned int bits)
    {
        return (i << bits) | (i >> (std::numeric_limits<result_type>::digits - bits));
    }

    /*! \brief Perform encryption step for ThreeFry2x64 algorithm
     *
     *  It performs the encryption step of the standard ThreeFish symmetric-key
     *  tweakable block cipher, which is the core of the ThreeFry random
     *  engine. The number of encryption rounds is specified by the class
     *  template parameter 'rounds'.
     *
     *  \param key   Reference to key value
     *  \param ctr   Counter value to use
     *
     *  \return Newly encrypted 2x64 block, according to the class template parameters.
     */
    counter_type generateBlock(const counter_type& key, const counter_type& ctr)
    {
        const unsigned int rotations[] = { 16, 42, 12, 31, 16, 32, 24, 21 };
        counter_type       x           = ctr;

        result_type ks[3] = { 0x0, 0x0, 0x1bd11bdaa9fc1a22 };

        // This is actually a pretty simple routine that merely executes the
        // for-block specified further down 'rounds' times. However, both
        // clang and gcc have problems unrolling and replacing rotations[r%8]
        // with constants, so we unroll the first 20 iterations manually.

        if (rounds > 0)
        {
            ks[0] = key[0];
            ks[2] ^= key[0];
            x[0]  = x[0] + key[0];
            ks[1] = key[1];
            ks[2] ^= key[1];
            x[1] = x[1] + key[1];
            x[0] += x[1];
            x[1] = rotLeft(x[1], 16);
            x[1] ^= x[0];
        }
        if (rounds > 1)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 42);
            x[1] ^= x[0];
        }
        if (rounds > 2)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 12);
            x[1] ^= x[0];
        }
        if (rounds > 3)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 31);
            x[1] ^= x[0];
            x[0] += ks[1];
            x[1] += ks[2] + 1;
        }
        if (rounds > 4)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 16);
            x[1] ^= x[0];
        }
        if (rounds > 5)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 32);
            x[1] ^= x[0];
        }
        if (rounds > 6)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 24);
            x[1] ^= x[0];
        }
        if (rounds > 7)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 21);
            x[1] ^= x[0];
            x[0] += ks[2];
            x[1] += ks[0] + 2;
        }
        if (rounds > 8)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 16);
            x[1] ^= x[0];
        }
        if (rounds > 9)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 42);
            x[1] ^= x[0];
        }
        if (rounds > 10)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 12);
            x[1] ^= x[0];
        }
        if (rounds > 11)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 31);
            x[1] ^= x[0];
            x[0] += ks[0];
            x[1] += ks[1] + 3;
        }
        if (rounds > 12)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 16);
            x[1] ^= x[0];
        }
        if (rounds > 13)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 32);
            x[1] ^= x[0];
        }
        if (rounds > 14)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 24);
            x[1] ^= x[0];
        }
        if (rounds > 15)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 21);
            x[1] ^= x[0];
            x[0] += ks[1];
            x[1] += ks[2] + 4;
        }
        if (rounds > 16)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 16);
            x[1] ^= x[0];
        }
        if (rounds > 17)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 42);
            x[1] ^= x[0];
        }
        if (rounds > 18)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 12);
            x[1] ^= x[0];
        }
        if (rounds > 19)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], 31);
            x[1] ^= x[0];
            x[0] += ks[2];
            x[1] += ks[0] + 5;
        }

        for (unsigned int r = 20; r < rounds; r++)
        {
            x[0] += x[1];
            x[1] = rotLeft(x[1], rotations[r % 8]);
            x[1] ^= x[0];
            if (((r + 1) & 3) == 0)
            {
                unsigned int r4 = (r + 1) >> 2;
                x[0] += ks[r4 % 3];
                x[1] += ks[(r4 + 1) % 3] + r4;
            }
        }
        return x;
    }

public:
    //! \brief Smallest value that can be returned from random engine.
#if !defined(_MSC_VER)
    static constexpr
#else
    // Avoid constexpr bug in MSVC 2015, note that max() below does work
    static
#endif
            result_type
            min()
    {
        return std::numeric_limits<result_type>::min();
    }

    //! \brief Largest value that can be returned from random engine.
    static constexpr result_type max() { return std::numeric_limits<result_type>::max(); }

    /*! \brief Construct random engine with 2x64 key values
     *
     *  This constructor takes two values, and should only be used with
     *  the 2x64 implementations.
     *
     *  \param key0   Random seed in the form of a 64-bit unsigned value.
     *  \param domain Random domain. This is used to guarantee that different
     *                applications of a random engine inside the code get different
     *                streams of random numbers, without requiring the user
     *                to provide lots of random seeds. Pick a value from the
     *                RandomDomain class, or RandomDomain::Other if it is
     *                not important. In the latter case you might want to use
     *                \ref gmx::DefaultRandomEngine instead.
     *
     *  \note The random domain is really another 64-bit seed value.
     *
     *  \throws InternalError if the high bits needed to encode the number of counter
     *          bits are nonzero.
     */
    //NOLINTNEXTLINE(cppcoreguidelines-pro-type-member-init)
    ThreeFry2x64General(uint64_t key0 = 0, RandomDomain domain = RandomDomain::Other)
    {
        seed(key0, domain);
    }

    /*! \brief Construct random engine from 2x64-bit unsigned integers
     *
     *  This constructor assigns the raw 128 bit key data from unsigned integers.
     *  It is meant for the case when you want full control over the key,
     *  for instance to compare with reference values of the ThreeFry
     *  function during testing.
     *
     *  \param key0   First word of key/random seed.
     *  \param key1   Second word of key/random seed.
     *
     *  \throws InternalError if the high bits needed to encode the number of counter
     *          bits are nonzero. To test arbitrary values, use 0 internal counter bits.
     */
    //NOLINTNEXTLINE(cppcoreguidelines-pro-type-member-init)
    ThreeFry2x64General(uint64_t key0, uint64_t key1) { seed(key0, key1); }

    /*! \brief Seed 2x64 random engine with two 64-bit key values
     *
     *  \param key0   First word of random seed, in the form of 64-bit unsigned values.
     *  \param domain Random domain. This is used to guarantee that different
     *                applications of a random engine inside the code get different
     *                streams of random numbers, without requiring the user
     *                to provide lots of random seeds. Pick a value from the
     *                RandomDomain class, or RandomDomain::Other if it is
     *                not important. In the latter case you might want to use
     *                \ref gmx::DefaultRandomEngine instead.
     *
     *  \note The random domain is really another 64-bit seed value.
     *
     *  Re-initialized the seed similar to the counter constructor.
     *  Same rules apply: The highest few bits of the last word are
     *  reserved to encode the number of internal counter bits, but
     *  to save the user the trouble of making sure these are zero
     *  when using e.g. a random device, we just ignore them.
     */
    void seed(uint64_t key0 = 0, RandomDomain domain = RandomDomain::Other)
    {
        seed(key0, static_cast<uint64_t>(domain));
    }

    /*! \brief Seed random engine from 2x64-bit unsigned integers
     *
     *  This assigns the raw 128 bit key data from unsigned integers.
     *  It is meant for the case when you want full control over the key,
     *  for instance to compare with reference values of the ThreeFry
     *  function during testing.
     *
     *  \param key0   First word of key/random seed.
     *  \param key1   Second word of key/random seed.
     *
     *  \throws InternalError if the high bits needed to encode the number of counter
     *          bits are nonzero. To test arbitrary values, use 0 internal counter bits.
     */
    void seed(uint64_t key0, uint64_t key1)
    {
        const unsigned int internalCounterBitsBits =
                (internalCounterBits > 0) ? (StaticLog2<internalCounterBits>::value + 1) : 0;

        key_ = { { key0, key1 } };

        if (internalCounterBits > 0)
        {
            internal::highBitCounter::checkAndClear<result_type, 2, internalCounterBitsBits>(&key_);
            internal::highBitCounter::increment<result_type, 2, internalCounterBitsBits>(
                    &key_, internalCounterBits - 1);
        }
        restart(0, 0);
    }

    /*! \brief Restart 2x64 random engine counter from 2 64-bit values
     *
     *  \param ctr0 First word of new counter, in the form of 64-bit unsigned values.
     *  \param ctr1 Second word of new counter
     *
     * Restarting the engine with a new counter is extremely fast with ThreeFry64,
     * and basically just consists of storing the counter value, so you should
     * use this liberally in your innermost loops to restart the engine with
     * e.g. the current step and atom index as counter values.
     *
     * \throws InternalError if any of the highest bits that are reserved
     *         for the internal part of the counter are set. The number of
     *         reserved bits is to the last template parameter to the class.
     */
    void restart(uint64_t ctr0 = 0, uint64_t ctr1 = 0)
    {

        counter_ = { { ctr0, ctr1 } };
        if (!internal::highBitCounter::checkAndClear<result_type, 2, internalCounterBits>(&counter_))
        {
            GMX_THROW(InternalError(
                    "High bits of counter are reserved for the internal stream counter."));
        }
        block_ = generateBlock(key_, counter_);
        index_ = 0;
    }

    /*! \brief Generate the next random number
     *
     *  This will return the next stored 64-bit value if one is available,
     *  and otherwise generate a new block, update the internal counters, and
     *  return the first value while storing the others.
     *
     *  \throws InternalError if the internal counter space is exhausted.
     */
    result_type operator()()
    {
        if (index_ >= c_resultsPerCounter_)
        {
            internal::highBitCounter::increment<result_type, 2, internalCounterBits>(&counter_);
            block_ = generateBlock(key_, counter_);
            index_ = 0;
        }
        return block_[index_++];
    }

    /*! \brief Skip next n random numbers
     *
     *  Moves the internal random stream for the give key/counter value
     *  n positions forward. The count is based on the number of random values
     *  returned, such that skipping 5 values gives exactly the same result as
     *  drawing 5 values that are ignored.
     *
     *  \param n Number of values to jump forward.
     *
     *  \throws InternalError if the internal counter space is exhausted.
     */
    void discard(uint64_t n)
    {
        index_ += n % c_resultsPerCounter_;
        n /= c_resultsPerCounter_;

        if (index_ > c_resultsPerCounter_)
        {
            index_ -= c_resultsPerCounter_;
            n++;
        }

        // Make sure the state is the same as if we came to this counter and
        // index by natural generation.
        if (index_ == 0 && n > 0)
        {
            index_ = c_resultsPerCounter_;
            n--;
        }
        internal::highBitCounter::increment<result_type, 2, internalCounterBits>(&counter_, n);
        block_ = generateBlock(key_, counter_);
    }

    /*! \brief Return true if two ThreeFry2x64 engines are identical
     *
     * \param  x    Instance to compare with.
     *
     * This routine should return true if the two engines will generate
     * identical random streams when drawing.
     */
    bool operator==(const ThreeFry2x64General<rounds, internalCounterBits>& x) const
    {
        // block_ is uniquely specified by key_ and counter_.
        return (key_ == x.key_ && counter_ == x.counter_ && index_ == x.index_);
    }

    /*! \brief Return true of two ThreeFry2x64 engines are not identical
     *
     * \param  x    Instance to compare with.
     *
     * This routine should return true if the two engines will generate
     * different random streams when drawing.
     */
    bool operator!=(const ThreeFry2x64General<rounds, internalCounterBits>& x) const
    {
        return !operator==(x);
    }

private:
    /*! \brief Number of results returned for each invocation of the block generation */
    static const unsigned int c_resultsPerCounter_ =
            static_cast<unsigned int>(sizeof(counter_type) / sizeof(result_type));

    /*! \brief ThreeFry2x64 key, i.e. the random seed for this stream.
     *
     *  The highest few bits of the key are replaced to encode the value of
     *  internalCounterBits, in order to make all streams unique.
     */
    counter_type key_;

    /*! \brief ThreeFry2x64 total counter.
     *
     *  The highest internalCounterBits are reserved for an internal counter
     *  so that the combination of a key and counter provides a stream that
     *  returns 2*2^internalCounterBits (ThreeFry2x64) random 64-bit values before
     *  the internal counter space is exhausted and an exception is thrown.
     */
    counter_type counter_;
    /*! \brief The present block encrypted from values of key and counter. */
    counter_type block_;
    /*! \brief Index of the next value in block_ to return from random engine */
    unsigned int index_;

    GMX_DISALLOW_COPY_AND_ASSIGN(ThreeFry2x64General);
};


/*! \brief ThreeFry2x64 random engine with 20 iteractions.
 *
 *  \tparam internalCounterBits, default 64.
 *
 *  This class provides very high quality random numbers that pass all
 *  BigCrush tests, it works with two 64-bit values each for keys and
 *  counters, and is most  efficient when we only need a few random values
 *  before restarting the counters with new values.
 */
template<unsigned int internalCounterBits = 64>
class ThreeFry2x64 : public ThreeFry2x64General<20, internalCounterBits>
{
public:
    /*! \brief Construct ThreeFry random engine with 2x64 key values, 20 rounds.
     *
     *  \param key0   Random seed in the form of a 64-bit unsigned value.
     *  \param domain Random domain. This is used to guarantee that different
     *                applications of a random engine inside the code get different
     *                streams of random numbers, without requiring the user
     *                to provide lots of random seeds. Pick a value from the
     *                RandomDomain class, or RandomDomain::Other if it is
     *                not important. In the latter case you might want to use
     *                \ref gmx::DefaultRandomEngine instead.
     *
     *  \note The random domain is really another 64-bit seed value.
     *
     *  \throws InternalError if the high bits needed to encode the number of counter
     *          bits are nonzero.
     */
    ThreeFry2x64(uint64_t key0 = 0, RandomDomain domain = RandomDomain::Other) :
        ThreeFry2x64General<20, internalCounterBits>(key0, domain)
    {
    }

    /*! \brief Construct random engine from 2x64-bit unsigned integers, 20 rounds
     *
     *  This constructor assigns the raw 128 bit key data from unsigned integers.
     *  It is meant for the case when you want full control over the key,
     *  for instance to compare with reference values of the ThreeFry
     *  function during testing.
     *
     *  \param key0   First word of key/random seed.
     *  \param key1   Second word of key/random seed.
     *
     *  \throws InternalError if the high bits needed to encode the number of counter
     *          bits are nonzero. To test arbitrary values, use 0 internal counter bits.
     */
    ThreeFry2x64(uint64_t key0, uint64_t key1) :
        ThreeFry2x64General<20, internalCounterBits>(key0, key1)
    {
    }
};

/*! \brief ThreeFry2x64 random engine with 13 iteractions.
 *
 *  \tparam internalCounterBits, default 64.
 *
 *  This class provides relatively high quality random numbers that only
 *  fail one BigCrush test, and it is a bit faster than the 20-round version.
 *  It works with two 64-bit values each for keys and counters, and is most
 *  efficient when we only need a few random values before restarting
 *  the counters with new values.
 */
template<unsigned int internalCounterBits = 64>
class ThreeFry2x64Fast : public ThreeFry2x64General<13, internalCounterBits>
{
public:
    /*! \brief Construct ThreeFry random engine with 2x64 key values, 13 rounds.
     *
     *  \param key0   Random seed in the form of a 64-bit unsigned value.
     *  \param domain Random domain. This is used to guarantee that different
     *                applications of a random engine inside the code get different
     *                streams of random numbers, without requiring the user
     *                to provide lots of random seeds. Pick a value from the
     *                RandomDomain class, or RandomDomain::Other if it is
     *                not important. In the latter case you might want to use
     *                \ref gmx::DefaultRandomEngine instead.
     *
     *  \note The random domain is really another 64-bit seed value.
     *
     *  \throws InternalError if the high bits needed to encode the number of counter
     *          bits are nonzero.
     */
    ThreeFry2x64Fast(uint64_t key0 = 0, RandomDomain domain = RandomDomain::Other) :
        ThreeFry2x64General<13, internalCounterBits>(key0, domain)
    {
    }

    /*! \brief Construct ThreeFry random engine from 2x64-bit unsigned integers, 13 rounds.
     *
     *  This constructor assigns the raw 128 bit key data from unsigned integers.
     *  It is meant for the case when you want full control over the key,
     *  for instance to compare with reference values of the ThreeFry
     *  function during testing.
     *
     *  \param key0   First word of key/random seed.
     *  \param key1   Second word of key/random seed.
     *
     *  \throws InternalError if the high bits needed to encode the number of counter
     *          bits are nonzero. To test arbitrary values, use 0 internal counter bits.
     */
    ThreeFry2x64Fast(uint64_t key0, uint64_t key1) :
        ThreeFry2x64General<13, internalCounterBits>(key0, key1)
    {
    }
};


/*! \brief Default fast and accurate random engine in Gromacs
 *
 *  This engine will return 2*2^64 random results using the default
 *  gmx::RandomDomain::Other stream, and can be initialized with a single
 *  seed argument without having to remember empty template angle brackets.
 */
typedef ThreeFry2x64Fast<> DefaultRandomEngine;

} // namespace gmx

#endif // GMX_RANDOM_THREEFRY_H
