/*
int foo (int x) {
  return add(x);
}
*/

.globl foo
foo:
    pushq   %rbp
    movq    %rsp, %rbp

    call    add
    call    sub

    leave
    ret
