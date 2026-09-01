#include <stdio.h>

union u {
    char c;
    long l;
};

int main(void) {
    union u x;

    printf("&x.l = %p\n&x.c = %p\n", &(x.l), &(x.c));

    x.c = 1;
    x.l = 2;
    printf("x.c = %hhd, x.l = %ld\n", x.c, x.l);

    x.l = 0xABCDEF0987654321;
    printf("x.c = %02hhX, x.l = %016lX\n", x.c, x.l);

    x.c = 0x1a;
    printf("x.c = %02hhX, x.l = %016lX\n", x.c, x.l);

    return 0;
}