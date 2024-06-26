library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(7 downto 0);
       	output_vector: out std_logic_vector(4 downto 0));
end entity;

architecture DutWrap of DUT is
	-- Instantiate your own top Module component in place of ALU_1
	
component behave_bcd_adder is
 port(A, B: in std_logic_vector(3 downto 0);
		carry :out std_logic;
		sum:out std_logic_vector(3 downto 0)
		);
end component;

begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: behave_bcd_adder port map (a(3 downto 0) => input_vector(7 downto 4), 
												b(3 downto 0) => input_vector(3 downto 0), 
											carry => output_vector(4), 
											sum(3 downto 0) => output_vector(3 downto 0)
											);

end DutWrap;
