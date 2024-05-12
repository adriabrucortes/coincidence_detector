module detector_top #(parameter NCHAN = 4, NBITS = 10, NREGS = 1024) (
    input wire                  Clk, Rst_n,
    input wire                  Enable,
    input wire [NBITS-1:0]      nCycles,
    input wire [NCHAN-1:0]      Channels,
    input wire [NBITS-1:0]      Delays       [NCHAN-1:0],
    output reg [NBITS-1:0]      Cnt_Clk,
    output reg [NBITS-1:0]      Cnt_chann    [NCHAN-1:0],
    output reg [NBITS-1:0]      Cnt_pairs    [(NCHAN*(NCHAN-1)/2)-1:0] // All possible combinations
);

detector #(
    .NCHAN(NCHAN),
    .NBITS(NBITS), // 2^NBITS >= NREGS
    .NREGS(NREGS)
) det (
    .Clk        (Clk),
    .Rst_n      (Rst_n),
    .Enable     (Enable),
    .nCycles    (nCycles),
    .Channels   (Channels),
    .Delays     (Delays),
    .Cnt_Clk    (Cnt_Clk),
    .Cnt_chann  (Cnt_chann),
    .Cnt_pairs  (Cnt_pairs)
);

endmodule