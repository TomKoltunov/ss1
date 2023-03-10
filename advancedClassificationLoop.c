#include "NumClass.h"

int numberLength(int number)
{
    int count = 0;
    while (number != 0)
    {
        count++;
        number /= 10;
    }
    return count;
}

int power(int base, int exponent)
{
    if (exponent == 0)
    {
        return 1;
    }
    return base * power(base, exponent - 1);
}

int isPalindrome(int number)
{
    int reverse = 0;
    int current = number;
    while (current != 0)
    {
        reverse = reverse * 10 + current % 10;
        current /= 10;
    }
    if (reverse == number)
    {
        return true;
    }
    return false;
}

// int isArmstrong(int number)
// {
//     int currentDigit, current = number, sum = 0;
//     int numberDigits = numberLength(number);
//     while (current != 0)
//     {
//         currentDigit = current % 10;
//         sum += power(currentDigit, numberDigits);
//         current /= 10;
//     }
//     if (sum == number)
//     {
//         return true;
//     }
//     return false;
// }


int sumArmstrong(int number)
{
    if (number > 0)
    {
        return power(number % 10, numberLength(number)) + sumArmstrong(number / 10);
    }
    return 0;
}

int isArmstrong(int number)
{
    if (number == sumArmstrong(number))
    {
        return true;
    }
    return false;
}