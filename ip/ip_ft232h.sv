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

    localparam S_WRITE  = 2'b00;
    localparam S_HANDLE = 2'b01;
    localparam S_READ   = 2'b10;

    bit clk;
    bit [63:0] addr;
    bit [2:0]  addr_off;
    bit [63:0] data;
    bit [3:0]  data_cnt;

    bit [1:0] state;
    bit [7:0] adbus_buff;

    bit i_txe_n = 1'b0;
    bit i_rxf_n = 1'b1;

    assign txe_n = i_txe_n;
    assign rxf_n = i_rxf_n;

    assign clkout = clk;
    assign adbus = (state == S_READ) ? adbus_buff : 8'bz;

    always #8 clk = ~clk;

    always @(posedge clk) begin
        if (state == S_WRITE) begin
            if (~wr_n) begin
                $display($time,, "addr: %x %x", adbus, addr);
                addr <= {adbus, addr[63:8]};
                addr_off <= addr_off + 1;
                if (&addr_off) begin
                    state <= S_HANDLE;
                end
            end
        end else if (state == S_HANDLE) begin
            i_txe_n <= 1'b1;
            i_rxf_n <= 1'b0;
            data <= addr;
            state <= S_READ;
        end else begin
            if (~oe_n & ~rd_n) begin
                $display($time,, "data: %x %x", data, data_cnt);
                adbus_buff <= data[7:0];
                data <= {8'b0, data[63:8]};
                if (data_cnt[3]) begin
                    state <= S_WRITE;
                    i_txe_n <= 1'b0;
                    i_rxf_n <= 1'b1;
                    adbus_buff <= 8'b0;
                    data_cnt <= 4'b0;
                end else begin
                    data_cnt <= data_cnt + 1;
                end
            end
        end
    end

endmodule
