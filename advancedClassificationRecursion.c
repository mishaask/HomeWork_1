#include "NumClass.h"

int isPalindrome(int num) {
    int reversed = reverseNumberR(num, 0);
    return (num == reversed) ? 1 : 0;
}


int isArmstrong(int num) {
    int n = countDigitsR(num);
    int sum = calculateArmstrongSum(num, n);
    return (sum == num) ? 1 : 0;
}

int reverseNumberR(int num, int reversed) {
    if (num == 0) {return reversed;} 
    else {
        int digit = num % 10;
        reversed = reversed * 10 + digit;
        return reverseNumberR(num / 10, reversed);
    }
}

int countDigitsR(int num) {
    if (num == 0) {return 0;} 
    else {return 1 + countDigitsR(num / 10);}
}

int calculateArmstrongSum(int num, int n) {
    if (num == 0) {return 0;} 
    else {
        int digit = num % 10;
        return power(digit, n) + calculateArmstrongSum(num / 10, n);
        }
}

int power(int base, int exponent) {
    if (exponent == 0) {return 1;} 
    else {return base * power(base, exponent - 1);}
}
