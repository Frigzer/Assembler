# gcc -c func2.c -o func2.o
# gcc -no-pie func2.o -o program4 program4.s

.global main
.text
main:
	sub $8, %rsp

	call exec

	add $8, %rsp

	ret
	
