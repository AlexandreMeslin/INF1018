/*
#include <stdio.h>

struct Exemplo {
    signed char c;
    int i;
    long l;
    short s;
};

int main(void) {
    struct Exemplo x;

    printf("Entre com os valores para os campos da estrutura: ");
    scanf("%hhd", &x.c);
    scanf("%d", &x.i);
    scanf("%ld", &x.l);
    scanf("%hd", &x.s);

    printf("Valores lidos c = %d, i = %d, l = %ld, s = %d\n", 
        x.c, x.i, x.l, x.s);

    return 0;
}
*/

.data
Sentrada:   .string "Entre com os valores para os campos da estrutura: "
Ssaida:     .string "Valores lidos c = %d, i = %d, l = %ld, s = %d\n"
SFhhd:      .string "%hhd"
SFd:        .string "%d"
SFld:       .string "%ld"
SFhd:       .string "%hd"

.text

#int main(void) {
.globl  main
main:

    pushq   %rbp        # salva o endereço do RA da função chamadora
    movq    %rsp, %rbp  # cria a base do RA da função chamada
    subq    $32, %rsp  # abre espaço para o RA da função chamada

    // TODO: salvar registradores callee-saved que vamos usar

#    struct Exemplo x;

#    printf("Entre com os valores para os campos da estrutura: ");
    movq    $Sentrada, %rdi # 1o parâmetro
    movl    $0, %eax        # só para o printf!
    call    printf

#    scanf("%hhd", &x.c);
    movq    $SFhhd, %rdi
    leaq    -24(%rbp), %rsi
    call    scanf

#    scanf("%d", &x.i);
    movq    $SFd, %rdi
    leaq    -20(%rbp), %rsi
    call    scanf

#    scanf("%ld", &x.l);
    movq    $SFld, %rdi
    leaq    -16(%rbp), %rsi
    call    scanf

#    scanf("%hd", &x.s);
    movq    $SFhd, %rdi
    leaq    -8(%rbp), %rsi
    call    scanf

#    printf("Valores lidos c = %d, i = %d, l = %ld, s = %d\n", 
#        x.c, x.i, x.l, x.s);
    movq    $Ssaida, %rdi
    movb    -24(%rbp), %sil # 2o parâmetro de 1 byte
    movl    -20(%rbp), %edx # 3o parâmetro de 4 bytes
    movq    -16(%rbp), %rcx # 4o parâmetro de 8 bytes
    movw    -8(%rbp), %r8w  # 5o parâmetro de 2 bytes
    movl    $0, %eax
    call    printf

#    return 0;
    movl    $0, %eax

#}
    leave
    ret
