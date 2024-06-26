library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(2 downto 0);
       	output_vector: out std_logic_vector(3 downto 0));
end entity;

architecture DutWrap of DUT is
	-- Instantiate your own top Module component in place of ALU_1
	
component decode is
port(A1,A2,E: in std_logic;
     Y0,Y1,Y2,Y3: out std_logic);
end component;

begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance:decode port map (A1 => input_vector(1), A2 => input_vector(2),
	                              E=> input_vector(0),
											Y0 => output_vector(0),Y1 => output_vector(1),
											Y2 => output_vector(2),Y3 => output_vector(3));

end Dutwrap;