`timescale 1ns/1ps

`include "isa.vh"
`include "crossbar/addr_space.vh"

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

    wire rxd;
    wire txd;

    reg  stall;
    reg  clear;
    reg  trap_en;
    reg  [63:0] trap_pc;
    reg  bj_en;
    reg  [63:0] bj_pc;

    wire [31:0] inst_out;
    wire [63:0] pc_out;

    logic [15:0] request;
    wire [15:0] grant;
    tilelink master[16]();
    tilelink slave[64]();

    clk_rst u_clk_rst (
        .clk   (clk   ),
        .rst_n (rst_n )
    );

    fetch fetch (
    	.clk      (clk      ),
        .rst_n    (rst_n    ),
        .stall    (stall    ),
        .clear    (clear    ),
        .trap_en  (trap_en  ),
        .trap_pc  (trap_pc  ),
        .bj_en    (bj_en    ),
        .bj_pc    (bj_pc    ),
        .inst_out (inst_out ),
        .pc_out   (pc_out   ),
        .request  (request[MASTER_IF]),
        .bus      (master[MASTER_IF])
    );
    
    crossbar u_crossbar (
    	.clk     (clk     ),
        .rst_n   (rst_n   ),
        .request (request ),
        .grant   (grant   ),
        .master  (master  ),
        .slave   (slave   )
    );

    zero_page zero_page (slave[CHIP_ZERO]);

    r_rom u_r_rom (
    	.clk    (clk    ),
        .ft_clk (ft_clk ),
        .rst_n  (rst_n  ),
        .txe_n  (txe_n  ),
        .wr_n   (wr_n   ),
        .siwu_n (siwu_n ),
        .rxf_n  (rxf_n  ),
        .oe_n   (oe_n   ),
        .rd_n   (rd_n   ),
        .adbus  (adbus  ),
        .bus    (slave[CHIP_ROM])
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

    ip_uart u_ip_uart (
    	.clk   (clk   ),
        .rst_n (rst_n ),
        .rxd   (rxd   ),
        .txd   (txd   ),
        .bus   (slave[CHIP_UART])
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

    generate
        for (genvar i = 1; i < 16; i++) begin: cycle0
            initial request[i] = `DISABLE;
        end
    endgenerate

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