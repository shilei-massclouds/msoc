module ip_fifo #(
    parameter WIDTH = 8,
    parameter DEPTH = 4
)(
    input   wire  rst,
    input   wire  wr_clk,
    input   wire  rd_clk,

    output  wire  full,
    input   wire  wr_en,
    input   wire  [(WIDTH-1):0] din,

    output  wire  empty,
    input   wire  rd_en,
    output  reg   [(WIDTH-1):0] dout
);

    localparam COUNT = 1 << DEPTH;

    reg [(WIDTH-1):0] cells[COUNT];

    reg [(DEPTH-1):0] head;
    reg [(DEPTH-1):0] tail;

    assign empty = (tail == head);
    assign full = (((tail + 1) % COUNT) == head);

    always @(posedge rst) begin
        if (rst) begin
            head <= {DEPTH{1'b0}};
            tail <= {DEPTH{1'b0}};
            dout <= {WIDTH{1'b0}};
        end
    end

    always @(posedge wr_clk, posedge rst) begin
        if (~rst & wr_en) begin
            cells[tail] <= din;
            tail <= (tail + 1) % COUNT;
        end
    end

    always @(posedge rd_clk, posedge rst) begin
        if (~rst & rd_en) begin
            dout <= cells[head];
            head <= (head + 1) % COUNT;
        end
    end

endmodule
