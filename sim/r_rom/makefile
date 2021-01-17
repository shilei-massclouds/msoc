TOP_DIR = ../..

BASE = r_rom

SRC = ./tb_r_rom.sv ./stimulator.sv ../load.c \
	${SRC_DIR}/r_rom/r_rom.sv ${SRC_DIR}/r_rom/r_rom_frontend.sv \
	${SRC_DIR}/r_rom/ft232h_bridge.sv \
	${IP_DIR}/ip_fifo.sv ${IP_DIR}/ip_ft232h.sv \
	${SRC_DIR}/clk_rst.sv ${SRC_DIR}/dff.sv ${SRC_DIR}/tilelink.sv

include ../makefile.common
