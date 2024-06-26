library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX4behavior is
	port(A : in std_logic_vector(3 downto 0);
		  S : in std_logic_vector(1 downto 0);
		  Y : out std_logic);
end entity;

architecture behavior of MUX4behavior is
	
	signal sel : unsigned(1 downto 0);
	
	begin
	
	
	p1: process(S)
	
	begin
	
	sel <= unsigned(S);
	
	end process p1;
	
	p2: process(A, sel)
	
	begin
	
	if(sel = 0) then
		Y <= A(0);
	elsif (sel = 1) then
		Y <= A(1);
	elsif (sel = 2) then
		Y <= A(2);
	else
		Y <= A(3);
	end if;
	
	end process p2;
	
end architecture behavior;
