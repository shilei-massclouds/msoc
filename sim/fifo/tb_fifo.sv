`timescale 1ns/1ps

module tb_fifo;

    localparam WIDTH = 8;
    localparam DEPTH = 4;

    reg  rst;
    reg  wr_clk;
    reg  rd_clk;

    wire wr_en;
    wire rd_en;
    reg  [(WIDTH-1):0] din;
    wire [(WIDTH-1):0] dout;
    wire full;
    wire empty;

    ip_fifo #(WIDTH, DEPTH) fifo(.*);

    assign wr_en = ~full;
    assign rd_en = ~empty;

    always #7 wr_clk = ~wr_clk;
    always #6 rd_clk = ~rd_clk;

    always @(posedge wr_clk, posedge rst) begin
        if (rst)
            din <= 8'd0;
        else begin
            if (~full) begin
                din <= din + 1;
            end
        end
    end

    reg r_valid;
    always @(posedge rd_clk, posedge rst) begin
        if (rst) begin
            r_valid <= 1'b0;
        end else begin
            if (r_valid) begin
                $display($time,, "%x", dout);
            end

            if (rd_en)
                r_valid <= 1'b1;
            else
                r_valid <= 1'b0;
        end
    end

    initial begin
        rst = 1'b1;
        wr_clk = 1'b0;
        rd_clk = 1'b0;

        #5 rst = 1'b0;

        #300 $finish();
    end

    initial begin
        $fsdbDumpfile("ip_fifo.fsdb");
        $fsdbDumpvars();
    end

endmodule
