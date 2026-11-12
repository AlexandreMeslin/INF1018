/*
//float passa_alta(short *v, int limite); errado!
float passa_alta(short v, int limite);  // CERTO!!!
//int foo(short *v, int n, long filtro) {   errado!
void foo(short *v, int n, long filtro) {    // CERTO!!!
int i;
double soma = 0;
for(i=0; i<n; i++) {
if(v[i] > filtro) {
soma += passa_alta(v[i], 3);
}
}
}
Dicionário
Reg     Var
rdi     v
esi     n 
rdx     filtro
xmm15   soma (double)
r12d    i

RA
 -8->-1     r12
-16->-9     rdi 
-24->-17    rdx
-32->-25    xmm15
-36->-33    esi
*/

.text

#float passa_alta(short *v, int limite);

#int foo(short *v, int n, long filtro) {
foo:    # símbolo T
.globl foo

    pushq   %rbp        # salva o endereço do RA da chamadora
    movq    %rsp, %rbp  # cria a base do RA da chamada
    subq    $48, %rsp   # abre espaço para o RA da chamada

    # TODO: salvar registradors callee-saved
    movq    %r12, -8(%rbp)

#int i;
#double soma = 1;
#double soma;

#soma = 0;
    #movsd   $0.0, %xmm15   MUITO ERRADO - PERDEU PONTO NA Q1 E NA A3 TAMBÉM!!!
    movl    $0, %eax
    cvtsi2sd    %eax, %xmm15

#for(i=0; i<n; i++) {
#i=0
    movl    $0, %r12d

WHILE:
#while(i<n){ 
    cmpl    %esi, %r12d
    jge     FORA_WHILE

#if(v[i] > filtro) {
temp = v[i]
    movl    %r12d, %eax     # eax = i'
    imull   $2, %eax        # deslocamento a partir do ínicio do vetor
    addq    %rdi, %rax      # endereço do elemento

#if(temp > filtro) {
    movswq  (%rax), %rax    # converte v[i] para long
    cmpq    %rdx, %rax
    jle     FORA_IF

#soma += passa_alta(v[i], 3);
soma += passa_alta(temp, 3)
    # antes de chamar a função:

    # salvar todos os não callee-saved em uso
    movq    %rdi, -16(%rbp)
    movq    %rdx, -24(%rbp)
    movsd   %xmm15, -32(%rbp)
    movl    %esi, -36(%rbp)

    # preparar os parâmetros
    movw    %ax, %di
    movl    $3, %esi

    call passa_alta

    # restaurar todos os não callee-saved salvos
    movq    -16(%rbp), %rdi
    movq    -24(%rbp), %rdx 
    movsd   -32(%rbp), %xmm15 
    movl    -36(%rbp), %esi

    cvtss2sd    %xmm0, %xmm0 
    addsd       %xmm0, %xmm15

#}
FORA_IF:

#i++
    incl    %r12d 
#}
    jmp     WHILE
FORA_WHILE:

#}

    # preparar o valor de retorno
    # neste caso, não há --> função void

    # restaurar os callee-saved salvos
    movq    -8(%rbp), %r12

    # remover o RA e retornar
    leave
    ret
