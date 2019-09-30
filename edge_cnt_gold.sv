/**
 * This module detects counts rising edges on the 
 * input and outputs a 1 when there have been EDGES rising edges 
 * seen on the input
 */
module edge_cnt_gold
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
    // flop the input
    else begin
        in_q <= in;
    end
end

//===== COMPUTE RISING EDGE + NEXT COUNT =====//
//   always @(*) and always_comb are the same ->
//   they just denote that they should be re-evaluated any time
//   a signal changes (like true combinational logic)
always_comb begin // always @(*)
    // Check that incoming is 1 and past was 0
    in_rising_edge = in & ~in_q;
    // Increment the count if we see a rising edge
    count_next = in_rising_edge ? count + 1 : count;
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
        count <= (count == EDGES) ? in_rising_edge : count_next;
    end
end

//===== ASSIGN OUTPUT =====//
// assign statements represent simply passing the output of a gate
// This is STRUCTURAL
assign out = (count_next == EDGES);

endmodule
