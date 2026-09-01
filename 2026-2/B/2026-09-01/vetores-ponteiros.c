#include <stdio.h>

int main(void) {
    int v[10];
    int *p;

    printf("tamanho de v = %ld\n", sizeof v);
    printf("tamanho de p = %ld\n", sizeof p);
    printf("tamanho de inteiro = %ld\n", sizeof(int));

    // Isso pode?

    p = v;  // SIM!!!
    // v = p;  // Não porque v é constante

    v[0] = 55;
    v[1] = 'A';
    //v[2] = "b"; // deveria ser v[2] = (int) "b"
    printf("v[0] = %d, v[1] = %d\n", v[0], v[1]);
    printf("v[0] = %c, v[1] = %c\n", v[0], v[1]);

    *p = 66;    // o conteúdo apontado por p recebe 66
    printf("v[0] = %d, v[1] = %d\n", v[0], v[1]);

    p = (int *) 1000; // o conteúdo de p recebe 1000
    printf("p = %ld\n", p);
    p = p + 4;
    printf("p = %ld\n", p);

    p = v;

    *(v+3) = 33;
    *(p+3) = 333;

    v[0] = 44;
    p[0] = 444;

    // v++;    // não pode incrementar a constante v
    p++;    // soma 4 ao valor inicial de p

    return 0;
}