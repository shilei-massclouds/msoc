`timescale 1ns / 1ps

`include "isa.vh"

module stimulator (
    input  wire clk,
    input  wire rst_n,

    tilelink.master bus
);

    localparam S_IDLE = 2'b00;
    localparam S_ADDR = 2'b01;

    reg  valid;
    reg  [63:0] address;

    /* Generator */
    wire [1:0] state;
    reg  [1:0] next_state;
    dff #(2, 2'b0) dff_state(clk, rst_n, `DISABLE, `DISABLE, next_state, state);

    assign bus.a_opcode  = `TL_GET;
    assign bus.a_param   = 3'b0;
    assign bus.a_size    = 3'd3;
    assign bus.a_source  = 4'b0001;
    assign bus.a_mask    = 8'hFF;
    assign bus.a_data    = 64'b0;
    assign bus.a_corrupt = `FALSE;

    assign bus.a_valid = (state == S_ADDR);
    assign bus.d_ready = `ENABLE;

    always @(state, valid, bus.a_ready) begin
        case (state)
            S_IDLE:
                next_state = valid ? S_ADDR : S_IDLE;
            S_ADDR:
                next_state = bus.a_ready ? S_IDLE : S_ADDR;
            default:
                next_state = S_IDLE;
        endcase
    end

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            bus.a_address <= 64'b0;
        end else begin
            if (state == S_IDLE && valid)
                bus.a_address <= address;

            if (state == S_ADDR && bus.a_ready)
                bus.a_address <= 64'b0;
        end
    end

    reg [7:0] count;
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            valid <= `ENABLE;
            address <= 64'b0;
            count <= 8'b0;
        end else begin
            if (&count) begin
                valid <= `ENABLE;
                address <= address + 1;
            end else begin
                valid <= `DISABLE;
                address <= address;
            end

            count <= count + 1;
        end
    end

    initial begin
        $monitor($time,, "d_data(%x) d_valid(%x)", bus.d_data, bus.d_valid);
        #20480 $finish();
    end

endmodule