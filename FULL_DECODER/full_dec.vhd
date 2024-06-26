library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity full_dec is
 port(A,B,C,E:in std_logic;
      sum,carry :out std_logic);
      end entity;
 
architecture struct of full_dec is
 signal sig1, sig2, sig3, sig4: std_logic;
 signal  Yi0,Yi1,Yi2,Yi3,Yi4,Yi5,Yi6,Yi7 : std_logic;
 component decoder_3 is
 port(A1,A2,A3,E:in std_logic;
      Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7 :out std_logic);
end component;
begin
	inst1:decoder_3 PORT map(A1=>A,A2=>B, A3=>C,E=>'1',Y0=>Yi0,Y1 => Yi1, Y2 =>Yi2,Y3 => Yi3,Y4=>Yi4,Y5 => Yi5, Y6 =>Yi6,Y7 => Yi7);
	inst2:OR_2  PORT map(A=>Yi1,B=>Yi2, Y=>sig1);
	inst3:OR_2  PORT map(A=>Yi4,B=>Yi7, Y=>sig2);
	inst4:OR_2  PORT map(A=>Yi3, B=>Yi5,Y=> sig3);
	inst5:OR_2  PORT map(A=>Yi6,B=>Yi7, Y=>sig4);
	
	inst6:OR_2  PORT map(A=>sig1,B=>sig2, Y=>sum);
	inst7:OR_2  PORT map(A=>sig3,B=>sig4, Y=>carry);
	
end struct;