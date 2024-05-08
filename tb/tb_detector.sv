module tb_detector ();

parameter CLK_HALFPERIOD = 5;
parameter NCHAN = 4;
parameter NBITS = 4;
parameter NREGS = 4;
parameter NCOMB = NCHAN*(NCHAN-1)/2;

wire                  Clk, Rst_n;
reg  [NCHAN-1:0]      Channels;
reg  [NBITS-1:0]      Delays [NCHAN-1:0];

reg  [NBITS-1:0]      Counts        [NCOMB-1:0];
reg  [NBITS-1:0]      expectCounts  [NCOMB-1:0];

reg  [NCHAN-1:0]      dataIn;

sys_model #(
  .CLK_HALFPERIOD   (CLK_HALFPERIOD), // units depends on timescale
  .DELAY            (2)  // delay between clock posedge and check
) u_sys (
  .Clk              (Clk),
  .Rst_n            (Rst_n)
);

detector #(
    .NCHAN(NCHAN),
    .NBITS(NBITS),
    .NREGS(NREGS)
) det (
    .Clk        (Clk),
    .Rst_n      (Rst_n),
    .Channels   (Channels),
    .Delays     (Delays),
    .Counts     (Counts)
);

// __________________________________
// Sigs and vars init
initial begin
    Channels <= 4'b0000; // Inputs are 0 at first
    Delays   <= {4'd1, 4'd1, 4'd2, 4'd2};
    Counts   <= {4'd0, 4'd0, 4'd0, 4'd0, 4'd0, 4'd0}; // 0 counts on every channel
end

initial begin
    u_sys.wait_cycles(5);
    $timeformat(-9, 2, " ns", 10);

    // Reset
    u_sys.reset(2);
    test1(50);
    u_sys.wait_cycles(100);
    

    $stop;
end

// __________________________________
// Tasks
task test1;
    input int N;

/*
    automatic int max_delay = Delays[0];
    foreach (Delays[i]) begin
        if (Delays[i] > max_delay)
            max_delay = Delays[i];
    end
*/

    begin
        expectCounts = 0;
        automatic int expCnt;
        repeat(N) begin
            expCnt = 0; // Reset counter
            
            dataIn = $urandom_range(0, 2**NCHAN-1); //

            Channels <= dataIn;
            $display("[Info- %t] Input vector: %b", $time, dataIn);
            u_sys.wait_cycles(1);
        end
    end
endtask

endmodule