.global main
main:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $32, %rsp
        movl    %edi, -20(%rbp)
        movq    %rsi, -32(%rbp)
        movabsq $31649950864991335, %rax
        movq    %rax, -12(%rbp)
        movl    $0, -4(%rbp)
        jmp     .L2
.L3:
        movl    -4(%rbp), %eax
        cltq
        movzbl  -12(%rbp,%rax), %eax
        subl    $2, %eax
        movl    %eax, %edx
        movl    -4(%rbp), %eax
        cltq
        movb    %dl, -12(%rbp,%rax)
        addl    $1, -4(%rbp)
.L2:
        cmpl    $6, -4(%rbp)
        jle     .L3
        leaq    -12(%rbp), %rax
        movq    %rax, %rdi
        movl    $0, %eax
        call    printf
        movl    $0, %eax
        leave
        ret