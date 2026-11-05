#include <stdio.h>
#include "meuInclude.h"

static int valor2(int a) {
    static long b = 5;
    return a + b;
}

int main(void) {
    static int b = 1;
    int c = 2;
    printf("%d\n", calcula(b + valor2(c)));
    return 0;
}       

int valor(int a) {
    static short b = 3;
    return a + b;
}
