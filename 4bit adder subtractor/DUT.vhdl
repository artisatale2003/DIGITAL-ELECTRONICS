library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(8 downto 0);
       	output_vector: out std_logic_vector(4 downto 0));
end entity;

architecture DutWrap of DUT is
	-- Instantiate your own top Module component in place of ALU_1
	
component four_adder is
port(a3,a2,a1,a0,b3,b2,b1,b0,M:in std_logic;
		C, s3,s2,s1,s0:out std_logic);
end component;

begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: four_adder port map (a3 => input_vector(8),
	                                   a2 => input_vector(7),
	                                   a1=> input_vector(6),
	                                   a0 => input_vector(5),
												  b3 => input_vector(4),
												  b2 => input_vector(3),
												  b1 => input_vector(2),
												  b0=> input_vector(1),
												  M => input_vector(0),
											     s0 => output_vector(0),
												  s1 => output_vector(1),
												  s2 => output_vector(2),
												  s3 => output_vector(3),
												  C => output_vector(4));

end Dutwrap;