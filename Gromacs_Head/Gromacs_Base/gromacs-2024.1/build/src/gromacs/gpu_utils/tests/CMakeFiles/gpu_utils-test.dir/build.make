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
include src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/compiler_depend.make

# Include the progress variables for this target.
include src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/progress.make

# Include the compile flags for this target's objects.
include src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/flags.make

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_devicetransfers.cu.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_devicetransfers.cu.o.depend
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_devicetransfers.cu.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_devicetransfers.cu.o.Release.cmake
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_devicetransfers.cu.o: ../src/gromacs/gpu_utils/tests/devicetransfers.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building NVCC (Device) object src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_devicetransfers.cu.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir && /usr/bin/cmake -E make_directory /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir//.
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir && /usr/bin/cmake -D verbose:BOOL=$(VERBOSE) -D build_configuration:STRING=Release -D generated_file:STRING=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir//./gpu_utils-test_generated_devicetransfers.cu.o -D generated_cubin_file:STRING=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir//./gpu_utils-test_generated_devicetransfers.cu.o.cubin.txt -P /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir//gpu_utils-test_generated_devicetransfers.cu.o.Release.cmake

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_typecasts_runner.cu.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_typecasts_runner.cu.o.depend
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_typecasts_runner.cu.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_typecasts_runner.cu.o.Release.cmake
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_typecasts_runner.cu.o: ../src/gromacs/gpu_utils/tests/typecasts_runner.cu
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building NVCC (Device) object src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_typecasts_runner.cu.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir && /usr/bin/cmake -E make_directory /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir//.
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir && /usr/bin/cmake -D verbose:BOOL=$(VERBOSE) -D build_configuration:STRING=Release -D generated_file:STRING=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir//./gpu_utils-test_generated_typecasts_runner.cu.o -D generated_cubin_file:STRING=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir//./gpu_utils-test_generated_typecasts_runner.cu.o.cubin.txt -P /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir//gpu_utils-test_generated_typecasts_runner.cu.o.Release.cmake

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/flags.make
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.o: ../src/gromacs/gpu_utils/tests/clfftinitializer.cpp
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.o -MF CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.o.d -o CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/clfftinitializer.cpp

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/clfftinitializer.cpp > CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.i

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/clfftinitializer.cpp -o CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.s

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_availability.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/flags.make
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_availability.cpp.o: ../src/gromacs/gpu_utils/tests/device_availability.cpp
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_availability.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_availability.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_availability.cpp.o -MF CMakeFiles/gpu_utils-test.dir/device_availability.cpp.o.d -o CMakeFiles/gpu_utils-test.dir/device_availability.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/device_availability.cpp

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_availability.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gpu_utils-test.dir/device_availability.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/device_availability.cpp > CMakeFiles/gpu_utils-test.dir/device_availability.cpp.i

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_availability.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gpu_utils-test.dir/device_availability.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/device_availability.cpp -o CMakeFiles/gpu_utils-test.dir/device_availability.cpp.s

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/flags.make
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.o: ../src/gromacs/gpu_utils/tests/device_stream_manager.cpp
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.o -MF CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.o.d -o CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/device_stream_manager.cpp

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/device_stream_manager.cpp > CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.i

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/device_stream_manager.cpp -o CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.s

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/flags.make
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.o: ../src/gromacs/gpu_utils/tests/hostallocator.cpp
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.o -MF CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.o.d -o CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/hostallocator.cpp

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/hostallocator.cpp > CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.i

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/hostallocator.cpp -o CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.s

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/flags.make
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.o: ../src/gromacs/gpu_utils/tests/pinnedmemorychecker.cpp
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.o -MF CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.o.d -o CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/pinnedmemorychecker.cpp

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/pinnedmemorychecker.cpp > CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.i

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/pinnedmemorychecker.cpp -o CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.s

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/flags.make
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.o: ../src/gromacs/gpu_utils/tests/device_buffer.cpp
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.o -MF CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.o.d -o CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/device_buffer.cpp

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/device_buffer.cpp > CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.i

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/device_buffer.cpp -o CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.s

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/flags.make
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.o: ../src/gromacs/gpu_utils/tests/gpueventsynchronizer.cpp
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.o -MF CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.o.d -o CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/gpueventsynchronizer.cpp

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/gpueventsynchronizer.cpp > CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.i

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/gpueventsynchronizer.cpp -o CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.s

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/typecasts.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/flags.make
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/typecasts.cpp.o: ../src/gromacs/gpu_utils/tests/typecasts.cpp
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/typecasts.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/typecasts.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/typecasts.cpp.o -MF CMakeFiles/gpu_utils-test.dir/typecasts.cpp.o.d -o CMakeFiles/gpu_utils-test.dir/typecasts.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/typecasts.cpp

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/typecasts.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gpu_utils-test.dir/typecasts.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/typecasts.cpp > CMakeFiles/gpu_utils-test.dir/typecasts.cpp.i

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/typecasts.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gpu_utils-test.dir/typecasts.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests/typecasts.cpp -o CMakeFiles/gpu_utils-test.dir/typecasts.cpp.s

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/flags.make
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.o: ../src/testutils/unittest_main.cpp
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.o: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.o"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.o -MF CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.o.d -o CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.o -c /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.i"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp > CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.i

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.s"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/testutils/unittest_main.cpp -o CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.s

# Object files for target gpu_utils-test
gpu_utils__test_OBJECTS = \
"CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.o" \
"CMakeFiles/gpu_utils-test.dir/device_availability.cpp.o" \
"CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.o" \
"CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.o" \
"CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.o" \
"CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.o" \
"CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.o" \
"CMakeFiles/gpu_utils-test.dir/typecasts.cpp.o" \
"CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.o"

# External object files for target gpu_utils-test
gpu_utils__test_EXTERNAL_OBJECTS = \
"/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_devicetransfers.cu.o" \
"/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_typecasts_runner.cu.o"

bin/gpu_utils-test: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/clfftinitializer.cpp.o
bin/gpu_utils-test: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_availability.cpp.o
bin/gpu_utils-test: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_stream_manager.cpp.o
bin/gpu_utils-test: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/hostallocator.cpp.o
bin/gpu_utils-test: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/pinnedmemorychecker.cpp.o
bin/gpu_utils-test: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/device_buffer.cpp.o
bin/gpu_utils-test: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpueventsynchronizer.cpp.o
bin/gpu_utils-test: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/typecasts.cpp.o
bin/gpu_utils-test: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/__/__/__/testutils/unittest_main.cpp.o
bin/gpu_utils-test: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_devicetransfers.cu.o
bin/gpu_utils-test: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_typecasts_runner.cu.o
bin/gpu_utils-test: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/build.make
bin/gpu_utils-test: /usr/local/cuda-12.4/lib64/libcudart_static.a
bin/gpu_utils-test: /usr/lib/x86_64-linux-gnu/librt.a
bin/gpu_utils-test: lib/libtestutils.so
bin/gpu_utils-test: lib/libgromacs.so.9.0.0
bin/gpu_utils-test: lib/libgmock.so.1.13.0
bin/gpu_utils-test: /usr/lib/gcc/x86_64-linux-gnu/11/libgomp.so
bin/gpu_utils-test: /usr/lib/x86_64-linux-gnu/libpthread.a
bin/gpu_utils-test: lib/libgtest.so.1.13.0
bin/gpu_utils-test: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Linking CXX executable ../../../../bin/gpu_utils-test"
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gpu_utils-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/build: bin/gpu_utils-test
.PHONY : src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/build

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/clean:
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests && $(CMAKE_COMMAND) -P CMakeFiles/gpu_utils-test.dir/cmake_clean.cmake
.PHONY : src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/clean

src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/depend: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_devicetransfers.cu.o
src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/depend: src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/gpu_utils-test_generated_typecasts_runner.cu.o
	cd /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1 /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/src/gromacs/gpu_utils/tests /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests /home/ubuntu/W4GROMACSPIPE/Gromacs_Head/Gromacs_Base/gromacs-2024.1/build/src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/gromacs/gpu_utils/tests/CMakeFiles/gpu_utils-test.dir/depend

