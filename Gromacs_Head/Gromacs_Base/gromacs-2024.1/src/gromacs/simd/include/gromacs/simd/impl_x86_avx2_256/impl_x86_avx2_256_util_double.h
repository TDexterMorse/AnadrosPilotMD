/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 2014- The GROMACS Authors
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

#ifndef GMX_SIMD_IMPL_X86_AVX2_256_UTIL_DOUBLE_H
#define GMX_SIMD_IMPL_X86_AVX2_256_UTIL_DOUBLE_H

#include "config.h"

#include <immintrin.h>

#include "gromacs/simd/impl_x86_avx_256/impl_x86_avx_256_util_double.h"

namespace gmx
{

// This version is marginally slower than the AVX 4-wide component load
// version on Intel Skylake. On older Intel architectures this version
// is significantly slower.
template<int align>
static inline void gmx_simdcall gatherLoadUTransposeSafe(const double*      base,
                                                         const std::int32_t offset[],
                                                         SimdDouble*        v0,
                                                         SimdDouble*        v1,
                                                         SimdDouble*        v2)
{
    assert(std::size_t(offset) % 16 == 0);

    const SimdDInt32 alignSimd = SimdDInt32(align);

    SimdDInt32 vindex = simdLoad(offset, SimdDInt32Tag());
    vindex            = vindex * alignSimd;

    *v0 = _mm256_i32gather_pd(base + 0, vindex.simdInternal_, sizeof(double));
    *v1 = _mm256_i32gather_pd(base + 1, vindex.simdInternal_, sizeof(double));
    *v2 = _mm256_i32gather_pd(base + 2, vindex.simdInternal_, sizeof(double));
}

} // namespace gmx

#endif // GMX_SIMD_IMPL_X86_AVX2_256_UTIL_DOUBLE_H
