module detector #(parameter NCHAN = 5, NBITS = 6, NREGS = 4) (
    input wire                  Clk, Rst_n,
    input wire [NCHAN-1:0]      Channels,
    input wire [NBITS-1:0]      Delays [NCHAN-1:0],
    output reg [NBITS-1:0]      Counts [(NCHAN*(NCHAN-1)/2)-1:0] // All possible combinations
);

reg  [NCHAN-1:0] delayed;
wire [NCHAN-1:0] Pulses; // Posedge

DelayGenerator #(
    .NCHAN(NCHAN),
    .NBITS(NBITS),
    .NREGS(NREGS)
) delay (
    .Clk            (Clk),
    .Rst_n          (Rst_n),
    .Channels       (Channels),
    .Delays         (Delays),
    .DlayChann      (delayed)
);

pos_edge_det #(
    .NCHAN(NCHAN)
) posedge_det (
    .Clk            (Clk),
    .Sig            (delayed),
    .Pe             (Pulses)
);

always @(posedge Clk or negedge Rst_n) begin

    if (!Rst_n) begin
        for (int i = 0; i < NCHAN; i++) begin
            Counts[i] <= {NBITS{1'b0}}; // Reset output to 0
        end

    end else begin

        int index = 0;

        for (int i = 0; i < NCHAN; i++) begin
            for (int j = i+1; j < NCHAN; j++) begin // Iterate over all pairs (i, j) where j > i
                Counts[index] <= Counts[i] + (Pulses[i] & Pulses[j]);
                index = index + 1;
            end
        end
    end
end

endmodule