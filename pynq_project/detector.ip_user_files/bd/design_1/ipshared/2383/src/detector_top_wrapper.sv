module detector_top_wrapper_sv #(parameter NCHAN = 4, NBITS = 10, NREGS = 1024) (
    input wire                      Clk, Rst_n,
    input wire                      Enable,
    input wire  [NBITS-1:0]         nCycles,
    input wire  [NCHAN-1:0]         Channels,
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

wire [NBITS-1:0]      Delays        [4-1:0];
wire [NBITS-1:0]      Counts_chann  [4-1:0];
wire [NBITS-1:0]      Counts_pairs  [6-1:0];

assign Delays = {Delay_A, Delay_B, Delay_C, Delay_D};
assign Counts_chann = {Counts_A, Counts_B, Counts_C, Counts_D};
assign Counts_pairs = {Counts_AB, Counts_AC, Counts_AD, Counts_BC, Counts_BD, Counts_CD};

detector_top #(
    .NCHAN(NCHAN),
    .NBITS(NBITS),
    .NREGS(NREGS)
) det (
    .Clk        (Clk),
    .Rst_n      (Rst_n),
    .Enable     (Enable),
    .nCycles    (nCycles),
    .Channels   (Channels),
    .Delays     (Delays),
    .Cnt_Clk    (Cnt_Clk),
    .Cnt_chann  (Counts_chann),
    .Cnt_pairs  (Counts_pairs)
);

endmodule
