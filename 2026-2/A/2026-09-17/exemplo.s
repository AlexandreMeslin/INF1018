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
Reg     Var     Tipo
EDI     i       não callee-saved
ESI     n       não callee-saved
R15D    a       callee-saved
*/

#int g(int x);

.text

#int f(int i, int n) {
.globl f
f:

    # Criar o RA da função chamada
    pushq   %rbp    # move o endereço do topo da pilha para um valor múltiplo de 16
                    # e ainda salvou o valor do RA da função chamadora
    movq    %rsp, %rbp  # o RBP agora aponta para o topo da piha, que é a base do RA da função chamada
    subq    $16, %rsp  # aloca espaço para o RA

    # salvar os registradores callee-saved 
    # TODO no futuro
    movq    %r15, -8(%rbp)  # salva o valor do R15 no RA

# int a = 0;
# int a;
# a = 0; 
    movl    $0, %r15d

WHILE:
# while (n--) {
# while (n!=0) {
    cmpl    $0, %esi
    jz      FORA_WHILE

# n--
    decl    %esi

# a += g(i);
    # chamada da função g
    # 1o passo: salvar os registradores que não são callee-saved
    # mas somente os que eu já usei e vou precisar usar depois

    movl    %edi, -16(%rbp)
    movl    %esi, -12(%rbp)

    # 2o passo: preparar os parâmetros
    # colocar o valor de i no edi (1o parâmetro)
    # mas já está lá (nada a fazer)

 #temp = g(i);
    call    g

    # restaurar os registradores não callee-saved salvos
    movl    -16(%rbp), %edi
    movl    -8(%rbp), %esi

# a = a + temp
    # variável a está em R15D
    # valor de temp está em EAX (registrador com o valor de retorno)
    addl    %eax, %r15d

# i *= 2;
    imull   $2, %esi
# }
    jmp     WHILE
FORA_WHILE:

# return a;
    movl    %r15d, %eax

#}
    # restaurar os valores dos registrador callee-saved
    movq    -8(%rbp), %r15
    # destruir o RA da função chamada
    movq    %rbp, %rsp
    # restaurar o RA da função chamadora
    popq    %rbp
    # retornar
    ret
