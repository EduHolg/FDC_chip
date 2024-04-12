module fdc_asincrono #(parameter ref_N = 2, ptat_N = 5)(
    input wire reset, FPTAT, FREF,
    output wire [ptat_N-1:0] data
    );
    wire [ptat_N-1:0] data_prev;
    wire [ref_N-1:0] ref_data;
    
    assign done = ref_data[ref_N-1];
    
    ripple_counter #(ref_N) REF_COUNT (
        .clk(~done&FREF),
        .reset(reset),
        .count(ref_data)
    );
    ripple_counter #(ptat_N) PTAT_COUNT (
        .clk(~done&FPTAT),
        .reset((ref_data == 0) ? 1'b1 : 1'b0),
        .count(data_prev)
    );
    reg_file #(ptat_N) Reg_Data (
        .clk(done),
        .reset(reset),
        .D(data_prev),
        .Q(data)
    );
endmodule

