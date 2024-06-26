transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/qaurtus/ALU_TASK/DUT.vhdl}
vcom -93 -work work {E:/qaurtus/ALU_TASK/ALU_TASK.vhd}

vcom -93 -work work {E:/qaurtus/ALU_TASK/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  TESTBENCH

add wave *
view structure
view signals
run -all
