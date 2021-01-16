`timescale 1ns/1ps

`include "isa.vh"

module r_rom (
    input wire clk,
    input wire ft_clk,
    input wire rst_n,

    tilelink.slave  bus,

    input   wire    txe_n,
    output  wire    wr_n,
    output  wire    siwu_n,
    input   wire    rxf_n,
    output  wire    oe_n,
    output  wire    rd_n,

    inout   wire    [7:0] adbus
);

    logic c_full;
    logic c_wr_en;
    logic [7:0] c_din;
    logic c_empty;
    logic c_rd_en;
    logic [7:0] c_dout;

    logic r_full;
    logic r_wr_en;
    logic [7:0] r_din;
    logic r_empty;
    logic r_rd_en;
    logic [7:0] r_dout;

    assign siwu_n = `DISABLE_N;

    r_rom_frontend frontend (
        .clk   (clk),
        .rst_n (rst_n),
        .bus   (bus),
        /* Command FIFO */
        .full  (c_full),
        .wr_en (c_wr_en),
        .din   (c_din),
        /* Response FIFO */
        .empty (r_empty),
        .rd_en (r_rd_en),
        .dout  (r_dout)
    );

    ip_fifo command_fifo (
        .rst_n  (rst_n),
        .wr_clk (clk),
        .rd_clk (ft_clk),
        .full   (c_full),
        .wr_en  (c_wr_en),
        .din    (c_din),
        .empty  (c_empty),
        .rd_en  (c_rd_en),
        .dout   (c_dout)
    );

    ip_fifo response_fifo (
        .rst_n  (rst_n),
        .wr_clk (ft_clk),
        .rd_clk (clk),
        .full   (r_full),
        .wr_en  (r_wr_en),
        .din    (r_din),
        .empty  (r_empty),
        .rd_en  (r_rd_en),
        .dout   (r_dout)
    );

    ft232h_bridge ft232h_bridge (
    	.clk   (ft_clk),
        .rst_n (rst_n),
        .empty (c_empty),
        .rd_en (c_rd_en),
        .dout  (c_dout),
        .full  (r_full),
        .wr_en (r_wr_en),
        .din   (r_din),
        .txe_n (txe_n),
        .wr_n  (wr_n),
        .rxf_n (rxf_n),
        .oe_n  (oe_n),
        .rd_n  (rd_n),
        .adbus (adbus)
    );

endmodule
