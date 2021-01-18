module instcache (
    input   wire    clk,
    input   wire    rst_n,

    input   wire    [63:0] pc,

    output  wire    inst_valid,
    output  wire    inst_compressed,
    output  wire    [31:0] inst,

    output  wire    request,
    tilelink.master bus
);

    /* Internal cache line */
    reg [15:0]  line_data0[8];
    reg [59:0]  line_tag0;
    reg [3:0]   line_offset0;
    reg         line_flying0;

    reg [15:0]  line_data1[8];
    reg [59:0]  line_tag1;
    reg [3:0]   line_offset1;
    reg         line_flying1;

    /* Input */
    wire [59:0] row = addr[63:4];
    wire [2:0] col = addr[3:1];
    wire last_col = &col;

    /* Intermedium */
    wire hit0 = line_offset0[3] & (row == line_tag0);
    wire hit1 = line_offset1[3] & (row == line_tag1);

    wire hit_next0 = line_offset0[3] & ((row + 1) == line_tag0);
    wire hit_next1 = line_offset1[3] & ((row + 1) == line_tag1);

    /* Feedback */
    wire [3:0] next_line_offset0 = line_offset0 + 4;
    wire [3:0] next_line_offset1 = line_offset1 + 4;

    /* Output */
    wire inst_compressed0 = ~(&(line_data0[col][1:0]));
    wire inst_compressed1 = ~(&(line_data1[col][1:0]));
    assign inst_compressed = (hit0 & inst_compressed0) |
                             (hit1 & inst_compressed1);

    wire [31:0] data0 = inst_compressed0 ?
        line_data0[col] : {line_data0[col + 1], line_data0[col]};
    wire [31:0] data1 = inst_compressed1 ?
        line_data1[col] : {line_data1[col + 1], line_data1[col]};

    wire partial0 = last_col & hit0 & ~inst_compressed0;
    wire partial1 = last_col & hit1 & ~inst_compressed1;
    wire partial = partial0 | partial1;

    assign inst_valid = (~partial & (hit0 | hit1)) |
        (partial0 & hit_next1) | (partial1 & hit_next0);
    assign inst = inst_valid ?
        (({32{hit0 & ~partial0}} & data0) | ({32{hit1 & ~partial1}} & data1) |
         ({32{partial0 & hit_next1}} & {line_data1[0], line_data0[7]}) |
         ({32{partial1 & hit_next0}} & {line_data0[0], line_data1[7]})) : {16'b0, 16'b1};

    /* Controller */
    localparam S_CACHING = 2'b00;
    localparam S_PARTIAL = 2'b01;
    localparam S_FILLING = 2'b10;

    logic [1:0] state, next_state;
    dff #(2, 2'b0) dff_state(clk, reset, `DISABLE, `DISABLE, next_state, state);

    /* State transition */
    always @(reset, state, addr, bus.d_valid,
             partial0, partial1, line_flying0, line_flying1,
             hit_next0, hit_next1, hit0, hit1,
             next_line_offset0, next_line_offset1) begin
        case (state)
            S_CACHING: begin
                if ((partial0 & ~hit_next1) | (partial1 & ~hit_next0))
                    next_state = S_PARTIAL;
                else if (~hit0 & ~hit1)
                    next_state = S_FILLING;
                else
                    next_state = S_CACHING;
            end
            S_PARTIAL: begin
                if ((partial0 & hit_next1) | (partial1 & hit_next0) |
                    (~hit0 & ~hit1))
                    next_state = S_CACHING;
                else
                    next_state = S_FILLING;
            end
            S_FILLING: begin
                if (bus.d_valid &
                    ((line_flying0 & next_line_offset0[3]) |
                     (line_flying1 & next_line_offset1[3])))
                     next_state = S_CACHING;
                else
                     next_state = S_FILLING;
            end
            default:
                next_state = S_CACHING;
        endcase
    end

    /* Operations for datapath */
    reg op_invalid0, op_invalid1;
    reg op_base0, op_base1;
    reg op_request, op_fillin, op_reset;
    always @(reset, state, addr, bus.d_valid,
             partial0, partial1, line_flying0, line_flying1,
             hit_next0, hit_next1, hit0, hit1,
             next_line_offset0, next_line_offset1) begin
        op_invalid0 = `DISABLE;
        op_invalid1 = `DISABLE;
        op_base0 = `FALSE;
        op_base1 = `FALSE;
        op_request = `DISABLE;
        op_fillin = `DISABLE;
        op_reset = `DISABLE;

        case (state)
            S_CACHING: begin
                if (~partial)
                    if (~hit0 & ~hit1) begin
                        if (hit_next0) begin
                            op_invalid1 = `ENABLE;
                            op_base1 = `TRUE;
                        end
                        else begin
                            op_invalid0 = `ENABLE;
                            op_base0 = `TRUE;
                        end
                    end
            end
            S_PARTIAL: begin
                if (partial0 & ~hit_next1) begin
                    op_invalid1 = `ENABLE;
                    op_base1 = `FALSE;
                end

                if (partial1 & ~hit_next0) begin
                    op_invalid0 = `ENABLE;
                    op_base0 = `FALSE;
                end
            end
            S_FILLING: begin
                if (bus.d_valid) begin
                    op_fillin = `ENABLE;

                    if ((line_flying0 & next_line_offset0[3]) |
                        (line_flying1 & next_line_offset1[3]))
                        op_reset = `ENABLE;
                    else
                        op_request = `ENABLE;
                end
            end
            default: begin
                op_invalid0 = `DISABLE;
                op_invalid1 = `DISABLE;
                op_base0 = `FALSE;
                op_base1 = `FALSE;
                op_request = `DISABLE;
                op_fillin = `DISABLE;
                op_reset = `DISABLE;
            end
        endcase
    end

    /* Datapath */
    assign bus.d_ready = `ENABLE;
    assign bus.a_opcode = `TL_GET;
    assign bus.a_size = 3;
    assign bus.a_source = 4'b0000;
    assign bus.a_mask = 8'hFF;
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            line_tag0 <= 60'b0;
            line_offset0 <= 4'b0;
            line_flying0 <= 1'b0;
            line_tag1 <= 60'b0;
            line_offset1 <= 4'b0;
            line_flying1 <= 1'b0;
            bus.a_valid <= `DISABLE;
            request <= `DISABLE;
        end
        
        if (op_invalid0) begin
            line_tag0 <= (op_base0 ? row : row+1);
            line_offset0 <= 4'b0;
            line_flying0 <= 1'b1;
            bus.a_address <= {(op_base0 ? row : row+1), 4'b0};
            bus.a_valid <= `ENABLE;
            request <= `ENABLE;
        end

        if (op_invalid1) begin
            line_tag1 <= (op_base1 ? row : row+1);
            line_offset1 <= 4'b0;
            line_flying1 <= 1'b1;
            bus.a_address <= {(op_base1 ? row : row+1), 4'b0};
            bus.a_valid <= `ENABLE;
            request <= `ENABLE;
        end

        if (op_request) begin
            if (line_flying0)
                bus.a_address <= {line_tag0, 4'b1000};
            else
                bus.a_address <= {line_tag1, 4'b1000};

            bus.a_valid <= `ENABLE;
        end

        if (op_fillin) begin
            if (line_flying0) begin
                {line_data0[line_offset0+3], line_data0[line_offset0+2],
                 line_data0[line_offset0+1], line_data0[line_offset0]}
                    <= bus.d_data;
                line_offset0 <= next_line_offset0;
                if (next_line_offset0[3]) line_flying0 <= 1'b0;
            end
            else if (line_flying1) begin
                {line_data1[line_offset1+3], line_data1[line_offset1+2],
                 line_data1[line_offset1+1], line_data1[line_offset1]}
                    <= bus.d_data;
                line_offset1 <= next_line_offset1;
                if (next_line_offset1[3]) line_flying1 <= 1'b0;
            end
        end

        if (op_reset) begin
            bus.a_valid <= `DISABLE;
            request <= `DISABLE;
        end

    end
endmodule
