library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity addfulltask is
 port(in1,in2,in3:in std_logic;
 sum, carry :out std_logic);
 end entity;
 
architecture struct of addfulltask is
 signal sig1, sig2, sig3, sig4,sig5, sig6, sig7: std_logic;
begin
	inst1:NAND_2 PORT map(in1, in2, sig1);
	inst2:NAND_2 PORT map(in1, sig1, sig2);
	inst3:NAND_2 PORT map(sig1, in2, sig3);
	inst4:NAND_2 PORT map(sig2, sig3, sig4);
	inst5:NAND_2 PORT map(sig4, in3, sig5);
	inst6:NAND_2 PORT map(sig4, sig5, sig6);    
	inst7:NAND_2 PORT map(sig5, in3, sig7);
	inst8:NAND_2 PORT map(sig6, sig7, sum);
	inst9:NAND_2 PORT map(sig1, sig5, carry);

end architecture;