module ip_ft232h (
    output  wire  clkout,

    inout   wire  [7:0] adbus,

    output  wire  txe_n,
    input   wire  wr_n,
    input   wire  siwu_n,

    output  wire  rxf_n,
    input   wire  oe_n,
    input   wire  rd_n
);

    localparam S_WRITE = 1'b0;
    localparam S_READ  = 1'b1;

    bit clk;
    bit [7:0] addr[8];
    bit [3:0] addr_cnt;
    bit [7:0] data[8];
    bit [3:0] data_cnt;

    bit state;
    bit [7:0] adbus_buff;

    assign clkout = clk;
    assign txe_n = (addr_cnt == 8);
    assign rxf_n = (data_cnt == 0);
    assign adbus = (state == S_READ) ? adbus_buff : 8'bz;

    always #8 clk = ~clk;

    always @(posedge clk) begin
        if (state == S_READ) begin
            if (~oe_n & ~rd_n) begin
                adbus_buff <= data[8 - data_cnt];
                data_cnt <= data_cnt - 1;
                if (data_cnt == 1) begin
                    state <= S_WRITE;
                    adbus_buff <= 8'b0;
                end
            end
        end else begin  /* state == S_WRITE */
            if (~wr_n) begin
                addr[addr_cnt] <= adbus;
                addr_cnt <= addr_cnt + 1;
                if (addr_cnt == 7) begin
                    state <= S_READ;
                    data <= addr;
                    data_cnt <= 4'd8;
                    addr_cnt <= 4'b0;
                end
            end
        end
    end

endmodule
