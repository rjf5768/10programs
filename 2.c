#include <klee/klee.h>
#include <stdio.h>



int main() {
    int x;
    // Unused variable
    int globalUnused = 0;
    klee_make_symbolic(&x, sizeof(x), "x");
    switch (globalUnused){
        case 2:
            return 42;
            break;
    }
    switch (x) {
        case 0:
            return 0;
            break;
        case 1:
            return 1;
            break;
        case 99999:
            return 99999;
            break;
        default:
            return 0;
            break;
    }

    return 0;
}
