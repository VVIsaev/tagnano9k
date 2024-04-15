yosys read_verilog counter.v
yosys synth_gowin -top counter -json counter.json
