#include <stdio.h>
#include "NumClass.h"

int isPrime(int num) {
    if (num <= 1) {
        return 0; //not prime
    }

    for (int i = 2; i * i <= num; i++) {    
        if (num % i == 0) {
            return 0; // not prime
        }
    }

    return 1; // is Prime
}

int isStrong(int num) {
    int originalNum = num;
    int sum = 0;

    // Calculate the sum of factorials of individual digits
    while (num > 0) {
        int digit = num % 10;
        int fact = 1;

        // Calculate factorial of the digit
        for (int i = 1; i <= digit; i++) {
            fact = fact * i;
        }
        sum = sum + fact;
        num = num / 10;
    }
        
    return (sum == originalNum); // Returns 1 if strong, 0 otherwise
}
