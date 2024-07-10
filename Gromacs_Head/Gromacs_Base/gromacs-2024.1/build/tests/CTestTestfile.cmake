# CMake generated Testfile for 
# Source directory: /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/tests
# Build directory: /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(regressiontests/complex "perl" "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/tests/regressiontests-2024.1/gmxtest.pl" "complex" "-crosscompile" "-noverbose" "-nosuffix")
set_tests_properties(regressiontests/complex PROPERTIES  ENVIRONMENT "PATH=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/lib:/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/bin:/usr/local/cuda-12.4/bin:/home/ubuntu/.local/bin:/home/ubuntu/miniconda3/bin:/home/ubuntu/miniconda3/condabin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" LABELS "SlowGpuTest" _BACKTRACE_TRIPLES "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/tests/CMakeLists.txt;181;add_test;/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/tests/CMakeLists.txt;0;")
add_test(regressiontests/freeenergy "perl" "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/tests/regressiontests-2024.1/gmxtest.pl" "freeenergy" "-crosscompile" "-noverbose" "-nosuffix")
set_tests_properties(regressiontests/freeenergy PROPERTIES  ENVIRONMENT "PATH=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/lib:/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/bin:/usr/local/cuda-12.4/bin:/home/ubuntu/.local/bin:/home/ubuntu/miniconda3/bin:/home/ubuntu/miniconda3/condabin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" LABELS "SlowGpuTest" _BACKTRACE_TRIPLES "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/tests/CMakeLists.txt;181;add_test;/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/tests/CMakeLists.txt;0;")
add_test(regressiontests/essentialdynamics "perl" "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/tests/regressiontests-2024.1/gmxtest.pl" "essentialdynamics" "-crosscompile" "-noverbose" "-nosuffix")
set_tests_properties(regressiontests/essentialdynamics PROPERTIES  ENVIRONMENT "PATH=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/lib:/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/bin:/usr/local/cuda-12.4/bin:/home/ubuntu/.local/bin:/home/ubuntu/miniconda3/bin:/home/ubuntu/miniconda3/condabin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" LABELS "SlowGpuTest" _BACKTRACE_TRIPLES "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/tests/CMakeLists.txt;181;add_test;/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/tests/CMakeLists.txt;0;")