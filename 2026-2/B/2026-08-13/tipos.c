#include <stdio.h>

int main(void) {
    char a;

    printf("A variável a tem %ld bytes\n", sizeof a);

    a = 'A';
    printf("a = %c, a = %d\n", a, a);

    a = 70;
    printf("a = %c, a = %d\n", a, a);


    return 0;
}