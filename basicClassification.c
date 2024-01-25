
#include "NumClass.h"

int factorial(int n);

int isPrime(int num){
    if(num<=1){return 0;}

    for(int i = 2; i*i<=num;++i){
        if(num % i==0){
            return 0;
        }
    }
    return 1;
}

int isStrong(int num){

    int originalNum = num;
    int sum = 0;

    while(num>0){
     int digit = num%10;
     sum+= factorial(digit);
     num /=10;
    }

    if(sum == originalNum){
     return 1;
    } else {
       return 0;
    }
}

int factorial(int n) {
    if( n == 0 || n == 1){return 1;} 
    else {return n * factorial(n - 1);}
}