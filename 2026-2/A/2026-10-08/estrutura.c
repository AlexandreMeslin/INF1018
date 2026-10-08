#include <stdio.h>

struct S {
    signed char c;
    int i;
    long l;
    short s;
};

int main(void) {
    struct S x;

    printf("Entre os valores de c, i, l e s: ");
    scanf("%hhd", &x.c);
    scanf("%d", &x.i);
    scanf("%ld", &x.l);
    scanf("%hd", &x.s);

    printf("Valores lidos: c = %hhd, i = %d, l = %ld, s = %hd\n", x.c, x.i, x.l, x.s);

    return 0;
}