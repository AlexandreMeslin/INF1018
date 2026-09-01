#include <stdio.h>

int main(void) {
    int v[10];  // v é o endereço do vetor de inteiros
    int *p;     // p contém um endereço de um inteiro

    printf("Tamanho de v = %ld\n", sizeof v);
    printf("Tamanho de p = %ld\n", sizeof p);
    printf("Tamanho de inteiro = %ld\n", sizeof(int));

    // Isso pode?
    p = v;  // SIM
    //v = p;  // NÃO porque v é um valor constante

    v[0] = 55;
    v[1] = 'A';
    printf("v[0] = %d, v[1] = %d\n", v[0], v[1]);
    printf("v[0] = %c, v[1] = %c\n", v[0], v[1]);
    *p = 66;
    *v = 77;

    p = (int *) 1000;
    printf("p = %ld, p + 4 = %ld\n", p, p+4);

    p = v;  // de novo!

    *(p+4) = 33;
    *(v+3) = 44;

    // v++;
    p++;

    return 0;
}