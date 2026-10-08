#include <stdio.h>

struct Exemplo {
    signed char c;
    int i;
    long l;
    short s;
};

int main(void) {
    struct Exemplo x;

    printf("Entre com os valores para os campos da estrutura: ");
    scanf("%hhd", &x.c);
    scanf("%d", &x.i);
    scanf("%ld", &x.l);
    scanf("%hd", &x.s);

    printf("Valores lidos c = %d, i = %d, l = %ld, s = %d\n", 
        x.c, x.i, x.l, x.s);

    return 0;
}