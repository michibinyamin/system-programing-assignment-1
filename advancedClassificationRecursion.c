#include <stdio.h>
#include "NumClass.h"

//with recursive
int power(int base, int exponent) {
    // Base case: any number to the power of 0 is 1
    if (exponent == 0) {
        return 1;
    }
    //base^exponent = base * base^(exponent-1)
    else {
        return base * power(base, exponent - 1);
    }
}
int isArmstrongRecursive(int num, int digits) {
    if (num == 0) {
        return 0;  // Base case: sum of powers for all digits is 0
    }

    int lastDigit = num % 10;
    return power(lastDigit, digits) + isArmstrongRecursive(num / 10, digits);
}

int count_digits1(int num){      //returns amount of digits
    if (num == 0)
    {
        return 0;
    }
    return 1 + count_digits1(num / 10);
}

int isArmstrong(int num) {
    int digits = count_digits1(num);
    int sum = isArmstrongRecursive(num,digits);
    if (sum == num)
    {
        return 1;
    }
    return 0;
}

int isPalindromeRecursive(int num, int digits) {
    if (digits <= 1) {
        return 1; // Single digit numbers are always palindromes
    } else {
        int firstDigit = num / (int)power(10, digits - 1);
        int lastDigit = num % 10;

    if (firstDigit != lastDigit) {
        return 0; // Not a palindrome
    } else {
        // Remove the first and last digits
        int remainingNum = (num % (int)power(10, digits - 1)) / 10;
        // Recursively check the remaining number
        return isPalindromeRecursive(remainingNum, digits - 2);
    }
}
}
int isPalindrome(int num) {
    int digits = count_digits1(num);
    return isPalindromeRecursive(num, digits);
}