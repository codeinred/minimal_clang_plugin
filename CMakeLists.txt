cmake_minimum_required(VERSION 3.23)

project(mem_profile)

if(APPLE)
    list(APPEND CMAKE_PREFIX_PATH /opt/homebrew/opt/llvm)
endif()
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

if(UNIX)
    add_compile_options(-Wall -fcolor-diagnostics -g)
endif()

include(cmake/get_cpm.cmake)


CPMAddPackage("gh:fmtlib/fmt#11.2.0")



find_package(Clang REQUIRED)
message(STATUS "Using Clang @ ${Clang_DIR}
    include: ${CLANG_INCLUDE_DIRS}
    config: ${Clang_CONFIG}
    CLANG_LINK_CLANG_DYLIB: ${CLANG_LINK_CLANG_DYLIB}
")
message(STATUS "Using LLVM @ ${LLVM_DIR}
    config: ${LLVM_CONFIG}")


# Check for existence of static library targets. If these exist, link them,
# otherwise fall back to dynamic library target clang-cpp
if(TARGET clangFrontend)
    set(clang_libs
        clangAST
        clangBasic
        clangFrontend
        clangSerialization
        clangTooling
    )
    set(llvm_tool_libs)
else()
    set(clang_libs clang-cpp)
    set(llvm_tool_libs LLVM)
endif()

add_library(clang_clang INTERFACE)
target_include_Directories(clang_clang INTERFACE ${CLANG_INCLUDE_DIRS})
target_link_libraries(clang_clang INTERFACE ${clang_libs})
add_library(clang::clang ALIAS clang_clang)

file(GLOB_RECURSE src include/plug/*.cpp)

add_library(rewrite_methods SHARED ${src})
target_link_libraries(rewrite_methods clang::clang fmt::fmt)
target_include_directories(rewrite_methods PRIVATE include/)
