#include <stdio.h>
#include "dados.h"

int main() {
  int i;
  St *p = dados;
  int max = 0;
  for (i = 0; i <3; i++) {
     if (p->cc && p->ci > max)
       max = p->ci;
     p++;
  }
  printf("%d\n",max);
  return 0;
}