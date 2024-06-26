transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/qaurtus/nptel/DUT.vhdl}
vcom -93 -work work {E:/qaurtus/nptel/Gates.vhdl}
vcom -93 -work work {E:/qaurtus/demux/decoder_1.vhd}
vcom -93 -work work {E:/qaurtus/demux_1/decoder_2.vhd}

vcom -93 -work work {E:/qaurtus/demux_1/../nptel/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
