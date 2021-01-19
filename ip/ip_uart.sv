`include "isa.vh"

module ip_uart (
    input   wire    clk,
    input   wire    rst_n,

    tilelink.slave  bus,

    input   wire    rxd,
    output  wire    txd
);

`ifdef SIM_IP_UART

    localparam UART_RBR = 0; /* In:  Recieve Buffer Register */
    localparam UART_THR = 0; /* Out: Transmitter Holding Register */
    localparam UART_DLL = 0; /* Out: Divisor Latch Low */
    localparam UART_IER = 1; /* I/O: Interrupt Enable Register */
    localparam UART_DLM = 1; /* Out: Divisor Latch High */
    localparam UART_FCR = 2; /* Out: FIFO Control Register */
    localparam UART_IIR = 2; /* I/O: Interrupt Identification Register */
    localparam UART_LCR = 3; /* Out: Line Control Register */
    localparam UART_MCR = 4; /* Out: Modem Control Register */
    localparam UART_LSR = 5; /* In:  Line Status Register */
    localparam UART_MSR = 6; /* In:  Modem Status Register */
    localparam UART_SCR = 7; /* I/O: Scratch Register */

    localparam UART_LSR_THRE = 8'b00100000; /* Transmit-hold-register empty */
    localparam UART_LSR_TEMT = 8'b01000000; /* Transmitter empty */

    localparam S_IDLE = 1'b0;
    localparam S_BUSY = 1'b1;

    /* Datapath: Internal cells */
    bit [7:0] cells['h100];

    /* Controller */
    logic state, next_state;
    dff dff_state (clk, rst_n, `DISABLE, `DISABLE, next_state, state);

    assign txd = `HIGH;

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

    always @(state, bus.a_valid, bus.d_ready) begin
        op_data = `DISABLE;
        case (state)
            S_IDLE:
                if (bus.a_valid) op_data = `ENABLE;
            S_BUSY:
                op_data = `DISABLE;
        endcase
    end

    /* Datapath */
    assign bus.a_ready = `ENABLE;
    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            cells[UART_LSR] <= UART_LSR_THRE | UART_LSR_TEMT;
            bus.d_valid <= `DISABLE;
            bus.d_data <= 64'b0;
        end else begin
            bus.d_valid <= `DISABLE;
            bus.d_data <= 64'b0;
            bus.d_denied <= `DISABLE;

            if (op_data) begin
                bus.d_size <= bus.a_size;
                bus.d_source <= bus.a_source;
                if (bus.a_opcode == `TL_PUT_F) begin
                    $display($time,, "UART(w) [%x]: %x;",
                             bus.a_address, bus.a_data);
                    cells[bus.a_address] <= bus.a_data;
                    bus.d_opcode <= `TL_ACCESS_ACK;
                end else if (bus.a_opcode == `TL_GET) begin
                    $display($time,, "UART(r) [%x]: %x;",
                             bus.a_address, cells[bus.a_address]);
                    bus.d_data <= cells[bus.a_address];
                    bus.d_opcode <= `TL_ACCESS_ACK_DATA;
                end
                bus.d_valid <= `ENABLE;
                bus.d_denied <= `ENABLE;
            end
        end
    end

`else   /* REAL IP_UART */

    localparam REG_RX_FIFO = 4'h0;
    localparam REG_TX_FIFO = 4'h4;

    wire interrupt;
    wire awready;
    wire arready;
    wire wready;
    wire rvalid;

    wire [31:0] rdata;
    wire [1:0]  rresp;
    wire [1:0]  bresp;

    uartlite uartlite (
        .s_axi_aclk(clk),
        .s_axi_aresetn(rst_n),
        .interrupt(interrupt),
        .s_axi_awaddr(REG_TX_FIFO),
        .s_axi_awvalid(bus.a_valid),
        .s_axi_awready(awready),
        .s_axi_wdata(bus.a_data[31:0]),
        .s_axi_wstrb(4'b0),
        .s_axi_wvalid(bus.a_valid),
        .s_axi_wready(wready),
        .s_axi_bresp(bresp),
        .s_axi_bvalid(bus.d_valid),
        .s_axi_bready(1'b1),
        .s_axi_araddr(REG_RX_FIFO),
        .s_axi_arvalid(1'b0),
        .s_axi_arready(arready),
        .s_axi_rdata(rdata),
        .s_axi_rresp(rresp),
        .s_axi_rvalid(rvalid),
        .s_axi_rready(1'b0),
        .rx(rxd),
        .tx(txd)
    );

`endif  /* IP_UART */

endmodule
