module fdc_sincronico(
    input wire VCO, clk, reset,
    output reg [4:0] D_out
);
    wire [4:0] count, q1, q2;

    counter counter_1(.clk(VCO), .reset(reset), .count(count));
    register register_1(.clk(clk), .reset(reset), .d(count), .q(q1));
    register register_2(.clk(clk), .reset(reset), .d(q1), .q(q2));

    always @* 
        D_out = q1 - q2;
endmodule

