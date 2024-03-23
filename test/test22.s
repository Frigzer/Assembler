.data
format:    .string "%f\n"
value:     .double 2.0
exponent:  .double 3.0

.text
.global main

main:
    subq $8, %rsp

    movsd value, %xmm0       # Załaduj wartość zmiennoprzecinkową do rejestru xmm0
    movsd exponent, %xmm1    # Załaduj wartość wykładnika do rejestru xmm1
    call pow                # Wywołanie funkcji pow

    mov $format, %edi        # Przekazanie adresu formatu jako argumentu dla printf
    movsd %xmm0, (%rsp)      # Skopiowanie wyniku do stosu
    call printf             # Wywołanie funkcji printf

    addq $8, %rsp
    xor %eax, %eax
    ret

pow:
    subq $8, %rsp
    mov $1, %eax             # Przekazanie liczby 1 jako argumentu dla pow
    call pow                # Wywołanie funkcji pow z podprocedury

    mulsd %xmm0, %xmm0       # Obliczenie potęgi przez pomnożenie wyniku przez siebie
    addq $8, %rsp
    ret





.data
format:    .string "%f\n"
value:     .double 2.0

.text
.global main

main:
    subq $8, %rsp

    movsd value, %xmm0       # Załaduj wartość zmiennoprzecinkową do rejestru xmm0
    call log                # Wywołanie funkcji log

    mov $format, %edi        # Przekazanie adresu formatu jako argumentu dla printf
    movsd %xmm0, (%rsp)      # Skopiowanie wyniku do stosu
    call printf             # Wywołanie funkcji printf

    addq $8, %rsp
    xor %eax, %eax
    ret

log:
    fldln2                   # Załaduj wartość logarytmu naturalnego z bazy 2
    fyl2x                    # Oblicz logarytm o podstawie 2 z wartości na stosie
    ret


