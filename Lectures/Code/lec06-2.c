#include <stdio.h>
#include <stdint.h> 
#include <stdlib.h>
#include <string.h>

/* Title: Demo code for CSE 031 Lecture 06 (Spring 2023)
 * Author: Santosh Chandrasekhar
 */

typedef 

struct myStruct1 {
	char x;
    int y;
} 

point1;

/* Instead of combining typedef with struct declaration as shown above, 
 * you may also just declare the struct as below, and then declare a typedef
 * as shown in line 33.
 */
// struct myStruct1 {
//	char x;
//	int y;
// };

typedef 

struct __attribute__((__packed__)) myStruct2 { // To compress the structure (not recommended)
	char x;
	int y;
} 

point2;

int main() {
	// typedef struct myStruct1 point1; // This should be used in combination with the struct declaration
	// in lines 23-26 and commenting the declaration in lines 10-17. 

	printf("Size of point1: %lu\n", sizeof(point1)); 
	printf("Size of point2: %lu\n", sizeof(point2));

	return 0;
}