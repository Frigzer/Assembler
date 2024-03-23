.data
txt_1:   .string "X = %6.f -> Y = %6.f\n"
txt_2:   .string "X = %6.1f -> Y = %6.1f\n"
txt_3:   .string "X = %6.Lf -> Y = %6.Lf\n"
txt:     .string "wynik = %6.f\n"

dwapi:   .double 6.28
x_1:     .long 1
x_2:     .float 2.0
x_3:     .double 3.0
y:       .double 0.0

cw:       .word 0

.text
.global main

main:
    push %rbp
    mov %rsp, %rbp

    finit

    fld dwapi  # Załaduj wartość dwapi do rejestru FPU
    fdiv x_2  # Podziel dwapi przez 2
    fstp y    # Zapisz wynik do zmiennej y

    mov $txt, %rdi     # Przekazanie adresu napisu txt_1 jako argumentu dla printf
    mov $1, %rax
    movsd y, %xmm0       # Załaduj wartość zmiennoprzecinkową y do rejestru xmm0 (argument zmiennoprzecinkowy dla printf)
    call printf         # Wywołanie funkcji printf

    pop %rbp
    xor %eax, %eax
    ret

