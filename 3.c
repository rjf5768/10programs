#include <klee/klee.h>

int main() {
    int x;
    int y = 2;
    klee_make_symbolic(&x, sizeof(x), "x");

    // Dead branch: This condition is always false.
    if (y == 0) {
        return 42;
    }
    
    if (x > 10) {
        return 1;
    } else {
        return 2;
    }
}
//ktest1 11, ktest2 0