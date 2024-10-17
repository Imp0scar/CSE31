#include <stdio.h>

int main()
{

	int punishment,typo; 
	
	printf("Enter the number of repetitions for the punishment phrase: ");
	scanf("%d", &punishment);

	int num = 1;

	if (punishment <= 0 && num == 1){    // if punishment is negative print the message
	printf("You entered an invalid value for the number of repetitions! \n");
	printf("Enter the number of repetitions for the punishment phrase again: ");
	scanf("%d", &punishment);
	
	}

	num += 1;
	while (punishment <= 0 && num > 1){ // while punishment amount is negative or 0
		if (num + 1 > 4){	// didnt want the sentence to repeat so i made it skip when num = 3 so it wouldnt loop
			printf("You entered an invalid value for the number of repetitions! \n");
			printf("Enter the number of repetitions for the punishment phrase again: ");
			scanf("%d", &punishment);
			}
			else{
				num +=1;
			}
		}

	printf("\nEnter the line where you wish to introduce the typo: ");
	scanf("%d", &typo);

	// if (typo <= 0 || typo > punishment){ 
	// 	printf("You entered an invalid value for the typo placement! \n");
	// 	printf("Enter the line where you wish to introduce the typo again: ");
	// 	scanf("%d", &typo);
	// }

	while (typo <= 0 || typo > punishment){   // checking if typo is negative or bigger then the number of punishments inputted.
			printf("You entered an invalid value for the typo placement!\n");
			printf("Enter the line where you wish to introduce the typo again: "); 
			scanf("%d", &typo);
		}

		printf("\n");
	for(int i = 1; i < punishment+1; i++){	// for loop that allows me to place the typo in the correct spot and continue printing the correct sentence for the rest.
		
		if(typo == i){
			printf("Cading in C is fun end intreseting! \n");
		}
		else{
			printf("Coding in C is fun and interesting! \n");
			}

	}

return 0;
}