module DelayGenerator #(parameter NCHAN = 4, NBITS = 4, NREGS = 2) (
	input wire              Clk, Rst_n,
    input wire [NCHAN-1:0]  Channels,
    input wire [NBITS-1:0]  Delays [NCHAN-1:0], // 2^NBITS >= NREGS
    output reg [NCHAN-1:0]  DlayChann
);

reg [NCHAN-1:0][NREGS-1:0] delayRegs ; // NCHAN registers for every Channel

// Delay
always @(posedge Clk or negedge Rst_n) begin

    if (!Rst_n) begin
        for (int i = 0; i < NCHAN; i++) 
            delayRegs[i] <= {NREGS{1'b0}};

    end else begin
        for (int i = 0; i < NCHAN; i++) begin  // Put regs for every channel
            // Shift left
            delayRegs[i] <= {delayRegs[i][NREGS-2:0], Channels[i]}; 
            DlayChann[i] <= delayRegs[i][Delays[i]]; // Output

        end
    end
end

endmodule