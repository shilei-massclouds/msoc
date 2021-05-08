`timescale 1ns / 1ps

`include "isa.vh"

`define LOAD_IMG(filename, base, size) \
    handle = open_img(filename, base); \
    if (handle) begin \
        logic [63:0] addr; \
        logic [63:0] data; \
        forever begin \
            if (load_img(handle, addr, data) < 0) \
                break; \
            cells[addr] = data; \
        end \
        size = close_img(); \
    end


module rom (
    input wire clk,
    input wire rst_n,

    tilelink.slave bus
);
    localparam S_IDLE = 1'b0;
    localparam S_BUSY = 1'b1;

    /* Datapath: Internal data cells in ROM */
    reg [63:0] cells[bit[60:0]];

    /* Controller */
    logic state, next_state;
    dff dff_state(clk, rst_n, `DISABLE, `DISABLE, next_state, state);

    assign bus.a_ready = (state == S_IDLE);

    /* State transition */
    always @(rst_n, state, bus.a_valid, bus.d_ready) begin
        case (state)
            S_IDLE:
                next_state = bus.a_valid ? S_BUSY : S_IDLE;
            S_BUSY:
                next_state = bus.d_ready ? S_IDLE : S_BUSY;
            default:
                next_state = S_IDLE;
        endcase
    end

    /* Output operations */
    reg op_data = `DISABLE;

    always @(rst_n, state, bus.a_valid, bus.d_ready) begin
        op_data = `DISABLE;
        case (state)
            S_IDLE:
                if (bus.a_valid) op_data = `ENABLE;
            S_BUSY:
                op_data = `DISABLE;
        endcase
    end

    /* Datapath */
    wire is_get = (bus.a_opcode == `TL_GET);

    wire [7:0] size_mask = {{4{bus.a_size[1] & bus.a_size[0]}},
                            {2{bus.a_size[1]}},
                            {bus.a_size[1] | bus.a_size[0]}, 1'b1};
    wire [60:0] addr = bus.a_address[63:3];
    wire [2:0] offset = bus.a_address[2:0];
    wire [63:0] a_data = bus.a_data << (8 * offset);
    wire [7:0] a_mask = (bus.a_mask & size_mask) << offset;
    wire [63:0] mask = {{8{a_mask[7]}}, {8{a_mask[6]}},
                        {8{a_mask[5]}}, {8{a_mask[4]}},
                        {8{a_mask[3]}}, {8{a_mask[2]}},
                        {8{a_mask[1]}}, {8{a_mask[0]}}};


    /* Todo: bus.a_corrupt means lr or sc */
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            bus.d_valid <= `DISABLE;
            bus.d_data <= 64'b0;
        end else begin
            bus.d_valid <= `DISABLE;
            bus.d_data <= 64'b0;
            bus.d_denied <= `DISABLE;

            if (op_data) begin
                bus.d_size <= bus.a_size;
                bus.d_source <= bus.a_source;
                if (is_get) begin
                    bus.d_data <= (cells[addr] & mask) >> (8 * offset);
                    bus.d_opcode <= `TL_ACCESS_ACK_DATA;
                end
                bus.d_valid <= `ENABLE;
                bus.d_denied <= `ENABLE;
            end
        end
    end

    dbg_rom u_dbg_rom (
    	.clk   (clk         ),
        .rst_n (rst_n       ),
        .valid (bus.d_valid ),
        .data  (bus.d_data  )
    );
    
    /* Initialize ram with firmware */
    initial begin
        string test;
        longint handle;
        int size = 0;

        test = getenv("TEST");
        if (test.len() > 0) begin
            $display("Test: %s", test);
            `LOAD_IMG({test, ".bin"}, 0, size)
        end else begin
            `LOAD_IMG("data/head.bin", 0, size)
            `LOAD_IMG("data/virt.dtb", 'h100, size)
            `LOAD_IMG("data/fw_jump.bin", 'h2000, size)
            rom.cells['h3ff] = size;
            $display("###### ROM!!! %x, %x", cells[5], cells[6]);
        end
    end

endmodule
