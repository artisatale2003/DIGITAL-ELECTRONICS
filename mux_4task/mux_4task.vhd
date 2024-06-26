library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity mux_4task is
port(in1,in2,in3,in4,s1,s2:in std_logic;
out1:out std_logic);
end entity;
architecture struct of mux_4task is
signal sig1,sig2,sig3:std_logic;
component mux_task is
port(in1,in2,s:in std_logic;
out1:out std_logic);
end component;
begin

inst1 : mux_task port map(in1=>in1,in2=>in2,s=>s2,out1=>sig1);
inst2 : mux_task port map(in1=>in3,in2=>in4,s=>s2,out1=>sig2);
inst3 : mux_task port map(in1=>sig1,in2=>sig2,s=>s1,out1=>out1);
end struct;
