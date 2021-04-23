`ifndef __ISA_VH__
    `define __ISA_VH__

`define DISABLE     1'b0
`define ENABLE      1'b1

`define DISABLE_N   1'b1
`define ENABLE_N    1'b0

`define LOW         1'b0
`define HIGH        1'b1

`define FALSE       1'b0
`define TRUE        1'b1

`define OP_NOP      7'b0000000
`define OP_LOAD     7'b0000011
`define OP_MISC     7'b0001111
`define OP_IMM      7'b0010011
`define OP_AUIPC    7'b0010111
`define OP_IMM_W    7'b0011011
`define OP_STORE    7'b0100011
`define OP_AMO      7'b0101111
`define OP_REG      7'b0110011
`define OP_LUI      7'b0110111
`define OP_REG_W    7'b0111011
`define OP_BRANCH   7'b1100011
`define OP_JALR     7'b1100111
`define OP_JAL      7'b1101111
`define OP_SYSTEM   7'b1110011

/* XLEN refers to the width of an X register
   in bits (32 or 64) */
`define XLEN        64
`define XMSB        (`XLEN - 1)

/* In ALU, operand extends with a bit 'CF' */
`define ALU_WIDTH   (`XLEN + 1)
`define ALU_MSB     `XLEN

`define TL_PUT_F            3'b000
`define TL_PUT_P            3'b001
`define TL_ARITH_DATA       3'b010
`define TL_LOGIC_DATA       3'b011
`define TL_GET              3'b100

`define TL_ACCESS_ACK       3'b000
`define TL_ACCESS_ACK_DATA  3'b001

`define TL_PARAM_MIN    3'b000
`define TL_PARAM_MAX    3'b001
`define TL_PARAM_MINU   3'b010
`define TL_PARAM_MAXU   3'b011
`define TL_PARAM_ADD    3'b100

`define TL_PARAM_XOR    3'b000
`define TL_PARAM_OR     3'b001
`define TL_PARAM_AND    3'b010
`define TL_PARAM_SWAP   3'b011

`endif