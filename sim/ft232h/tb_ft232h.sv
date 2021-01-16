`timescale 1ns/1ps

`include "isa.vh"

module tb_fifo;

    wire clkout;
    wire txe_n;
    reg  wr_n;
    reg  siwu_n;
    wire rxf_n;
    wire oe_n;
    reg  rd_n;

    wire [7:0] adbus;
    reg  [7:0] adbus_buf;

    bit  state = 1'b0;

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

    assign adbus = state ? 8'bz : adbus_buf;
    assign oe_n = rxf_n;

    integer i = 0;
    reg [63:0] addr[3];
    reg [63:0] cur_addr;

    initial begin
        addr[0] = 64'h1100FFEEDDCCBBAA;
        addr[1] = 64'hABCDEF0123456789;
        addr[2] = 64'h0000000000000000;

        siwu_n = `DISABLE_N;
        wr_n = `DISABLE_N;
        rd_n = `DISABLE_N;

        for (integer j = 0; j < 3; j++) begin
            $display($time,, "cycle[%d]", j);

            cur_addr = addr[j];

            wait(~txe_n);
            $display($time,, "txe_n: %x", txe_n);

            i = 0;
            while (i < 8) begin
                @ (posedge clkout) begin
                    adbus_buf = cur_addr[7:0];
                    cur_addr = {8'b0, cur_addr[63:8]};
                    i = i + 1;
                    wr_n = `ENABLE_N;
                end
            end

            @ (posedge clkout);
            state = 1'b1;
            wr_n = `DISABLE_N;

            wait (~rxf_n);

            $display($time,, "rxf_n: %x", rxf_n);

            @ (posedge clkout);
            rd_n = `ENABLE_N;
            @ (posedge clkout);

            i = 0;
            while (i < 8) begin
                @ (posedge clkout) begin
                    $display($time,, "Got[%d]: %x", i, adbus);
                    i = i + 1;
                end
            end

            @ (posedge clkout);
            siwu_n = `DISABLE_N;
            wr_n = `DISABLE_N;
            rd_n = `DISABLE_N;
            state = 1'b0;
        end

        $finish();
    end

//`define FSDB_DUMP
`ifdef FSDB_DUMP
    initial begin
        $fsdbDumpfile("ft232h.fsdb");
        $fsdbDumpvars();
    end
`endif

endmodule
