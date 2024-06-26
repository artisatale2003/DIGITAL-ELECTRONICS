library ieee;
use ieee.std_logic_1164.all;

entity fib_series is
port(X:in std_logic_vector(9 downto 0);
Y:out std_logic);
end entity;
architecture behavioural of Fib_series is
 
begin
p1:process(x)
begin
case X is
when "0000000000"| "0000000001"|"0000000010"|"0000000011"|"0000000101"|"0000001000"|"0000001101"|"0000010101"|"0000100010"|"0000110111"|"0001011001"|"0010010000"|"0011101001"|"0101111001"|"1001100010"|"1111011011"=>
Y<='1';
when others=>Y<='0';
end case;
end process;
end architecture;
