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
/*Dicionário
Reg     Var
rdi     s
esi     n
r13d    acum
*/

.text
#int boo(struct S *s, int n) {
.globl boo
boo:
    # Criar o RA da função chamada
    pushq   %rbp    # salvando o RA da chamadora
    movq    %rsp, %rbp  # criando o RA da função chamada
    subq    $32, %rsp  # alocando espaço para o RA da função chamada

    # salvar no RA os registradores callee-saved que serão usados
    movq    %r13, -8(%rbp)  # salvando r13 no RA
    movq    %r14, -16(%rbp)  # salvando r14 no RA

#int acum = 0;
#int acum;
#acum = 0;
    movl    $0, %r13d

#while (s!=0) {
WHILE:
    cmpq    $0, %rdi
    je      FORA_WHILE

# s->v = acerta(norma, n+acum);
#temp = n + acum
#temp = n
    movl    %esi, %r14d
#temp += acum
    addl    %r13d, %r14d

# temp = acerta(norma, temp)
    # salvar os registradores não callee-saved que estão em uso
    movq    %rdi, -24(%rbp)  # salvando s no RA
    movl    %esi, -28(%rbp)  # salvando n no RA

    # preparar os parâmetros da chamada
    movq    $norma, %rdi  # primeiro parâmetro: norma
    movl    %r14d, %esi  # segundo parâmetro: temp

    # chamar a função acerta
    call    acerta

    # restaurar os registradores não callee-saved que estavam em uso
    movq    -24(%rbp), %rdi  # restaurando s do RA
    movl    -28(%rbp), %esi  # restaurando n do RA

#s->v = temp
    movl    %eax, (%rdi)    

#acum += n;
    addl    %esi, %r13d

#s = s->prox;
    movq    8(%rdi), %rdi
#}
    jmp     WHILE

FIM_WHILE:

#return acum;
    movl    %r13d, %eax

    # restaurar os registradores callee-saved que foram salvos
    movq    -8(%rbp), %r13  # restaurando r13 do RA
    movq    -16(%rbp), %r14  # restaurando r14 do RA

    # remover o RA da função chamada
    movq    %rbp, %rsp  # removendo o RA da função chamada
    popq    %rbp    # restaurando o RA da chamadora
    ret
#}
