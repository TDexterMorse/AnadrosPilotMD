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
include api/nblib/samples/CMakeFiles/methane-water-integration.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include api/nblib/samples/CMakeFiles/methane-water-integration.dir/compiler_depend.make

# Include the progress variables for this target.
include api/nblib/samples/CMakeFiles/methane-water-integration.dir/progress.make

# Include the compile flags for this target's objects.
include api/nblib/samples/CMakeFiles/methane-water-integration.dir/flags.make

api/nblib/samples/CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.o: api/nblib/samples/CMakeFiles/methane-water-integration.dir/flags.make
api/nblib/samples/CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.o: ../api/nblib/samples/methane-water-integration.cpp
api/nblib/samples/CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.o: api/nblib/samples/CMakeFiles/methane-water-integration.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object api/nblib/samples/CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/samples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT api/nblib/samples/CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.o -MF CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.o.d -o CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/nblib/samples/methane-water-integration.cpp

api/nblib/samples/CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/samples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/nblib/samples/methane-water-integration.cpp > CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.i

api/nblib/samples/CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/samples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/nblib/samples/methane-water-integration.cpp -o CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.s

# Object files for target methane-water-integration
methane__water__integration_OBJECTS = \
"CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.o"

# External object files for target methane-water-integration
methane__water__integration_EXTERNAL_OBJECTS =

bin/methane-water-integration: api/nblib/samples/CMakeFiles/methane-water-integration.dir/methane-water-integration.cpp.o
bin/methane-water-integration: api/nblib/samples/CMakeFiles/methane-water-integration.dir/build.make
bin/methane-water-integration: lib/libnblib_gmx.so.0.1.0
bin/methane-water-integration: /usr/lib/gcc/x86_64-linux-gnu/11/libgomp.so
bin/methane-water-integration: /usr/lib/x86_64-linux-gnu/libpthread.a
bin/methane-water-integration: api/nblib/samples/CMakeFiles/methane-water-integration.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/methane-water-integration"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/samples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/methane-water-integration.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
api/nblib/samples/CMakeFiles/methane-water-integration.dir/build: bin/methane-water-integration
.PHONY : api/nblib/samples/CMakeFiles/methane-water-integration.dir/build

api/nblib/samples/CMakeFiles/methane-water-integration.dir/clean:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/samples && $(CMAKE_COMMAND) -P CMakeFiles/methane-water-integration.dir/cmake_clean.cmake
.PHONY : api/nblib/samples/CMakeFiles/methane-water-integration.dir/clean

api/nblib/samples/CMakeFiles/methane-water-integration.dir/depend:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1 /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/api/nblib/samples /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/samples /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/api/nblib/samples/CMakeFiles/methane-water-integration.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : api/nblib/samples/CMakeFiles/methane-water-integration.dir/depend

