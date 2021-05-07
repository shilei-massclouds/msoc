`timescale 1ns / 1ps

`include "isa.vh"

module dbg_regfile (
    input wire clk,
    input wire rst_n,

    input wire [63:0] pc,
    input wire [4:0]  rd,
    input wire [63:0] data
);

    string abi_names[32] = {
        "zero",                                                 /* 0 */
        "ra", "sp", "gp", "tp", "t0", "t1", "t2", "s0", "s1",   /* 1 ~ 9 */
        "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",         /* 10 ~ 17 */
        "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9",         /* 18 ~ 25 */
        "s10", "s11", "t3", "t4", "t5", "t6"                    /* 26 ~ 31 */
    };

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
        end else begin
            if (rd)
                $display($time,, "Reg: [%08x] %x => %s",
                         pc, data, abi_names[rd]);
        end
    end

endmodule
