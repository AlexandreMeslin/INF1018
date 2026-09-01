#include <stdio.h>

int main(void) {
    char *pchar;
    short *pshort;
    int *pint;
    long *plong;

    pchar = pshort = pint = plong = (void *)0x1000;

    printf("pchar  = %p\n", pchar);
    printf("pshort = %p\n", pshort);
    printf("pint   = %p\n", pint);
    printf("plong  = %p\n", plong);

    pchar++;
    pshort++;
    pint++;
    plong++;

    printf("pchar  = %p\n", pchar);
    printf("pshort = %p\n", pshort);
    printf("pint   = %p\n", pint);
    printf("plong  = %p\n", plong);

    return 0;
}