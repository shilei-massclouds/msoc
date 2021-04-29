`timescale 1ns / 1ps

`include "isa.vh"

module stimulator (
    input  wire         clk,
    input  wire         rst_n,

    output wire [63:0]  pc,
    output reg  [63:0]  data,
    output reg  [4:0]   rd
);

    assign pc = 64'h400;

    initial begin
        rd   <= 5'h3;
        data <= 64'h3A2A;
    end

endmodule
