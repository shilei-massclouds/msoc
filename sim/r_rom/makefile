TOP_DIR = ../..

BASE = r_rom

SRC = tb_${BASE}.sv ./stimulator.sv ${SRC_DIR}/r_rom.sv \
	${SRC_DIR}/r_rom_frontend.sv ${SRC_DIR}/tilelink.sv \
	${SRC_DIR}/dff.sv ${SRC_DIR}/clk_rst.sv ${IP_DIR}/ip_fifo.sv \
	${SRC_DIR}/ft232h_bridge.sv ${IP_DIR}/ip_ft232h.sv \
	../load.c

include ../makefile.common
