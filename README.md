# EE271_edge_cnt
Intro Module for getting a feel for verilog

## Instructions
0. Get on the caddy systems - `ssh -Y <SUNetID>@caddy.stanford.edu`, clone this repo: `git clone https://github.com/mbstrange2/EE271_edge_cnt.git`, then activate tcsh :`tcsh`
and source the setup file in the repo `source setup_ee271.cshrc` - **YOU NEED TO BE ON THE STANFORD NETWORK FOR THIS - EITHER ON CAMPUS OR THROUGH THE VPN**
1. First off, the gold code is in `edge_cnt_gold.sv`. I implore you to try figuring it out on your own and implementing
your solution in `edge_cnt.sv` before looking at mine.  I've provided obvious places to insert code in this module with comments.
2. To run your module, you need to edit `edge_cnt_tb.sv` to instantiate your module instead of mine -> comment out `edge_cnt_gold` on line 12, and uncomment `edge_cnt` on line 13
3. You can uncomment the different `$display()` lines in `edge_cnt_tb.sv` to aid in debugging from the command line.
4. Different compile options:
    + `make compile`: simply compiles the executable `simv`
    + `make wave`: compiles the executable `simv` ready to run with waveform dumping
    + `make run`: compiles and runs the `./simv`
    + `make run_wave`: compiles and runs `./simv` and will dump a waveform to `test.vcd`
5. You can look at the waveform by running `dve` then opening the vcd with `File->Open Database`
