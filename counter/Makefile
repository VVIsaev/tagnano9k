BOARD=tangnano9k
FAMILY=GW1N-9C
DEVICE=GW1NR-LV9QN88PC6/I5

all: counter.fs

# Synthesis
counter.json: counter.v counter.tcl Makefile
	yosys -c counter.tcl

# Place and Route
counter_pnr.json: counter.json
	nextpnr-gowin --json counter.json --freq 27 --write counter_pnr.json --device ${DEVICE} --family ${FAMILY} --cst ${BOARD}.cst

# Generate Bitstream
counter.fs: counter_pnr.json
	gowin_pack -d ${FAMILY} -o counter.fs counter_pnr.json

# Program Board
load: counter.fs
	openFPGALoader -b ${BOARD} counter.fs

clean:
	rm -f counter.fs counter_pnr.json counter.json

.PHONY: load clean
.INTERMEDIATE: counter_pnr.json counter.json
