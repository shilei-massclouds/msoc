`timescale 1ns/1ps

`include "isa.vh"

module tb_remote_rom;

    reg clk;
    reg ft_clk;
    reg rst_n;
    reg state;
    reg [7:0] buff[8];
    reg [2:0] buff_off;

    wire empty;
    wire rd_en;
    wire [7:0] dout;

    wire full;
    reg  wr_en;
    reg  [7:0] din;

    logic c_full;
    logic c_wr_en;
    logic [7:0] c_din;
    logic r_empty;
    logic r_rd_en;
    logic [7:0] r_dout;

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
        .empty  (empty),
        .rd_en  (rd_en),
        .dout   (dout)
    );

    ip_fifo response_fifo (
    	.rst    (~rst_n),
        .wr_clk (ft_clk),
        .rd_clk (clk),
        .full   (full),
        .wr_en  (wr_en),
        .din    (din),
        .empty  (r_empty),
        .rd_en  (r_rd_en),
        .dout   (r_dout)
    );

    initial begin
        clk = 1'b0;
        ft_clk = 1'b0;
        rst_n = 1'b0;

        state = 1'b0;
        buff_off = 3'b0;
        wr_en = 1'b0;
        din = 8'b0;

        #5 rst_n = 1'b1;

        #20 read_req(bus, 64'hEFCD_AB89_6745_2301, 8);

        #470
        state = 1'b0;
        buff_off = 3'b0;
        wr_en = 1'b0;
        din = 8'b0;

        read_req(bus, 64'h0123_4567_89AB_CDEF, 8);

        #450
        state = 1'b0;
        buff_off = 3'b0;
        wr_en = 1'b0;
        din = 8'b0;

        read_req(bus, 64'hAABB_CCDD_EEFF_0011, 8);

        #1600 $finish();
    end

    always #10  clk = ~clk;
    always #8   ft_clk = ~ft_clk;

    logic last_empty;
    dff #(1, 1'b1) dff_read (ft_clk, rst_n, `DISABLE, `DISABLE,
                             empty, last_empty);

    assign rd_en = ~empty;

    always @(posedge ft_clk, negedge rst_n) begin
        if (~rst_n) begin
        end if (~state) begin
            if (~last_empty) begin
                //$display($time,, "addr: %x", dout);
                buff[buff_off] <= dout;
                buff_off <= buff_off + 1;
                if (&buff_off) begin
                    state <= 1'b1;
                end
            end
        end else begin
            if (~full) begin
                //$display($time,, "data: %x", buff[buff_off]);
                din <= buff[buff_off];
                wr_en <= `ENABLE;
                buff_off <= buff_off + 1;
                buff[buff_off] <= 8'b0;
                if (&buff_off) begin
                    state <= 1'b0;
                end
            end
        end
    end

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
        $fsdbDumpfile("remote_rom_with_fifo.fsdb");
        $fsdbDumpvars();
    end
`endif
    
endmodule
