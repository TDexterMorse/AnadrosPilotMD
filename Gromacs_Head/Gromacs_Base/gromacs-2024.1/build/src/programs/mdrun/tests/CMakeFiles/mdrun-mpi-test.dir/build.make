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
include src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/compiler_depend.make

# Include the progress variables for this target.
include src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/progress.make

# Include the compile flags for this target's objects.
include src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/flags.make

src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.o: src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/flags.make
src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.o: ../src/programs/mdrun/tests/domain_decomposition.cpp
src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.o: src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.o -MF CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.o.d -o CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/programs/mdrun/tests/domain_decomposition.cpp

src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/programs/mdrun/tests/domain_decomposition.cpp > CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.i

src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/programs/mdrun/tests/domain_decomposition.cpp -o CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.s

src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.o: src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/flags.make
src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.o: ../src/programs/mdrun/tests/minimize.cpp
src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.o: src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.o -MF CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.o.d -o CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/programs/mdrun/tests/minimize.cpp

src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/programs/mdrun/tests/minimize.cpp > CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.i

src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/programs/mdrun/tests/minimize.cpp -o CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.s

src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.o: src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/flags.make
src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.o: ../src/programs/mdrun/tests/mimic.cpp
src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.o: src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.o -MF CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.o.d -o CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/programs/mdrun/tests/mimic.cpp

src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/programs/mdrun/tests/mimic.cpp > CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.i

src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/programs/mdrun/tests/mimic.cpp -o CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.s

src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.o: src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/flags.make
src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.o: ../src/testutils/unittest_main.cpp
src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.o: src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.o -MF CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.o.d -o CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp

src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp > CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.i

src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp -o CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.s

# Object files for target mdrun-mpi-test
mdrun__mpi__test_OBJECTS = \
"CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.o" \
"CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.o" \
"CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.o" \
"CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.o"

# External object files for target mdrun-mpi-test
mdrun__mpi__test_EXTERNAL_OBJECTS = \
"/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/CMakeFiles/mdrun_objlib.dir/mdrun/mdrun.cpp.o" \
"/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/CMakeFiles/mdrun_objlib.dir/mdrun/nonbonded_bench.cpp.o"

bin/mdrun-mpi-test: src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/domain_decomposition.cpp.o
bin/mdrun-mpi-test: src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/minimize.cpp.o
bin/mdrun-mpi-test: src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/mimic.cpp.o
bin/mdrun-mpi-test: src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/__/__/__/testutils/unittest_main.cpp.o
bin/mdrun-mpi-test: src/programs/CMakeFiles/mdrun_objlib.dir/mdrun/mdrun.cpp.o
bin/mdrun-mpi-test: src/programs/CMakeFiles/mdrun_objlib.dir/mdrun/nonbonded_bench.cpp.o
bin/mdrun-mpi-test: src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/build.make
bin/mdrun-mpi-test: /usr/local/cuda-12.4/lib64/libcudart_static.a
bin/mdrun-mpi-test: /usr/lib/x86_64-linux-gnu/librt.a
bin/mdrun-mpi-test: lib/libmdrun_test_infrastructure.a
bin/mdrun-mpi-test: lib/libtestutils.so
bin/mdrun-mpi-test: lib/libgromacs.so.9.0.0
bin/mdrun-mpi-test: /usr/lib/gcc/x86_64-linux-gnu/11/libgomp.so
bin/mdrun-mpi-test: /usr/lib/x86_64-linux-gnu/libpthread.a
bin/mdrun-mpi-test: lib/libgmock.so.1.13.0
bin/mdrun-mpi-test: lib/libgtest.so.1.13.0
bin/mdrun-mpi-test: src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable ../../../../bin/mdrun-mpi-test"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mdrun-mpi-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/build: bin/mdrun-mpi-test
.PHONY : src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/build

src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/clean:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests && $(CMAKE_COMMAND) -P CMakeFiles/mdrun-mpi-test.dir/cmake_clean.cmake
.PHONY : src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/clean

src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/depend:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1 /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/programs/mdrun/tests /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/programs/mdrun/tests/CMakeFiles/mdrun-mpi-test.dir/depend

