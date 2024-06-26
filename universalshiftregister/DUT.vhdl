library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(11 downto 0);
       	output_vector: out std_logic_vector(7 downto 0));
end entity;

architecture DutWrap of DUT is
	-- Instantiate your own top Module component in place of ALU_1
	
component shift is
port  (l: in std_logic;
      b: in std_logic_vector(2 downto 0);
		data: in std_logic_vector(7 downto 0);
      out1: out std_logic_vector( 7 downto 0));
end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
      add_instance: shift port map (l=> input_vector(11),
      b=> input_vector(10 downto 8),
		data=> input_vector(7 downto 0),
      out1=> output_vector(7 downto 0));

end Dutwrap;