`timescale 1ns/1ps

`include "isa.vh"

module tb_fifo;

    wire rst_n;
    wire wr_clk;
    reg  rd_clk;

    wire wr_en;
    wire rd_en;
    reg  [7:0] din;
    wire [7:0] dout;
    wire full;
    wire empty;

    clk_rst u_clk_rst(
        .clk   (wr_clk),
        .rst_n (rst_n)
    );

    ip_fifo u_ip_fifo(
        .rst_n  (rst_n),
        .wr_clk (wr_clk),
        .rd_clk (rd_clk),
        .full   (full),
        .wr_en  (wr_en),
        .din    (din),
        .empty  (empty),
        .rd_en  (rd_en),
        .dout   (dout)
    );

    assign wr_en = ~full;
    assign rd_en = ~empty;

    always #8 rd_clk = ~rd_clk;

    always @(posedge wr_clk, negedge rst_n) begin
        if (~rst_n)
            din <= 8'd0;
        else begin
            if (~full) begin
                din <= din + 1;
            end
        end
    end

    reg r_valid;
    always @(posedge rd_clk, negedge rst_n) begin
        if (~rst_n) begin
            r_valid <= `FALSE;
        end else begin
            if (r_valid) begin
                $display($time,, "%x", dout);
            end

            if (rd_en)
                r_valid <= `TRUE;
            else
                r_valid <= `FALSE;
        end
    end

    initial begin
        rd_clk = 1'b0;
        #1000 $finish();
    end

//`define FSDB_DUMP
`ifdef FSDB_DUMP
    initial begin
        $fsdbDumpfile("ip_fifo.fsdb");
        $fsdbDumpvars();
    end
`endif

endmodule
