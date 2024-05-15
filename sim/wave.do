onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_detector/Clk
add wave -noupdate -radix unsigned /tb_detector/Rst_n
add wave -noupdate -radix unsigned /tb_detector/Restart
add wave -noupdate -radix unsigned /tb_detector/Enable
add wave -noupdate /tb_detector/Channels
add wave -noupdate -radix unsigned /tb_detector/Delays
add wave -noupdate -radix unsigned /tb_detector/Cnt_chann
add wave -noupdate -radix unsigned /tb_detector/Cnt_pairs
add wave -noupdate -radix unsigned /tb_detector/nCycles
add wave -noupdate -radix unsigned /tb_detector/Cnt_Clk
add wave -noupdate -radix binary /tb_detector/dataIn
add wave -noupdate -divider DUT
add wave -noupdate -radix unsigned /tb_detector/detector/Clk
add wave -noupdate -radix unsigned /tb_detector/detector/Rst_n
add wave -noupdate -radix unsigned /tb_detector/detector/Channels
add wave -noupdate -radix unsigned /tb_detector/detector/Restart_i
add wave -noupdate -radix unsigned /tb_detector/detector/Enable_i
add wave -noupdate -radix unsigned /tb_detector/detector/nCycles_i
add wave -noupdate -radix unsigned /tb_detector/detector/Delay_A_i
add wave -noupdate -radix unsigned /tb_detector/detector/Delay_B_i
add wave -noupdate -radix unsigned /tb_detector/detector/Delay_C_i
add wave -noupdate -radix unsigned /tb_detector/detector/Delay_D_i
add wave -noupdate -radix unsigned /tb_detector/detector/Restart_o
add wave -noupdate -radix unsigned /tb_detector/detector/Enable_o
add wave -noupdate -radix unsigned /tb_detector/detector/nCycles_o
add wave -noupdate -radix unsigned /tb_detector/detector/Delay_A_o
add wave -noupdate -radix unsigned /tb_detector/detector/Delay_B_o
add wave -noupdate -radix unsigned /tb_detector/detector/Delay_C_o
add wave -noupdate -radix unsigned /tb_detector/detector/Delay_D_o
add wave -noupdate -radix unsigned /tb_detector/detector/Cnt_Clk
add wave -noupdate -radix unsigned /tb_detector/detector/Counts_A
add wave -noupdate -radix unsigned /tb_detector/detector/Counts_B
add wave -noupdate -radix unsigned /tb_detector/detector/Counts_C
add wave -noupdate -radix unsigned /tb_detector/detector/Counts_D
add wave -noupdate -radix unsigned /tb_detector/detector/Counts_AB
add wave -noupdate -radix unsigned /tb_detector/detector/Counts_AC
add wave -noupdate -radix unsigned /tb_detector/detector/Counts_AD
add wave -noupdate -radix unsigned /tb_detector/detector/Counts_BC
add wave -noupdate -radix unsigned /tb_detector/detector/Counts_BD
add wave -noupdate -radix unsigned /tb_detector/detector/Counts_CD
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1542420 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2448650 ps}
