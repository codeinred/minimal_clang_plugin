
struct MyClass {
    const char*        method_1() { return "Hello, world!"; }
    inline char const* method_2();
    char const*        method_3();
};

char const* MyClass::method_2() { return "Hi!"; }

char const* MyClass::method_3() { return "Hi 2"; }

extern "C" {
int puts(char const*);
}

int main() {
    MyClass m{};
    puts(m.method_1());
    puts(m.method_2());
    puts(m.method_3());
}
