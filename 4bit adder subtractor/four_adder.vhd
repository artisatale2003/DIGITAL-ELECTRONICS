library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity four_adder is
 port(a3,a2,a1,a0,b3,b2,b1,b0,M:in std_logic;
		C, s3,s2,s1,s0:out std_logic);
 end entity;
 
architecture struct of four_adder is
 
 component full_add is
 port(a,b,c:in std_logic;
 sum, carry :out std_logic);
 end component;
 signal sig7,sig6,sig5,sig4,sig3, sig2, sig1: std_logic;

begin
	inst8:full_add port map(A=>sig7, B=>a3, c=>sig6, sum=>S3, carry=> C);
	inst6:full_add port map(A=>sig5, B=>a2, c=>sig4, sum=>S2, carry=>sig6);
	inst4:full_add port map(A=>sig3, B=>a1, c=>sig2, sum=>S1, carry=>sig4);
	inst2:full_add port map(A=>sig1, B=>a0, c=>M,    sum=>S0, carry=>sig2);
	inst7:XOR_2 port map(A=>b3, B=>M, Y=>sig7);
	inst5:XOR_2 port map(A=>b2, B=>M, Y=>sig5);
	inst3:XOR_2 port map(A=>b1, B=>M, Y=>sig3);
	inst1:XOR_2 port map(A=>b0, B=>M, Y=>sig1);

end architecture;