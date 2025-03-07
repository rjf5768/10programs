#include <klee/klee.h>
#include <stdio.h>

// Dead function: never called
void neverCalled() {
    printf("I'm never called!\n");
}

int main() {
    int x;
    klee_make_symbolic(&x, sizeof(x), "x");

    if (x > 0) {
        printf("x is positive.\n");
    } else {
        // Even if x == 0, it also goes here, but let's add a dead path inside
        if (x == -99999) {
            // This path is essentially a "dead path" if we don't allow such large negative values
            printf("Magic negative!\n");
        }
        printf("x is non-positive.\n");
    }

    return 0;
}
