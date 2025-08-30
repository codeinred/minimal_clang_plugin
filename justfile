clang_bin := if os() == "macos" {
    if path_exists("/opt/homebrew/opt/llvm/bin") == "true" {
        "/opt/homebrew/opt/llvm/bin/"
    } else {
        error("Could not find path to LLVM Clang. Please specify when running `just`: eg, `just clang_bin=/opt/homebrew/opt/llvm/bin <target>`")
    }
} else {
    ""
}

ld_preload := if os() == "macos" {
    "DYLD_INSERT_LIBRARIES"
} else {
    "LD_PRELOAD"
}

dsymutil_tgt := if os() == "macos" {
    "_dsymutil"
} else {
    "_noop"
}

lib_ext := if os() == "macos" { "dylib" } else { "so" }

clang_exe := join(clang_bin, 'clang')
clang_tidy := join(clang_bin, 'clang-tidy')

clang_cc := clang_exe
clang_cxx := clang_exe + '++'

build:
    cmake -B build -G Ninja && cmake --build build

ast_dump *args:
    {{clang_cxx}} -Xclang=-ast-dump -c {{args}}

build_test_file *args: build
    mkdir -p build/test_files
    {{clang_cxx}} \
        -fplugin=build/librewrite_methods.{{lib_ext}} \
        -Xclang=-add-plugin \
        -Xclang=test_rewrite \
        -Og -g \
        {{args}}
