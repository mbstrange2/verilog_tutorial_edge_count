/**
 * This module detects counts rising edges on the 
 * input and outputs a 1 when there have been EDGES rising edges 
 * seen on the input
 *
 * There is no latency between the EDGE'th posedge and the output
 * going high.
 */
module edge_cnt
#(
    // This is a compile time parameter to just show the feature
    // This is like the genesis variables you will use in the project
    // This could definitely be an input to the module so that you could
    // change the edge detection behavior after the module has been compiler
    // Mainly here for pedagogical reasons :)
    parameter EDGES = 32
)
(
    input logic clk,
    input logic rst_n,
    input logic in,
    output logic out
);

//===== LOCAL DEFINITIONS =====//
logic [31:0] count;      // 32 bit number, so we can't support EDGES > (2^32)-1
logic [31:0] count_next;
logic in_rising_edge;
logic in_q;

//===== FLOP THE INPUT =====//
//   always @ or always_ff @ will work here...
//   always_ff just lets the tool know you intended
//   to synthesize a flip flop so that if you accidentally
//   infer a latch, it will let you know as such.
always_ff @(posedge clk, negedge rst_n) begin // always @(posedge clk, negedge rst_n)
    // asynchronous reset
    if(!rst_n) begin
        in_q <= '0;
    end
    else begin
        // 1. flop the input
        ////// BEGIN: INSERT CODE HERE //////

        ////// END:   INSERT CODE HERE //////
    end
end

//===== COMPUTE RISING EDGE + NEXT COUNT =====//
//   always @(*) and always_comb are the same ->
//   they just denote that they should be re-evaluated any time
//   a signal changes (like true combinational logic)
always_comb begin // always @(*)
    // 1. Check that incoming in is 1 and previous was 0
    // 2. Increment the count if we see a rising edge
    ////// BEGIN: INSERT CODE HERE //////

    ////// END:   INSERT CODE HERE //////
end

//===== COUNT REGISTER =====//
always_ff @(posedge clk, negedge rst_n) begin
    // Reset to all zeros (could say 32'd0, but '0 is shorthand to
    // assign a signal to all 0's)
    if(!rst_n) begin
        count <= '0;
    end  
    // We could manually reset this flop, but we allow the count to go from 
    // EDGES to 1 or 0
    else begin
        // 1. Increment count on rising edges
        // 2. Make sure to handle the count going back to 0 when it has reached
        //    its final threshold (could see a rising edge also)
        ////// BEGIN: INSERT CODE HERE //////

        ////// END:   INSERT CODE HERE //////
    end
end

//===== ASSIGN OUTPUT =====//
// assign statements represent simply passing the output of a gate
// This is STRUCTURAL

// 1. out should be high when the count == edges 
////// BEGIN: INSERT CODE HERE //////
//assign out = // output here //
////// END:   INSERT CODE HERE //////

endmodule
