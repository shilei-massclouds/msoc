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
    bit [7:0] addr[8];
    bit [2:0] addr_cnt;
    bit [7:0] data[8];
    bit [2:0] data_cnt;
    bit [7:0] rdata;
    bit state;

    assign clkout = clk;
    assign txe = (addr_cnt == 8);
    assign rxf = (data_cnt == 0);
    assign adbus = state ? rdata : 8'bz;

    always #8 clk = ~clk;

    always @(posedge clk) begin
        if (~state) begin
            if (~wr) begin
                addr[addr_cnt] <= adbus;
                addr_cnt <= addr_cnt + 1;
            end else if (txe) begin
                addr_cnt <= 3'd0;
                data_cnt <= 3'd8;
                data <= addr;
                state <= 1'b1;
            end
        end else begin
            if (~oe) begin
                rdata <= data[8 - data_cnt];
                data_cnt <= data_cnt - 1;
            end else if (rxf) begin
                state <= 1'b0;
                rdata <= 8'b0;
            end
        end
    end

endmodule
