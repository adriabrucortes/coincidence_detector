module DelayGenerator #(parameter NCHAN = 4, NBITS = 4, NREGS = 8) (
	input wire              Clk, Rst_n,
    input wire [NCHAN-1:0]  Channels,
    input wire [NBITS-1:0]  Delays [NCHAN-1:0], // 2^NBITS = NREGS
    output reg [NCHAN-1:0]  DlayChann
);

reg [NREGS-1:0] delayRegs [NCHAN-1:0]; // NCHAN registers for every Channel

// Delay
always @(posedge Clk or negedge Rst_n) begin

    if (!Rst_n) begin
        for (int i = 0; i < NCHAN; i++) 
            delayRegs[i] <= {NREGS{1'b0}};

    end else begin
        for (int i = 0; i < NCHAN; i++) begin  // Put regs for every channel

            int j;
            for (j = 0; j < Delays[i]; j++) begin
                delayRegs[i] <= {delayRegs[i], Channels[i]};
            end

            DlayChann[i] <= delayRegs[i][j];
        end
    end
end

endmodule