
#include <stdio.h>
#include <stdlib.h>
//#include <malloc.h>

 int main() {
	int num;
	int *ptr;
	int **handle;

	num = 14;
	ptr = (int *)malloc(2 * sizeof(int));
	*ptr = num;
	handle = (int **)malloc(1 * sizeof(int *));
	*handle = ptr;

	// Insert code here
	printf("%p\n", &num);
	printf("%p\n", &ptr);
	printf("%p\n", &handle);


	return 0;
} 

