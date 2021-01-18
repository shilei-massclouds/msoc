module pc_ctl (
    input   wire    clk,
    input   wire    rst_n,

    input   wire    stall,
    input   wire    trap_en,
    input   wire    [63:0] trap_pc,
    input   wire    bj_en,
    input   wire    [63:0] bj_pc,

    input   wire    inst_valid,
    input   wire    inst_compressed,

    output  wire    [63:0] pc
);

    reg [63:0] last_pc;

    assign pc = trap_en ? trap_pc :
                bj_en ? bj_pc :
                (stall | ~inst_valid) ? last_pc :
                (inst_compressed ? last_pc+2 : last_pc+4);

    always @ (posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            last_pc <= 64'h1000;
        end else begin
            last_pc <= pc;
        end
    end

endmodule
