#include <stdio.h>
#include "NumClass.h"

int main() {
    int number1;
    int number2;

    //printf("Enter a number: ");
    scanf("%d", &number1);
    //printf("Enter a second number: ");
    scanf("%d", &number2);

    if (number2 < number1) {
        int temp = number1;
        number1 = number2;
        number2 = temp;
    }
    
    printf("The Armstrong numbers are:");
    
        for (int i = number1; i <= number2; ++i) {
        if (isArmstrong(i)) {
            printf(" %d", i);
        }

        if(i == number2){
            printf("\n");
        }
    }

    printf("The Palindromes are:");

        for (int i = number1; i <= number2; ++i) {
        if (isPalindrome(i)) {
            printf(" %d", i);
        }

        if(i == number2){
            printf("\n");
        }
    }

    printf("The Prime numbers are:");

    for (int i = number1; i <= number2; ++i) {
        if (isPrime(i)) {
            printf(" %d", i);
        }

        if(i == number2){
            printf("\n");
        }
    }

    printf("The Strong numbers are:");

    for (int i = number1; i <= number2; ++i) {
        if (isStrong(i)) {
            printf(" %d", i);
        }

        if(i == number2){
            printf("\n");
        }
    }
    return 0;
}
