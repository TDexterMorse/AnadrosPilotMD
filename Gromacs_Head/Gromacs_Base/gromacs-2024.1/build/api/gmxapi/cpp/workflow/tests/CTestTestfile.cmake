# CMake generated Testfile for 
# Source directory: /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/gmxapi/cpp/workflow/tests
# Build directory: /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/gmxapi/cpp/workflow/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(GmxapiInternalInterfaceTests "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/bin/workflow-details-test" "-ntomp" "2" "--gtest_output=xml:/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/Testing/Temporary/GmxapiInternalInterfaceTests.xml")
set_tests_properties(GmxapiInternalInterfaceTests PROPERTIES  LABELS "GTest;IntegrationTest;QuickGpuTest" TIMEOUT "120" WORKING_DIRECTORY "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/gmxapi/cpp/workflow/tests" _BACKTRACE_TRIPLES "/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/TestMacros.cmake;329;add_test;/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/gmxapi/cpp/workflow/tests/CMakeLists.txt;51;gmx_register_gtest_test;/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/gmxapi/cpp/workflow/tests/CMakeLists.txt;0;")
