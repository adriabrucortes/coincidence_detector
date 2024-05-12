module detector_top_wrapper_v #(parameter NCHAN = 4, NBITS = 4, NREGS = 16) (
    input wire                      Clk, Rst_n,
    input wire                      Enable,
    input wire  [NCHAN-1:0]         Channels,

    // To be regs
    input wire  [NBITS-1:0]         nCycles,
    input wire  [NBITS-1:0]         Delay_A,
    input wire  [NBITS-1:0]         Delay_B,
    input wire  [NBITS-1:0]         Delay_C,
    input wire  [NBITS-1:0]         Delay_D,
    output wire [NBITS-1:0]         Cnt_Clk,
    output wire [NBITS-1:0]         Counts_A,
    output wire [NBITS-1:0]         Counts_B,
    output wire [NBITS-1:0]         Counts_C,
    output wire [NBITS-1:0]         Counts_D,
    output wire [NBITS-1:0]         Counts_AB,
    output wire [NBITS-1:0]         Counts_AC,
    output wire [NBITS-1:0]         Counts_AD,
    output wire [NBITS-1:0]         Counts_BC,
    output wire [NBITS-1:0]         Counts_BD,
    output wire [NBITS-1:0]         Counts_CD
);

detector_top_wrapper_sv #(
    .NCHAN(NCHAN),
    .NBITS(NBITS),
    .NREGS(NREGS)
) detector_inst (
    .Clk        (Clk),
    .Rst_n      (Rst_n),
    .Enable     (Enable),
    .nCycles    (nCycles),
    .Channels   (Channels),
    .Delay_A    (Delay_A),
    .Delay_B    (Delay_B),
    .Delay_C    (Delay_C),
    .Delay_D    (Delay_D),
    .Cnt_Clk    (Cnt_Clk),
    .Counts_A   (Counts_A),
    .Counts_B   (Counts_B),
    .Counts_C   (Counts_C),
    .Counts_D   (Counts_D),
    .Counts_AB  (Counts_AB),
    .Counts_AC  (Counts_AC),
    .Counts_AD  (Counts_AD),
    .Counts_BC  (Counts_BC),
    .Counts_BD  (Counts_BD),
    .Counts_CD  (Counts_CD)
);

endmodule