`timescale 1ns / 1ps

`include "isa.vh"

module dbg_access (
    input wire clk,
    input wire rst_n,

    input wire stall,

    input wire [63:0] pc,
    input wire [4:0]  rd,
    input wire [63:0] data,

    tilelink.master bus
);

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
        end else begin
            if (`CHECK_ENV("VERBOSE")) begin
                $display($time,, "Access: [%08x] rd(%s) data(%0x) stall(%0x) d_valid(%0x)",
                         pc, abi_names[rd], data, stall,
                         bus.d_valid);
            end
        end
    end

endmodule
