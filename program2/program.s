.global main
.data
	text: .space 10
	format: .string "%s\n"
.text
main:
	mov %rsi, %rbx
	mov 8(%rbx), %rax
	mov %rax, text
	
	sub $8, %rsp

	mov $format, %rdi
	mov text, %rsi
	call printf

	add $8, %rsp

	ret
	
