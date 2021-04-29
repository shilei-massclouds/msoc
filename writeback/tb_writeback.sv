/*
 * [writeback]
 * ma_wb -- writeback -- regfile
 *              |
 *          forward
 */

`timescale 1ns / 1ps

`include "isa.vh"

module tb_writeback;

    wire clk;
    wire rst_n;

    wire [63:0] pc;
    wire [63:0] data;
    wire [4:0]  rd;

    wire [63:0] data_out;
    wire [4:0]  rd_out;

    clk_rst u_clk_rst (
        .clk   (clk   ),
        .rst_n (rst_n )
    );

    stimulator u_stimulator (
    	.clk   (clk   ),
        .rst_n (rst_n ),
        .pc    (pc    ),
        .data  (data  ),
        .rd    (rd    )
    );
    
    writeback u_writeback (
    	.pc       (pc       ),
        .data     (data     ),
        .rd       (rd       ),
        .data_out (data_out ),
        .rd_out   (rd_out   )
    );
    
    initial begin
        $monitor($time,, "(%x): %x", rd, data);

        #1024 $finish();
    end

endmodule
