library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(5 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
	-- Instantiate your own top Module component in place of ALU_1
	
component mux_4task is
port(in1,in2,in3,in4,s1,s2:in std_logic;
out1:out std_logic);
end component;

begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: mux_4task port map (in1 => input_vector(5), in2 => input_vector(4),in3=> input_vector(3),in4=> input_vector(2),s1=> input_vector(1),s2=> input_vector(0),
											 out1 => output_vector(0));

end Dutwrap;