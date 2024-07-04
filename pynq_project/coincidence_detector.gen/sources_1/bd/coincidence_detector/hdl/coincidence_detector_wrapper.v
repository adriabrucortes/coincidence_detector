//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Thu Jul  4 12:28:16 2024
//Host        : Elitebook-QCommsUB-Adria running 64-bit major release  (build 9200)
//Command     : generate_target coincidence_detector_wrapper.bd
//Design      : coincidence_detector_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module coincidence_detector_wrapper
   (DS_Channels);
  input [7:0]DS_Channels;

  wire [7:0]DS_Channels;

  coincidence_detector coincidence_detector_i
       (.DS_Channels(DS_Channels));
endmodule
