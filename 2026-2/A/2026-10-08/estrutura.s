/*
#include <stdio.h>

struct S {
    signed char c;
    int i;
    long l;
    short s;
};

int main(void) {
    struct S x;

    printf("Entre os valores de c, i, l e s: ");
    scanf("%hhd", &x.c);
    scanf("%d", &x.i);
    scanf("%ld", &x.l);
    scanf("%hd", &x.s);

    printf("Valores lidos: c = %hhd, i = %d, l = %ld, s = %hd\n", x.c, x.i, x.l, x.s);

    return 0;
}
*/

.data
Fpergunta:  .string "Entre os valores de c, i, l e s: "
Fhhd:   .string "%hhd"
Fd:     .string "%d"
Fld:    .string "%ld"
Fhd:    .string "%hd"
Fsaida: .string "Valores lidos: c = %hhd, i = %d, l = %ld, s = %hd\n"

.text

#int main(void) {
.globl main
main:

    pushq   %rbp        # salva o endereço do RA da chamadora na pilha
    movq    %rsp, %rbp  # cria a base do RA da função chamada
    subq    $32,  %rsp  # abre espaço para o RA da função chamadora

#    struct S x;

#    printf("Entre os valores de c, i, l e s: ");
    movq    $Fpergunta, %rdi
    movl    $0, %eax    # isso só para o printf!
    call    printf

#    scanf("%hhd", &x.c);
    movq    $Fhhd, %rdi
    leaq    -24(%rbp), %rsi
    call    scanf

#    scanf("%d", &x.i);
    movq    $Fd, %rdi
    leaq    -20(%rbp), %rsi
    call    scanf

#    scanf("%ld", &x.l);
    movq    $Fld, %rdi
    leaq    -16(%rbp), %rsi
    call    scanf

#    scanf("%hd", &x.s);
    movq    $Fhd, %rdi
    leaq    -8(%rbp), %rsi
    call    scanf

#    printf("Valores lidos: c = %hhd, i = %d, l = %ld, s = %hd\n", 
#        x.c, x.i, x.l, x.s);
    movq    $Fsaida, %rdi   # 1o parâmetro
    movb    -24(%rbp), %sil # 2o parâmetro x.c
    movl    -20(%rbp), %edx # 3o parâmetro x.i
    movq    -16(%rbp), %rcx # 4o parâmetro x.l
    movw    -8(%rbp), %r8w  # 5o parâmetro x.s
    movl    $0, %eax
    call    printf

#    return 0;
    movl    $0, %eax

#}
    leave
    ret
