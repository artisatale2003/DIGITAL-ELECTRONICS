library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity sequence_det is
    Port (
        clock : in std_logic;
        reset : in std_logic;
        input_bit : in std_logic_vector(4 downto 0);
        output_bit : out std_logic
    );
end sequence_det;

architecture Behavioral of sequence_det is
    type state_type is (q0, q1, q2, q3, q4, q5, q6, q7);
    signal current_state, next_state : state_type;
begin
    clock_proc:process(clock, reset)
    begin
	  if(clock='1' and clock' event) then

        if reset = '1' then
            current_state <= q0;
        elsif rising_edge(clock) then
            current_state <= next_state;
        end if;
		  end if;
    end process clock_proc;

    process(current_state, input_bit)
    begin
        case current_state is
            when q0 =>
                if (unsigned(input_bit)=19) then
                    next_state <= q1;
						  output_bit<='0';
                else
                    next_state <= q0;output_bit<='0';
                end if;
            when q1 =>
                if (unsigned(input_bit)=20) then
                    next_state <= q2;
						  output_bit<='0';
                else
                    next_state <= q1;output_bit<='0';
                end if;
            when q2 =>
                 if (unsigned(input_bit)=21) then
                    next_state <= q3;

						  output_bit<='0';
                else
                    next_state <= q2;output_bit<='0';
                end if;
            when q3 =>
                                if (unsigned(input_bit)=4) then
                    next_state <= q4;
						  output_bit<='0';
                else
                    next_state <= q3;output_bit<='0';
                end if;
            when q4 =>
                                if (unsigned(input_bit)=5) then
                    next_state <= q5;
						  output_bit<='0';
                else
                    next_state <= q4;
						  output_bit<='0';
                end if;
            when q5 =>
                                if (unsigned(input_bit)=14) then
                    next_state <= q6;
						  output_bit<='0';
                else
                    next_state <= q5;
                end if;
            when q6 =>
                 if (unsigned(input_bit)=20) then
                    next_state <= q7;
						  output_bit<='0';
                else
                    next_state <= q6;
						  output_bit<='0';
                end if;
            when q7 =>
                                if (unsigned(input_bit)=19) then
                    next_state <= q0;
						  output_bit<='1';
                else
                    next_state <= q7;
						  output_bit<='0';
                end if;
            when others => 
				next_state <= q0;
                
        end case;
    end process;
end Behavioral;