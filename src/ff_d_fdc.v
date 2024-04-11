module ff_d_fdc(
    input wire clk, reset,
    input wire D,
    output reg Q,
    output wire not_Q
    );
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Q <= 1'b1;
        end
        else begin
            Q <= D;
        end
    end
    
    assign not_Q = ~Q;

endmodule

