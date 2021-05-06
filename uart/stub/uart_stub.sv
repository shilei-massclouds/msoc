`timescale 1ns / 1ps

`include "isa.vh"

import "DPI-C" function longint
uart_putc(input byte base);

module uart (
    input   wire    clk,
    input   wire    rst_n,

    tilelink.slave  bus
);

    localparam UART_RX_FIFO = 4'h0; /* In:  Recieve Buffer Register */
    localparam UART_TX_FIFO = 4'h4; /* Out: Transmitter Holding Register */
    localparam UART_STATUS  = 4'h8; /* In:  Line Status Register */
    localparam UART_CONTROL = 4'hc; /* Out: Line Control Register */

    //                          Status Register
    // +--------+------+------+------+-------+-------+--------+-------+--------+
    // |  31:8  |  7   |  6   |  5   |   4   |   3   |   2    |   1   |   0    |
    // +--------+------+------+------+-------+-------+--------+-------+--------+
    //  Reserved   PE     FE     OE   Intr-En Tx-Full Tx-Empty Rx-Full Rx-Valid
    //
    //  PE: Parity Error;   FE: Frame Error;    OE: Overrun Error;
    //

    //                          Control Register
    //  +———————————+—————————————+———————————+——————————————+——————————————+
    //  | 31:5      |     4       |  3:2      |      1       |      0       |
    //  +———————————+—————————————+———————————+——————————————+——————————————+
    //    Reserved    Enable Intr   Reserved    Rst Rx FIFO    Rst Tx FIFO
    //

    localparam UART_LSR_THRE = 8'b00100000; /* Transmit-hold-register empty */
    localparam UART_LSR_TEMT = 8'b01000000; /* Transmitter empty */

    localparam S_IDLE    = 3'b000;
    localparam S_RX_FIFO = 3'b001;
    localparam S_TX_FIFO = 3'b010;
    localparam S_STATUS  = 3'b011;
    localparam S_CONTROL = 3'b100;

    reg [31:0] rx_buffer;
    reg [31:0] status;
    reg [31:0] control;

    /* Controller */
    logic [2:0] state, next_state;
    dff #(3, 3'b0) dff_stage(clk, rst_n, `DISABLE, `DISABLE, next_state, state);

    assign bus.a_ready = (state == S_IDLE);
    assign bus.d_valid = (state == S_RX_FIFO) | (state == S_STATUS);
    assign bus.d_data = ({32{state == S_RX_FIFO}} & rx_buffer) |
                        ({32{state == S_STATUS}} & status);

    /* State transition */
    always @(state, bus.a_valid, bus.d_ready) begin
        case (state)
            S_IDLE:
                if (bus.a_valid) begin
                    if (bus.a_address == UART_RX_FIFO) begin
                        next_state = S_RX_FIFO;
                    end else if (bus.a_address == UART_TX_FIFO) begin
                        next_state = S_TX_FIFO;
                    end else if (bus.a_address == UART_STATUS) begin
                        next_state = S_STATUS;
                    end else if (bus.a_address == UART_CONTROL) begin
                        next_state = S_CONTROL;
                    end else begin
                        next_state = S_IDLE;
                    end
                end else begin
                    next_state = S_IDLE;
                end
            S_RX_FIFO:
                next_state = bus.d_ready ? S_IDLE : S_RX_FIFO;
            S_TX_FIFO:
                next_state = S_IDLE;
            S_STATUS:
                next_state = bus.d_ready ? S_IDLE : S_STATUS;
            S_CONTROL:
                next_state = S_IDLE;
            default:
                next_state = S_IDLE;
        endcase
    end

    /* Datapath */
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            rx_buffer <= 32'b0;
            status <= 32'b0;
            control <= 32'b0;
        end else begin
            if (state == S_TX_FIFO) begin
                uart_putc(bus.a_data[7:0]);
            end else if (state == S_CONTROL) begin
                control <= bus.a_data[31:0];
            end
        end
    end

endmodule
