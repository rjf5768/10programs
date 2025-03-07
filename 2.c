#include <klee/klee.h>
#include <stdio.h>

// Unused variable
int globalUnused = 0;

int main() {
    int x;
    klee_make_symbolic(&x, sizeof(x), "x");

    switch (x) {
        case 0:
            printf("x is 0\n");
            break;
        case 1:
            printf("x is 1\n");
            break;
        case 99999:
            printf("Magic big number.\n");
            break;
        default:
            printf("x is something else.\n");
            break;
    }

    return 0;
}
