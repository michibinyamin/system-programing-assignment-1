#include <stdio.h>
#include "NumClass.h"

//with loops
int power(int base, int exponent) {
    int result = 1;

    for (int i = 0; i < exponent; ++i) {
        result = result * base;
    }
    return result;
}
int count_digits(int num){      //returns the amount of digits
    int digits = 0;
    while (num > 0)
    {
        num = num / 10;     //get rid of last digit
        digits++;
    }
    return digits;
}

int isArmstrong(int num) {
    int originalNum = num;      //Store the original number
    int Armstrong = 0;
    int digits = count_digits(num);     //stores amount of digits
        
    while(num > 0)
    {
        Armstrong = Armstrong + (int)power(num%10 , digits);   //get the single digit
        num = num / 10;                        //get rid of last digit
    }
    if (Armstrong == originalNum)
    {
        return 1;
    }
        
    return 0;
}


int isPalindrome(int num) {
    int originalNum = num;
    int reversedNum = 0;

    while (num > 0) {
        int digit = num % 10;       //get first digit
        reversedNum = (reversedNum * 10) + digit;       //adds in the oposit direction in the new number
        num = num / 10;
    }

return (originalNum == reversedNum);  // Returns 1 if palindrome, 0 otherwise
}