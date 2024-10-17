
#include <stdio.h>
#include <stdlib.h>

int** matMult(int **a, int **b, int size) {
	// (4) Implement your matrix multiplication here. You will need to create a new matrix to store the product.
int **arr3 = (int**)malloc(size * sizeof(int*));

for (int i = 0; i < size; i++){
	arr3[i] = (int *)malloc(size * sizeof(int*));
}

	for(int i = 0; i < size; i++){
		for (int j = 0; j < size; j++){
			for (int k = 0; k < size; k++){
				arr3[i][j] += a[i][k] * b[k][j];
				}

		}
	}


	return arr3;
}

void printArray(int **arr, int n) {
	// (2) Implement your printArray function here
	for (int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%d ", arr[i][j]);
		}
		printf("\n");
}
}

void initiliazeArray(int **arr, int n){
	for (int i = 0; i < n; i++){
	arr[i] = (int *)malloc(n * sizeof(int*));
}

	printf("Enter the values of the matrix: \n");
    for (int i = 0; i < n; i++) {
    	// printf("\n");
        for (int j = 0; j < n; j++) {
            scanf("%d", &arr[i][j]);
        }
    }
        	printf("\n");


}

int main() {
	int n;
	printf("Enter the size of the array: ");
	scanf("%d", &n);
	int **matA, **matB, **matC;
	// (1) Define 2 (n x n) arrays (matrices). 
	int **arr1 = (int**)malloc(n * sizeof(int*));

	int **arr2 = (int**)malloc(n * sizeof(int*));


	initiliazeArray(arr1, n);
	initiliazeArray(arr2, n);
	// initiliazeArray(arr3, n);

	// (3) Call printArray to print out the 2 arrays here.
		printArray(arr1, n);
		printf("\n");
		printArray(arr2, n);
		printf("\n");

	
	// (5) Call matMult to multiply the 2 arrays here.
	int **arr3 = matMult(arr1, arr2, n);
	
	// (6) Call printArray to print out resulting array here.
	printArray(arr3, n);

    return 0;
}