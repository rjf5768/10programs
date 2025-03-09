#include <klee/klee.h>

int main() {
    int a;
    klee_make_symbolic(&a, sizeof(a), "a");
    int b = 20;
    int c = 20;
    int ret;
    if (a > 5) {
        ret = 1;
    } else {
        ret = 2;
    }

    // Unreachable branch: 
    if (b > 100) {
        return 42;
    }
    if (c > 100) {
        return 42;
    }

    return ret;
}
