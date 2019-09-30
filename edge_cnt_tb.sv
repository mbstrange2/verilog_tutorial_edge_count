// Testbench for edge_cnt module
module edge_cnt_tb();
   
    // Define parameter and inputs/outputs of DUT (device under test) 
    localparam EDGES = 10;
    logic clk;
    logic rst_n;
    logic in;
    logic out;
    
    // Instantiate DUT - use gold for my version, other for yours
    edge_cnt_gold 
    //edge_cnt
    #(
        .EDGES(EDGES)
    )
    dut
    (
        .clk(clk),
        .rst_n(rst_n),
        .in(in),
        .out(out)
    );

    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end

    // For loop signal
    integer i;
    // Used to track the behavior of the module at a tb level
    integer edge_cnt;
    logic in_prev;

// For tb
initial begin
    // reset sequence
    rst_n = 1;
    in = 0;
    @(negedge clk);
    rst_n = 0;
    @(negedge clk);
    rst_n = 1;
    edge_cnt = 0;
    in_prev = 0;
    in = 0;
    // Now do a ton of iterations, checking the results
    // It may be helpful to uncomment some of these displays 
    // for debbugging purposes
    for(i = 0; i < 100; i++) begin
        @(posedge clk);
        //$display("IN WAS: %b, IN IS NOW: %b", in_prev, in);
        if((in == 1) && (in_prev == 0)) begin
            edge_cnt++;
            $display("DETECTED POSEDGE ON IN");
            //$display("EDGE COUNT NOW: %d", edge_cnt);
            if(edge_cnt == EDGES) begin
                $display("OUT SHOULD BE 1: out: %b", out);
                edge_cnt = 0;
                if(out == 0) begin
                    $display("ASSERTION FAILED! Quitting...");
                    $finish;
                end
            end
        end
        in_prev = in;
        @(negedge clk)
        // Generate random next input
        in = $random % 2;
    end
    // If you make it here, it's safe to say you're good.
    $display("PASSED!");
    $finish;
end

endmodule
