`timescale 1ns/1ps

`include "isa.vh"

module tb_front_end;

    localparam S_WRITE = 1'b0;
    localparam S_READ  = 1'b1;

    wire clk;
    wire rst_n;

    reg state;
    reg [63:0] buff;
    reg [2:0] offset;

    reg full;
    wire wr_en;
    wire [7:0] din;

    reg empty;
    wire rd_en;
    reg [7:0] dout;

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

    r_rom_frontend frontend (
        .clk   (clk),
        .rst_n (rst_n),
        .bus   (bus),
        /* Command FIFO */
        .full  (full),
        .wr_en (wr_en),
        .din   (din),
        /* Response FIFO */
        .empty (empty),
        .rd_en (rd_en),
        .dout  (dout)
    );
    
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            full = `FALSE;
            empty = `TRUE;
            dout = 8'b0;
            state = S_WRITE;
            buff = 64'b0;
            offset = 3'b0;
        end if (state == S_WRITE) begin
            if (wr_en) begin
                //$display($time,, "addr: %x; buff: %x", din, buff);
                buff <= {din, buff[63:8]};
                offset <= offset + 1;

                if (&offset) begin
                    full <= `TRUE;
                    empty <= `FALSE;
                    state <= S_READ;
                end
            end
        end else begin  /* state == S_READ */
            if (rd_en) begin
                //$display($time,, "data: %x", buff[7:0]);
                dout <= buff[7:0];
                buff <= {8'b0, buff[63:8]};
                offset <= offset + 1;

                if (&offset) begin
                    full <= `FALSE;
                    empty <= `TRUE;
                    state <= S_WRITE;
                end
            end
        end
    end

//`define FSDB_DUMP
`ifdef FSDB_DUMP
    initial begin
        $fsdbDumpfile("frontend.fsdb");
        $fsdbDumpvars();
    end
`endif
    
endmodule
