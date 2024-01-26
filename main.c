#include <stdio.h>
#include "NumClass.h"
int main(){
    int num1;
    int num2;

    printf("type two numbers : ");
    scanf("%d %d",&num1, &num2);

    printf("\nPrime numbers are : ");
    for (int i = num1; i <= num2; i++)
    {
        if(isPrime(i)){
            printf("%d ",i);
        }
    }
    
    printf("\nArmstrong numbers are : ");
    for (int i = num1; i <= num2; i++)
    {
        if(isArmstrong(i)){
            printf("%d ",i);
        }
    }

    printf("\nStrong numbers are : ");
    for (int i = num1; i <= num2; i++)
    {
        if(isStrong(i)){
            printf("%d ",i);
        }
    }

    printf("\nPalindrome numbers are : ");
    for (int i = num1; i <= num2; i++)
    {
        if(isPalindrome(i)){
            printf("%d \n",i);
        }
    }

    return 0;
}
