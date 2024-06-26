library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity prime_task is
	port(A,B,C,D : in std_logic;
			Y : out std_logic);
end entity;

architecture structure of prime_task is 
signal sig1,sig2,sig3,sig4,sig5,sig6,sig7,sig8,sig9,sig10,sigA,sigB,sigC : std_logic;

begin
	inst1 : INVERTER port map(A => A, Y => sigA);
	inst2 : INVERTER port map(A => B, Y => sigB);
	inst3 : INVERTER port map(A => C, Y => sigC);
	
	inst4 : AND_2 port map(A => sigA, B => sigB, Y => sig1);
	inst5 : AND_2 port map(A => sig1, B => C, Y => sig2);
	
	inst6 : AND_2 port map(A => sigA, B => C, Y => sig3);
	inst7 : AND_2 port map(A => sig3, B => D, Y => sig4);
	
	inst8 : AND_2 port map(A => sigB, B => C, Y => sig5);
	inst9 : AND_2 port map(A => sig5, B => D, Y => sig6);
	
	inst10 : AND_2 port map(A => B, B => sigC, Y => sig7);
	inst11 : AND_2 port map(A => sig7, B => D, Y => sig8);
	
	inst12 : OR_2 port map(A => sig2, B => sig4, Y => sig9);
	inst13 : OR_2 port map(A => sig9, B => sig6, Y => sig10);
	inst14 : OR_2 port map(A => sig10, B => sig8, Y => Y);
	
end structure;