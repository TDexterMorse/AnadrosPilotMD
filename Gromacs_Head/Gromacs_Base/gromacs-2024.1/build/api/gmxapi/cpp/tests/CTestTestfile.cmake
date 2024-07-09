# CMake generated Testfile for 
# Source directory: /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/gmxapi/cpp/tests
# Build directory: /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/gmxapi/cpp/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(GmxapiExternalInterfaceTests "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/bin/gmxapi-test" "-ntomp" "2" "--gtest_output=xml:/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/Testing/Temporary/GmxapiExternalInterfaceTests.xml")
set_tests_properties(GmxapiExternalInterfaceTests PROPERTIES  LABELS "GTest;IntegrationTest;QuickGpuTest" TIMEOUT "120" WORKING_DIRECTORY "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/gmxapi/cpp/tests" _BACKTRACE_TRIPLES "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/TestMacros.cmake;329;add_test;/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/gmxapi/cpp/tests/CMakeLists.txt;69;gmx_register_gtest_test;/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/gmxapi/cpp/tests/CMakeLists.txt;0;")
