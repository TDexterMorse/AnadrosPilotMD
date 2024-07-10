/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 2012- The GROMACS Authors
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
 * \brief
 * Build information from the build system.
 *
 * Used for log and version output.
 */

/** C compiler used to build */
#define BUILD_C_COMPILER        "/usr/bin/cc GNU 11.4.0"

/** C compiler flags for this build configuration */
#define CMAKE_BUILD_CONFIGURATION_C_FLAGS "-O3 -DNDEBUG"

#include "compilerflaginfo-Release-C.h"

/** C++ compiler used to build */
#define BUILD_CXX_COMPILER      "/usr/bin/c++ GNU 11.4.0"

/** C++ compiler flags for this build configuration */
#define CMAKE_BUILD_CONFIGURATION_CXX_FLAGS "-O3 -DNDEBUG"

#include "compilerflaginfo-Release-CXX.h"

/** Installation prefix (default location of data files) */
#define CMAKE_INSTALL_PREFIX    "/usr/local/gromacs"

/** Source directory for the build */
#define CMAKE_SOURCE_DIR        "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1"

/** Directory for test input files */
#define GMX_TESTSIMULATIONDATABASE_DIR  "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/simulationdatabase"

/** Binary directory for the build */
#define CMAKE_BINARY_DIR        "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build"

/** Location of GROMACS-specific data files */
#define GMX_INSTALL_GMXDATADIR  "share/gromacs"

/** HWLOC version information */
#define HWLOC_VERSION ""

/** CUDA compiler version information */
#define CUDA_COMPILER_INFO "/usr/local/cuda-12.4/bin/nvcc nvcc: NVIDIA (R) Cuda compiler driver;Copyright (c) 2005-2024 NVIDIA Corporation;Built on Thu_Mar_28_02:18:24_PDT_2024;Cuda compilation tools, release 12.4, V12.4.131;Build cuda_12.4.r12.4/compiler.34097967_0"

/** CUDA compiler flags (device flags, plus host flags if propagated)*/
#define CUDA_DEVICE_COMPILER_FLAGS "-std=c++17;--generate-code=arch=compute_50,code=sm_50;--generate-code=arch=compute_52,code=sm_52;--generate-code=arch=compute_60,code=sm_60;--generate-code=arch=compute_61,code=sm_61;--generate-code=arch=compute_70,code=sm_70;--generate-code=arch=compute_75,code=sm_75;--generate-code=arch=compute_80,code=sm_80;--generate-code=arch=compute_86,code=sm_86;--generate-code=arch=compute_89,code=sm_89;--generate-code=arch=compute_90,code=sm_90;-Wno-deprecated-gpu-targets;--generate-code=arch=compute_53,code=sm_53;--generate-code=arch=compute_80,code=sm_80;-use_fast_math;-Xptxas;-warn-double-usage;-Xptxas;-Werror;-D_FORCE_INLINES;-Xcompiler;-fopenmp;"
#define CUDA_HOST_COMPILER_FLAGS BUILD_CXXFLAGS
#define CUDA_COMPILER_FLAGS CUDA_DEVICE_COMPILER_FLAGS CUDA_HOST_COMPILER_FLAGS

/** OpenCL include dir */
#define OPENCL_INCLUDE_DIR ""

/** OpenCL library */
#define OPENCL_LIBRARY ""

/** OpenCL version */
#define OPENCL_VERSION_STRING ""

/** SYCL DPCPP flags */
#define SYCL_DPCPP_COMPILER_FLAGS ""
#define SYCL_DPCPP_LINKER_FLAGS ""

/** SYCL hipSYCL backend list */
#define SYCL_HIPSYCL_COMPILER_LAUNCHER ""
#define SYCL_HIPSYCL_COMPILER_FLAGS ""
#define SYCL_HIPSYCL_DEVICE_COMPILER_FLAGS ""
#define SYCL_HIPSYCL_TARGETS ""
