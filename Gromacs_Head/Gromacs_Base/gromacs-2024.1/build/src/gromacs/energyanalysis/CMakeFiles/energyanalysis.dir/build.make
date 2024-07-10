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
include src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/compiler_depend.make

# Include the progress variables for this target.
include src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/progress.make

# Include the compile flags for this target's objects.
include src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/flags.make

src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/energyterm.cpp.o: src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/flags.make
src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/energyterm.cpp.o: ../src/gromacs/energyanalysis/energyterm.cpp
src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/energyterm.cpp.o: src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/energyterm.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/energyanalysis && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/energyterm.cpp.o -MF CMakeFiles/energyanalysis.dir/energyterm.cpp.o.d -o CMakeFiles/energyanalysis.dir/energyterm.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/energyanalysis/energyterm.cpp

src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/energyterm.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/energyanalysis.dir/energyterm.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/energyanalysis && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/energyanalysis/energyterm.cpp > CMakeFiles/energyanalysis.dir/energyterm.cpp.i

src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/energyterm.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/energyanalysis.dir/energyterm.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/energyanalysis && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/energyanalysis/energyterm.cpp -o CMakeFiles/energyanalysis.dir/energyterm.cpp.s

energyanalysis: src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/energyterm.cpp.o
energyanalysis: src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/build.make
.PHONY : energyanalysis

# Rule to build all files generated by this target.
src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/build: energyanalysis
.PHONY : src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/build

src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/clean:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/energyanalysis && $(CMAKE_COMMAND) -P CMakeFiles/energyanalysis.dir/cmake_clean.cmake
.PHONY : src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/clean

src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/depend:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1 /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/energyanalysis /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/energyanalysis /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/gromacs/energyanalysis/CMakeFiles/energyanalysis.dir/depend
