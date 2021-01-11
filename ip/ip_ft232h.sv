module ip_ft232h (
    output  wire  clkout,

    inout   wire  [7:0] adbus,

    output  wire  txe,
    input   wire  wr,
    input   wire  siwu,

    output  wire  rxf,
    input   wire  oe,
    input   wire  rd
);

    bit clk;
    bit [7:0] addr[4];
    bit [2:0] addr_cnt;
    bit [7:0] data[4];
    bit [2:0] data_cnt;
    bit [7:0] tmp;
    bit [7:0] rdata;
    bit state;

    assign clkout = clk;
    assign txe = (addr_cnt == 4);
    assign rxf = (data_cnt == 0);
    assign adbus = state ? rdata : 8'bz;

    always #8 clk = ~clk;

    bit can_read;
    always @(posedge clk) begin
        if (~wr) begin
            addr[addr_cnt] <= adbus;
            addr_cnt <= addr_cnt + 1;
            data_cnt <= 4;
        end else if (txe) begin
            data <= addr;
            state <= 1'b1;
        end
        
        if (~oe & ~rd) begin
            rdata <= data[4 - data_cnt];
            data_cnt <= data_cnt - 1;
        end
    end

endmodule
