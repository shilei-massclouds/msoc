module fifo_sim (
    input   wire    clk,
    input   wire    rst_n,

    input   wire    txe_n,
    output  wire    wr_n,
    output  wire    siwu_n,

    input   wire    rxf_n,
    output  wire    oe_n,
    output  wire    rd_n,

    inout   wire    [7:0] adbus
);
    reg     empty;
    wire    rd_en;
    reg     [7:0] dout;

    reg     full;
    wire    wr_en;
    wire    [7:0] din;

    reg     [7:0] count;

    assign siwu_n = 1'b1;

    ft232h_bridge u_ft232h_bridge(
    	.clk   (clk   ),
        .rst_n (rst_n ),
        .empty (empty ),
        .rd_en (rd_en ),
        .dout  (dout  ),
        .full  (full  ),
        .wr_en (wr_en ),
        .din   (din   ),
        .txe_n (txe_n ),
        .wr_n  (wr_n  ),
        .rxf_n (rxf_n ),
        .oe_n  (oe_n  ),
        .rd_n  (rd_n  ),
        .adbus (adbus )
    );

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            dout <= 8'b0;
            empty <= 1'b0;
            full <= 1'b0;
            count <= 8'b0;
        end else begin
            if (count == 8) begin
                count <= 8'b0;
                empty <= 1'b1;
            end

            if (rd_en) begin
                count <= count + 1;
                dout <= 8'b0;
            end
        end
    end

    initial begin
        $monitor($time,, "dout(%x) din(%x)", dout, din);
    end

endmodule