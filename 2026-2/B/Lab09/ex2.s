/*
int fat (int n) {
  if (n==0) {
   temp = 1;
  }
  else {
    temp = n
    temp -=1
    temp = fat(temp);
    temp = temp * n
  }
  return temp;
}
Dicionário
Reg	Var
EDI	n
*/

# não há variáveis globais e nem strings constantes => não preciso do .data

.text

#int fat (int n) {
.globl	fat
fat:
	pushq	%rbp	# salva o RA da chamadora e coloca o topo da pilha múltiplo de 16!!!
	movq	%rsp, %rbp	# cria a base do RA da função chamada
	subq	$16, %rsp	# abre espaço no RA da função chamada

	# TODO: salvar os registradores callee-saved que iremos usar

#  if (n==0) {
	cmpl	$0, %edi
	jne	ELSE

#   temp = 1;
	movl	$1, %eax
#  }
	jmp	FORA_IF
ELSE:
#  else {
	# salvar todos os registradores não callee-saved ainda em uso
	movl	%edi, -4(%rbp)

#    temp = n
#	movl	%edi, %edi

#    temp -=1
	decl	%edi

#    temp = fat(temp);
	call	fat	# 1o parâmetro EDI (antigo temp), valor de retorno EAX (novo temp)

	# restaurar os registradores não callee-saved salvos
	movl	-4(%rbp), %edi

#    temp = temp * n
	imull	%edi, %eax
#  }
FORA_IF:

#  return temp;
	# nada a fazer porque o valor já está no EAX

#}
	leave
	ret

