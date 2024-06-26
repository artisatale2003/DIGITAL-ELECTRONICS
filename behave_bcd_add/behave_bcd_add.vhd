library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
library work;
use work.Gates.all;

entity behave_bcd_adder is
port(A,B:in std_logic_vector(3 downto 0);
     carry :out std_logic;
     sum:out std_logic_vector(3 downto 0)
	  );
	  end entity;
	  
architecture behavioural of behave_bcd_adder is
begin

process (A,B)
	variable temp_b_sum : std_logic_vector(4 downto 0);
	variable c : std_logic;
	begin
		temp_b_sum := ('0' & A) + ('0' & B);
		if (temp_b_sum > "1001" ) then 
			carry <= '1';
			sum <= temp_b_sum(3 downto 0) + "0110";
		else
			sum <= temp_b_sum(3 downto 0);
			carry <= '0';
		end if;
		
 end process;
	
end architecture;