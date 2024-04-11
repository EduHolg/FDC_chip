module ripple_counter#(parameter N=8)(
    input wire clk, reset,
    output wire [N-1:0] count
    );
    
    wire qclk[N-1:0];
    
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : counter_gen
            ff_d_fdc dff_instance (
                .clk((i == 0) ? clk:qclk[i-1]),
                .reset(reset),
                .D(count[i]),
                .Q(qclk[i]),
                .not_Q(count[i])
            );
        end
    endgenerate
    
endmodule

