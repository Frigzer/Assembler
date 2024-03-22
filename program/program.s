.section .data
msg1:
    .string "The first number is greater than the second.\n"
msg2:
    .string "The second number is greater than the first.\n"
msg3:
    .string "Both numbers are equal.\n"

.section .text
.global main
.type main, @function
main:
    push %rbp
    mov %rsp, %rbp
    
    # Get the first argument
    mov 8(%rbp), %eax
    mov %eax, -4(%rbp)
    
    # Get the second argument
    mov 12(%rbp), %eax
    mov %eax, -8(%rbp)
    
    # Compare the numbers
    mov -4(%rbp), %eax
    cmp -8(%rbp), %eax
    jg greater
    jl lesser
    # The numbers are equal
    mov $msg3, %rdi
    call puts
    jmp exit
    
greater:
    # The first number is greater than the second
    mov $msg1, %rdi
    call puts
    jmp exit
    
lesser:
    # The second number is greater than the first
    mov $msg2, %rdi
    call puts

exit:
    mov %rbp, %rsp
    pop %rbp
    ret

