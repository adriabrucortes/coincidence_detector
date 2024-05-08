module DelayGenerator #(parameter NCHAN = 4, NBITS = 4, NREGS = 2) (
	input wire              Clk, Rst_n,
    input wire [NCHAN-1:0]  Channels,
    input wire [NBITS-1:0]  Delays [NCHAN-1:0], // 2^NBITS = NREGS
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

            automatic int j = 0;

            // Swapped "for" for "do while" to ensure this happens at least once (in case there is 0 delay)
            // This entails that there will always be at least 1+1 delay
            do begin 
                delayRegs[i] <= {delayRegs[i][NREGS-2:0], Channels[i]}; // Shift left
                j++;
            end
            while (j < Delays[i]);

            /*
            for (j = 0; j < Delays[i]; j++) begin
                delayRegs[i] <= {delayRegs[i][NREGS-2:0], Channels[i]}; // Shift left
            end
            */

            DlayChann[i] <= delayRegs[i][j];
        end
    end
end

endmodule