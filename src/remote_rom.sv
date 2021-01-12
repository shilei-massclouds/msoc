module remote_rom (
    input   wire    clk,
    input   wire    rst_n,

    tilelink.slave  bus,

    /* FT232H interface */
    input   wire    ft_clk,

    input   wire    txe_n,
    output  wire    wr_n,
    output  wire    siwu_n,
    input   wire    rxf_n,
    output  wire    oe_n,
    output  wire    rd_n,

    inout wire [7:0] adbus,
);

    localparam S_IDLE = 3'b000;
    localparam S_ADDR = 3'b001;
    localparam S_DATA = 3'b010;
    localparam S_WAIT = 3'b011;
    localparam S_DONE = 3'b100;

    bit [2:0]   addr_off;
    bit [63:0]  addr_buf;

    bit [2:0]   data_off;
    bit [63:0]  data_buf;

    logic full;
    logic wr_en;
    logic [7:0] din;

    logic empty;
    logic rd_en;
    logic [7:0] dout;

    /* Controller */
    logic state, next_state;
    dff #(3, 3'b0) dff_state(clk, rst_n, `DISABLE, `DISABLE, next_state, state);

    /* State transition */
    always @(state, bus.a_valid, bus.d_ready, empty, addr_off, data_off) begin
        case (state)
            S_IDLE:
                next_state = bus.a_valid ? S_ADDR : S_IDLE;
            S_ADDR:
                next_state = &addr_off ? S_DATA : S_ADDR;
            S_DATA:
                next_state = ~empty ? S_WAIT : S_DATA;
            S_WAIT:
                next_state = &data_off ? S_DONE : S_DATA;
            S_DONE:
                next_state = bus.d_ready ? S_IDLE : S_DONE;
            default:
                next_state = S_IDLE;
        endcase
    end

    /* Output operations */
    reg save_addr = `DISABLE;
    reg send_byte = `DISABLE;
    reg req_byte = `DISABLE;
    reg fill_byte = `DISABLE;
    reg reply_data = `DISABLE;

    always @(state, bus.a_valid, bus.d_ready, empty, addr_off, data_off) begin

        save_addr = `DISABLE;
        send_byte = `DISABLE;
        req_byte = `DISABLE;
        fill_byte = `DISABLE;
        reply_data = `DISABLE;

        case (state)
            S_IDLE:
                if (bus.a_valid) save_addr = `ENABLE;
            S_ADDR:
                send_byte = `ENABLE;
            S_DATA:
                if (~empty) req_byte = `ENABLE;
            S_WAIT:
                fill_byte = `ENABLE;
                if (&data_off) reply_data = `ENABLE;
            S_DONE:
            default:
        endcase
    end

    /* Datapath */
    /* Todo: bus.a_corrupt means lr or sc */
    assign bus.a_ready = `ENABLE;
    assign siwu_n = 1'b1;
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            bus.d_valid <= `DISABLE;
            bus.d_data <= 64'b0;
        end else begin
            bus.d_valid <= `DISABLE;
            bus.d_data <= 64'b0;
            bus.d_denied <= `DISABLE;

            if (save_addr) begin
                addr_buf <= bus.a_address;
                addr_off <= 3'b0;
            end

            if (send_byte) begin
                din <= addr_buf[7:0];
                addr_buf <= {8'b0, addr_buf[63:8]};
                addr_off <= addr_off + 3'b1;
                wr_en <= 1'b1;
            end

            if (req_byte) begin
                rd_en <= 1'b1;
            end

            if (fill_byte) begin
                data_buf <= {dout, data_buf[63:8]};
            end

            if (reply_data) begin
                bus.d_data <= data_buf;
                bus.d_valid <= `ENABLE;
                bus.d_denied <= `ENABLE;
                bus.d_size <= bus.a_size;
                bus.d_source <= bus.a_source;
                bus.d_opcode <= `TL_ACCESS_ACK_DATA;
            end
        end
    end

    logic send_empty;
    logic send_rd_en;
    logic [7:0] send_dout;
    logic recv_full;
    logic recv_wr_en;
    logic [7:0] recv_din;

    ip_fifo send_fifo(
        .rst(~rst_n),
        .wr_clk(clk),
        .rd_clk(ft_clk),
        .full(full),
        .wr_en(wr_en),
        .din(din),
        .empty(send_empty),
        .rd_en(send_rd_en),
        .dout(send_dout)
    );

    ip_fifo recv_fifo(
        .rst(~rst_n),
        .wr_clk(ft_clk),
        .rd_clk(clk),
        .full(recv_full),
        .wr_en(recv_wr_en),
        .din(recv_din),
        .empty(empty),
        .rd_en(rd_en),
        .dout(dout)
    );

    assign send_rd_en = (~send_empty) & (~txe_n);
    assign wr_n = send_rd_en;
    assign adbus = send_dout;

    assign oe_n = rxf_n;
    assign rd_n = recv_full;
    assign recv_wr_en = ~rd_n;
    assign recv_din = adbus;

endmodule
