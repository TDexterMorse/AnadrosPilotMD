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
include src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/compiler_depend.make

# Include the progress variables for this target.
include src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/progress.make

# Include the compile flags for this target's objects.
include src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/flags.make

src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/electricfield.cpp.o: src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/flags.make
src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/electricfield.cpp.o: ../src/gromacs/applied_forces/tests/electricfield.cpp
src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/electricfield.cpp.o: src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/electricfield.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/applied_forces/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/electricfield.cpp.o -MF CMakeFiles/applied_forces-test.dir/electricfield.cpp.o.d -o CMakeFiles/applied_forces-test.dir/electricfield.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/applied_forces/tests/electricfield.cpp

src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/electricfield.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/applied_forces-test.dir/electricfield.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/applied_forces/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/applied_forces/tests/electricfield.cpp > CMakeFiles/applied_forces-test.dir/electricfield.cpp.i

src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/electricfield.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/applied_forces-test.dir/electricfield.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/applied_forces/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/applied_forces/tests/electricfield.cpp -o CMakeFiles/applied_forces-test.dir/electricfield.cpp.s

src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.o: src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/flags.make
src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.o: ../src/testutils/unittest_main.cpp
src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.o: src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/applied_forces/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.o -MF CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.o.d -o CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp

src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/applied_forces/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp > CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.i

src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/applied_forces/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp -o CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.s

# Object files for target applied_forces-test
applied_forces__test_OBJECTS = \
"CMakeFiles/applied_forces-test.dir/electricfield.cpp.o" \
"CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.o"

# External object files for target applied_forces-test
applied_forces__test_EXTERNAL_OBJECTS =

bin/applied_forces-test: src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/electricfield.cpp.o
bin/applied_forces-test: src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/__/__/__/testutils/unittest_main.cpp.o
bin/applied_forces-test: src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/build.make
bin/applied_forces-test: /usr/local/cuda-12.4/lib64/libcudart_static.a
bin/applied_forces-test: /usr/lib/x86_64-linux-gnu/librt.a
bin/applied_forces-test: lib/libtestutils.so
bin/applied_forces-test: lib/libgromacs.so.9.0.0
bin/applied_forces-test: lib/libgmock.so.1.13.0
bin/applied_forces-test: lib/libgtest.so.1.13.0
bin/applied_forces-test: /usr/lib/gcc/x86_64-linux-gnu/11/libgomp.so
bin/applied_forces-test: /usr/lib/x86_64-linux-gnu/libpthread.a
bin/applied_forces-test: lib/libmuparser.so.2.3.4
bin/applied_forces-test: src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable ../../../../bin/applied_forces-test"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/applied_forces/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/applied_forces-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/build: bin/applied_forces-test
.PHONY : src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/build

src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/clean:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/applied_forces/tests && $(CMAKE_COMMAND) -P CMakeFiles/applied_forces-test.dir/cmake_clean.cmake
.PHONY : src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/clean

src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/depend:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1 /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/applied_forces/tests /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/applied_forces/tests /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/gromacs/applied_forces/tests/CMakeFiles/applied_forces-test.dir/depend

