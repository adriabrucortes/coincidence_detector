module ds_to_single (
    input wire   [8-1:0] DS_Channels,
    output wire  [4-1:0] Channels
);
    IBUFDS IBUFDS_inst0 (
      .O(Channels[0]),   // 1-bit output: Buffer output
      .I(DS_Channels[0]),   // 1-bit input: Diff_p buffer input (connect directly to top-level port)
      .IB(DS_Channels[1])  // 1-bit input: Diff_n buffer input (connect directly to top-level port)
    );

    IBUFDS IBUFDS_inst1 (
      .O(Channels[1]),   // 1-bit output: Buffer output
      .I(DS_Channels[2]),   // 1-bit input: Diff_p buffer input (connect directly to top-level port)
      .IB(DS_Channels[3])  // 1-bit input: Diff_n buffer input (connect directly to top-level port)
    );

    IBUFDS IBUFDS_inst2 (
      .O(Channels[2]),   // 1-bit output: Buffer output
      .I(DS_Channels[4]),   // 1-bit input: Diff_p buffer input (connect directly to top-level port)
      .IB(DS_Channels[5])  // 1-bit input: Diff_n buffer input (connect directly to top-level port)
    );

    IBUFDS IBUFDS_inst3 (
      .O(Channels[3]),   // 1-bit output: Buffer output
      .I(DS_Channels[6]),   // 1-bit input: Diff_p buffer input (connect directly to top-level port)
      .IB(DS_Channels[7])  // 1-bit input: Diff_n buffer input (connect directly to top-level port)
    );
endmodule