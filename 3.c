#include <klee/klee.h>
#include <stdio.h>

int someFunction(int y) {
    // This branch is always dead because 'y' can’t be 100000 if we restrict range or don’t consider it
    if (y == 100000) {
        return 42;
    }
    return y + 1;
}

int main() {
    int x;
    klee_make_symbolic(&x, sizeof(x), "x");

    int result = someFunction(x);
    printf("Result: %d\n", result);

    return 0;
}
