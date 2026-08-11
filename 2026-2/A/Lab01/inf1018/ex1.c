#include <stdio.h>
#include <stdlib.h>

float foo (float pf) {
  return pf+1;
}

int main (int argc, char **argv) {
  float f;
  if (argc!=2) {
    printf ("uso do programa: %s <valor float>\n", argv[0]);
    exit(0);
  }
  f = atof(argv[1]);
  printf ("foo(%.2f): %.2f\n", f, foo(f));
  return 0;
}