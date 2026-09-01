#include <stdio.h>

int main(void) {
    char a;
    unsigned char b;

    short i;
    unsigned short j;

    int x;
    unsigned int y;

    a = 25;
    b = a;
    printf("a = %hhd, b = %hhu\n", a, b);

    a = -25;
    b = a;
    printf("a = %hhd, b = %hhu\n", a, b);
    printf("a = %hhd, a = %hhu\n", a, a);

    /*
    32 bits c/ sinal
    -129 -> 129
    129 = 128 + 1
    128 = 1000 0000
    129 = 1000 0001
    129 -> 0000 0000 0000 0000 0000 0000 1000 0001
    (inv)  1111 1111 1111 1111 1111 1111 0111 1110
                                                +1
           ---------------------------------------
           1111 1111 1111 1111 1111 1111 0111 1111
                                         0111 1111 -> a
    */
    x = -129;
    y = x;
    i = x;
    j = x;
    a = x;
    b = x;
    printf("x = %d, y = %u\n", x, y);
    printf("i = %hd, j = %hu\n", i, j);
    printf("a = %hhd, b = %hhu\n", a, b);

    a = 127;    // 0111 1111
    printf("a = %hhd, a = %hhu\n", a, a);
    a++;        // 1000 0000
    printf("a = %hhd, a = %hhu\n", a, a);

    return 0;
}