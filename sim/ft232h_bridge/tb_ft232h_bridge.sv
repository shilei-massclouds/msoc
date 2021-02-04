`timescale 1ns/1ps

`include "isa.vh"

module tb_ft232h_bridge;

    wire clkout;
    reg  rst_n;
    wire txe_n;
    wire wr_n;
    wire siwu_n;
    wire rxf_n;
    wire oe_n;
    wire rd_n;

    wire [7:0] adbus;

    fifo_sim u_fifo_sim(
    	.clk    (clkout ),
        .rst_n  (rst_n  ),
        .txe_n  (txe_n  ),
        .wr_n   (wr_n   ),
        .siwu_n (siwu_n ),
        .rxf_n  (rxf_n  ),
        .oe_n   (oe_n   ),
        .rd_n   (rd_n   ),
        .adbus  (adbus  )
    );
    
    ip_ft232h u_ip_ft232h(
        .clkout (clkout),
        .adbus  (adbus),
        .txe_n  (txe_n),
        .wr_n   (wr_n),
        .siwu_n (siwu_n),
        .rxf_n  (rxf_n),
        .oe_n   (oe_n),
        .rd_n   (rd_n)
    );

`define FSDB_DUMP
`ifdef FSDB_DUMP
    initial begin
        $fsdbDumpfile("ft232h_bridge.fsdb");
        $fsdbDumpvars();
    end
`endif

    initial begin
        rst_n = 1'b0;
        #20 rst_n = 1'b1;
        #1000 $finish();
    end

endmodule
