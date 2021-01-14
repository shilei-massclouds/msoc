module ft232h_ctl (
    input   wire    clk,
    input   wire    rst_n,

    input   wire    empty,
    output  wire    rd_en,
    input   wire    [7:0] dout,

    input   wire    full,
    output  reg     wr_en,
    output  reg     [7:0] din,

    input   wire    txe_n,
    output  reg     wr_n,

    input   wire    rxf_n,
    output  wire    oe_n,
    output  wire    rd_n,

    inout   wire    [7:0] adbus
);

    localparam S_WRITE = 1'b0;
    localparam S_READ  = 1'b1;

    reg state;
    reg [2:0] offset;
    reg [7:0] adbus_buff;
    logic last_empty;
    logic last_oe_n;
    logic last_rd_n;

    dff #(1, 1'b1) dff_read (clk, rst_n, `DISABLE, `DISABLE,
                             empty, last_empty);

    dff dff_oe_n (clk, rst_n, `DISABLE, `DISABLE, oe_n, last_oe_n);
    dff dff_rd_n (clk, rst_n, `DISABLE, `DISABLE, rd_n, last_rd_n);

    assign adbus = (state == S_WRITE) ? adbus_buff : 8'bz;
    assign rd_en = ~empty;

    assign oe_n = rxf_n;
    assign rd_n = last_oe_n;

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            adbus_buff <= 8'b0;
            wr_n <= `DISABLE_N;
            offset <= 3'b0;
            state <= S_WRITE;
        end if (state == S_WRITE) begin
            if (~last_empty) begin
                $display($time,, "addr: %x", dout);
                adbus_buff <= dout;
                wr_n <= `ENABLE_N;
                offset <= offset + 1;
                if (&offset) begin
                    state <= S_READ;
                end
            end
        end else begin
            if (~last_rd_n) begin
                $display($time,, "data: %x", adbus);
                din <= adbus;
                wr_en <= `ENABLE;
                offset <= offset + 1;
                if (&offset) begin
                    state <= S_WRITE;
                end
            end
        end
    end

endmodule