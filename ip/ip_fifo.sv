module ip_fifo (
    input   wire  rst_n,
    input   wire  wr_clk,
    input   wire  rd_clk,

    output  wire  full,
    input   wire  wr_en,
    input   wire  [7:0] din,

    output  wire  empty,
    input   wire  rd_en,
    output  reg   [7:0] dout
);

    localparam COUNT = 8;

    reg [7:0] cells[COUNT];

    reg [2:0] head;
    reg [2:0] tail;

    assign empty = (tail == head);
    assign full = (((tail + 1) % COUNT) == head);

    always @(negedge rst_n) begin
        if (~rst_n) begin
            head <= 3'b0;
            tail <= 3'b0;
            dout <= 8'b0;
        end
    end

    always @(posedge wr_clk, negedge rst_n) begin
        if (rst_n & wr_en & ~full) begin
            cells[tail] <= din;
            tail <= (tail + 1) % COUNT;
        end
    end

    always @(posedge rd_clk, negedge rst_n) begin
        if (rst_n & rd_en & ~empty) begin
            dout <= cells[head];
            head <= (head + 1) % COUNT;
        end
    end

endmodule
