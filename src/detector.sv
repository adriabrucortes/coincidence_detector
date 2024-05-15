module detector #(parameter NCHAN = 4, NBITS = 4, NREGS = 2) (
    input wire                  Clk, Rst_n,

    input wire                  Restart_i, 
    input wire                  Enable_i,
    input wire [NBITS-1:0]      nCycles_i,
    input wire [NBITS-1:0]      Delays_i     [NCHAN-1:0],
    
    output reg                  Restart_o,
    output reg                  Enable_o,
    output reg [NBITS-1:0]      nCycles_o,
    output reg [NBITS-1:0]      Delays_o     [NCHAN-1:0],
    
    input wire [NCHAN-1:0]      Channels,
    
    output reg [NBITS-1:0]      Cnt_Clk,
    output reg [NBITS-1:0]      Cnt_chann    [NCHAN-1:0],
    output reg [NBITS-1:0]      Cnt_pairs    [(NCHAN*(NCHAN-1)/2)-1:0] // All possible combinations
          
);

wire Reset_n;

reg  [(NCHAN*(NCHAN-1)/2)-1:0] iCnt_pairs;
reg  [NCHAN-1:0] delayed;
wire [NCHAN-1:0] Pulses; // Posedge

assign Reset_n = Rst_n && !Restart_i;

always @(posedge Clk) begin
    Enable_o <= Enable_i;
    nCycles_o <= nCycles_i;
    Delays_o <= Delays_i;
    Restart_o <= Restart_i;
end

DelayGenerator #(
    .NCHAN(NCHAN),
    .NBITS(NBITS), // 2^NBITS >= NREGS
    .NREGS(NREGS)
) delay (
    .Clk            (Clk),
    .Rst_n          (Reset_n),
    .Channels       (Pulses),
    .Delays         (Delays_i),
    .DlayChann      (delayed)
);

pos_edge_det #(
    .NCHAN(NCHAN)
) posedge_det (
    .Clk            (Clk),
    .Sig            (Channels),
    .Pe             (Pulses)
);

// Clk counter control
always @(posedge Clk or negedge Reset_n) begin

    if (!Reset_n) begin
        Cnt_Clk <= {NBITS{1'b0}};

    end else if ((Enable_i) && (Cnt_Clk < nCycles_i)) begin
        Cnt_Clk <= Cnt_Clk + 1'b1;

    end else begin
        Cnt_Clk <= Cnt_Clk;
    end
end

// Channel counter
always @(posedge Clk or negedge Reset_n) begin
    if (!Reset_n) begin
        for (int i = 0; i < NCHAN; i++) begin
            Cnt_chann[i] <= {NBITS{1'b0}};
        end

    end else if ((Enable_i) && (Cnt_Clk < nCycles_i)) begin
        // Counts per channel
        for (int i = 0; i < NCHAN; i++) begin
            Cnt_chann[i] <= Cnt_chann[i] + delayed[i]; // THIS IS DIFFERENT
        end
    
    end else begin
        Cnt_chann <= Cnt_chann;
    end
end

// Coincidence counter
always @(posedge Clk or negedge Reset_n) begin

    if (!Reset_n) begin
        for (int i = 0; i < (NCHAN*(NCHAN-1)/2); i++) begin
            Cnt_pairs[i] <= {NBITS{1'b0}}; // Reset output to 0
            iCnt_pairs[i] <= 1'b0;
        end

    end else if ((Enable_i) && (Cnt_Clk < nCycles_i)) begin

        automatic int index = 0;

        for (int i = 0; i < NCHAN; i++) begin
            for (int j = i+1; j < NCHAN; j++) begin // Iterate over all pairs (i, j) where j > i
                iCnt_pairs[index] <= delayed[i] & delayed[j]; // Cnt_pairs in this clock
                Cnt_pairs[index] <= Cnt_pairs[index] + (delayed[i] & delayed[j]); // Accumulated counts
                index = index + 1;
            end
        end

    end else begin
        iCnt_pairs <= iCnt_pairs;
        Cnt_pairs <= Cnt_pairs;

    end
end

endmodule