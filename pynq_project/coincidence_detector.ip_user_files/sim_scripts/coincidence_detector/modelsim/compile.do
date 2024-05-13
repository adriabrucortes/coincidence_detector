vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_15
vlib modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_15
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/lib_pkg_v1_0_3
vlib modelsim_lib/msim/axi_timer_v2_0_31
vlib modelsim_lib/msim/generic_baseblocks_v2_1_1
vlib modelsim_lib/msim/axi_register_slice_v2_1_29
vlib modelsim_lib/msim/fifo_generator_v13_2_9
vlib modelsim_lib/msim/axi_data_fifo_v2_1_28
vlib modelsim_lib/msim/axi_crossbar_v2_1_30
vlib modelsim_lib/msim/proc_sys_reset_v5_0_14
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_29
vlib modelsim_lib/msim/axi_clock_converter_v2_1_28
vlib modelsim_lib/msim/blk_mem_gen_v8_4_7
vlib modelsim_lib/msim/axi_dwidth_converter_v2_1_29

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_15 modelsim_lib/msim/axi_vip_v1_1_15
vmap zynq_ultra_ps_e_vip_v1_0_15 modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_15
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap lib_pkg_v1_0_3 modelsim_lib/msim/lib_pkg_v1_0_3
vmap axi_timer_v2_0_31 modelsim_lib/msim/axi_timer_v2_0_31
vmap generic_baseblocks_v2_1_1 modelsim_lib/msim/generic_baseblocks_v2_1_1
vmap axi_register_slice_v2_1_29 modelsim_lib/msim/axi_register_slice_v2_1_29
vmap fifo_generator_v13_2_9 modelsim_lib/msim/fifo_generator_v13_2_9
vmap axi_data_fifo_v2_1_28 modelsim_lib/msim/axi_data_fifo_v2_1_28
vmap axi_crossbar_v2_1_30 modelsim_lib/msim/axi_crossbar_v2_1_30
vmap proc_sys_reset_v5_0_14 modelsim_lib/msim/proc_sys_reset_v5_0_14
vmap axi_protocol_converter_v2_1_29 modelsim_lib/msim/axi_protocol_converter_v2_1_29
vmap axi_clock_converter_v2_1_28 modelsim_lib/msim/axi_clock_converter_v2_1_28
vmap blk_mem_gen_v8_4_7 modelsim_lib/msim/blk_mem_gen_v8_4_7
vmap axi_dwidth_converter_v2_1_29 modelsim_lib/msim/axi_dwidth_converter_v2_1_29

vlog -work xilinx_vip  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L zynq_ultra_ps_e_vip_v1_0_15 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2023.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L zynq_ultra_ps_e_vip_v1_0_15 -L xilinx_vip "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_15  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L zynq_ultra_ps_e_vip_v1_0_15 -L xilinx_vip "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/5753/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_15  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L zynq_ultra_ps_e_vip_v1_0_15 -L xilinx_vip "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../bd/coincidence_detector/ip/coincidence_detector_zynq_ultra_ps_e_0_0/sim/coincidence_detector_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vcom -work axi_lite_ipif_v3_0_4  -93  \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2  -93  \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work lib_pkg_v1_0_3  -93  \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/56d9/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work axi_timer_v2_0_31  -93  \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/7ebb/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/coincidence_detector/ip/coincidence_detector_axi_timer_0_0/sim/coincidence_detector_axi_timer_0_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../bd/coincidence_detector/ipshared/155c/hdl/axilite_detector_v1_0_S00_AXI.v" \
"../../../bd/coincidence_detector/ipshared/155c/hdl/axilite_detector_v1_0.v" \
"../../../bd/coincidence_detector/ipshared/155c/src/detector_top_wrapper_v.v" \

vlog -work xil_defaultlib  -incr -mfcu  -sv -L axi_vip_v1_1_15 -L zynq_ultra_ps_e_vip_v1_0_15 -L xilinx_vip "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../bd/coincidence_detector/ipshared/155c/src/DelayGenerator.sv" \
"../../../bd/coincidence_detector/ipshared/155c/src/detector.sv" \
"../../../bd/coincidence_detector/ipshared/155c/src/detector_top_wrapper.sv" \
"../../../bd/coincidence_detector/ipshared/155c/src/pos_edge_det.sv" \
"../../../bd/coincidence_detector/ip/coincidence_detector_axilite_detector_0_0/sim/coincidence_detector_axilite_detector_0_0.sv" \

vlog -work generic_baseblocks_v2_1_1  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/10ab/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_29  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ff9f/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_9  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ac72/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_9  -93  \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ac72/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_9  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ac72/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_28  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/279e/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_30  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/fb47/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../bd/coincidence_detector/ip/coincidence_detector_xbar_0/sim/coincidence_detector_xbar_0.v" \

vcom -work proc_sys_reset_v5_0_14  -93  \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/408c/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/coincidence_detector/ip/coincidence_detector_rst_ps8_0_100M_0/sim/coincidence_detector_rst_ps8_0_100M_0.vhd" \

vlog -work axi_protocol_converter_v2_1_29  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/a63f/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work axi_clock_converter_v2_1_28  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/769c/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_7  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/3c0c/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_29  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/670d/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/ec67/hdl" "+incdir+../../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ipshared/2fcd/hdl" "+incdir+C:/Xilinx/Vivado/2023.2/data/xilinx_vip/include" \
"../../../bd/coincidence_detector/ip/coincidence_detector_auto_ds_0/sim/coincidence_detector_auto_ds_0.v" \
"../../../bd/coincidence_detector/ip/coincidence_detector_auto_pc_0/sim/coincidence_detector_auto_pc_0.v" \
"../../../bd/coincidence_detector/ip/coincidence_detector_auto_ds_1/sim/coincidence_detector_auto_ds_1.v" \
"../../../bd/coincidence_detector/ip/coincidence_detector_auto_pc_1/sim/coincidence_detector_auto_pc_1.v" \
"../../../bd/coincidence_detector/sim/coincidence_detector.v" \

vlog -work xil_defaultlib \
"glbl.v"

