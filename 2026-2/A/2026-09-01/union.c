#include <stdio.h>

union U {
    char c;
    long l;
    int i;
    short s;
};

int main(void) {
    union U x;

    x.c = 1;
    x.l = 2;

    printf("x.c = %hhd, x.l = %ld\n", x.c, x.l);
    printf("&x.c = %p\n&x.l = %p\n", &(x.c), &(x.l));

    x.l = 0x1234567876;
    printf("x.c = %02X, x.l = %16lX\n", x.c, x.l);
    printf("x.i = %08X, x.s = %04X\n", x.i, x.s);

    x.c = 0x1A;
    printf("x.c = %02X, x.l = %16lX\n", x.c, x.l);
    printf("x.i = %08X, x.s = %04X\n", x.i, x.s);

    return 0;
}