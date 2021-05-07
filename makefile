TOP_DIR = .
COMMON_DIR = ${TOP_DIR}/common

BASE = soc

SRC = ./soc.sv ./cpu.sv \
	  ./fetch/fetch.sv ./fetch/pc_ctl.sv ./fetch/stage_if_id.sv ./fetch/dbg_fetch.sv \
	  ./decode/decode.sv ./decode/stage_id_ex.sv \
	  ./decode/dec32.sv ./decode/dec16.sv ./decode/dec_sel.sv \
	  ./execute/execute.sv ./execute/stage_ex_ma.sv ./execute/alu.sv \
	  ./execute/jmp_br.sv ./execute/system_ctl.sv \
	  ./access/access.sv ./access/stage_ma_wb.sv \
	  ./instcache/instcache.sv ./rom/stub/rom_stub.sv ./rom/stub/dbg_rom.sv ./ram/ram.sv \
	  ./uart/stub/uart_stub.sv \
	  ./crossbar/crossbar.sv ./crossbar/arbiter.sv ./crossbar/pma.sv \
	  ./crossbar/crossbar_ctl.sv ./crossbar/crossbar_dp.sv \
	  ${COMMON_DIR}/regfile.sv \
	  ${COMMON_DIR}/clk_rst.sv ${COMMON_DIR}/dff.sv ${COMMON_DIR}/tilelink.sv \
	  ${COMMON_DIR}/zero_page.sv \
	  ${COMMON_DIR}/forward.sv \
	  ${COMMON_DIR}/alu_ops.sv ${COMMON_DIR}/io_ops.sv \
	  ${COMMON_DIR}/bj_ops.sv ${COMMON_DIR}/sys_ops.sv \
	  ${COMMON_DIR}/load.c

include ${TOP_DIR}/makefile.common
