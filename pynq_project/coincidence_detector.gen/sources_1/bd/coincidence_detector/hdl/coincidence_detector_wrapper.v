//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Mon May 13 16:29:47 2024
//Host        : Elitebook-QCommsUB-Adria running 64-bit major release  (build 9200)
//Command     : generate_target coincidence_detector_wrapper.bd
//Design      : coincidence_detector_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module coincidence_detector_wrapper
   (Channels);
  input [3:0]Channels;

  wire [3:0]Channels;

  coincidence_detector coincidence_detector_i
       (.Channels(Channels));
endmodule
