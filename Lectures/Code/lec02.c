#include <stdio.h>
#include <stdbool.h>

/* Title: Demo code for CSE 031 Lecture 02 (Fall 2022)
 * Author: Santosh Chandrasekhar
 */

int main(int argc, char *argv[]) {

	printf("argc = %d\n", argc);		// Prints the number of command line arguments (including the executable)
	printf("argv[0] = %s\n\n", argv[0]);	// Should print the name of your executable file

	char c = 'a';
	int  x = 34;
	int  y[4];
	long unsigned z;
	printf("sizeof(c) = %lu\n",   sizeof(c));		// %d - int, %c - char, %lu - long unsigned, etc.
	printf("sizeof(char) = %lu\n",sizeof(char));	// For a full list of format specifiers
	printf("sizeof(x) = %lu\n",   sizeof(x));		// see https://www.cplusplus.com/reference/cstdio/printf/
	printf("sizeof(int) = %lu\n", sizeof(int));
	printf("sizeof(y) = %lu\n",   sizeof(y));
	printf("sizeof(7) = %lu\n",   sizeof(7));
	printf("sizeof(z) = %lu\n",   sizeof(z));

	printf("\n");

	if(-46)	// Any non-zero value is treated as true
		printf("Hello!\n");

	bool bvar = true; // This datatype requires the use of stdbool.h
	printf("Boolean variable bvar = %d\n", bvar); // Should print 1 (or 0 if bvar = false)
	
	return 0;
}
