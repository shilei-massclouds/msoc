`timescale 1ns / 1ps

`include "csr_addr.vh"

module system_ctl (
    input  wire clk,
    input  wire rst_n,

    sys_ops.dst           sys_ops,
    input  wire [`XMSB:0] pc,
    input  wire [`XMSB:0] data1,
    input  wire [`XMSB:0] imm,
    input  wire           with_imm,

    output wire [`XMSB:0] csr_data,
    output wire           trap_en,
    output wire [`XMSB:0] trap_pc
);

    reg [1:0]       priv;
    bit [`XMSB:0]   csr[4096];

    wire [`XMSB:0] wdata = with_imm ? imm : data1;

    wire op_csr = sys_ops.csrrw_op |
                  sys_ops.csrrs_op |
                  sys_ops.csrrc_op;

    assign csr_data = op_csr ? csr[sys_ops.csr_addr] : 64'b0;

    assign trap_en = sys_ops.ecall_op | sys_ops.ebreak_op |
                     sys_ops.mret_op;
    assign trap_pc = {`XLEN{sys_ops.ecall_op|sys_ops.ebreak_op}} & csr[`MTVEC] |
                     {`XLEN{sys_ops.mret_op}} & csr[`MEPC];

    always @(posedge clk, negedge rst_n) begin
        if (~rst_n) begin
            priv <= `M_MODE;
            csr[`MISA] <= MISA_INIT_VAL;
        end else begin
            if (sys_ops.ecall_op | sys_ops.ebreak_op) begin
                $display($time,, "ecall/ebreak: mtvec(%x) priv(%x)",
                         csr[`MTVEC], priv);
                csr[`MEPC] <= pc;
                csr[`MCAUSE] <= 64'h08;
                csr[`MTVAL] <= 64'b0;

                csr[`MSTATUS][`MS_MPIE] <= csr[`MSTATUS][`MS_MIE];
                csr[`MSTATUS][`MS_MIE] <= `DISABLE;

                csr[`MSTATUS][`MS_MPP] <= priv;
                priv <= `M_MODE;
            end else if (sys_ops.mret_op) begin
                $display($time,, "mret: mepc(%x) mstatus(%x) priv(%x)",
                         csr[`MEPC], csr[`MSTATUS], priv);
                csr[`MSTATUS][`MS_MIE] <= csr[`MSTATUS][`MS_MPIE];
                priv <= csr[`MSTATUS][`MS_MPP];
            end else if (sys_ops.csrrw_op) begin
                $display($time,, "csrrw: (%x,%x,%x)",
                         sys_ops.csr_addr, csr[sys_ops.csr_addr], wdata);
                csr[sys_ops.csr_addr] <= wdata;
            end else if (sys_ops.csrrs_op) begin
                $display($time,, "csrrs: (%x,%x,%x)",
                         sys_ops.csr_addr, csr[sys_ops.csr_addr], wdata);
                csr[sys_ops.csr_addr] <= csr[sys_ops.csr_addr] | wdata;
            end else if (sys_ops.csrrc_op) begin
                $display($time,, "csrrc: (%x,%x,%x)",
                         sys_ops.csr_addr, csr[sys_ops.csr_addr], wdata);
                csr[sys_ops.csr_addr] <= csr[sys_ops.csr_addr] & ~wdata;
            end
        end

    end
    
endmodule
