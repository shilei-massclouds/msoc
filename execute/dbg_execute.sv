`timescale 1ns / 1ps

`include "isa.vh"

module dbg_execute (
    input wire clk,
    input wire rst_n,

    input wire [63:0] pc,

    sys_ops.dst sys_ops
);

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
        end else begin
            if (`EN_VERBOSE) begin
                $display($time,, "Execute: [%08x] ebreak(%x)",
                         pc, sys_ops.ebreak_op);
            end

            if (sys_ops.ebreak_op)
                $finish();
        end
    end

endmodule
