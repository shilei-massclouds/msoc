`timescale 1ns / 1ps

`include "isa.vh"

module stimulator (
    input   wire clk,
    input   wire rst_n,

    output  reg  [63:0] pc,

    input   wire inst_valid,
    input   wire inst_compressed,
    input   wire [31:0] inst,

    input   wire request
);

    wire [63:0] next_pc;

    assign next_pc = inst_valid ? (pc + (inst_compressed ? 2 : 4)) : pc;

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            pc <= 64'h000;
        end else begin
            pc <= next_pc;
            if (inst_valid)
                $display($time,, "inst: %x(%x,%x); pc: (%x : %x); req: %x",
                         inst, inst_valid, inst_compressed,
                         pc, next_pc, request);
        end
    end

    initial begin
        #1024 $finish();
    end

endmodule
