.data
txt:     .string "Wynik: %f\n"
dwapi:   .double 6.28

.text
.global main

main:
    push %rbp

    movsd dwapi, %xmm0
    sqrtsd %xmm0, %xmm0

    mov $txt, %rdi
    mov $1, %rsi
    call printf

    pop %rbp
    xor %eax, %eax
    ret

