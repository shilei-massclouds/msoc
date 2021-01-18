`timescale 1ns/1ps

`include "isa.vh"

module tb_fetch;

    wire  clk;
    wire  rst_n;

    reg   stall;
    reg   trap_en;
    reg   [63:0] trap_pc;
    reg   bj_en;
    reg   [63:0] bj_pc;
    reg   inst_valid;
    reg   inst_compressed;

    wire  [63:0] pc;

    clk_rst u_clk_rst(
        .clk   (clk   ),
        .rst_n (rst_n )
    );

    pc_ctl u_pc_ctl(
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

    initial begin
        stall = `DISABLE;
        trap_en = `DISABLE;
        trap_pc = 64'b0;
        bj_en = `DISABLE;
        bj_pc = 64'b0;
        inst_valid = `FALSE;
        inst_compressed = `FALSE;

        wait (rst_n);

        #20 inst_valid = `TRUE;

        #20 inst_compressed = `TRUE;

        #20 inst_compressed = `FALSE;

        #20 inst_valid = `FALSE;

        #200 $finish();
    end

    always @ (posedge clk) begin
        $display("%d", pc);
    end
    
endmodule