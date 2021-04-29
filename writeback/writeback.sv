`timescale 1ns / 1ps

`include "isa.vh"

module writeback (
    input  wire [63:0]  pc,
    input  wire [63:0]  data,
    input  wire [4:0]   rd,
    output wire [63:0]  data_out,
    output wire [4:0]   rd_out
);

    assign data_out = data;
    assign rd_out   = rd;
    
endmodule
