#include<stdio.h>
#include<limits.h>

/* Title: Demo code for CSE 031 Lecture 11 (Spring 2023)
 * Author: Santosh Chandrasekhar
 */

// A function to calculate integer exponentiations: base^exp.
// For further reference see: https://iq.opengenus.org/binary-exponentiation/
int ipow(int base, int exp) { 
    int result = 1;
    
    for (;;) {
        if (exp & 1)
        	result *= base;
        exp >>= 1;
        if (!exp)
            break;
        base *= base;
    }

    return result;
}

// Outputs the binary representation of n
void bin(int n) { 
    unsigned i; 
    for (i = 1 << 31; i > 0; i >>= 1) // You may substitute 'i >>= 1' with 'i = i / 2'
        (n & i)? printf("1"): printf("0");
    printf("\n"); 
} 

int main(void) { 
	
	printf("INT_MAX: %d\n", INT_MAX); // Add a '+ 1' to INT_MAX for an overflow
	bin(INT_MAX);
    printf("INT_MIN: %d\n", INT_MIN); // You may also try subtracting 1 from INT_MIN
    bin(INT_MIN);
    
    int a = INT_MAX;
    printf("a + 1 = %d\n", (a + 1)); // This will cause an overflow
    int b = INT_MIN;
    printf("b - 1 = %d\n", (b - 1)); // This will also cause an overflow

    int c = 1000000000;
    printf("c * 4 = %d\n", c * 4); // This will cause an overflow as well
	
    printf("2^31 = %u\n\n", ipow(2, 31)); 
    
    return 0;
} 
