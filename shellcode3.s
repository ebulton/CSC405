.global main
.LC0:
        .string "/bin//ls"
main:
        pushq   %rbp
        movq    %rsp, %rbp
        subq    $32, %rsp
        movl    %edi, -20(%rbp)
        movq    %rsi, -32(%rbp)
        movq    $.LC0, -8(%rbp)
        leaq    -8(%rbp), %rax
        movl    $0, %edx
        movq    %rax, %rsi
        movl    $.LC0, %edi
        call    execve
        movl    $0, %edi
        call    exit