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
include src/gromacs/options/tests/CMakeFiles/options-test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/gromacs/options/tests/CMakeFiles/options-test.dir/compiler_depend.make

# Include the progress variables for this target.
include src/gromacs/options/tests/CMakeFiles/options-test.dir/progress.make

# Include the compile flags for this target's objects.
include src/gromacs/options/tests/CMakeFiles/options-test.dir/flags.make

src/gromacs/options/tests/CMakeFiles/options-test.dir/abstractoptionstorage.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/flags.make
src/gromacs/options/tests/CMakeFiles/options-test.dir/abstractoptionstorage.cpp.o: ../src/gromacs/options/tests/abstractoptionstorage.cpp
src/gromacs/options/tests/CMakeFiles/options-test.dir/abstractoptionstorage.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/gromacs/options/tests/CMakeFiles/options-test.dir/abstractoptionstorage.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/options/tests/CMakeFiles/options-test.dir/abstractoptionstorage.cpp.o -MF CMakeFiles/options-test.dir/abstractoptionstorage.cpp.o.d -o CMakeFiles/options-test.dir/abstractoptionstorage.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/abstractoptionstorage.cpp

src/gromacs/options/tests/CMakeFiles/options-test.dir/abstractoptionstorage.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/options-test.dir/abstractoptionstorage.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/abstractoptionstorage.cpp > CMakeFiles/options-test.dir/abstractoptionstorage.cpp.i

src/gromacs/options/tests/CMakeFiles/options-test.dir/abstractoptionstorage.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/options-test.dir/abstractoptionstorage.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/abstractoptionstorage.cpp -o CMakeFiles/options-test.dir/abstractoptionstorage.cpp.s

src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoption.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/flags.make
src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoption.cpp.o: ../src/gromacs/options/tests/filenameoption.cpp
src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoption.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoption.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoption.cpp.o -MF CMakeFiles/options-test.dir/filenameoption.cpp.o.d -o CMakeFiles/options-test.dir/filenameoption.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/filenameoption.cpp

src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoption.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/options-test.dir/filenameoption.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/filenameoption.cpp > CMakeFiles/options-test.dir/filenameoption.cpp.i

src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoption.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/options-test.dir/filenameoption.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/filenameoption.cpp -o CMakeFiles/options-test.dir/filenameoption.cpp.s

src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoptionmanager.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/flags.make
src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoptionmanager.cpp.o: ../src/gromacs/options/tests/filenameoptionmanager.cpp
src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoptionmanager.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoptionmanager.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoptionmanager.cpp.o -MF CMakeFiles/options-test.dir/filenameoptionmanager.cpp.o.d -o CMakeFiles/options-test.dir/filenameoptionmanager.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/filenameoptionmanager.cpp

src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoptionmanager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/options-test.dir/filenameoptionmanager.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/filenameoptionmanager.cpp > CMakeFiles/options-test.dir/filenameoptionmanager.cpp.i

src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoptionmanager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/options-test.dir/filenameoptionmanager.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/filenameoptionmanager.cpp -o CMakeFiles/options-test.dir/filenameoptionmanager.cpp.s

src/gromacs/options/tests/CMakeFiles/options-test.dir/option.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/flags.make
src/gromacs/options/tests/CMakeFiles/options-test.dir/option.cpp.o: ../src/gromacs/options/tests/option.cpp
src/gromacs/options/tests/CMakeFiles/options-test.dir/option.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/gromacs/options/tests/CMakeFiles/options-test.dir/option.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/options/tests/CMakeFiles/options-test.dir/option.cpp.o -MF CMakeFiles/options-test.dir/option.cpp.o.d -o CMakeFiles/options-test.dir/option.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/option.cpp

src/gromacs/options/tests/CMakeFiles/options-test.dir/option.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/options-test.dir/option.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/option.cpp > CMakeFiles/options-test.dir/option.cpp.i

src/gromacs/options/tests/CMakeFiles/options-test.dir/option.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/options-test.dir/option.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/option.cpp -o CMakeFiles/options-test.dir/option.cpp.s

src/gromacs/options/tests/CMakeFiles/options-test.dir/optionsassigner.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/flags.make
src/gromacs/options/tests/CMakeFiles/options-test.dir/optionsassigner.cpp.o: ../src/gromacs/options/tests/optionsassigner.cpp
src/gromacs/options/tests/CMakeFiles/options-test.dir/optionsassigner.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/gromacs/options/tests/CMakeFiles/options-test.dir/optionsassigner.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/options/tests/CMakeFiles/options-test.dir/optionsassigner.cpp.o -MF CMakeFiles/options-test.dir/optionsassigner.cpp.o.d -o CMakeFiles/options-test.dir/optionsassigner.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/optionsassigner.cpp

src/gromacs/options/tests/CMakeFiles/options-test.dir/optionsassigner.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/options-test.dir/optionsassigner.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/optionsassigner.cpp > CMakeFiles/options-test.dir/optionsassigner.cpp.i

src/gromacs/options/tests/CMakeFiles/options-test.dir/optionsassigner.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/options-test.dir/optionsassigner.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/optionsassigner.cpp -o CMakeFiles/options-test.dir/optionsassigner.cpp.s

src/gromacs/options/tests/CMakeFiles/options-test.dir/repeatingsection.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/flags.make
src/gromacs/options/tests/CMakeFiles/options-test.dir/repeatingsection.cpp.o: ../src/gromacs/options/tests/repeatingsection.cpp
src/gromacs/options/tests/CMakeFiles/options-test.dir/repeatingsection.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/gromacs/options/tests/CMakeFiles/options-test.dir/repeatingsection.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/options/tests/CMakeFiles/options-test.dir/repeatingsection.cpp.o -MF CMakeFiles/options-test.dir/repeatingsection.cpp.o.d -o CMakeFiles/options-test.dir/repeatingsection.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/repeatingsection.cpp

src/gromacs/options/tests/CMakeFiles/options-test.dir/repeatingsection.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/options-test.dir/repeatingsection.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/repeatingsection.cpp > CMakeFiles/options-test.dir/repeatingsection.cpp.i

src/gromacs/options/tests/CMakeFiles/options-test.dir/repeatingsection.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/options-test.dir/repeatingsection.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/repeatingsection.cpp -o CMakeFiles/options-test.dir/repeatingsection.cpp.s

src/gromacs/options/tests/CMakeFiles/options-test.dir/timeunitmanager.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/flags.make
src/gromacs/options/tests/CMakeFiles/options-test.dir/timeunitmanager.cpp.o: ../src/gromacs/options/tests/timeunitmanager.cpp
src/gromacs/options/tests/CMakeFiles/options-test.dir/timeunitmanager.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/gromacs/options/tests/CMakeFiles/options-test.dir/timeunitmanager.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/options/tests/CMakeFiles/options-test.dir/timeunitmanager.cpp.o -MF CMakeFiles/options-test.dir/timeunitmanager.cpp.o.d -o CMakeFiles/options-test.dir/timeunitmanager.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/timeunitmanager.cpp

src/gromacs/options/tests/CMakeFiles/options-test.dir/timeunitmanager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/options-test.dir/timeunitmanager.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/timeunitmanager.cpp > CMakeFiles/options-test.dir/timeunitmanager.cpp.i

src/gromacs/options/tests/CMakeFiles/options-test.dir/timeunitmanager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/options-test.dir/timeunitmanager.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/timeunitmanager.cpp -o CMakeFiles/options-test.dir/timeunitmanager.cpp.s

src/gromacs/options/tests/CMakeFiles/options-test.dir/treesupport.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/flags.make
src/gromacs/options/tests/CMakeFiles/options-test.dir/treesupport.cpp.o: ../src/gromacs/options/tests/treesupport.cpp
src/gromacs/options/tests/CMakeFiles/options-test.dir/treesupport.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/gromacs/options/tests/CMakeFiles/options-test.dir/treesupport.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/options/tests/CMakeFiles/options-test.dir/treesupport.cpp.o -MF CMakeFiles/options-test.dir/treesupport.cpp.o.d -o CMakeFiles/options-test.dir/treesupport.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/treesupport.cpp

src/gromacs/options/tests/CMakeFiles/options-test.dir/treesupport.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/options-test.dir/treesupport.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/treesupport.cpp > CMakeFiles/options-test.dir/treesupport.cpp.i

src/gromacs/options/tests/CMakeFiles/options-test.dir/treesupport.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/options-test.dir/treesupport.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests/treesupport.cpp -o CMakeFiles/options-test.dir/treesupport.cpp.s

src/gromacs/options/tests/CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/flags.make
src/gromacs/options/tests/CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.o: ../src/testutils/unittest_main.cpp
src/gromacs/options/tests/CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.o: src/gromacs/options/tests/CMakeFiles/options-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object src/gromacs/options/tests/CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/options/tests/CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.o -MF CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.o.d -o CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp

src/gromacs/options/tests/CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp > CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.i

src/gromacs/options/tests/CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp -o CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.s

# Object files for target options-test
options__test_OBJECTS = \
"CMakeFiles/options-test.dir/abstractoptionstorage.cpp.o" \
"CMakeFiles/options-test.dir/filenameoption.cpp.o" \
"CMakeFiles/options-test.dir/filenameoptionmanager.cpp.o" \
"CMakeFiles/options-test.dir/option.cpp.o" \
"CMakeFiles/options-test.dir/optionsassigner.cpp.o" \
"CMakeFiles/options-test.dir/repeatingsection.cpp.o" \
"CMakeFiles/options-test.dir/timeunitmanager.cpp.o" \
"CMakeFiles/options-test.dir/treesupport.cpp.o" \
"CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.o"

# External object files for target options-test
options__test_EXTERNAL_OBJECTS =

bin/options-test: src/gromacs/options/tests/CMakeFiles/options-test.dir/abstractoptionstorage.cpp.o
bin/options-test: src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoption.cpp.o
bin/options-test: src/gromacs/options/tests/CMakeFiles/options-test.dir/filenameoptionmanager.cpp.o
bin/options-test: src/gromacs/options/tests/CMakeFiles/options-test.dir/option.cpp.o
bin/options-test: src/gromacs/options/tests/CMakeFiles/options-test.dir/optionsassigner.cpp.o
bin/options-test: src/gromacs/options/tests/CMakeFiles/options-test.dir/repeatingsection.cpp.o
bin/options-test: src/gromacs/options/tests/CMakeFiles/options-test.dir/timeunitmanager.cpp.o
bin/options-test: src/gromacs/options/tests/CMakeFiles/options-test.dir/treesupport.cpp.o
bin/options-test: src/gromacs/options/tests/CMakeFiles/options-test.dir/__/__/__/testutils/unittest_main.cpp.o
bin/options-test: src/gromacs/options/tests/CMakeFiles/options-test.dir/build.make
bin/options-test: /usr/local/cuda-12.4/lib64/libcudart_static.a
bin/options-test: /usr/lib/x86_64-linux-gnu/librt.a
bin/options-test: lib/libtestutils.so
bin/options-test: lib/libgromacs.so.9.0.0
bin/options-test: lib/libgmock.so.1.13.0
bin/options-test: /usr/lib/gcc/x86_64-linux-gnu/11/libgomp.so
bin/options-test: /usr/lib/x86_64-linux-gnu/libpthread.a
bin/options-test: lib/libgtest.so.1.13.0
bin/options-test: src/gromacs/options/tests/CMakeFiles/options-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Linking CXX executable ../../../../bin/options-test"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/options-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/gromacs/options/tests/CMakeFiles/options-test.dir/build: bin/options-test
.PHONY : src/gromacs/options/tests/CMakeFiles/options-test.dir/build

src/gromacs/options/tests/CMakeFiles/options-test.dir/clean:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests && $(CMAKE_COMMAND) -P CMakeFiles/options-test.dir/cmake_clean.cmake
.PHONY : src/gromacs/options/tests/CMakeFiles/options-test.dir/clean

src/gromacs/options/tests/CMakeFiles/options-test.dir/depend:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1 /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/options/tests /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/options/tests/CMakeFiles/options-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/gromacs/options/tests/CMakeFiles/options-test.dir/depend

