#include <stdio.h>

struct s1 {
    int a;
    int b;
    char c;
};

struct s2 {
    char a;
    int b;
    int c;
};

struct s3 {
    int i1;
    char c1;
    int i2;
    char c2;
};

struct s4 {
    int i1;
    char c1;
    char c2;
    int i2;
};

int main(void) {
    printf("tamanho de s1 = %ld\n", sizeof(struct s1));
    printf("tamanho de s2 = %ld\n", sizeof(struct s2));
    printf("tamanho de s3 = %ld\n", sizeof(struct s3));
    printf("tamanho de s4 = %ld\n", sizeof(struct s4));

    return 0;
}