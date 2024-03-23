.data
txt_1:   .string "X = %6.f -> Y = %6.f\n"
txt_2:   .string "X = %6.1f -> Y = %6.1f\n"
txt_3:   .string "X = %6.Lf -> Y = %6.Lf\n"

dwapi:   .double 6.28
x_1:     .long 1
x_2:     .float 2.0
x_3:     .double 3.0
y:       .double 0.0

.text
.global main

main:
    push %rbp
    mov %rsp, %rbp

    finit

    flds x_2       # Załaduj wartość x_2 (2.0) do rejestru FPU
    fild x_1       # Załaduj wartość x_1 (1) do rejestru FPU jako liczba całkowita
    fmul x_3       # Pomnóż x_2 przez x_3
    fdiv dwapi   # Podziel wynik przez dwapi
    fstp y       # Zapisz wynik do zmiennej y

    movsd y, %xmm0

    mov $txt_1, %rdi  
    mov $1, %rsi       
    call printf         # Wywołanie funkcji printf

    pop %rbp
    xor %eax, %eax
    ret

