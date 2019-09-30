compile:
	vcs -full64 -sverilog -top edge_cnt_tb -f vlog.vf

run: 
	$(MAKE) compile
	./simv

wave:
	vcs -full64 -sverilog -top edge_cnt_tb +vcs+dumpvars+test.vcd -f vlog.vf

run_wave: 
	$(MAKE) wave
	./simv

clean:
	rm ./simv

