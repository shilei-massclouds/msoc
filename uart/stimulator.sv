`timescale 1ns / 1ps

`include "isa.vh"

module stimulator (
    input wire clk,
    input wire rst_n,

    tilelink.master bus
);

    localparam UART_RX_FIFO = 4'h0; /* In:  Recieve Buffer Register */
    localparam UART_TX_FIFO = 4'h4; /* Out: Transmitter Holding Register */
    localparam UART_STATUS  = 4'h8; /* In:  Line Status Register */
    localparam UART_CONTROL = 4'hc; /* Out: Line Control Register */

    localparam S_IDLE = 1'b0;
    localparam S_ADDR = 1'b1;

    reg  valid;
    reg  [7:0] data;

    /* Generator */
    logic state, next_state;
    dff dff_state(clk, rst_n, `DISABLE, `DISABLE, next_state, state);

    assign bus.a_opcode  = `TL_GET;
    assign bus.a_param   = 3'b0;
    assign bus.a_size    = 3'd3;
    assign bus.a_source  = 4'b0001;
    assign bus.a_mask    = 8'hFF;
    assign bus.a_corrupt = `FALSE;

    assign bus.a_valid = (state == S_ADDR);
    assign bus.d_ready = `ENABLE;

    always @(rst_n, state, valid, bus.a_ready) begin
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
            if (state == S_IDLE && valid) begin
                bus.a_address <= UART_TX_FIFO;
                bus.a_data <= data;
            end

            if (state == S_ADDR && bus.a_ready)
                bus.a_address <= 64'b0;
        end
    end

    reg [3:0] count;
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            valid <= `ENABLE;
            data <= "A";
            count <= 4'b0;
        end else begin
            if (&count) begin
                valid <= `ENABLE;
                if (data == "\n")
                    data <= "A";
                else if (data >= "Z")
                    data <= "\n";
                else
                    data <= data + 1;
            end else begin
                valid <= `DISABLE;
            end

            count <= count + 1;
        end
    end

    initial begin
        #20480 $finish();
    end

endmodule
