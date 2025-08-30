# Very Simple Compiler Plugin

This repo demonstrates how to rewrite method bodies using Clang Plugins.

## Building and Running the Plugin

Describes how to build and run the plugin.

There are two ways - you can use `just`, or you can execute the steps on the
command line.

### Building and running (just)

You can build and run using the justfile, assuming that clang is at a somewhat
standard location. If not, CMake will error during configuration.

```sh
just build_test_file test_inputs/hello.cpp -o hello
```

### Building and running (manual)

**Macos:**

```sh
cmake -B build -G Ninja -DCMAKE_PREFIX_PATH=/opt/homebrew/opt/llvm
cmake --build build
/opt/homebrew/opt/llvm/bin/clang++ \
    -fplugin=build/librewrite_methods.dylib \
    -Xclang=-add-plugin \
    -Xclang=test_rewrite \
    -Og -g test_inputs/hello.cpp -o hello
```

**Linux:**

Assuming clang can be found via `find_package`, you can build on linux like so:

```sh
cmake -B build -G Ninja
cmake --build build
clang++ \
    -fplugin=build/librewrite_methods.so \
    -Xclang=-add-plugin \
    -Xclang=test_rewrite \
    -Og -g test_inputs/hello.cpp -o hello
```

### Running the compiled program

All methods listed above should produce an executable named `hello`. This executable
is a compiled version of `test_inputs/hello.cpp`.

```sh
./hello
```
