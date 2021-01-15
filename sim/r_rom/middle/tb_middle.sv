`timescale 1ns/1ps

`include "isa.vh"

module tb_front_end;

    localparam S_WRITE = 1'b0;
    localparam S_READ  = 1'b1;

    wire clk;
    wire rst_n;
    reg  ft_clk;

    reg state;
    reg [63:0] buff;
    reg [2:0] offset;

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

    tilelink bus();

    logic last_empty;
    dff #(1, 1'b1) dff_read (ft_clk, rst_n, `DISABLE, `DISABLE,
                             c_empty, last_empty);

    clk_rst clk_rst (
    	.clk   (clk),
        .rst_n (rst_n)
    );

    stimulator stimulator (
    	.clk   (clk),
        .rst_n (rst_n),
        .bus   (bus)
    );

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

    always #8 ft_clk = ~ft_clk;
    assign c_rd_en = ~c_empty;

    always @(posedge ft_clk, negedge rst_n) begin
        if (~rst_n) begin
            ft_clk = 1'b0;
            state = S_WRITE;
            buff = 64'b0;
            offset = 3'b0;
            r_wr_en = 1'b0;
            r_din = 8'b0;
        end if (state == S_WRITE) begin
            if (~last_empty) begin
                $display($time,, "addr: %x %x", c_dout, buff);
                buff <= {c_dout, buff[63:8]};
                offset <= offset + 1;
                if (&offset) begin
                    state <= S_READ;
                end
            end
        end else begin /* state == S_READ */
            if (~r_full) begin
                $display($time,, "data: %x %x", buff[7:0], offset);
                r_wr_en <= `ENABLE;
                r_din <= buff[7:0];
                buff <= {8'b0, buff[63:8]};
                offset <= offset + 1;
                if (&offset) begin
                    state <= S_WRITE;
                end
            end
        end
    end

//`define FSDB_DUMP
`ifdef FSDB_DUMP
    initial begin
        $fsdbDumpfile("middle.fsdb");
        $fsdbDumpvars();
    end
`endif
    
endmodule
