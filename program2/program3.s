# gcc -c func.c -o func.o
# gcc -no-pie func.o -o program3 program3.s

.global main
.data
	number_1: .int 0
	number_2: .int 0
	
	result: .int 0
	format: .string "Wynikem dodawania %d + %d jest: %d\n"
.text
main:
	cmp $3, %edi	#sprawdza liczbe argumentow
	jne exit

	sub $8, %rsp

	mov %rsi, %rbx

	mov 8(%rbx), %rdi	#wczytanie 1 liczy
	call atoi
	mov %eax, number_1

	mov 16(%rbx), %rdi	#wczytanie 2 liczby
	call atoi
	mov %eax, number_2

	mov number_1, %rdi	#suma
	mov number_2, %rsi
	call sum
	mov %eax, result

	mov $format, %rdi	#wypisanie na ekran
	mov number_1, %rsi
	mov number_2, %rdx
	mov result, %rcx
	call printf

	add $8, %rsp

exit:
	ret
	
