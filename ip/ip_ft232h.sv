`define LOAD_IMG(filename, base, size) \
    handle = open_img(filename, base); \
    if (handle) begin \
        logic [63:0] addr; \
        logic [63:0] data; \
        forever begin \
            if (load_img(handle, addr, data) < 0) \
                break; \
            addr_space[addr] = data; \
        end \
        size = close_img(); \
    end else begin \
        $display("### Error: No [%s] ###", filename); \
    end

import "DPI-C" function longint
open_img(input string filename, input longint base);

import "DPI-C" function int
close_img();

import "DPI-C" function int
load_img(input longint handle, output longint addr, output longint data);


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
    localparam S_READ   = 2'b01;

    bit clk;
    bit [63:0] addr;
    bit [2:0]  addr_cnt;
    bit [63:0] data;
    bit [2:0]  data_cnt;

    bit [1:0] state;

    bit i_txe_n = 1'b0;
    bit i_rxf_n = 1'b1;

    reg [63:0] addr_space[bit[60:0]];

    assign txe_n = i_txe_n;
    assign rxf_n = i_rxf_n;

    assign clkout = clk;
    assign adbus = (state == S_READ) ? data[7:0] : 8'bz;

    always #8 clk = ~clk;

    always @(posedge clk) begin
        if (state == S_WRITE) begin
            if (~wr_n) begin
                //$display($time,, "addr: %x %x %x %x",
                         //adbus, addr, addr_cnt, wr_n);
                addr <= {adbus, addr[63:8]};
                addr_cnt <= addr_cnt + 1;
            end

            if (&addr_cnt) begin
                state <= S_READ;
                i_txe_n <= 1'b1;
                i_rxf_n <= 1'b0;
                data <= addr_space[addr[63:3]];
                addr_cnt <= 3'b0;
            end
        end else begin  /* state == S_READ */
            if (~rd_n) begin
                //$display($time,, "data: %x %x", data, data_cnt);
                //$display($time,, "[%x]: %x", addr, data);
                data <= {8'b0, data[63:8]};
                if (&data_cnt) begin
                    state <= S_WRITE;
                    i_txe_n <= 1'b0;
                    i_rxf_n <= 1'b1;
                    data_cnt <= 3'b0;
                end else begin
                    data_cnt <= data_cnt + 1;
                end
            end
        end
    end

    /* Initialize address space with files */
    initial begin
        longint handle;
        int size = 0;
        `LOAD_IMG({`TOP_DIR, "/data/head.bin"},    'h0,    size)
        `LOAD_IMG({`TOP_DIR, "/data/virt.dtb"},    'h100,  size)
        `LOAD_IMG({`TOP_DIR, "/data/fw_jump.bin"}, 'h2000, size)
        addr_space['h3ff] = size;
    end

endmodule
