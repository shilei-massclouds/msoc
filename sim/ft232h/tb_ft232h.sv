`timescale 1ns/1ps

module tb_fifo;

    wire  clkout;

    wire  [7:0] adbus;

    wire  txe;
    reg   wr;
    reg   siwu;

    wire  rxf;
    wire  oe;
    reg   rd;

    bit   state = 1'b0;
    reg   [7:0] adbus_buf;
    assign adbus = state ? 'hzz : adbus_buf;
    assign oe = rxf;

    ip_ft232h ft232h(.*);

    integer i = 0;
    reg [7:0] addr[4];

    initial begin
        addr[0] = 8'hAA;
        addr[1] = 8'hBB;
        addr[2] = 8'hCC;
        addr[3] = 8'hDD;

        siwu = 1'b1;
        wr = 1'b1;
        rd = 1'b1;

        for (integer j = 0; j < 3; j++) begin
            $display("txe: %x", txe);
            wait(~txe);

            i = 0;
            while (i < 4) begin
                @ (posedge clkout) begin
                    adbus_buf = addr[i];
                    i = i + 1;
                    wr = 1'b0;
                end
            end

            @ (posedge clkout);
            state = 1'b1;
            wr = 1'b1;

            wait (~rxf);

            $display($time,, "3: %x", rxf);

            @ (posedge clkout);
            rd = 1'b0;

            i = 0;
            while (i < 4) begin
                @ (posedge clkout) begin
                    $display($time,, "Got[%d]: %x", i, adbus);
                    i = i + 1;
                end
            end

            siwu = 1'b1;
            wr = 1'b1;
            rd = 1'b1;
            state = 1'b0;
        end

        $finish();
    end

`define FSDB_DUMP
`ifdef FSDB_DUMP
    initial begin
        $fsdbDumpfile("ip_ft232h.fsdb");
        $fsdbDumpvars();
    end
`endif

endmodule
