#include <stdio.h>
double squareRoot(double num, int iterations);

int main() {
    printf("Hello\n");
    printf("%f\n", squareRoot(100, 10));  
    return 0;
}


double squareRoot(double num, int iterations) {
    // if(num <= 0){return;}
    double currentGuess = num/2;
    for (int i = 0; i < iterations; i++){
        double newGuess = (currentGuess + num/currentGuess) * 0.5;
        currentGuess = newGuess;
    }
    return currentGuess;
    
}