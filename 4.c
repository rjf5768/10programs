#include <klee/klee.h>

int main() {
    int x;
    int y = 1;
    klee_make_symbolic(&x, sizeof(x), "x");

    // Dead branch: This condition is always false.
    if (y==0) {
        return 99;
    }

    // Even though there are two branches (even or odd),
    // both paths return the same value.
    if (x == 3) {
        return 2;
    } else if (x % 2 == 0) {
        return 1;
    } else {
        return 1;
    }
}

// ktest1 input 3, ktest2 input 1, ktest3 input 0