module tb_detector ();

parameter CLK_HALFPERIOD = 5;
parameter NCHAN = 4;
parameter NBITS = 32;
parameter NREGS = 1024;
parameter NCOMB = NCHAN*(NCHAN-1)/2;

reg                   Clk, Rst_n, Restart, Enable;
reg  [NCHAN-1:0]      Channels;
reg  [NBITS-1:0]      Delays           [NCHAN-1:0];

reg  [NBITS-1:0]      Cnt_chann        [NCHAN-1:0];
reg  [NBITS-1:0]      Cnt_pairs        [NCOMB-1:0];
reg  [NBITS-1:0]      xpect_Cnt_pairs  [NCOMB-1:0];
reg  [NBITS-1:0]      nCycles, Cnt_Clk;

reg  [NCHAN-1:0]      dataIn;

sys_model #(
  .CLK_HALFPERIOD   (CLK_HALFPERIOD), // units depends on timescale
  .DELAY            (2)  // delay between clock posedge and check
) u_sys (
  .Clk              (Clk),
  .Rst_n            (Rst_n)
);

/*
detector #(
    .NCHAN(NCHAN),
    .NBITS(NBITS),
    .NREGS(NREGS)
) det (
    .Clk        (Clk),
    .Rst_n      (Rst_n),
    .Restart_i  (Restart),
    .Enable_i   (Enable),
    .nCycles_i  (nCycles),
    .Delays_i   (Delays),
    .Channels   (Channels),
    .Cnt_Clk    (Cnt_Clk),
    .Cnt_chann  (Cnt_chann),
    .Cnt_pairs  (Cnt_pairs)
);
*/

detector_top_wrapper_v #(
       .NCHAN(NCHAN),
       .NBITS(NBITS),
       .NREGS(NREGS)
    ) detector (
       // Input ports
       .Clk          (Clk),
       .Rst_n        (Rst_n),
       .Channels     (Channels),
       
       // Input AXIS
	   .Restart_i	 (Restart),
       .Enable_i     (Enable), // This is a 1-bit control
       .nCycles_i    (nCycles),
       .Delay_A_i    (Delays[0]),
       .Delay_B_i    (Delays[1]),
       .Delay_C_i    (Delays[2]),
       .Delay_D_i    (Delays[3]),
       .Cnt_Clk      (Cnt_Clk),
       .Counts_A     (Cnt_chann[0]),
       .Counts_B     (Cnt_chann[1]),
       .Counts_C     (Cnt_chann[2]),
       .Counts_D     (Cnt_chann[3]),
       .Counts_AB    (Cnt_pairs[0]),
       .Counts_AC    (Cnt_pairs[1]),
       .Counts_AD    (Cnt_pairs[2]),
       .Counts_BC    (Cnt_pairs[3]),
       .Counts_BD    (Cnt_pairs[4]),
       .Counts_CD    (Cnt_pairs[5])
    );

// __________________________________
// Sigs and vars init
initial begin
    Channels <= 4'b0000; // Inputs are 0 at first
    nCycles <= 10000;
    
    Restart <= 1'b1;
    Enable <= 1'b0;

    Delays <= {4'd0, 4'd0, 4'd0, 4'd5};
    Cnt_pairs <= {4'd0, 4'd0, 4'd0, 4'd0, 4'd0, 4'd0}; // 0 counts on every channel
end

initial begin
    u_sys.wait_cycles(5);
    $timeformat(-9, 2, " ns", 10);

    // Reset
    u_sys.reset(2);
    test1(50);
    u_sys.wait_cycles(30);
    test1(120);

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
        // Declarations
        automatic int expCnt;

        // Assignments
        //expectCounts <= 0;
        nCycles <= N;
        Enable = 1'b0;
        Restart = 1'b1;
        u_sys.wait_cycles(1);
        Restart = 1'b0;
        u_sys.wait_cycles(1);
        Enable = 1'b1;

        repeat(N) begin
            expCnt = 0; // Reset counter
            
            dataIn = $urandom_range(0, 2**NCHAN-1); //

            Channels <= dataIn;
            $display("[Info- %t] Input vector: %b", $time, dataIn);
            u_sys.wait_cycles(1);
        end

        Enable = 1'b0;
        Restart = 1'b1;
        u_sys.wait_cycles(1);
        Restart = 1'b0;
    end
endtask

endmodule