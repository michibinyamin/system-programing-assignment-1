#include <stdio.h>
#include "NumClass.h"
int main(){
    int num1;
    int num2;  
    
    printf("type two numbers: ");
    scanf("%d %d",&num1, &num2);

    // Swap values if num1 is greater than num2
    if (num1 > num2) {
        int temp = num1;
        num1 = num2;
        num2 = temp;
    }

    printf("\nThe Armstrong numbers are:");
    for (int i = num1; i <= num2; i++)
    {
        if(isArmstrong(i)){
            printf("%d ",i);
        }
    }
    printf("\n");

    printf("\nThe Palindromes numbers are:");
    for (int i = num1; i <= num2; i++)
    {
        if(isPalindrome(i)){
            printf("%d ",i);
        }
    }
    printf("\n");

    printf("\nThe Prime numbers are:");
    for (int i = num1; i <= num2; i++)
    {
        if(isPrime(i)){
            printf("%d ",i);
        }
    }
    printf("\n");

        printf("\nThe Strong numbers are:");
    for (int i = num1; i <= num2; i++)
    {
        if(isStrong(i)){
            printf("%d ",i);
        }
    }
    printf("\n");
    return 0;
}
