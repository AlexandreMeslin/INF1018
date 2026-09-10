/*
#include <stdio.h>
#include "dados.h"

int main() {
  int i;
  St *p = dados;
  int max = 0;
  for (i = 0; i <3; i++) {
     if (p->cc && p->ci > max)
       max = p->ci;
     p++;
  }
  printf("%d\n",max);
  return 0;
}
*/
/*
Dicionário
Reg     Var
rbx     p
r8d     max
r9d     i
*/

#include <stdio.h>
#include "dados.h"

.data
Sf: .string "%d\n"

.text

#int main() {
.globl main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)  /* guarda rbx */
  movq    %r12, -16(%rbp)  /* guarda r12 */
/********************************************************/

#  int i;

#//  St *p = dados;
#  St *p;
#  p = dados;
    movq    $dados, %rbx

#//  int max = 0;
#  int max;
#  max = 0;
    movl    $0, %r8d

#//  for (i = 0; i <3; i++) {
#    i = 0;
    movl    $0, %r9d

WHILE:
#    while(i<3) {
    cmpl    $3, %r9d
    jge     FORA_WHILE

#//     if (p->cc && p->ci > max)
#     if (p->cc != 0 && p->ci > max)
     # comparar p->cc c/ 0
     cmpb   $0, (%rbx)
     jz     FORA_IF
     # compara p->ci c/ max
     cmpl   %r8d, 4(%rbx)
     jle    FORA_IF

#       max = p->ci;
    movl    4(%rbx), %r8d

FORA_IF:       

#     p++;
    addq    $8, %rbx

#     i++;
    incl    %r9d
    
#  }
    jmp     WHILE
FORA_WHILE:  

#  printf("%d\n",max);
    movl    %r8d, %eax
/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi   /* segundo parametro  (inteiro) */
  movl  $0, %eax
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/

#  return 0;
#}
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq    -16(%rbp), %r12 /* recupera r12 */
  movq    -8(%rbp), %rbx  /* recupera rbx */
  leave
  ret      
/***************************************************************/
