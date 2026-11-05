#include <stdio.h>
#include "meuinclude.h"

static int add2(int x, int y) {
    return x + 100 * y;
}

int soma(int x, int y) {
    return add2(x, y);
}
