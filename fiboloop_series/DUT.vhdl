library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(9 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
	-- Instantiate your own top Module component in place of ALU_1
	
component fiboloop is
port(x : in std_logic_vector ;
      y :out std_logic);
end component;

begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: fiboloop port map (x => input_vector,y => output_vector(0));

end DutWrap;