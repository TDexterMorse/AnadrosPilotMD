# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build

# Include any dependencies generated for this target.
include api/nblib/tests/CMakeFiles/nblib-integration-test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include api/nblib/tests/CMakeFiles/nblib-integration-test.dir/compiler_depend.make

# Include the progress variables for this target.
include api/nblib/tests/CMakeFiles/nblib-integration-test.dir/progress.make

# Include the compile flags for this target's objects.
include api/nblib/tests/CMakeFiles/nblib-integration-test.dir/flags.make

api/nblib/tests/CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.o: api/nblib/tests/CMakeFiles/nblib-integration-test.dir/flags.make
api/nblib/tests/CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.o: ../api/nblib/tests/gmxcalculator.cpp
api/nblib/tests/CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.o: api/nblib/tests/CMakeFiles/nblib-integration-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object api/nblib/tests/CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/tests/CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.o -MF CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.o.d -o CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/nblib/tests/gmxcalculator.cpp

api/nblib/tests/CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/nblib/tests/gmxcalculator.cpp > CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.i

api/nblib/tests/CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/nblib/tests/gmxcalculator.cpp -o CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.s

api/nblib/tests/CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.o: api/nblib/tests/CMakeFiles/nblib-integration-test.dir/flags.make
api/nblib/tests/CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.o: ../api/nblib/tests/nbkernelsystem.cpp
api/nblib/tests/CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.o: api/nblib/tests/CMakeFiles/nblib-integration-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object api/nblib/tests/CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/tests/CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.o -MF CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.o.d -o CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/nblib/tests/nbkernelsystem.cpp

api/nblib/tests/CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/nblib/tests/nbkernelsystem.cpp > CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.i

api/nblib/tests/CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/nblib/tests/nbkernelsystem.cpp -o CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.s

api/nblib/tests/CMakeFiles/nblib-integration-test.dir/simstate.cpp.o: api/nblib/tests/CMakeFiles/nblib-integration-test.dir/flags.make
api/nblib/tests/CMakeFiles/nblib-integration-test.dir/simstate.cpp.o: ../api/nblib/tests/simstate.cpp
api/nblib/tests/CMakeFiles/nblib-integration-test.dir/simstate.cpp.o: api/nblib/tests/CMakeFiles/nblib-integration-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object api/nblib/tests/CMakeFiles/nblib-integration-test.dir/simstate.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/tests/CMakeFiles/nblib-integration-test.dir/simstate.cpp.o -MF CMakeFiles/nblib-integration-test.dir/simstate.cpp.o.d -o CMakeFiles/nblib-integration-test.dir/simstate.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/nblib/tests/simstate.cpp

api/nblib/tests/CMakeFiles/nblib-integration-test.dir/simstate.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib-integration-test.dir/simstate.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/nblib/tests/simstate.cpp > CMakeFiles/nblib-integration-test.dir/simstate.cpp.i

api/nblib/tests/CMakeFiles/nblib-integration-test.dir/simstate.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib-integration-test.dir/simstate.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/nblib/tests/simstate.cpp -o CMakeFiles/nblib-integration-test.dir/simstate.cpp.s

api/nblib/tests/CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.o: api/nblib/tests/CMakeFiles/nblib-integration-test.dir/flags.make
api/nblib/tests/CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.o: ../src/testutils/unittest_main.cpp
api/nblib/tests/CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.o: api/nblib/tests/CMakeFiles/nblib-integration-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object api/nblib/tests/CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/tests/CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.o -MF CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.o.d -o CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp

api/nblib/tests/CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp > CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.i

api/nblib/tests/CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp -o CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.s

# Object files for target nblib-integration-test
nblib__integration__test_OBJECTS = \
"CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.o" \
"CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.o" \
"CMakeFiles/nblib-integration-test.dir/simstate.cpp.o" \
"CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.o"

# External object files for target nblib-integration-test
nblib__integration__test_EXTERNAL_OBJECTS =

bin/nblib-integration-test: api/nblib/tests/CMakeFiles/nblib-integration-test.dir/gmxcalculator.cpp.o
bin/nblib-integration-test: api/nblib/tests/CMakeFiles/nblib-integration-test.dir/nbkernelsystem.cpp.o
bin/nblib-integration-test: api/nblib/tests/CMakeFiles/nblib-integration-test.dir/simstate.cpp.o
bin/nblib-integration-test: api/nblib/tests/CMakeFiles/nblib-integration-test.dir/__/__/__/src/testutils/unittest_main.cpp.o
bin/nblib-integration-test: api/nblib/tests/CMakeFiles/nblib-integration-test.dir/build.make
bin/nblib-integration-test: /usr/local/cuda-12.4/lib64/libcudart_static.a
bin/nblib-integration-test: /usr/lib/x86_64-linux-gnu/librt.a
bin/nblib-integration-test: lib/libnblib_test_infrastructure.a
bin/nblib-integration-test: lib/libnblib_gmx.so.0.1.0
bin/nblib-integration-test: lib/libtestutils.so
bin/nblib-integration-test: lib/libgmock.so.1.13.0
bin/nblib-integration-test: lib/libgtest.so.1.13.0
bin/nblib-integration-test: lib/libgromacs.so.9.0.0
bin/nblib-integration-test: /usr/lib/gcc/x86_64-linux-gnu/11/libgomp.so
bin/nblib-integration-test: /usr/lib/x86_64-linux-gnu/libpthread.a
bin/nblib-integration-test: api/nblib/tests/CMakeFiles/nblib-integration-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable ../../../bin/nblib-integration-test"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/nblib-integration-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
api/nblib/tests/CMakeFiles/nblib-integration-test.dir/build: bin/nblib-integration-test
.PHONY : api/nblib/tests/CMakeFiles/nblib-integration-test.dir/build

api/nblib/tests/CMakeFiles/nblib-integration-test.dir/clean:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests && $(CMAKE_COMMAND) -P CMakeFiles/nblib-integration-test.dir/cmake_clean.cmake
.PHONY : api/nblib/tests/CMakeFiles/nblib-integration-test.dir/clean

api/nblib/tests/CMakeFiles/nblib-integration-test.dir/depend:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1 /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/nblib/tests /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/tests/CMakeFiles/nblib-integration-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : api/nblib/tests/CMakeFiles/nblib-integration-test.dir/depend

