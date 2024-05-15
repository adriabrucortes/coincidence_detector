module detector_top_wrapper_v #(parameter NCHAN = 4, NBITS = 10, NREGS = 1024) (
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
    
    output wire                     Restart_o,
    output wire                     Enable_o,
    output wire [NBITS-1:0]         nCycles_o,
    output wire [NBITS-1:0]         Delay_A_o,
    output wire [NBITS-1:0]         Delay_B_o,
    output wire [NBITS-1:0]         Delay_C_o,
    output wire [NBITS-1:0]         Delay_D_o,
    
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
    .Channels   (Channels),
    .Restart_i  (Restart_i),
    .Enable_i   (Enable_i),
    .nCycles_i  (nCycles_i),
    .Delay_A_i  (Delay_A_i),
    .Delay_B_i  (Delay_B_i),
    .Delay_C_i  (Delay_C_i),
    .Delay_D_i  (Delay_D_i),
    .Restart_o  (Restart_o),
    .Enable_o   (Enable_o),
    .nCycles_o  (nCycles_o),
    .Delay_A_o  (Delay_A_o),
    .Delay_B_o  (Delay_B_o),
    .Delay_C_o  (Delay_C_o),
    .Delay_D_o  (Delay_D_o),
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