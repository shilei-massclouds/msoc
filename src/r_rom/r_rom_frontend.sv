`include "isa.vh"

module r_rom_frontend (
    input   wire    clk,
    input   wire    rst_n,

    tilelink.slave  bus,

    /* Command FIFO */
    input   wire  full,
    output  reg   wr_en,
    output  reg   [7:0] din,

    /* Response FIFO */
    input   wire  empty,
    output  wire  rd_en,
    input   wire  [7:0] dout
);

    localparam S_IDLE = 2'b00;
    localparam S_ADDR = 2'b01;
    localparam S_DATA = 2'b10;
    localparam S_DONE = 2'b11;

    bit [2:0]   addr_off;
    bit [63:0]  addr_buf;

    bit [2:0]   data_off;
    bit [63:0]  data_buf;

    /* Controller */
    logic [1:0] state, next_state;
    dff #(2, 2'b0) dff_state(clk, rst_n, `DISABLE, `DISABLE, next_state, state);

    /* State transition */
    always @(state, bus.a_valid, bus.d_ready, empty, addr_off, data_off) begin
        case (state)
            S_IDLE:
                next_state = bus.a_valid ? S_ADDR : S_IDLE;
            S_ADDR:
                next_state = &addr_off ? S_DATA : S_ADDR;
            S_DATA:
                next_state = &data_off ? S_DONE : S_DATA;
            S_DONE:
                next_state = bus.d_ready ? S_IDLE : S_DONE;
            default:
                next_state = S_IDLE;
        endcase
    end

    /* Output operations */
    reg cache_addr;
    reg send_addr_byte;
    reg recv_data_byte;
    reg respond_data;

    logic last_empty;
    dff dff_read(clk, rst_n, `DISABLE, `DISABLE, empty, last_empty);

    always @(state, bus.a_valid, last_empty, data_off) begin

        cache_addr = `DISABLE;
        send_addr_byte = `DISABLE;
        recv_data_byte = `DISABLE;
        respond_data = `DISABLE;

        case (state)
            S_IDLE:
                if (bus.a_valid) cache_addr = `ENABLE;
            S_ADDR:
                send_addr_byte = `ENABLE;
            S_DATA:
                if (~last_empty) recv_data_byte = `ENABLE;
            S_DONE:
                respond_data = `ENABLE;
        endcase
    end

    /* Datapath */
    assign bus.a_ready = `ENABLE;
    assign siwu_n = 1'b1;
    assign rd_en = ~empty;

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            bus.d_valid <= `DISABLE;
            bus.d_data <= 64'b0;
            bus.d_denied <= `DISABLE;
            wr_en <= 1'b0;
        end else begin
            bus.d_valid <= `DISABLE;
            bus.d_data <= 64'b0;
            bus.d_denied <= `DISABLE;
            wr_en <= 1'b0;

            if (cache_addr) begin
                addr_buf <= bus.a_address;
                addr_off <= 3'b0;
            end

            if (send_addr_byte) begin
                wr_en <= 1'b1;
                din <= addr_buf[7:0];
                addr_buf <= {8'b0, addr_buf[63:8]};
                addr_off <= addr_off + 3'b1;
            end

            if (recv_data_byte) begin
                data_buf <= {dout, data_buf[63:8]};
                data_off <= data_off + 3'b1;
            end

            if (respond_data) begin
                bus.d_data <= data_buf;
                bus.d_valid <= `ENABLE;
                bus.d_denied <= `ENABLE;
                bus.d_size <= bus.a_size;
                bus.d_source <= bus.a_source;
                bus.d_opcode <= `TL_ACCESS_ACK_DATA;
            end
        end
    end

endmodule
