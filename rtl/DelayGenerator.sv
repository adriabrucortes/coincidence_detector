module DelayGenerator #(parameter NCHAN = 4, NBITS = 8) (
	input wire              Clk, Rst_n,
    input wire [NCHAN-1:0]  Channels,
    input wire [NCHAN-1:0]  Delays [NBITS-1:0], // 2^NBITS = NREGS
    output reg [NCHAN-1:0]  DlayChann
);

// Delay
always @(posedge Clk) begin

    for (int i = 0; i < NCHAN-1; i++) begin  // Put regs for every channel
        for (int j = 0; j < Delays[i]; i++) begin
            DlayChann[i] <= {delayRegs[i], Channels[i]};
        end
    end
end

endmodule