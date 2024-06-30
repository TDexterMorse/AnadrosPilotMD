/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 2022- The GROMACS Authors
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

/*! \internal \file
 *  \brief Declares the GPU 3D FFT routines.
 *
 *  \author Carsten Uphoff <carsten.uphoff@intel.com>
 *  \ingroup module_fft
 */

#ifndef GMX_FFT_GPU_3DFFT_SYCL_BBFFT_H
#define GMX_FFT_GPU_3DFFT_SYCL_BBFFT_H

#include <bbfft/plan.hpp>
#include <sycl/sycl.hpp>

#include "gromacs/fft/fft.h"
#include "gromacs/gpu_utils/devicebuffer_datatype.h"
#include "gromacs/gpu_utils/gmxsycl.h"
#include "gromacs/gpu_utils/gputraits.h"
#include "gromacs/utility/gmxmpi.h"

#include "gpu_3dfft_impl.h"

class DeviceContext;
class DeviceStream;

namespace gmx
{

/*! \internal \brief
 * A 3D FFT wrapper class for performing R2C/C2R transforms using
 * SYCL + double-batched FFT library (internally known as bbfft).
 */
class Gpu3dFft::ImplSyclBbfft : public Gpu3dFft::Impl
{
public:
    //! \copydoc Gpu3dFft::Impl::Impl
    ImplSyclBbfft(bool                 allocateRealGrid,
                  MPI_Comm             comm,
                  ArrayRef<const int>  gridSizesInXForEachRank,
                  ArrayRef<const int>  gridSizesInYForEachRank,
                  int                  nz,
                  bool                 performOutOfPlaceFFT,
                  const DeviceContext& context,
                  const DeviceStream&  pmeStream,
                  ivec                 realGridSize,
                  ivec                 realGridSizePadded,
                  ivec                 complexGridSizePadded,
                  DeviceBuffer<float>* realGrid,
                  DeviceBuffer<float>* complexGrid);

    //! \copydoc Gpu3dFft::Impl::~Impl
    ~ImplSyclBbfft() override;

    //! \copydoc Gpu3dFft::Impl::perform3dFft
    void perform3dFft(gmx_fft_direction dir, CommandEvent* timingEvent) override;

private:
    // Shorthand for the FFT descriptor (a.k.a. plan) type
    using Descriptor = bbfft::plan<sycl::event>;

    float*      realGrid_;
    sycl::queue queue_;
    Descriptor  r2cDescriptor_, c2rDescriptor_;
};

} // namespace gmx

#endif
