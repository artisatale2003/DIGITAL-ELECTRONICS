library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity xor_task is
 port(in1,in2:in std_logic;
 out1 :out std_logic);
 end entity;
 
 architecture struct of xor_task is
   signal sig1,sig2, sig3: std_logic;
 begin
   inst1:NAND_2 PORT map(in1, in2, sig1);
	inst2:NAND_2 PORT map(in1, sig1, sig2);
	inst3:NAND_2 PORT map(sig1, in2, sig3);
	inst4:NAND_2 PORT map(sig2, sig3, out1);
 end architecture;