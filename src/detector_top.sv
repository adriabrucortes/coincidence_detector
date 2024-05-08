module detector_top #(parameter NCHAN = 6, NBITS = 4, NREGS = 3) (
    input wire                  Clk, Rst_n,
    input wire [NCHAN-1:0]      Channels,
    input wire [NBITS-1:0]      Delays [NCHAN-1:0],
    output reg [NBITS-1:0]      Counts [(NCHAN*(NCHAN-1)/2)-1:0] // All possible combinations
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

endmodule