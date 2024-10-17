#include<stdio.h>
#include<string.h>
#include <stdlib.h>

int size; // Variable to record size of original array arr
int evenCount = 0, oddCount = 0; // Variables to record sizes of new arrays arr_even and arr_odd
int *arr; // Dynamically allocated original array with #elements = size
int *arr_even;  // Dynamically allocated array with #elements = #even elements in arr (evenCount)
int *arr_odd;   // Dynamically allocated array with #elements = #odd elements in arr (oddCount)
char *str1 = "Original array's contents: ";
char *str2 = "Contents of new array containing even elements from original: ";
char *str3 = "Contents of new array containing odd elements from original: ";

// DO NOT change the definition of the printArr function when it comes to 
// adding/removing/modifying the function parameters, or changing its return 
// type. 
void printArr(int *a, int size, char *prompt){
	// Your code here
    int j = 0;
    int k = 0;
    int i = 0;

        
        if (size == 0 ){
        printf("%sempty\n", prompt);
        // printf("%sempty \n", str2);
        // printf("%sempty", str3);
    }
        else{
            printf("%s", prompt);
            for (int i = 0; i < size; i++) {
                printf("%d ", *(a + i));

           
        }
        printf("\n");
    }

    
    
    
}

// DO NOT change the definition of the arrCopy function when it comes to 
// adding/removing/modifying the function parameters, or changing its return 
// type. 
void arrCopy(){
	// Your code here
    int j = 0;
    int k = 0;
    int i = 0;
    for (int i = 0; i < size; i++){

        // if ((arr[i] % 2) == 0){
        //     arr_even[i] = arr[i];
        // }

        if ((*(arr + i) % 2) == 0){
            *(arr_even + j) = *(arr + i);
            j++;
        }
        else{
            *(arr_odd + k) = *(arr + i);
            k++;
        }

    }
}

int main(){
    int i;
    // int  evenCount, oddCount;
    // int *arr;
    // int *arr_even;
    // int *arr_odd;
    printf("Enter the size of array you wish to create: ");
    scanf("%d", &size);
    printf("\n");

    // Dynamically allocate memory for arr (of appropriate size)
    // Your code here
    arr = (int *) malloc (size * sizeof(int));
    // memset(arr, 0,size*sizeof(int));
    // free(arr);
    // Ask user to input content of arr and compute evenCount and oddCount
	// Your code here
    for (int i = 0; i < size; i++){
        
            printf("Enter array element #%d: ", i+1);
            scanf("%d", &arr[i]);

        if ((arr[i] % 2) == 0){
            evenCount++;
        }
        else if ((arr[i] % 2) == 1){
            oddCount++;
        }

    }
    printf("\n");
    // free(arr);
    // Dynamically allocate memory for arr_even and arr_odd (of appropriate size)
    // Your code here    
    arr_even = (int *) malloc (evenCount * sizeof(int));
        // memset(arr_even, 0,size*sizeof(int));
    // free(arr_even);
    arr_odd = (int *) malloc (oddCount * sizeof(int));
    // memset(arr_odd, 0,size*sizeof(int));
	// free(arr_odd);
/*************** YOU MUST NOT MAKE CHANGES BEYOND THIS LINE! ***********/
	
	// Print original array
    printArr(arr, size, str1);

	/// Copy even elements of arr into arr_even and odd elements into arr_odd
    arrCopy();

    // Print new array containing even elements from arr
    printArr(arr_even, evenCount, str2);

    // Print new array containing odd elements from arr
    printArr(arr_odd, oddCount, str3);


    printf("\n");

    return 0;
}