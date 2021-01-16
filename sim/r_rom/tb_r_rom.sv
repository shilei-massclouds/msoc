`timescale 1ns/1ps

`include "isa.vh"

module tb_r_rom;

    wire clk;
    wire ft_clk;
    wire rst_n;

    wire txe_n;
    wire wr_n;
    wire siwu_n;
    wire rxf_n;
    wire oe_n;
    wire rd_n;
    wire [7:0] adbus;

    tilelink bus();

    clk_rst clk_rst (
        .clk   (clk),
        .rst_n (rst_n)
    );

    stimulator stimulator (
        .clk   (clk),
        .rst_n (rst_n),
        .bus   (bus)
    );

    r_rom u_r_rom(
        .clk    (clk),
        .ft_clk (ft_clk),
        .rst_n  (rst_n),
        .bus    (bus),
        .txe_n  (txe_n),
        .wr_n   (wr_n   ),
        .siwu_n (siwu_n ),
        .rxf_n  (rxf_n  ),
        .oe_n   (oe_n   ),
        .rd_n   (rd_n   ),
        .adbus  (adbus  )
    );

    ip_ft232h ip_ft232h (
    	.clkout (ft_clk),
        .adbus  (adbus),
        .txe_n  (txe_n),
        .wr_n   (wr_n),
        .siwu_n (siwu_n),
        .rxf_n  (rxf_n),
        .oe_n   (oe_n),
        .rd_n   (rd_n)
    );

//`define FSDB_DUMP
`ifdef FSDB_DUMP
    initial begin
        $fsdbDumpfile("r_rom.fsdb");
        $fsdbDumpvars();
    end
`endif

endmodule
