#include "NumClass.h"
int isArmstrong(int num) {

    int originalNum = num;
    int n = countDigitsL(num);
    int sum = 0;

    while (num != 0) {
        int digit = num % 10;  
        int digitPowerN = 1;

        for (int i = 0; i < n; ++i) {
            digitPowerN *= digit;
        }

        sum += digitPowerN;  
        num /= 10; 
    }

    if (sum == originalNum) {return 1;} 
    else {return 0;}
}


int isPalindrome(int num) {
    if (num == reverseNumberL(num)) {return 1;} 
    else {return 0;}
}

int countDigitsL(int num) {
    int count = 0;
    while (num != 0) {
        num /= 10;
        count++;
    }
    return count;
}

int reverseNumberL(int num) {
    int reversed = 0;
    while (num > 0) {
        int digit = num % 10;
        reversed = reversed * 10 + digit;
        num /= 10;
    }
    return reversed;
}