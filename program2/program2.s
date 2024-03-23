.global main
.data
	number: .int 0
	format: .string "Liczba: %d\n"
.text
main:
	sub $8, %rsp

	mov 8(%rsi), %rdi
	call atoi
	mov %eax, number

	mov $format, %rdi
	mov number, %rsi
	call printf

	add $8, %rsp

	ret
	
