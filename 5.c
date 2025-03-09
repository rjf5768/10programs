#include <klee/klee.h>

int main() {
    int x;
    klee_make_symbolic(&x, sizeof(x), "x");

    if (x > 0) {
        return 1;          // Path 1: x > 0
    } else if (x == 0) {
        return 2;          // Path 2a: x == 0
    } else if (0) {         // Dead branch: never executed
        return 3;
    } else {
        return 2;          // Path 2b: x < 0 (identical output as x == 0)
    }
}
//ktest1 input 1, ketst2 input -2147483648, ktest3 input 0