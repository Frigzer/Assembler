// gcc -no-pie -o program program.s
// gcc -S program.c

#include <stdio.h>

int main(int a, int b)
{
	char* msg1="The first number is greater than the second.\n";
	char* msg2="The second number is greater than the first.\n";
	char* msg3="Both numbers are equal.\n";
        if(a>b)
		printf("%s", msg1);
        else if(b>a)
        	printf("%s", msg2);
	else if(a==b)
		printf("%s", msg3);
}
