module register(
    input wire clk, reset,
    input wire [4:0] d,
    output reg [4:0] q
);
    always @(posedge clk) begin
        if (reset) 
            q <= 5'd0;
        else 
            q <= d;
    end
endmodule
