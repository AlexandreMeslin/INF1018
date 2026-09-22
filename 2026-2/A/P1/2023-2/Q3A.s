/*
int acerta (int u[], int i)
int acerta (int *u, int i)
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

# não tem dados globais nem strings constantes, não tem .data

.text
.globl acerta
acerta:
    # Criar o RA da função acerta
    pushq   %rbp    # salvando o RA da chamadora
    movq    %rsp, %rbp  # criando o RA da função acerta
    #subq    $???, %rsp  # alocando espaço para o RA da função chamada

    # salvar no RA os registradores callee-saved que serão usados

    # return u[i];
    imull   $4, %esi
    movslq  %esi, %rsi
    addq    %rsi, %rdi
    movl    (%rdi), %eax

    # restaurar os registradores callee-saved que foram salvos

    # remover o RA da função chamada
    #movq    %rbp, %rsp  # removendo o RA da função acerta
    #popq    %rbp    # restaurando o RA da chamadora
    leave
    ret
