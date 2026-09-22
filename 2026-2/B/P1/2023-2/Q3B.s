/*
struct S
{
int v;
struct S *prox;
};
extern int norma[];
int boo(struct S *s, int n)
{
int acum = 0;
while (s)
{
s->v = acerta(norma, n+acum);
acum += n;
s = s->prox;
}
return acum;
}
*/
/*
Dicionário
Reg     Var
rdi     s
esi     n
r10d    acum
*/

.text

#int boo(struct S *s, int n){
.globl boo
boo:
    # criar o RA da função chamada
    pushq   %rbp    # salvando o RA da função chamadora
    movq    %rsp, %rbp  # RBP aponta para a base do RA da função chamada
    subq    $16, %rsp  # alocando espaço para o RA da função chamada

    # salvar os registradores callee-saved que serão usados

#int acum = 0;
#int acum;
#acum = 0;
    movl    $0, %r10d

#while (s){
#while (s!=0){
WHILE:
    cmpq    $0, %rdi
    je      FORA_WHILE

#s->v = acerta(norma, n+acum);
#temp = n + acum
#temp = n;
    movl    %esi, ,%r11d
#temp += acum;
    addl    %r10d, %r11d

#temp = acerta(norma, temp)
    # salvar os registradores não callee-saved que estão em uso
    movq    %rdi, -8(%rbp)
    movl    %r10d, -16(%rbp)
    movl    %esi, -12(%rbp)

    # preparar os argumentos da função acerta
    movq    $norma, %rdi    # 1o parâmetro: norma
    movl    %r11d, %esi     # 2o parâmetro: temp
    call    acerta      # temp = EAX = acerta(norma, temp)

    # restaurar os registradores não callee-saved que estão em uso
    movq    -8(%rbp), %rdi
    movl    -16(%rbp), %r10d
    movl    -12(%rbp), %esi

#s->v = temp
    movl    %eax, (%rdi)

#acum += n;
    addl    %esi, %r10d

#s = s->prox;
    movq    8(%rdi), %rdi
#}
    jmp     WHILE
FORA_WHILE:
#return acum;
    movl    %r10d, %eax
#}
    # restaurar os registradores callee-saved que foram salvos

    leave                    # destruir o RA da função chamada e restaurar o RA da função chamadora
    ret
