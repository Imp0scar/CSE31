#include <stdio.h>
#include <math.h>
#include <stdlib.h>

void calculateAverages() {
    int input, num, even_count, odd_count;
    float odd = 0, even = 0, even_avg, odd_avg;

    num = 0;
    even_count = 0;
    odd_count = 0;

    do {
        num++;

        // Display the appropriate prompt based on the digit position
        if ((num % 10 == 1 && num != 11) || (num % 10 == 2 && num != 12) || (num % 10 == 3 && num != 13)) {
            printf("Enter the %d%s number: ", num, (num % 10 == 1) ? "st" : (num % 10 == 2) ? "nd" : "rd");
        } else {
            printf("Enter the %dth number: ", num);
        }

        scanf("%d", &input);

        int total = 0;
        int remainder = abs(input);

        while (remainder > 0) {
            total += remainder % 10;
            remainder /= 10;
        }

        printf("%d \n", total);

        if (input != 0) {
            if (total % 2 == 1) {
                odd += input;
                odd_count++;
            } else {
                even += input;
                even_count++;
            }
        }

    } while (input != 0);

    if (even_count != 0) {
        even_avg = even / even_count;
        printf("Average of inputs whose digits sum up to an even number: %.2f \n", even_avg);
    }

    if (odd_count != 0) {
        odd_avg = odd / odd_count;
        printf("Average of inputs whose digits sum up to an odd number: %.2f \n", odd_avg);
    }

    if (even_count == 0 && odd_count == 0) {
        printf("There is no average to compute. \n");
    }
}

int main() {
    calculateAverages();
    return 0;
}



// <stdio.h>
// #include <math.h>
// #include <stdlib.h>

// int main()
// {

// int  input, num, even_count, odd_count, total, remainder;
// // double even_avg, odd_avg;
// float even_avg, odd_avg, odd, even;
// // printf("Enter the 1st number: ");
// // scanf("%d", &input);

// num = 0;
// even_count = 0;
// odd_count = 0;

// while (input != 0){
// 	num += 1;
// 	if (num % 10 == 1 && num != 11){
// 			printf("Enter the %dst number: ", num); // prints the 1"st" number excluding 11"th"
// 			scanf("%d", &input);
// 	}
// 	else if (num % 10 == 2 && num != 12){
// 			printf("Enter the %dnd number: ", num);// prints the 2"nd" number excluding 12"th"
// 			scanf("%d", &input);
// 	}
// 	else if (num % 10 == 3 && num != 13){
// 			printf("Enter the %drd number: ", num); // prints the 3"rd" number excluding 13"th"
// 			scanf("%d", &input);
// 	}

// 	else if(num % 10 == 4 || num % 10 == 5 || num % 10 == 6 || num % 10 == 7 || num % 10 == 8 || num % 10 == 9 || num % 10 == 0 || num == 11 || num == 12 || num == 13){
// 		printf("Enter the %dth number: ", num); // prints the 4-10"th" number including 11"th" 12th and 13th
// 			scanf("%d", &input);
// 	}
// 	if(input != 0){
// 		total = (abs(input) % 10); // ex: splits 123 into 3 by doing 123 % 10 = 3
// 		remainder = floor((abs(input) / 10)); // ex: 123 gets the remainder 123 / 10 = 12
// 		total += (remainder % 10);			// ex: splits the remainder 12 into 2 by doing 12 % 10 = 12 / 10 = 1.2 (12 - (10 * 1) = 2) and adds that to the total
// 		remainder = floor((abs(input) / 100)); //ex: 123 get split into 1 by doing 123 % 100.
// 		total += (remainder % 10);  // adds the 1 to the total to get (" 1 + 2 + 3 = 6")
// 		printf("%d \n", total);	
// 	}
	
// 	if(total % 2 == 1 && input != 0){   //checks to see if the total of the input is odd and empty
// 		odd += input;	
// 		odd_count ++;
// 			// printf("%d \n", odd);
// 		}
// 	else if (total % 2 == 0 && input != 0){  //checks to see if the total of the input is even and empty
// 		even += input;
// 		even_count ++;
// 			// printf("%d \n", even);
// 	}
	
// }
// if (even_count != 0){
// even_avg = (float)(even / even_count);  // 
// printf("Average of inputs whose digits sum up to an even number: %.2f \n", even_avg);
// }
// if (odd_count != 0){
// 	odd_avg = (odd / odd_count);
// 	printf("Average of inputs whose digits sum up to an odd number: %.2f \n", odd_avg);
// }
// if (even_count == 0 && odd_count == 0){
// 	printf("There is no average to compute. \n");
// }


// return 0;
// }