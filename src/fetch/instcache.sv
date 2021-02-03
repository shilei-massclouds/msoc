module instcache (
    input   wire    clk,
    input   wire    rst_n,

    input   wire    [63:0] pc,

    output  wire    inst_valid,
    output  wire    inst_compressed,
    output  wire    [31:0] inst,

    output  reg     request,
    tilelink.master bus
);

    /*
     * Address space of instruction is within 2^32, so only
     * low-32-bit part is valid.
     * PC := {pad(32), tag(24), index(5), offset(3)};
     */
    wire [23:0] tag    = pc[31:8];
    wire [4:0]  index  = pc[7:3];
    wire [2:0]  offset = pc[2:0];

    /*
     * Internal cache line:
     * Fields := {valid(1), tag(24), data(64)};
     */
    `define F_DATA  63:0
    `define F_TAG   87:64
    `define F_VALID 88

    localparam CACHE_WIDTH = 1 + 24 + 64;   /* bits */
    localparam CACHE_DEPTH = 32;            /* index: 2^5 */

    bit [(CACHE_WIDTH-1):0] lines[CACHE_DEPTH];
    reg [1:0]               req_bmp;
    reg [63:0]              req_addr;
    wire [63:0]             req_addr_rest;

    wire hit = lines[index][`F_VALID] & (lines[index][`F_TAG] == tag);
    wire [63:0] data = lines[index][`F_DATA];

    wire inst_of_4bytes = &(data[1:0]);
    wire crossed = inst_of_4bytes & (offset == 6);

    /* Back half of the instruction if it crosses the boundary. */
    wire [31:0] bh_pc    = {(pc[31:3] + 1), 3'b0};
    wire [23:0] bh_tag   = bh_pc[31:8];
    wire [4:0]  bh_index = bh_pc[7:3];
    wire [63:0] bh_data = lines[bh_index][`F_DATA];

    wire hit_rest = lines[bh_index][`F_VALID] &
                    (lines[bh_index][`F_TAG] == bh_tag);

    wire last_req = ^req_bmp;

    /* Output */
    assign inst_valid = (~crossed & hit) | (crossed & (hit & hit_rest));
    assign inst_compressed = ~inst_of_4bytes;
    assign inst = inst_valid ?
        (({32{~crossed}} & (data >> (offset * 8))) |
         ({32{crossed}} & {bh_data[15:0], data[63:48]})) : {16'b0, 16'b1};

    /* Controller */
    localparam S_CACHE = 2'b00;
    localparam S_ADDR  = 2'b01;
    localparam S_DATA  = 2'b10;

    logic [1:0] state, next_state;
    dff #(2, 2'b0) dff_state(clk, rst_n, `DISABLE, `DISABLE, next_state, state);

    /* State transition */
    always @(state, crossed, hit, hit_rest, bus.d_valid, last_req) begin
        case (state)
            S_CACHE: begin
                if (crossed) begin
                    if (hit & hit_rest)
                        next_state = S_CACHE;
                    else
                        next_state = S_ADDR;
                end else begin
                    if (hit)
                        next_state = S_CACHE;
                    else
                        next_state = S_ADDR;
                end
            end
            S_ADDR: begin
                if (bus.a_ready)
                    next_state = S_DATA;
                else
                    next_state = S_ADDR;
            end
            S_DATA: begin
                if (bus.d_valid & last_req)
                    next_state = S_CACHE;
                else
                    next_state = S_DATA;
            end
            default:
                next_state = S_CACHE;
        endcase
    end

    /* Operations for datapath */
    reg set_addr0;
    reg set_addr1;
    reg fillin;
    reg clr_all;
    reg clr_addr0;

    always @(state, crossed, hit, hit_rest, bus.d_valid, last_req) begin
        set_addr0 = `DISABLE;
        set_addr1 = `DISABLE;
        fillin    = `DISABLE;
        clr_all   = `DISABLE;
        clr_addr0 = `DISABLE;
        bus.d_ready = `DISABLE;

        case (state)
            S_CACHE: begin
                request = `DISABLE;
                bus.a_valid = `DISABLE;

                if (crossed) begin
                    if (~hit) set_addr0 = `ENABLE;
                    if (~hit_rest) set_addr1 = `ENABLE;
                end else if (~hit) begin
                    set_addr0 = `ENABLE;
                end
            end
            S_ADDR: begin
                request = `ENABLE;
                bus.a_valid = `ENABLE;
            end
            S_DATA: begin
                bus.a_valid = `DISABLE;

                if (bus.d_valid) begin
                    fillin = `ENABLE;
                    bus.d_ready = `ENABLE;
                    if (last_req)
                        clr_all = `ENABLE;
                    else
                        clr_addr0 = `ENABLE;
                end
            end
        endcase
    end

    /* Datapath */
    assign req_addr_rest = req_addr + 8;
    assign bus.a_address = req_bmp[0] ? req_addr :
                           req_bmp[1] ? req_addr_rest : 64'b0;
    //assign bus.d_ready = `ENABLE;
    assign bus.a_opcode = `TL_GET;
    assign bus.a_size = 3;
    assign bus.a_source = 4'b0000;
    assign bus.a_mask = 8'hFF;

    always @(posedge clk, negedge rst_n) begin

        if (~rst_n) begin
            req_addr <= 64'b0;
            req_bmp <= 2'b0;
            request <= `DISABLE;
            bus.a_valid <= `DISABLE;
            bus.d_ready <= `DISABLE;
        end else begin
            if (set_addr0 | set_addr1) begin
                req_addr <= {pc[63:3], 3'b0};
                req_bmp[0] <= set_addr0;
                req_bmp[1] <= set_addr1;
            end

            if (fillin) begin
                if (req_bmp[0]) begin
                    lines[req_addr[7:3]] <= {1'b1, req_addr[31:8], bus.d_data};
                end else if (req_bmp[1]) begin
                    lines[req_addr_rest[7:3]] <=
                        {1'b1, req_addr_rest[31:8], bus.d_data};
                end
            end

            if (clr_addr0) begin
                req_bmp[0] <= 1'b0;
            end

            if (clr_all) begin
                req_addr <= 64'b0;
                req_bmp <= 2'b0;
            end
        end
    end

endmodule
