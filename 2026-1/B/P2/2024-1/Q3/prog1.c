#include <stdio.h>

#define VALOR_INICIAL 321

extern short s;
extern short banana;
void abacaxi(void);

static int x = 123;

void f1(void) {
    s--;
    printf("s = %hd, x = %d\n", s, x);
}

static void f3(void) {
    static int z = 456;
    int y = VALOR_INICIAL;
    s++;
    printf("s = %hd, y = %d, z = %d\n", s, y, z);
}

void f2(void) {
    static int z = 213;
    printf("s = %hd, z = %d\n", s, z);
    f1();
    f3();
}
