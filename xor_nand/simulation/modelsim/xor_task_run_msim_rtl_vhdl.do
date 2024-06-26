transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/qaurtus/artisatale_nptel/xor_nand/Gates.vhdl}
vcom -93 -work work {E:/qaurtus/artisatale_nptel/xor_nand/DUT.vhdl}
vcom -93 -work work {E:/qaurtus/artisatale_nptel/xor_nand/xor_task.vhd}

vcom -93 -work work {E:/qaurtus/artisatale_nptel/xor_nand/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
