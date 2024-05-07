module pos_edge_det #(parameter NCHAN = 4) (
    input wire              Clk,
    input wire  [NCHAN-1:0] Sig,    // Signal
    output wire [NCHAN-1:0] Pe      // Posedge
);

    reg [NCHAN-1:0] Sig_dly;

	always @ (posedge Clk) begin
		Sig_dly <= Sig;
	end

	assign Pe = Sig & ~Sig_dly;            
endmodule 