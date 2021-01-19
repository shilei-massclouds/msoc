`timescale 1ns/1ps

`include "isa.vh"

module tb_fetch;

    wire clk;
    wire rst_n;
    wire ft_clk;

    wire txe_n;
    wire wr_n;
    wire siwu_n;
    wire rxf_n;
    wire oe_n;
    wire rd_n;
    wire [7:0] adbus;

    reg  stall;
    reg  clear;
    reg  trap_en;
    reg  [63:0] trap_pc;
    reg  bj_en;
    reg  [63:0] bj_pc;

    wire inst_valid;
    wire inst_compressed;
    wire [31:0] inst;

    wire [63:0] pc;

    wire [31:0] inst_out;
    wire [63:0] pc_out;

    tilelink bus();

    clk_rst u_clk_rst (
        .clk   (clk   ),
        .rst_n (rst_n )
    );

    pc_ctl u_pc_ctl (
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

    stage_if_id u_stage_if_id (
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

    instcache u_instcache (
    	.clk             (clk             ),
        .rst_n           (rst_n           ),
        .pc              (pc              ),
        .inst_valid      (inst_valid      ),
        .inst_compressed (inst_compressed ),
        .inst            (inst            ),
        .request         (request         ),
        .bus             (bus)
    );

    r_rom u_r_rom (
    	.clk    (clk    ),
        .ft_clk (ft_clk ),
        .rst_n  (rst_n  ),
        .bus    (bus),
        .txe_n  (txe_n  ),
        .wr_n   (wr_n   ),
        .siwu_n (siwu_n ),
        .rxf_n  (rxf_n  ),
        .oe_n   (oe_n   ),
        .rd_n   (rd_n   ),
        .adbus  (adbus  )
    );

    ip_ft232h u_ip_ft232h (
    	.clkout (ft_clk ),
        .adbus  (adbus  ),
        .txe_n  (txe_n  ),
        .wr_n   (wr_n   ),
        .siwu_n (siwu_n ),
        .rxf_n  (rxf_n  ),
        .oe_n   (oe_n   ),
        .rd_n   (rd_n   )
    );

    initial begin
        stall = `DISABLE;
        clear = `DISABLE;
        trap_en = `DISABLE;
        trap_pc = 64'b0;
        bj_en = `DISABLE;
        bj_pc = 64'b0;

        wait (rst_n);
        $display($time,, "fetch test ...");

        #5000 $finish();
    end

    always @ (posedge clk) begin
        if (inst_out != 32'h00000001)
            $display("[%x]: %x", pc_out, inst_out);
    end

`define FSDB_DUMP
`ifdef FSDB_DUMP
    initial begin
        $fsdbDumpfile("fetch.fsdb");
        $fsdbDumpvars();
    end
`endif
    
endmodule