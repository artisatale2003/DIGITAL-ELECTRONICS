library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(6 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
	-- Instantiate your own top Module component in place of ALU_1
	
component sequence_det is
Port (
        clock : in std_logic;
        reset : in std_logic;
        input_bit : in std_logic_vector(4 downto 0);
        output_bit : out std_logic
    );end component;

begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: sequence_det port map (input_bit => input_vector(6 downto 2), reset => input_vector(1),clock => input_vector(0),
											output_bit => output_vector(0));

end DutWrap;