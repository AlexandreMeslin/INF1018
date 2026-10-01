/*
int fat (int n) {
  if (n==0) {
    temp = 1;
  }
  else {
    temp = n-1
    temp = fat(temp)
    temp = n*temp;
  }
  return temp
}
Dicionário
Reg 	Var
EDI	n
*/

# não tem dados globais nem strings constantes ==> sem .data

.text

#int fat (int n) {
.globl fat
fat:
	pushq	%rbp	# salva o RA da função chamadora e coloca o topo da pilha múltiplo de 16
	movq	%rsp, %rbp	# cria a base do RA da função chamada
	subq	$16, %rsp	# abre espaço para o RA da função chamada

	# TODO: salvar registradores callee-saved usados

#  if (n==0) {
	cmpl	$0, %edi
	jnz	ELSE

#    temp = 1;
	movl	$1, %eax

#  }
	jmp	FORA_IF

#  else {
ELSE:
	# salvar registradores que não são callee-saved
	movl	%edi, -4(%rbp)

#    temp = n-1
#    temp = n
#	movl	%edi, %edi
#    temp -= 1
	decl	%edi

#    temp = fat(temp)
	call	fat	# edi 1o parâmetro (antigo temp), eax valor retornado (novo temp)

	# restaurar os registradors não callee-saved que foram salvos
	movl	-4(%rbp), %edi

#    temp = n*temp;
	imull	%edi, %eax
#  }

FORA_IF:

#  return temp
	# nada a fazer porque o valor já está no EAX
#}
	# restaurar o valor dos registradores callee-saved salvos
	# --> não usei nenhum nesse código, nada a fazer

	leave
	ret

