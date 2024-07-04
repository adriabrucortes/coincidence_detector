
`timescale 1 ns / 1 ps

	module axilite_detector_v1_0 #
	(
		// Users to add parameters here
        parameter integer NSTAGES_SYNC = 2,
		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 7
	)
	(
		// Users to add ports here
		
		input wire [4-1:0] Channels,
		input wire         PL_Clk,

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
// Instantiation of Axi Bus Interface S00_AXI
	axilite_detector_v1_0_S00_AXI #(
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) axilite_detector_v1_0_S00_AXI_inst (
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready),
		.Restart_i	  (Restart_i),
		.Enable_i     (Enable_i), // This is a 1-bit control
        .nCycles_i    (nCycles_i),
        .Delay_A_i    (Delay_A_i),
        .Delay_B_i    (Delay_B_i),
        .Delay_C_i    (Delay_C_i),
        .Delay_D_i    (Delay_D_i),
		.Restart_o	  (Restart_o),
        .Enable_o     (Enable_o),
        .nCycles_o    (nCycles_o),
        .Delay_A_o    (Delay_A_o),
        .Delay_B_o    (Delay_B_o),
        .Delay_C_o    (Delay_C_o),
        .Delay_D_o    (Delay_D_o),
        .Cnt_Clk      (Cnt_Clk_sync),
        .Counts_A     (Counts_A_sync),
        .Counts_B     (Counts_B_sync),
        .Counts_C     (Counts_C_sync),
        .Counts_D     (Counts_D_sync),
        .Counts_AB    (Counts_AB_sync),
        .Counts_AC    (Counts_AC_sync),
        .Counts_AD    (Counts_AD_sync),
        .Counts_BC    (Counts_BC_sync),
        .Counts_BD    (Counts_BD_sync),
        .Counts_CD    (Counts_CD_sync)
	);


	// Add user logic here	
	wire								Restart_i;
	wire							    Enable_i;
    wire  [C_S00_AXI_DATA_WIDTH-1:0]	nCycles_i;
    wire  [C_S00_AXI_DATA_WIDTH-1:0]	Delay_A_i, Delay_B_i, Delay_C_i, Delay_D_i;
    
	wire								Restart_o;
    wire							    Enable_o;
    wire  [C_S00_AXI_DATA_WIDTH-1:0]	nCycles_o;
    wire  [C_S00_AXI_DATA_WIDTH-1:0]	Delay_A_o, Delay_B_o, Delay_C_o, Delay_D_o;

	wire  [C_S00_AXI_DATA_WIDTH-1:0]	Cnt_Clk;
	wire  [C_S00_AXI_DATA_WIDTH-1:0]	Counts_A, Counts_B, Counts_C, Counts_D;
	wire  [C_S00_AXI_DATA_WIDTH-1:0]	Counts_AB, Counts_AC, Counts_AD, Counts_BC, Counts_BD, Counts_CD;
	
	wire  [C_S00_AXI_DATA_WIDTH-1:0]	Cnt_Clk_sync;
	wire  [C_S00_AXI_DATA_WIDTH-1:0]	Counts_A_sync, Counts_B_sync, Counts_C_sync, Counts_D_sync;
	wire  [C_S00_AXI_DATA_WIDTH-1:0]	Counts_AB_sync, Counts_AC_sync, Counts_AD_sync, Counts_BC_sync, Counts_BD_sync, Counts_CD_sync;

	detector_top_wrapper_v #(
       .NCHAN(4),
       .NBITS(C_S00_AXI_DATA_WIDTH),
       .NREGS(1024)
    ) detector (
       // Input ports
       .Clk          (PL_Clk),
       .Rst_n        (s00_axi_aresetn),
       .Channels     (Channels),
       
       // Input AXIS
	   .Restart_i	 (Restart_i),
       .Enable_i     (Enable_i), // This is a 1-bit control
       .nCycles_i    (nCycles_i),
       .Delay_A_i    (Delay_A_i),
       .Delay_B_i    (Delay_B_i),
       .Delay_C_i    (Delay_C_i),
       .Delay_D_i    (Delay_D_i),
	   .Restart_o	 (Restart_o),
       .Enable_o     (Enable_o),
       .nCycles_o    (nCycles_o),
       .Delay_A_o    (Delay_A_o),
       .Delay_B_o    (Delay_B_o),
       .Delay_C_o    (Delay_C_o),
       .Delay_D_o    (Delay_D_o),
       .Cnt_Clk      (Cnt_Clk),
       .Counts_A     (Counts_A),
       .Counts_B     (Counts_B),
       .Counts_C     (Counts_C),
       .Counts_D     (Counts_D),
       .Counts_AB    (Counts_AB),
       .Counts_AC    (Counts_AC),
       .Counts_AD    (Counts_AD),
       .Counts_BC    (Counts_BC),
       .Counts_BD    (Counts_BD),
       .Counts_CD    (Counts_CD)
    );
    
    
    // SYNC REGISTERS
    sync_reg #(
       .NSTAGES(NSTAGES_SYNC),
       .NBITS(C_S00_AXI_DATA_WIDTH)
    ) cnt_Clk_sync (
       .Clk(s00_axi_aclk),
       .Rst_n(s00_axi_aresetn),
       .In(Cnt_Clk),
       .Out(Cnt_Clk_sync)
    );
    
    sync_reg #(
       .NSTAGES(NSTAGES_SYNC),
       .NBITS(C_S00_AXI_DATA_WIDTH)
    ) cnt_A_sync (
       .Clk(s00_axi_aclk),
       .Rst_n(s00_axi_aresetn),
       .In(Counts_A),
       .Out(Counts_A_sync)
    );
    
    sync_reg #(
       .NSTAGES(NSTAGES_SYNC),
       .NBITS(C_S00_AXI_DATA_WIDTH)
    ) cnt_B_sync (
       .Clk(s00_axi_aclk),
       .Rst_n(s00_axi_aresetn),
       .In(Counts_B),
       .Out(Counts_B_sync)
    );
    
    sync_reg #(
       .NSTAGES(NSTAGES_SYNC),
       .NBITS(C_S00_AXI_DATA_WIDTH)
    ) cnt_C_sync (
       .Clk(s00_axi_aclk),
       .Rst_n(s00_axi_aresetn),
       .In(Counts_C),
       .Out(Counts_C_sync)
    );
    
    sync_reg #(
       .NSTAGES(NSTAGES_SYNC),
       .NBITS(C_S00_AXI_DATA_WIDTH)
    ) cnt_D_sync (
       .Clk(s00_axi_aclk),
       .Rst_n(s00_axi_aresetn),
       .In(Counts_D),
       .Out(Counts_D_sync)
    );
    
    sync_reg #(
       .NSTAGES(NSTAGES_SYNC),
       .NBITS(C_S00_AXI_DATA_WIDTH)
    ) cnt_AB_sync (
       .Clk(s00_axi_aclk),
       .Rst_n(s00_axi_aresetn),
       .In(Counts_AB),
       .Out(Counts_AB_sync)
    );
    
    sync_reg #(
       .NSTAGES(NSTAGES_SYNC),
       .NBITS(C_S00_AXI_DATA_WIDTH)
    ) cnt_AC_sync (
       .Clk(s00_axi_aclk),
       .Rst_n(s00_axi_aresetn),
       .In(Counts_AC),
       .Out(Counts_AC_sync)
    );
    
    sync_reg #(
       .NSTAGES(NSTAGES_SYNC),
       .NBITS(C_S00_AXI_DATA_WIDTH)
    ) cnt_AD_sync (
       .Clk(s00_axi_aclk),
       .Rst_n(s00_axi_aresetn),
       .In(Counts_AD),
       .Out(Counts_AD_sync)
    );
    
    sync_reg #(
       .NSTAGES(NSTAGES_SYNC),
       .NBITS(C_S00_AXI_DATA_WIDTH)
    ) cnt_BC_sync (
       .Clk(s00_axi_aclk),
       .Rst_n(s00_axi_aresetn),
       .In(Counts_BC),
       .Out(Counts_BC_sync)
    );
    
    sync_reg #(
       .NSTAGES(NSTAGES_SYNC),
       .NBITS(C_S00_AXI_DATA_WIDTH)
    ) cnt_BD_sync (
       .Clk(s00_axi_aclk),
       .Rst_n(s00_axi_aresetn),
       .In(Counts_BD),
       .Out(Counts_BD_sync)
    );
    
    sync_reg #(
       .NSTAGES(NSTAGES_SYNC),
       .NBITS(C_S00_AXI_DATA_WIDTH)
    ) cnt_CD_sync (
       .Clk(s00_axi_aclk),
       .Rst_n(s00_axi_aresetn),
       .In(Counts_CD),
       .Out(Counts_CD_sync)
    );

	// User logic ends

	endmodule