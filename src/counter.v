module counter(
    input wire clk, reset,
    output reg [4:0] count
);
    always @(posedge clk) begin
        if (reset) 
            count <= 5'd0;
        else 
            count <= count + 1;
        end
endmodule
