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

# Utility rule file for install-LLVMDPReduction.

# Include the progress variables for this target.
include DPReduction/CMakeFiles/install-LLVMDPReduction.dir/progress.make

DPReduction/CMakeFiles/install-LLVMDPReduction: libi/LLVMDPReduction.so
	cd /home/raynardwidjaja/discopop/build/DPReduction && /usr/bin/cmake -DCMAKE_INSTALL_COMPONENT="LLVMDPReduction" -P /home/raynardwidjaja/discopop/build/cmake_install.cmake

install-LLVMDPReduction: DPReduction/CMakeFiles/install-LLVMDPReduction
install-LLVMDPReduction: DPReduction/CMakeFiles/install-LLVMDPReduction.dir/build.make

.PHONY : install-LLVMDPReduction

# Rule to build all files generated by this target.
DPReduction/CMakeFiles/install-LLVMDPReduction.dir/build: install-LLVMDPReduction

.PHONY : DPReduction/CMakeFiles/install-LLVMDPReduction.dir/build

DPReduction/CMakeFiles/install-LLVMDPReduction.dir/clean:
	cd /home/raynardwidjaja/discopop/build/DPReduction && $(CMAKE_COMMAND) -P CMakeFiles/install-LLVMDPReduction.dir/cmake_clean.cmake
.PHONY : DPReduction/CMakeFiles/install-LLVMDPReduction.dir/clean

DPReduction/CMakeFiles/install-LLVMDPReduction.dir/depend:
	cd /home/raynardwidjaja/discopop/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/raynardwidjaja/discopop /home/raynardwidjaja/discopop/DPReduction /home/raynardwidjaja/discopop/build /home/raynardwidjaja/discopop/build/DPReduction /home/raynardwidjaja/discopop/build/DPReduction/CMakeFiles/install-LLVMDPReduction.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : DPReduction/CMakeFiles/install-LLVMDPReduction.dir/depend

