/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_ss_register(
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
    serie_serie_register U1 (.data_in(ui_in[0]), .clk(clk), .rst(rst_n), .ena(ena), .leri(ui_in[1]), .data_out(uo_out[0]));
    assign uio_oe = 0;
    assign uio_out = 0;
    assign uo_out[7:1] = 7'b0000000;

endmodule
