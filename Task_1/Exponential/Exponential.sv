module Exponential (
    input logic [15:0] x,   
    output logic [31:0] result
);

    logic [31:0] term;     
    logic [31:0] x_power;   
    logic [31:0] sum;       
    logic [31:0] factorial; 
    integer i; 

    always_comb begin
        sum = 1 << 8;  
        x_power = 1 << 8; 

        for (i = 1; i <= 10; i++) begin
            case (i)
                1: factorial = 1;
                2: factorial = 2;
                3: factorial = 6;
                4: factorial = 24;
                5: factorial = 120;
                6: factorial = 720;
                7: factorial = 5040;
                8: factorial = 40320;
                9: factorial = 362880;
               10: factorial = 3628800;
               default: factorial = 1;
            endcase

            x_power = (x_power * x) >> 8;  
            term = x_power / factorial;
            sum += term;
        end

        result = sum;
    end

endmodule

