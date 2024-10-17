
#include <stdio.h>
#include <stdlib.h>
//#include <malloc.h>

struct Node {
    int iValue;
    float fValue;
    struct Node *next;
};

int main() {

    struct Node *head = (struct Node*) malloc(sizeof(struct Node));
    head->iValue = 5;
    head->fValue = 3.14;
	
	// Insert code here
	printf("value of head: %p\n", head);
	printf("adress of head: %p\n", &head);
	printf("adress of iValue: %p\n", &head->iValue);
	printf("adress of fValue: %p\n", &head->fValue);
	printf("adress of head->next: %p\n", &head->next);
	
	
	
	return 0;
}