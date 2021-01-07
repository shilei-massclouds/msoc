module ip_fifo #(
    parameter WIDTH = 8,
    parameter DEPTH = 4
)(
    input   wire  rst,
    input   wire  wr_clk,
    input   wire  rd_clk,

    output  wire  full,
    input   wire  wr_en,
    input   wire  [(WIDTH-1):0] din,

    output  wire  empty,
    input   wire  rd_en,
    output  wire  [(WIDTH-1):0] dout
);

    reg [(WIDTH-1):0] cells[(DEPTH-1):0];

    reg [(DEPTH-1):0] head;
    reg [(DEPTH-1):0] tail;
    
endmodule
