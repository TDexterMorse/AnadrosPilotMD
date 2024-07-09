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

# Utility rule file for run-ctest-phys.

# Include any custom commands dependencies for this target.
include CMakeFiles/run-ctest-phys.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/run-ctest-phys.dir/progress.make

CMakeFiles/run-ctest-phys:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running physical validation tests"
	/usr/bin/ctest --output-on-failure -R physicalvalidationtests

run-ctest-phys: CMakeFiles/run-ctest-phys
run-ctest-phys: CMakeFiles/run-ctest-phys.dir/build.make
.PHONY : run-ctest-phys

# Rule to build all files generated by this target.
CMakeFiles/run-ctest-phys.dir/build: run-ctest-phys
.PHONY : CMakeFiles/run-ctest-phys.dir/build

CMakeFiles/run-ctest-phys.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/run-ctest-phys.dir/cmake_clean.cmake
.PHONY : CMakeFiles/run-ctest-phys.dir/clean

CMakeFiles/run-ctest-phys.dir/depend:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1 /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1 /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles/run-ctest-phys.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/run-ctest-phys.dir/depend

