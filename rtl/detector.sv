module detector #(parameter NCHAN = 4, NBITS = 4) (
    // MAX regs per channel = 2^NBITS
    input wire                              Clk, Rst_n,
    input wire [NCHAN-1:0]                  Channels,
    input wire [NCHAN-1:0]                  Delays [NBITS-1:0],
    output reg [(NCHAN*(NCHAN-1)/2)-1:0]    Counts [NBITS-1:0] // All possible combinations
);

reg  [NCHAN-1:0] delayed;
wire [NCHAN-1:0] Pulses; // Posedge

DelayGenerator #(.NCHAN(NCHAN), .NBITS(NBITS)) delay (
    .Clk            (Clk),
    .Rst_n          (Rst_n),
    .Delays         (Delays),
    .DlayChann      (delayed)
);

pos_edge_det #(NCHAN) posedge_det (
    .Clk            (Clk),
    .Sig            (delayed),
    .Pe             (Pulses)
);

always @(posedge Clk or negedge Rst_n) begin

    if (!Rst_n) begin
        for (int i = 0; i < NCHAN; i++) begin
            Counts[i] <= {NBITS{1'b0}};
        end
    end
    
    else begin
        for (int i = 0; i < NCHAN; i++) begin
            for (int j = 0; ((j < NCHAN) && (j != i)); j++) begin
                Counts[i][j] <= Counts[i][j] + Pulses[i] & Pulses[j];
            end
        end
    end
end

endmodule