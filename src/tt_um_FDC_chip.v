/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_FDC_chip (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
    assign uio_oe = 8'b0000_0000;
    assign uio_out = 8'b0000_0000;
    assign uo_out[7:5] = 3'b000;

chip chip(
	.reset(ui_in[3]),
	.selec(ui_in[0]),
	.clk_ref(ui_in[1]),
	.VCO(ui_in[2]),
	.out(uo_out{4:0})
		);

endmodule