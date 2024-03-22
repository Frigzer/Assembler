.section .data
msg1:
    .string "The first number is greater than the second.\n"
msg2:
    .string "The second number is greater than the first.\n"
msg3:
    .string "Both numbers are equal.\n"

.section .bss
    .lcomm num1, 4
    .lcomm num2, 4

.section .text
.global main
.type main, @function
main:
    push %rbp
    mov %rsp, %rbp
    
    # Set the first argument
    movl $100, num1
    # Set the second argument
    movl $200, num2
    
    # Get the first argument
    movl num1, %eax
    mov %eax, -4(%rbp)
    
    # Get the second argument
    movl num2, %eax
    mov %eax, -8(%rbp)
    
    # Compare the numbers
    mov -4(%rbp), %eax
    cmp -8(%rbp), %eax
    je equal
    jg greater
    # The second number is greater than the first
    mov $msg2, %rdi
    call puts
    jmp exit
    
greater:
    # The first number is greater than the second
    mov $msg1, %rdi
    call puts
    jmp exit
    
equal:
    # Both numbers are equal
    mov $msg3, %rdi
    call puts
    
exit:
    mov %rbp, %rsp
    pop %rbp
    ret

