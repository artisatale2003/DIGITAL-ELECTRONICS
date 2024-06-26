library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity decode is
 port(A1,A2,E:in std_logic;
      Y0,Y1,Y2,Y3 :out std_logic);
      end entity;
 
architecture struct of decode is
 signal sig1, sig2, sig3, sig4,sig5, sig6: std_logic;
begin
	inst1:INVERTER PORT map(A=>A1,Y=>sig1);
	inst2:INVERTER  PORT map(A=>A2, Y=>sig2);
	
	inst3:AND_2  PORT map(A=>sig1, B=>sig2,Y=> sig3);
	inst4:AND_2  PORT map(A=>E,B=>sig3,Y=>Y0);
	
	inst5:AND_2  PORT map(A=>sig2, B=>A1, Y=>sig4);
	inst6:AND_2  PORT map(A=>E, B=>sig4, Y=>Y1);
	
	inst7:AND_2  PORT map(A=>A2,B=>sig1, Y=>sig5);
	inst8:AND_2  PORT map(A=>E,B=>sig5,Y=>y2);
	
	inst9:AND_2 PORT map(A=>A2,B=>A1, Y=>sig6);
   inst10:AND_2 PORT map(A=>E,B=>sig6, Y=>Y3);
end struct;