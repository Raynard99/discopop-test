# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/raynardwidjaja/discopop

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/raynardwidjaja/discopop/build

# Include any dependencies generated for this target.
include CUGeneration/CMakeFiles/LLVMCUGeneration.dir/depend.make

# Include the progress variables for this target.
include CUGeneration/CMakeFiles/LLVMCUGeneration.dir/progress.make

# Include the compile flags for this target's objects.
include CUGeneration/CMakeFiles/LLVMCUGeneration.dir/flags.make

CUGeneration/CMakeFiles/LLVMCUGeneration.dir/CUGenerationPass.cpp.o: CUGeneration/CMakeFiles/LLVMCUGeneration.dir/flags.make
CUGeneration/CMakeFiles/LLVMCUGeneration.dir/CUGenerationPass.cpp.o: ../CUGeneration/CUGenerationPass.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/raynardwidjaja/discopop/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CUGeneration/CMakeFiles/LLVMCUGeneration.dir/CUGenerationPass.cpp.o"
	cd /home/raynardwidjaja/discopop/build/CUGeneration && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LLVMCUGeneration.dir/CUGenerationPass.cpp.o -c /home/raynardwidjaja/discopop/CUGeneration/CUGenerationPass.cpp

CUGeneration/CMakeFiles/LLVMCUGeneration.dir/CUGenerationPass.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMCUGeneration.dir/CUGenerationPass.cpp.i"
	cd /home/raynardwidjaja/discopop/build/CUGeneration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/raynardwidjaja/discopop/CUGeneration/CUGenerationPass.cpp > CMakeFiles/LLVMCUGeneration.dir/CUGenerationPass.cpp.i

CUGeneration/CMakeFiles/LLVMCUGeneration.dir/CUGenerationPass.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMCUGeneration.dir/CUGenerationPass.cpp.s"
	cd /home/raynardwidjaja/discopop/build/CUGeneration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/raynardwidjaja/discopop/CUGeneration/CUGenerationPass.cpp -o CMakeFiles/LLVMCUGeneration.dir/CUGenerationPass.cpp.s

CUGeneration/CMakeFiles/LLVMCUGeneration.dir/__/share/lib/DPUtils.cpp.o: CUGeneration/CMakeFiles/LLVMCUGeneration.dir/flags.make
CUGeneration/CMakeFiles/LLVMCUGeneration.dir/__/share/lib/DPUtils.cpp.o: ../share/lib/DPUtils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/raynardwidjaja/discopop/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CUGeneration/CMakeFiles/LLVMCUGeneration.dir/__/share/lib/DPUtils.cpp.o"
	cd /home/raynardwidjaja/discopop/build/CUGeneration && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LLVMCUGeneration.dir/__/share/lib/DPUtils.cpp.o -c /home/raynardwidjaja/discopop/share/lib/DPUtils.cpp

CUGeneration/CMakeFiles/LLVMCUGeneration.dir/__/share/lib/DPUtils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LLVMCUGeneration.dir/__/share/lib/DPUtils.cpp.i"
	cd /home/raynardwidjaja/discopop/build/CUGeneration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/raynardwidjaja/discopop/share/lib/DPUtils.cpp > CMakeFiles/LLVMCUGeneration.dir/__/share/lib/DPUtils.cpp.i

CUGeneration/CMakeFiles/LLVMCUGeneration.dir/__/share/lib/DPUtils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LLVMCUGeneration.dir/__/share/lib/DPUtils.cpp.s"
	cd /home/raynardwidjaja/discopop/build/CUGeneration && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/raynardwidjaja/discopop/share/lib/DPUtils.cpp -o CMakeFiles/LLVMCUGeneration.dir/__/share/lib/DPUtils.cpp.s

# Object files for target LLVMCUGeneration
LLVMCUGeneration_OBJECTS = \
"CMakeFiles/LLVMCUGeneration.dir/CUGenerationPass.cpp.o" \
"CMakeFiles/LLVMCUGeneration.dir/__/share/lib/DPUtils.cpp.o"

# External object files for target LLVMCUGeneration
LLVMCUGeneration_EXTERNAL_OBJECTS =

libi/LLVMCUGeneration.so: CUGeneration/CMakeFiles/LLVMCUGeneration.dir/CUGenerationPass.cpp.o
libi/LLVMCUGeneration.so: CUGeneration/CMakeFiles/LLVMCUGeneration.dir/__/share/lib/DPUtils.cpp.o
libi/LLVMCUGeneration.so: CUGeneration/CMakeFiles/LLVMCUGeneration.dir/build.make
libi/LLVMCUGeneration.so: CUGeneration/CMakeFiles/LLVMCUGeneration.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/raynardwidjaja/discopop/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared module ../libi/LLVMCUGeneration.so"
	cd /home/raynardwidjaja/discopop/build/CUGeneration && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LLVMCUGeneration.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CUGeneration/CMakeFiles/LLVMCUGeneration.dir/build: libi/LLVMCUGeneration.so

.PHONY : CUGeneration/CMakeFiles/LLVMCUGeneration.dir/build

CUGeneration/CMakeFiles/LLVMCUGeneration.dir/clean:
	cd /home/raynardwidjaja/discopop/build/CUGeneration && $(CMAKE_COMMAND) -P CMakeFiles/LLVMCUGeneration.dir/cmake_clean.cmake
.PHONY : CUGeneration/CMakeFiles/LLVMCUGeneration.dir/clean

CUGeneration/CMakeFiles/LLVMCUGeneration.dir/depend:
	cd /home/raynardwidjaja/discopop/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/raynardwidjaja/discopop /home/raynardwidjaja/discopop/CUGeneration /home/raynardwidjaja/discopop/build /home/raynardwidjaja/discopop/build/CUGeneration /home/raynardwidjaja/discopop/build/CUGeneration/CMakeFiles/LLVMCUGeneration.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CUGeneration/CMakeFiles/LLVMCUGeneration.dir/depend

