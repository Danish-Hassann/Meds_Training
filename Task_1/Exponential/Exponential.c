#include <stdio.h>

double exponential(int num, int iterations);
double computePower(double base, int power);

int main() {
    printf("Hello\n");
    printf("%f\n", exponential(-4, 100));  
    return 0;
}

double exponential(int num, int iterations) {
    double factorial = 1.0; 
    double result = 1.0;
    for (int i = 1; i <= iterations; i++) {
        factorial *= i;
        result += computePower((double)num, i) / factorial;
    }
    return result;
}

double computePower(double base, int power) {
    double result = 1.0;
    for (int i = 0; i < power; i++) {
        result *= base;
    }
    return result;
}