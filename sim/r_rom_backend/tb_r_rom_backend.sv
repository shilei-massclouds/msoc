`timescale 1ns/1ps

`include "isa.vh"

module tb_r_rom_backend;

    reg clk;
    wire ft_clk;
    reg rst_n;
    wire [7:0] adbus;

    logic c_full;
    logic c_wr_en;
    logic [7:0] c_din;
    wire c_empty;
    wire c_rd_en;
    wire [7:0] c_dout;

    logic r_empty;
    logic r_rd_en;
    logic [7:0] r_dout;
    wire r_full;
    reg  r_wr_en;
    reg  [7:0] r_din;

    tilelink bus();

    remote_rom rom (
        .clk      (clk),
        .rst_n    (rst_n),
        .bus      (bus),
        /* Command FIFO */
        .full     (c_full),
        .wr_en    (c_wr_en),
        .din      (c_din),
        /* Response FIFO */
        .empty    (r_empty),
        .rd_en    (r_rd_en),
        .dout     (r_dout)
    );

    ip_fifo command_fifo (
        .rst    (~rst_n),
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
    	.rst    (~rst_n),
        .wr_clk (ft_clk),
        .rd_clk (clk),
        .full   (r_full),
        .wr_en  (r_wr_en),
        .din    (r_din),
        .empty  (r_empty),
        .rd_en  (r_rd_en),
        .dout   (r_dout)
    );

    ft232h_ctl ft232h_ctl (
        .clk      (ft_clk),
        .rst_n    (rst_n),
        .empty    (c_empty),
        .rd_en    (c_rd_en),
        .dout     (c_dout),
        .full     (r_full),
        .wr_en    (r_wr_en),
        .din      (r_din),
        .txe_n    (txe_n),
        .wr_n     (wr_n),
        .rxf_n    (rxf_n),
        .oe_n     (oe_n),
        .rd_n     (rd_n),
        .adbus    (adbus)
    );

    reg siwu_n = `DISABLE_N;

    ip_ft232h ip_ft232h (
        .clkout    (ft_clk),
        .adbus     (adbus),
        .txe_n     (txe_n),
        .wr_n      (wr_n),
        .siwu_n    (siwu_n),
        .rxf_n     (rxf_n),
        .oe_n      (oe_n),
        .rd_n      (rd_n)
    );

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;

        #5 rst_n = 1'b1;

        #20 read_req(bus, 64'hEFCD_AB89_6745_2301, 8);

        //#470 read_req(bus, 64'h0123_4567_89AB_CDEF, 8);

        //#450 read_req(bus, 64'hAABB_CCDD_EEFF_0011, 8);

        #1600 $finish();
    end

    always #10  clk = ~clk;

    always @(posedge bus.d_valid) begin
        bus.a_valid <= `DISABLE;
        ack(bus);
    end

    function read_req(
        virtual tilelink.master bus,
        input [63:0] addr,
        input [3:0] size
    );

        bus.a_opcode = `TL_GET;
        bus.a_size = $clog2(size);
        bus.a_source = 4'b0000;
        bus.a_address = addr;
        bus.a_mask = 8'hFF;
        bus.a_valid = `ENABLE;

    endfunction

    function ack(virtual tilelink.master bus);
        if (bus.d_opcode == `TL_ACCESS_ACK_DATA) begin
            $display($time,, "[%x] Read (%1d) %x.",
                     bus.a_address, 1 << bus.d_size, bus.d_data);
            bus.d_ready = 1'b1;
            bus.a_valid = 1'b0;
        end
    endfunction

`define FSDB_DUMP
`ifdef FSDB_DUMP
    initial begin
        $fsdbDumpfile("r_rom_backend.fsdb");
        $fsdbDumpvars();
    end
`endif
    
endmodule
