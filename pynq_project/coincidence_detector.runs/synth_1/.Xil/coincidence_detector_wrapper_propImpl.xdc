set_property SRC_FILE_INFO {cfile:c:/Users/HP/Documents/Projectes/Coincidence_detector/pynq_project/coincidence_detector.gen/sources_1/bd/coincidence_detector/ip/coincidence_detector_rst_ps8_0_100M_0/coincidence_detector_rst_ps8_0_100M_0.xdc rfile:../../../coincidence_detector.gen/sources_1/bd/coincidence_detector/ip/coincidence_detector_rst_ps8_0_100M_0/coincidence_detector_rst_ps8_0_100M_0.xdc id:1 order:EARLY scoped_inst:coincidence_detector_i/rst_ps8_0_100M/U0} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/HP/Documents/Projectes/Coincidence_detector/pynq_project/coincidence_detector.srcs/constrs_1/new/ports.xdc rfile:../../../coincidence_detector.srcs/constrs_1/new/ports.xdc id:2} [current_design]
current_instance coincidence_detector_i/rst_ps8_0_100M/U0
set_property src_info {type:SCOPED_XDC file:1 line:50 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-11} -user "proc_sys_reset" -desc "Timing uncritical paths" -tags "1171415" -scope -internal -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */ACTIVE_LOW_AUX.ACT_LO_AUX/GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to}]]
current_instance
set_property src_info {type:XDC file:2 line:1 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F8 [get_ports {Channels[0]}]
set_property src_info {type:XDC file:2 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F7 [get_ports {Channels[1]}]
set_property src_info {type:XDC file:2 line:3 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN G7 [get_ports {Channels[2]}]
set_property src_info {type:XDC file:2 line:4 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN F6 [get_ports {Channels[3]}]
