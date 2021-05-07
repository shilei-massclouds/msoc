.PHONY: all clean
.SUFFIXES: .bin .elf

OBJS = calc_add.bin mem_sw_lw.bin

%.elf:%.S
	riscv64-linux-gnu-gcc -c ./$^ -o ./$@

%.bin:%.elf
	riscv64-linux-gnu-objcopy -O binary ./$^ ./$@

all:$(OBJS)

clean:
	rm -rf ./*.elf ./*.bin
