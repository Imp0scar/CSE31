#include <stdio.h> 
 
 int main() { 
  int i, x, y, *px, *py; 
  x = 2;
  y = 5;
  px = &x;
  py = &y;
  int arr[10];

  for (i = 0; i < 10; ++i) *(arr + i) = 2 * i;
  int *p = arr;
    printf("elements of p[] and their adresses: \n");
for (i = 0; i < 10; ++i) printf("%d @ %p\n", *(p + i), (p + i));
    printf("\n");

printf("%d \t p: %p", x, p);

    printf("%d\n", x);
    printf("%p\n", &x);
    printf("%p\n", &y);
    printf("%p\n", &y);
    printf("%p\n", px);
    printf("%p\n", py);
    printf("%p\n", &arr[0]);

    printf("%p\n", px);
    printf("%p\n", py);
 
  return 0; 
 }