`timescale 1ns/1ps

`include "isa.vh"

module tb_remote_rom;

    reg clk;
    reg rst_n;
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

    remote_rom rom (
        .clk      (clk),
        .rst_n    (rst_n),
        .bus      (bus),
        /* Command FIFO */
        .full     (full),
        .wr_en    (wr_en),
        .din      (din),
        /* Response FIFO */
        .empty    (empty),
        .rd_en    (rd_en),
        .dout     (dout)
    );

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        state = 1'b0;
        buff = 64'b0;
        offset = 3'b0;

        dout = 8'b0;

        #5 rst_n = 1'b1;

        #20 read_req(bus, 64'hEFCD_AB89_6745_2301, 8);

        #450
        full = 1'b0;
        empty = 1'b1;
        state = 1'b0;
        offset = 3'b0;

        read_req(bus, 64'h0123_4567_89AB_CDEF, 8);

        #1000 $finish();
    end

    always #10 clk = ~clk;

    always @(posedge clk) begin
        if (~state) begin
            if (wr_en) begin
                if (&offset) begin
                    full <= 1'b1;
                    empty <= 1'b0;
                    state <= 1'b1;
                end

                buff <= {din, buff[63:8]};
                offset <= offset + 3'd1;
                //$display($time,, "addr: %x; buff: %x", din, buff);
            end
        end else begin
            if (rd_en) begin
                //$display($time,, "data: %x", buff[7:0]);
                dout <= buff[7:0];
                buff <= {8'b0, buff[63:8]};
                offset <= offset + 3'd1;
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

//`define FSDB_DUMP
`ifdef FSDB_DUMP
    initial begin
        $fsdbDumpfile("remote_rom.fsdb");
        $fsdbDumpvars();
    end
`endif
    
endmodule
