library ieee;
use ieee.std_logic_1164.all;

entity mux2beh is
	port(a0,a1,s : in std_logic;
		   Y : out std_logic);
end entity;
architecture behavior of mux2beh is

begin
process(a0,a1,s)
begin
if(s='1') then
 y<=a1;
 
 else
 y<=a0;
 end if;
 end process;
end architecture;