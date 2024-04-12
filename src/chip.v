module chip (
    input wire  reset,selec,clk_ref,VCO,
    output wire [4:0] out
    );

    wire VCO_S, VCO_A, CLK_S, CLK_A;
    wire [4:0] S;
    wire [4:0] A;
    
    demux dmx1(
    .selec(selec),
    .a(VCO), 
    .x(VCO_S), 
    .y(VCO_A));
    demux dmx2(
    .selec(selec),
    .a(clk_ref), 
    .x(CLK_S), 
    .y(CLK_A));
    fdc_sincronico sfdc(
    .VCO(VCO_S), 
    .clk(CLK_S), 
    .reset(reset),
    .D_out(S));
    fdc_asincrono asfdc(
    .reset(reset),
    .FPTAT(VCO_A), 
    .FREF(CLK_A), 
    .data(A));
    
    assign out = (selec)? S:A;

endmodule

