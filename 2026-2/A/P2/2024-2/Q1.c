#include <stdio.h>
void dump(void *p, int n)
{
    unsigned char *p1 = (unsigned char *)p;
    while (n--)
    {
        printf("%p - %02x\n", p1, *p1);
        p1++;
    }
}
struct S
{
    short a;
    double b;
    char c;
    float d;
} s = {-25, 25.25, 25, 25.25};
int main(void)
{
    dump(&s, sizeof(struct S));
    return 0;
}