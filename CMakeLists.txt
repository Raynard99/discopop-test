cmake_minimum_required(VERSION 3.4.3)
project(DiscoPoP)

set(CMAKE_CXX_STANDARD 11)
execute_process(COMMAND source config RESULT_VARIABLE res)
set(LLVM_DIR ${LLVM_DIST_PATH}/lib/cmake/llvm)
find_package(LLVM 8.0 REQUIRED CONFIG)
message(STATUS "Using LLVM version ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
list(APPEND CMAKE_MODULE_PATH ${LLVM_CMAKE_DIR})

set(LLVM_RUNTIME_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/bin)
set(LLVM_LIBRARY_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/libi)

list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(HandleLLVMOptions)
include(AddLLVM)

add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})

add_subdirectory(CUGeneration)
add_subdirectory(CUInstantiation)
add_subdirectory(DPInstrumentation)
add_subdirectory(DPReduction)
add_subdirectory(DPInstrumentationOmission)
add_subdirectory(rtlib)

set(ENV{DPInstrumentation1} "-g\ -O0\ -fno-discard-value-names\ -Xclang\ -load\ -Xclang\ ${CMAKE_CURRENT_BINARY_DIR}/libi/LLVMDPInstrumentation.so")
message("variable is $ENV{DPInstrumentation1}")



