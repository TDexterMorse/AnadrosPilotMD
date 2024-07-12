### MAC/Linux

pre-req: Python3, Java11, cmake, conda, docker, and xcode

Begin in the $BASE directory (the directory in which you have placed the program)

```

cd $BASE

```

Install rdkit

```

pip install rdkit-pypi

#or

conda activate <your_environment_name>

conda install -c conda-forge rdkit

python -c "import rdkit"


```

Install obabel

```

brew install open-babel

```
Determine location of open-babel (a good place to look is your homebrew local cellar) 

```

find / -type d -name "open-babel" 2>/dev/null

```

then add the path to your source section of RUNALL.sh script (or to your ~/.bashrc file) 

Install GROMACS

```

cd Gromacs_Head/Gromacs_Base/gromacs-2024.1
mkdir build
cd build
cmake .. -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON
make 
make check
sudo make install
source /usr/local/gromacs/bin/GMXRC

# Add Ions:

cd /usr/local/gromacs/share/gromacs/top/amber03.ff

sudo cp ions.itp ions2.itp


cd $BASE

```

see https://manual.gromacs.org/documentation/current/install-guide/index.html for help with install

Error Catch: OpenMP error, no parallelization library generation available, so we have to pre-build the library then reference that map

```

curl -O https://mac.r-project.org/openmp/openmp-14.0.6-darwin20-Release.tar.gz\nsudo tar fvxz openmp-14.0.6-darwin20-Release.tar.gz -C /


#Then Substitute cmake command with:

cmake .. -DGMX_BUILD_OWN_FFTW=OFF -DREGRESSIONTEST_DOWNLOAD=ON -DGMX_OPENMP=ON -DGMX_FFT_LIBRARY=fftw3 -DFFTWF_INCLUDE_DIR=/usr/local/Cellar/fftw/3.3.10_1/include -DFFTWF_LIBRARY=/usr/local/Cellar/fftw/3.3.10_1/lib/libfftw3f.dylib


```

# NVIDIA

Everything else the same except for installing CUDA and Gromacs

## CUDA Toolkit Installation:

For GPU enabled simulations we will need to have CUDA installed on our machines. The exact method of installation is architecture specific so please consult this CUDA driver decisions tree for a device specific installation protocol: [CUDA Driver](https://developer.nvidia.com/cuda-downloads)

## Gromacs Install

```
wget ftp://ftp.gromacs.org/gromacs/gromacs-2024.1.tar.gz
tar xfz gromacs-2024.1.tar.gz
cd gromacs-2024.1
mkdir build
cd build
cmake -D CMAKE_CUDA_COMPILER=/usr/local/cuda/bin/nvcc \
      -D GMX_BUILD_OWN_FFTW=ON \
      -D REGRESSIONTEST_DOWNLOAD=ON \
      -D GMX_GPU=CUDA \
      ..
make
make check
sudo make install

```

### And Source Environment

```
source /usr/local/gromacs/bin/GMXRC
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

```

### Verify CUDA and GROMACS installations:

```
nvcc --version  # Check CUDA version
gmx --version   # Check GROMACS version and CUDA support

```


