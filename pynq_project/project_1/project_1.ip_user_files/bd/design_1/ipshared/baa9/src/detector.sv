module detector #(parameter NCHAN = 4, NBITS = 4, NREGS = 2) (
    input wire                  Clk, Rst_n,
    input wire                  Enable,
    input wire [NBITS-1:0]      nCycles,
    input wire [NCHAN-1:0]      Channels,
    input wire [NBITS-1:0]      Delays       [NCHAN-1:0],
    output reg [NBITS-1:0]      Cnt_Clk,
    output reg [NBITS-1:0]      Cnt_chann    [NCHAN-1:0],
    output reg [NBITS-1:0]      Cnt_pairs    [(NCHAN*(NCHAN-1)/2)-1:0] // All possible combinations
          
);

reg  [(NCHAN*(NCHAN-1)/2)-1:0] iCnt_pairs;
reg  [NCHAN-1:0] delayed;
wire [NCHAN-1:0] Pulses; // Posedge

DelayGenerator #(
    .NCHAN(NCHAN),
    .NBITS(NBITS), // 2^NBITS >= NREGS
    .NREGS(NREGS)
) delay (
    .Clk            (Clk),
    .Rst_n          (Rst_n),
    .Channels       (Pulses),
    .Delays         (Delays),
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
always @(posedge Clk or negedge Rst_n) begin

    if (!Rst_n) begin
        Cnt_Clk <= {NBITS{1'b0}};

    end else if ((Enable) && (Cnt_Clk < nCycles)) begin
        Cnt_Clk <= Cnt_Clk + 1'b1;

    end else begin
        Cnt_Clk <= Cnt_Clk;
    end
end

// Channel counter
always @(posedge Clk or negedge Rst_n) begin
    if (!Rst_n) begin
        for (int i = 0; i < NCHAN; i++) begin
            Cnt_chann[i] <= {NBITS{1'b0}};
        end

    end else if ((Enable) && (Cnt_Clk < nCycles)) begin
        // Counts per channel
        for (int i = 0; i < NCHAN; i++) begin
            Cnt_chann[i] <= Cnt_chann[i] + Channels[i];
        end
    
    end else begin
        Cnt_chann <= Cnt_chann;
    end
end

// Coincidence counter
always @(posedge Clk or negedge Rst_n) begin

    if (!Rst_n) begin
        for (int i = 0; i < (NCHAN*(NCHAN-1)/2); i++) begin
            Cnt_pairs[i] <= {NBITS{1'b0}}; // Reset output to 0
            iCnt_pairs[i] <= 1'b0;
        end

    end else if ((Enable) && (Cnt_Clk < nCycles)) begin

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