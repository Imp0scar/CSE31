#include <stdio.h>
#include <stdlib.h>

/* Title: Demo code for CSE 031 Lecture 08 (Spring 2023)
 * Author: Santosh Chandrasekhar
 * 
 *
 * Instructions:
 * Compile the code. Let's assume this outputs the executable file named a.out. Next, 
 * execute the command "size a.out" at your command prompt (assuming a linux shell).
 * Observe the values of text (code segment), data (global and static variables that 
 * are initialized), and bss (global and static variables that are not initialized). 
 * They represent the decimal size of these segments in bytes. dec = text + data + bss,
 * and hex shows dec in hexadecimal format. The bss and data put together is the static 
 * data segment in lecture slides. 

 * Now, uncomment a line starting with the declaration of the uninitialized global variable
 * x, recompile the code and run the size command to see how the text, data and bss 
 * values change. Follow this process for all the other commented lines.
 */

//double x;
//double y = 1;

int main(void) {
    //static double i;
    //static int j = 2;
    //static int k = 10;
    //const char charlist[] = {'a', 'b'}; 
    //const int intlist[] = {22, 33, 44, 55};
    //int a = 10;
    //char myChar = 'c';
 
    return 0;

}