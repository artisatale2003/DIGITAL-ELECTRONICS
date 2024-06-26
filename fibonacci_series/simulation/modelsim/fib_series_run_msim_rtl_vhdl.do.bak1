transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/qaurtus/fibonacci_series/DUT.vhdl}
vcom -93 -work work {E:/qaurtus/fibonacci_series/fib_series.vhd}

vcom -93 -work work {E:/qaurtus/fibonacci_series/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
