#include <iostream>
#include "VExponential.h"  
#include "verilated.h"

int main(int argc, char **argv)
{
    Verilated::commandArgs(argc, argv);
    VExponential *top = new VExponential;

    for (int x = 0; x <= 5; ++x)
    {
        top->x = x << 8;  
        top->eval();

        std::cout << x <<" (fixed-point format): " << (x << 8) 
                  << ", exp(x) (8.8 format): " << top->result 
                  << ", exp(x) (float): " << top->result / 256.0 << std::endl;
    }

    delete top;

    return 0;
}