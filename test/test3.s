.data
txt_1:  .string "X = %6.f -> Y = %6.f\n"
txt_2:  .string "X = %6.1f -> Y = %6.1f\n"
txt_3:  .string "X = %6.Lf -> Y = %6.Lf\n"

x_1:    .long   1
x_2:    .float  2.0
x_3:    .double 3.0
y:      .float  0.0

.text
.global main

main:
    push %rbp
    mov %rsp, %rbp

    finit

    flds x_2      # Załaduj wartość x_2 do rejestru FPU
    fmul x_3      # Pomnóż x_2 przez x_3
    fadd x_1      # Dodaj x_1 do wyniku
    fstps y       # Zapisz wynik do zmiennej y

    mov $txt_1, %rdi  # Przekazanie adresu napisu txt_1 jako argumentu dla printf
    movss y, %xmm0    # Załaduj wartość zmiennoprzecinkową y do rejestru xmm0 (argument zmiennoprzecinkowy dla printf)
    call printf      # Wywołanie funkcji printf

    pop %rbp
    xor %eax, %eax
    ret

