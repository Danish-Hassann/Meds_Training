#include <iostream>
#include "VSquare_Root.h"  
#include "verilated.h"

int main(int argc, char **argv)
{
    Verilated::commandArgs(argc, argv);

    VSquare_Root *top = new VSquare_Root;

    std::cout << "Input\tFixed-Point Output\tFloat Output\tExpected\n";

    for (int x = 1; x <= 100; x += 5)
    {
        top->x = x;  
        top->eval();

        float input_val = x;  
        float result_val = top->result / 256.0;  
        float expected = std::sqrt(input_val);  

        std::cout << x << "\t"
                  << top->result << "\t\t\t"
                  << result_val << "\t\t"
                  << expected << std::endl;
    }

    delete top;
    return 0;
}