module ft232h_bridge (
    input   wire    clk,
    input   wire    rst_n,

    /* W: fifo interface */
    input   wire    empty,
    output  wire    rd_en,
    input   wire    [7:0] dout,

    input   wire    full,
    output  reg     wr_en,
    output  reg     [7:0] din,

    /* E: usb interface */
    input   wire    txe_n,
    output  reg     wr_n,

    input   wire    rxf_n,
    output  wire    oe_n,
    output  wire    rd_n,

    inout   wire    [7:0] adbus
);

    localparam S_IDLE  = 2'b00;
    localparam S_WAIT  = 2'b01;
    localparam S_READ  = 2'b10;
    localparam S_WRITE = 2'b11;

    /* Controller */
    logic [1:0] state, next_state;
    dff #(2, S_IDLE) dff_state(clk, rst_n, `DISABLE, `DISABLE,
                               next_state, state);

    assign rd_en = (state == S_WRITE) & ~empty & ~txe_n;
    assign wr_n = ~rd_en;
    assign adbus = (state == S_WRITE) ? dout : 8'bz;

    assign wr_en = (state == S_READ) & ~rxf_n;
    assign rd_n = ~wr_en;
    assign din = (state == S_READ) ? adbus : 8'bz;

    assign oe_n = ~(((state == S_WAIT) | (state == S_READ)) & ~rxf_n);

    /* State transition */
    always @(state, empty, txe_n, rxf_n) begin
        case (state)
            S_IDLE:
                next_state = ~rxf_n ? S_WAIT :
                             (~empty & ~txe_n) ? S_WRITE : S_IDLE;
            S_WAIT:
                next_state = ~rxf_n ? S_READ : S_IDLE;
            S_READ:
                next_state = rxf_n ? S_IDLE : S_READ;
            S_WRITE:
                next_state = (~txe_n | empty) ? S_IDLE : S_WRITE;
            default:
                next_state = S_IDLE;
        endcase
    end

endmodule