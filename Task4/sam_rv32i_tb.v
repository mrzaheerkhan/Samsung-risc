module sam_rv32i_tb;

reg clk, RN;
wire [31:0] WB_OUT, NPC;
sam_rv32i rv32(clk, RN, NPC, WB_OUT);

// Generate clock signal with a period of 6 time units
always #3 clk = !clk;

initial begin 
    // Initialize reset and clock
    RN  = 1'b1;
    clk = 1'b1;

    // Dump waveform for debugging
    $dumpfile("sam_rv32i.vcd"); // Generate VCD waveform file
    $dumpvars(0, sam_rv32i_tb);
  
    // Apply reset and then release
    #5 RN = 1'b0;

    // Run the simulation for 500 time units to observe results
    #5000 $finish;
end

// Monitor output changes for debugging
always @(posedge clk) begin
    $display("Time: %0t | NPC: %h | WB_OUT: %h", $time, NPC, WB_OUT);
end

endmodule



