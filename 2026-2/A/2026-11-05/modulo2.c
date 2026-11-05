#include "meuInclude.h"

int x = INICIO;

static int valor2(int a) {
    static int b = 5;
    return a + b;
}

int calcula(int x) {
        x = valor2(x);
        return x + 4;
}
