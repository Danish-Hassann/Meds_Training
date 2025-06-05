module Square_Root(
    input logic [15:0] x,    
    output logic [15:0] result 
);

logic [31:0] guess;           
logic [31:0] temp;            
logic [31:0] new_x;           

always_comb begin
    new_x = {16'b0, x} << 8;        
    guess = (new_x >> 1);     
    for (int i = 0; i < 4; i++) begin
        temp = ((new_x << 8) / guess);
        guess = (guess + temp) >> 1;  
    end

    result = guess[15:0];  
end

endmodule
