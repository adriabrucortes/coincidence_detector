module detector_top_wrapper_sv #(parameter NCHAN = 4, NBITS = 10, NREGS = 1024) (
    input wire                      Clk, Rst_n,
    input wire  [NCHAN-1:0]         Channels,

    // To be regs
    input wire                      Restart_i,
    input wire                      Enable_i,
    input wire  [NBITS-1:0]         nCycles_i,
    input wire  [NBITS-1:0]         Delay_A_i,
    input wire  [NBITS-1:0]         Delay_B_i,
    input wire  [NBITS-1:0]         Delay_C_i,
    input wire  [NBITS-1:0]         Delay_D_i,
    
    output reg                      Restart_o,
    output reg                      Enable_o,
    output reg  [NBITS-1:0]         nCycles_o,
    output reg  [NBITS-1:0]         Delay_A_o,
    output reg  [NBITS-1:0]         Delay_B_o,
    output reg  [NBITS-1:0]         Delay_C_o,
    output reg  [NBITS-1:0]         Delay_D_o,
    
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

wire [NBITS-1:0]      Delays_i      [4-1:0];
wire [NBITS-1:0]      Delays_o      [4-1:0];
wire [NBITS-1:0]      Counts_chann  [4-1:0];
wire [NBITS-1:0]      Counts_pairs  [6-1:0];

assign Delays_i = {Delay_A_i, Delay_B_i, Delay_C_i, Delay_D_i};

assign Delay_A_o = Delays_o[0];
assign Delay_B_o = Delays_o[1];
assign Delay_C_o = Delays_o[2];
assign Delay_D_o = Delays_o[3];

assign Counts_A = Counts_chann[0];
assign Counts_B = Counts_chann[1];
assign Counts_C = Counts_chann[2];
assign Counts_D = Counts_chann[3];

assign Counts_AB = Counts_pairs[0];
assign Counts_AC = Counts_pairs[1];
assign Counts_AD = Counts_pairs[2];
assign Counts_BC = Counts_pairs[3];
assign Counts_BD = Counts_pairs[4];
assign Counts_CD = Counts_pairs[5];

detector #(
    .NCHAN(NCHAN),
    .NBITS(NBITS),
    .NREGS(NREGS)
) det (
    .Clk        (Clk),
    .Rst_n      (Rst_n),
    .Channels   (Channels),
    .Restart_i  (Restart_i),
    .Enable_i   (Enable_i),
    .nCycles_i  (nCycles_i),
    .Delays_i   (Delays_i),
    .Restart_o  (Restart_o),
    .Enable_o   (Enable_o),
    .nCycles_o  (nCycles_o),
    .Delays_o   (Delays_o),
    .Cnt_Clk    (Cnt_Clk),
    .Cnt_chann  (Counts_chann),
    .Cnt_pairs  (Counts_pairs)
);

endmodule
