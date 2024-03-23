#################################################################
# Program ma zliczyc i wydrukowac w oknie terminala (funkcja printf):
#
# na maks. 7 punktow
#
# - sume wszystkich elementow tablicy
#
# kontynuacja - na maks. 10 punktow:
#
# - dodatkowo - liczbe elementow tablicy o wartosciach parzystych
#
# Zadanie ratunkowe - na maks. 4 punkty: wydrukowanie tekstu "Imie nazwisko nr_albumu",
# przy czym nr_albumu ma stanowic wartosc zmiennej
#
#################################################################

			.data

text_a:		.string "Suma = %d,  elementow parzystych = %d\n"

tab:		.long 6, 4, -3, 3, -5, 9, 7, 1, -2, 8, -3, 5, 9, -1, 2
count:		.long 15

sum:		.long 0
evencnt:	.long 0

text_b:		.string "Adam Borek nr %d\n"
number:		.long 12345

#################################################################

		.text
		.global	main

main:
		push %rbp

# nadaj wartosci poczatkowe sumie i licznikom

		mov 	$0, %rax
		mov 	%rax, sum

		mov 	$0, %rax
		mov 	%rax, evencnt

# dane mozna przechowywac gdziekolwiek (w rejestrach, w pamieci)

		mov 	$0, %ecx

petla:
		cmp	count, %ecx
		je	koniec

# usun bledy i odczytaj w prawidlowy sposob element tablicy

		mov	tab(,%ecx,4), %eax
		

# zaktualizuj sumę

		add	%eax, sum
		
# sprawdz czy wartosc jest parzysta

		test 	$1, %eax
		jz	parzysta
		
		inc 	%ecx
    		jmp 	petla

# zamknij petle

		

# tak - zaktualizuj licznik wartosci parzystych
parzysta:
		
		add	%eax, evencnt
    		inc 	%ecx
    		jmp 	petla


koniec:

# przekaz argumenty 
# wyswietl wyniki (printf)
		mov	$text_a, %rdi
		mov	sum, %rsi
		mov	evencnt, %rdx
		call	printf

# koniec funkcji main

		pop	%rbp
		xor	%rax,%rax
		ret

#################################################################
