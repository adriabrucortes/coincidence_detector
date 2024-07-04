module sync_reg #(parameter NSTAGES = 2, NBITS = 32)(
  input   Clk,
  input   Rst_n,
  input   [NBITS-1:0] In,
  output  Out
);

  reg [NBITS-1:0] regs [NSTAGES-1:0];

  always @(posedge Clk or negedge Rst_n)
    if(!Rst_n)
      regs <= {NSTAGES{1'b0}};
      
    else
      regs <= {regs[NSTAGES-2:0], In};

  assign Out = regs[NSTAGES-1];

endmodule
