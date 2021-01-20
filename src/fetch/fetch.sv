module fetch (
    input   wire    clk,
    output  wire    rst_n,

    input   wire    stall,
    input   wire    clear,

    input   wire    trap_en,
    input   wire    [63:0] trap_pc,
    input   wire    bj_en,
    input   wire    [63:0] bj_pc,

    output  wire    [31:0] inst_out,
    output  wire    [63:0] pc_out,

    output  wire    request,
    tilelink.master bus
);

    wire [63:0] pc;
    wire inst_valid;
    wire inst_compressed;
    wire [31:0] inst;

    pc_ctl pc_ctl (
        .clk             (clk             ),
        .rst_n           (rst_n           ),
        .stall           (stall           ),
        .trap_en         (trap_en         ),
        .trap_pc         (trap_pc         ),
        .bj_en           (bj_en           ),
        .bj_pc           (bj_pc           ),
        .inst_valid      (inst_valid      ),
        .inst_compressed (inst_compressed ),
        .pc              (pc              )
    );

    stage_if_id stage_if_id (
    	.clk      (clk      ),
        .rst_n    (rst_n    ),
        .clear    (clear    ),
        .stall    (stall    ),
        .bj_en    (bj_en    ),
        .trap_en  (trap_en  ),
        .inst_in  (inst     ),
        .pc_in    (pc       ),
        .inst_out (inst_out ),
        .pc_out   (pc_out   )
    );

    instcache instcache (
    	.clk             (clk               ),
        .rst_n           (rst_n             ),
        .pc              (pc                ),
        .inst_valid      (inst_valid        ),
        .inst_compressed (inst_compressed   ),
        .inst            (inst              ),
        .request         (request           ),
        .bus             (bus               )
    );
    
endmodule
