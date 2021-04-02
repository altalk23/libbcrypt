cmake_minimum_required(VERSION 3.0.0)

project(bcrypt C)

option(BUILD_ASM "if ues x86.S" ON)
option(BUILD_TESTING "if build and run tests" ON)

message("BUILD_ASM     = ${BUILD_ASM}")
message("BUILD_TESTING = ${BUILD_TESTING}")

add_subdirectory(src/lib)

if (BUILD_TESTING)
    add_subdirectory(src/test)
endif()
