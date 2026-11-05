#include <stdio.h>
#include "meuinclude.h"

int a = CONSTANTE1;
extern int d;

int main(void) {
    static int b = CONSTANTE2;
    int c;

    a = CONSTANTE1;
    c = soma(a, b);
    
    printf("The sum of %d and %d is %d\n", a, b, c);

    return 0;
}

static int add2(int x, int y) {
    return x + 10 * y;
}

int add(int x, int y) {
    return add2(x, y);
}
