TOP_DIR = ../..

BASE = fetch

SRC = ./tb_fetch.sv ../load.c \
	${SRC_DIR}/clk_rst.sv ${SRC_DIR}/dff.sv ${SRC_DIR}/tilelink.sv \
	${IP_DIR}/ip_fifo.sv ${IP_DIR}/ip_ft232h.sv \
	${SRC_DIR}/fetch/pc_ctl.sv ${SRC_DIR}/fetch/stage_if_id.sv \
	${SRC_DIR}/fetch/instcache.sv \
	${SRC_DIR}/r_rom/r_rom.sv ${SRC_DIR}/r_rom/r_rom_frontend.sv \
	${SRC_DIR}/r_rom/ft232h_bridge.sv

include ../makefile.common
