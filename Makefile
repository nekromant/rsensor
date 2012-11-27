
all: rsensor

rsensor: rsensor.vvp
	@./rsensor.vvp

top_rsensor.v=tb_rsensor

%.vvp: %.v tb_%.v
	@iverilog -o$(@) $^ -s$($(addprefix top_,$<))  

clean: 
	rm *.vvp *.vcd *~
