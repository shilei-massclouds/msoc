module ip_ft232h (
    output  wire  clkout,

    inout   wire  [7:0] adbus,

    output  wire  txe,
    input   wire  wr,
    input   wire  siwu,

    output  wire  rxf,
    input   wire  oe,
    input   wire  rd
);

    localparam DEPTH = 4;
    localparam COUNT = 1 << DEPTH;

    bit clk;
    bit [7:0] cells[COUNT];
    bit [7:0] buff;

    bit [(DEPTH-1):0] head;
    bit [(DEPTH-1):0] tail;

    assign clkout = clk;
    assign txe = (((tail + 1) % COUNT) != head);
    assign rxf = (tail != head);
    assign adbus = rxf ? buff : 8'hFF;

    always #8 clk = ~clk;

    always @(posedge clk) begin
        buff <= 0xFF;

        if (wr) begin
            cells[tail] <= adbus;
            tail <= (tail + 1) % COUNT;
        end else if (rd) begin
            buff <= cells[head];
            head <= (head + 1) % COUNT;
        end else begin
        end
    end

endmodule
