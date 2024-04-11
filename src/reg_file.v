module reg_file #(parameter N = 5)(
    input wire clk, reset,
    input wire [N-1:0]D,
    output reg [N-1:0]Q
    );
    
    always@(posedge clk or posedge reset)
    begin
        if(reset)
            Q <= 0;
        else
            Q <= D;
    end
    
endmodule

