#include <stdio.h>

int main() {
    int number, digit_sum, sum_even = 0, count_even = 0, sum_odd = 0, count_odd = 0;

    while (1) {
        printf("Enter a number (enter 0 to stop): ");
        scanf("%d", &number);
        if (number == 0) {
            break;
        }

        digit_sum = 0;
        while (number > 0) {
            digit_sum += number % 10;
            number /= 10;
        }

        if (digit_sum % 2 == 0) {
            sum_even += number;
            count_even++;
        } else {
            sum_odd += number;
            count_odd++;
        }
    }

    if (count_even > 0) {
        printf("Average of even digit sum numbers is %f\n", (float)sum_even / count_even);
    } else {
        printf("No even digit sum numbers were entered.\n");
    }

    if (count_odd > 0) {
        printf("Average of odd digit sum numbers is %f\n", (float)sum_odd / count_odd);
    } else {
        printf("No odd digit sum numbers were entered.\n");
    }
    return 0;
}