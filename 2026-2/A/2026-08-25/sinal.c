#include <stdio.h>

int main(void) {
    char a;
    unsigned char b;

    short i;
    unsigned short j;

    int x;
    unsigned int y;

    a = 127;    // 0111 1111
    b = 255;    // 1111 1111

    printf("a = %hhd, b = %hhu\n", a, b);

    a++;        // a <- 1000 0000
    printf("a = %hhd, b = %hhu\n", a, b);

    a = b;      // 1111 1111
    printf("a = %hhd, b = %hhu\n", a, b);
    printf("a = %hhd, a = %hhu\n", a, a);

    a = -25;
    b = a;
    printf("a = %hhd, b = %hhu\n", a, b);

    x = 300;
    y = x;
    printf("x = %d, y = %u\n", x, y);

    /*
    -128 -> 128
    128 -> 1000 0000
    (inv)  0111 1111
                  +1
           ---------
           1000 0000
           
    -129 -> 129
    129 -> 0000 0000 0000 0000 0000 0000 1000 0001
    (inv)  1111 1111 1111 1111 1111 1111 0111 1110
                                                +1
           ---------------------------------------
           1111 1111 1111 1111 1111 1111 0111 1111           
    */
    x = -129; // 1111 1111 1111 1111 1111 1111 0111 1111
    y = x;
    printf("x = %d, y = %u\n", x, y);

    i = x;
    j = x;
    a = x;
    b = x;
    printf("i = %hd, j = %hu\n", i, j);
    printf("a = %hhd, b = %hhu\n", a, b);

    return 0;
}