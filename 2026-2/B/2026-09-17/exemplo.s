/*
int g(int x);
int f(int i, int n) {
 int a = 0;
 while (n--) {
 a += g(i);
 i *= 2;
 }
 return a;
}
*/
/*
Dicionário
Reg     Var
R15D    a
EDI     i
ESI     n
*/

.text

#int g(int x);

#int f(int i, int n) {
.globl f
f:
    # Criar o RA da função chamada
    pushq   %rbp    # salva o endereço da base do RA da função chamadora na pilha
                    # coloca o endereço do topo da pilha com um valor múltiplo de 16
    movq    %rsp, %rbp  # o RBP agora aponta para o topo da pilha para ser a base do RA da função chamada 
    subq    $???, %rsp  # abre espaço para o RA da função chamada                   

    # salvar no RA todos os registradores callee-saved usados
    movq    %r15, -8(%rbp)

# int a = 0;
# int a;
# a = 0;
    movl    $0, %r15d

# while (n--) {

# while (n!=0) {
WHILE:
    cmpl    $0, %esi
    jz      FORA_WHILE

# n--
    decl    %esi

# a += g(i);
# temp = g(i);

    # chamada da função g
    # 1o passo: salvar todos os registradores não callee-saved que usamos E vamos usar
    movl    %edi, -16(%rbp)
    movl    %esi, -12(%rbp)
    # 2o passo: preparar os parâmetros
    # 1o parâmetro: colocar o valor da variável i no registrador EDI
    # nada precisa ser feito porque a variável i já está em EDI
    call    g
    # restaurar os registradores salvos
    movl    -16(%rbp), %edi
    movl    -12(%rbp), %esi

# a = a + temp;
    addl    %eax, %r15d

# i *= 2;
    imull   $2, %edi
# }
    jmp     WHILE
FORA_WHILE:

# return a;
    movl    %r15d, %eax

#}
    # restaurar os callee-saved salvos
    movq    -8(%rbp), %r15

    # destruir o RA
    movq    %rbp, %rsp

    # restaurar o RA da chamadora
    popq    %rbp

    # retornar
    ret
    