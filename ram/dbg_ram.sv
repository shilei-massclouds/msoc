`timescale 1ns / 1ps

`include "isa.vh"

module dbg_ram (
    input wire clk,
    input wire rst_n,

    tilelink.slave bus
);

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
        end else if (`EN_VERBOSE) begin
            if (bus.a_valid) begin
                string opcode;
                if (bus.a_opcode == `TL_GET)
                    opcode = "get";
                else if (bus.a_opcode == `TL_PUT_F || bus.a_opcode == `TL_PUT_P)
                    opcode = "put";
                else
                    opcode = "unknown";

                $display($time,, "RAM(%s): [%x] %x",
                         opcode, bus.a_address, bus.a_data);
            end

            if (bus.d_valid)
                $display($time,, "RAM(data): %x",
                         bus.d_data);
        end
    end

endmodule
