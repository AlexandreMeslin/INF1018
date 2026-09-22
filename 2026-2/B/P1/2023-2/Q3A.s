/*
int acerta (int u[], int i)
{
return u[i];
}
*/
/*
Dicionário
Reg     Var
rdi     u
esi     i
*/

# não há .data porque não há variáveis globais nem strings constantes

.text

#int acerta (int u[], int i) {
#int acerta (int *u, int i) {
.globl acerta
acerta:
    # criar o RA da função chamada
    pushq   %rbp    # salvando o RA da função chamadora
    movq    %rsp, %rbp  # RBP aponta para a base do RA da função chamada
    #subq    $???, %rsp  # alocando espaço para o RA da função chamada

    # salvar os registradores callee-saved que serão usados

#    return u[i];
#   temp = 4 * i
    imull   $4, %esi    # esi = 4 * i
    movslq  %esi, %rsi  # rsi = (long) esi
    addq    %rsi, %rdi    # rdi = u + (4 * i)
    movl    (%rdi), %eax  # eax = u[i]
#}
    # restaurar os registradores callee-saved que foram salvos

    #movq    %rbp, %rsp      # destruir o RA da função chamada
    #popq    %rbp            # restaurar o RA da função chamadora
    leave                    # destruir o RA da função chamada e restaurar o RA da função chamadora
    # retornar para a função chamadora
    ret
