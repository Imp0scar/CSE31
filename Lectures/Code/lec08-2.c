#include<stdio.h>

/* Title: Demo code for CSE 031 Lecture 08 (Spring 2023)
 * Author: Santosh Chandrasekhar
 */

int *ptr () {
    int y;
    y = 3;
    return &y;
}

int main(void) { 
    int *stackAddr, content;
    stackAddr = ptr();
    content = *stackAddr;
    printf("%d", content); // Will cause segmentation fault
                           // as y no longer exists after stack
                           // frame for ptr() is popped. 
    
    return 0;
} 


