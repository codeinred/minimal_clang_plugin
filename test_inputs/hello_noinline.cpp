
struct MyClass {
    [[gnu::noinline]] const char*        method_1() { return "method_1"; }
    [[gnu::noinline]] inline char const* method_2();
    [[gnu::noinline]] char const*        method_3();
};

char const* MyClass::method_2() { return "method_2"; }

char const* MyClass::method_3() { return "method_3"; }

extern "C" {
int puts(char const*);
}

int main() {
    MyClass m{};
    puts(m.method_1());
    puts(m.method_2());
    puts(m.method_3());
}
