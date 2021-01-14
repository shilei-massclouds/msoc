.PHONY: all clean verdi

VERDI_BASE = /home/cloud/synopsys/verdi_2016.06-1/share/PLI/VCS/linux64
VCS = vcs -full64 -sverilog -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed -debug_all \
		-P ${VERDI_BASE}/novas.tab ${VERDI_BASE}/pli.a

BASE = r_rom_backend
TARGET = tb_${BASE}.elf

SRC_DIR = ../../src
IP_DIR = ../../ip
SRC = tb_${BASE}.sv ${SRC_DIR}/remote_rom.sv ${SRC_DIR}/tilelink.sv \
	${SRC_DIR}/dff.sv ${IP_DIR}/ip_fifo.sv ${SRC_DIR}/ft232h_ctl.sv \
	${IP_DIR}/ip_ft232h.sv

SIM = ./${TARGET}

all:
	${VCS} +incdir+${SRC_DIR}+ +define+TEST_OBJ=${TEST_OBJ} -o ${TARGET} ${SRC}
	${SIM}

clean:
	rm -rf ./*.elf ./csrc ./*.daidir ./*.log ./simv* ./*.key ./*.fsdb ./novas.* ./verdiLog

verdi:
	verdi -sv -ssf ./${BASE}.fsdb
