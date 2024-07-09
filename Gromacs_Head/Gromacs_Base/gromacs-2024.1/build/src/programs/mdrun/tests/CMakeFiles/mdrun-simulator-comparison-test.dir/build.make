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
include src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/compiler_depend.make

# Include the progress variables for this target.
include src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/progress.make

# Include the compile flags for this target's objects.
include src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/flags.make

src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.o: src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/flags.make
src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.o: ../src/programs/mdrun/tests/simulator.cpp
src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.o: src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.o -MF CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.o.d -o CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/programs/mdrun/tests/simulator.cpp

src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/programs/mdrun/tests/simulator.cpp > CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.i

src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/programs/mdrun/tests/simulator.cpp -o CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.s

src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.o: src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/flags.make
src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.o: ../src/testutils/unittest_main.cpp
src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.o: src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.o -MF CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.o.d -o CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp

src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp > CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.i

src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp -o CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.s

# Object files for target mdrun-simulator-comparison-test
mdrun__simulator__comparison__test_OBJECTS = \
"CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.o" \
"CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.o"

# External object files for target mdrun-simulator-comparison-test
mdrun__simulator__comparison__test_EXTERNAL_OBJECTS = \
"/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/CMakeFiles/mdrun_objlib.dir/mdrun/mdrun.cpp.o" \
"/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/CMakeFiles/mdrun_objlib.dir/mdrun/nonbonded_bench.cpp.o"

bin/mdrun-simulator-comparison-test: src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/simulator.cpp.o
bin/mdrun-simulator-comparison-test: src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/__/__/__/testutils/unittest_main.cpp.o
bin/mdrun-simulator-comparison-test: src/programs/CMakeFiles/mdrun_objlib.dir/mdrun/mdrun.cpp.o
bin/mdrun-simulator-comparison-test: src/programs/CMakeFiles/mdrun_objlib.dir/mdrun/nonbonded_bench.cpp.o
bin/mdrun-simulator-comparison-test: src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/build.make
bin/mdrun-simulator-comparison-test: /usr/local/cuda-12.4/lib64/libcudart_static.a
bin/mdrun-simulator-comparison-test: /usr/lib/x86_64-linux-gnu/librt.a
bin/mdrun-simulator-comparison-test: lib/libmdrun_test_infrastructure.a
bin/mdrun-simulator-comparison-test: lib/libtestutils.so
bin/mdrun-simulator-comparison-test: lib/libgromacs.so.9.0.0
bin/mdrun-simulator-comparison-test: /usr/lib/gcc/x86_64-linux-gnu/11/libgomp.so
bin/mdrun-simulator-comparison-test: /usr/lib/x86_64-linux-gnu/libpthread.a
bin/mdrun-simulator-comparison-test: lib/libgmock.so.1.13.0
bin/mdrun-simulator-comparison-test: lib/libgtest.so.1.13.0
bin/mdrun-simulator-comparison-test: src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../../../../bin/mdrun-simulator-comparison-test"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mdrun-simulator-comparison-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/build: bin/mdrun-simulator-comparison-test
.PHONY : src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/build

src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/clean:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && $(CMAKE_COMMAND) -P CMakeFiles/mdrun-simulator-comparison-test.dir/cmake_clean.cmake
.PHONY : src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/clean

src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/depend:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1 /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/programs/mdrun/tests /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/programs/mdrun/tests/CMakeFiles/mdrun-simulator-comparison-test.dir/depend

