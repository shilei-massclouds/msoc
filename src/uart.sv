module uart (
    input   wire    clk,
    input   wire    rst_n,

    input   wire    [7:0] data,
    input   wire    valid,
    output  wire    ack,

    input   wire    rxd,
    output  wire    txd
);

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
        .s_axi_awvalid(valid),
        .s_axi_awready(awready),
        .s_axi_wdata({24'b0, data}),
        .s_axi_wstrb(4'b0),
        .s_axi_wvalid(valid),
        .s_axi_wready(wready),
        .s_axi_bresp(bresp),
        .s_axi_bvalid(ack),
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

endmodule
