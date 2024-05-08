onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider DUT
add wave -noupdate -radix unsigned /tb_detector/det/Clk
add wave -noupdate -radix unsigned /tb_detector/det/Rst_n
add wave -noupdate -radix unsigned /tb_detector/det/Delays
add wave -noupdate -color Yellow -itemcolor Yellow /tb_detector/det/Channels
add wave -noupdate -color {Violet Red} -itemcolor {Violet Red} /tb_detector/det/Pulses
add wave -noupdate -color Magenta -itemcolor {Dark Orchid} /tb_detector/det/delayed
add wave -noupdate -color Cyan -itemcolor Cyan -radix unsigned /tb_detector/det/iCnt
add wave -noupdate -color Cyan -itemcolor Cyan -radix unsigned /tb_detector/det/Counts
add wave -noupdate -divider {DELAY GEN}
add wave -noupdate -radix unsigned /tb_detector/det/delay/Delays
add wave -noupdate -color Yellow -itemcolor Yellow /tb_detector/det/delay/Channels
add wave -noupdate -color {Sky Blue} -itemcolor {Sky Blue} -radix binary /tb_detector/det/delay/delayRegs
add wave -noupdate -color Magenta -itemcolor {Dark Orchid} /tb_detector/det/delay/DlayChann
add wave -noupdate -divider TB
add wave -noupdate /tb_detector/NCHAN
add wave -noupdate /tb_detector/NBITS
add wave -noupdate /tb_detector/NREGS
add wave -noupdate /tb_detector/NCOMB
add wave -noupdate -radix unsigned /tb_detector/Clk
add wave -noupdate -radix unsigned /tb_detector/Rst_n
add wave -noupdate /tb_detector/Channels
add wave -noupdate -radix unsigned /tb_detector/Delays
add wave -noupdate -radix unsigned /tb_detector/Counts
add wave -noupdate -radix unsigned /tb_detector/expectCounts
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {211700 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 98
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
WaveRestoreZoom {137980 ps} {276700 ps}
