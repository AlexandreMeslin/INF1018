#include <stdio.h>

extern short s;

void f1(void);
void f2(void);

short s = 101;
short t;

int main(void) {
    printf("s = %08hx\n", s);
    printf("t = %08hx\n", t);
    f2();
    return 0;
}