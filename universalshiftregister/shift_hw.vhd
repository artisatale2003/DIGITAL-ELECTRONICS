library ieee;
use ieee.std_logic_1164.all;
library work;
use work.gates.all;
entity shift is 
port (l: in std_logic;
      b: in std_logic_vector(2 downto 0);
		data: in std_logic_vector(7 downto 0);
      out1: out std_logic_vector( 7 downto 0)); 
end entity;

architecture struct of shift is

component mux_task is
port(in1,in2,s : in std_logic;
      out1 :out std_logic);
end component;

signal a:  std_logic_vector(7 downto 0); 
signal s1: std_logic_vector(7 downto 0);
signal s2: std_logic_vector(7 downto 0); 
signal s3: std_logic_vector (7 downto 0);

begin

rev : for n in 0 to 7 generate
lsb:if n<8 generate
b2: mux_task port map ( in1=>data(n), in2=>data(7-n), s=> l,out1 =>a(n));
end generate lsb;
 end generate rev;


n4_bit : for n in 0 to 7 generate
lsb1: if n<  4 generate
	b3: mux_task port map(in1=>a(n),in2=> a(n+4),S=>b(2),out1=>s1(n));
end generate lsb1;
msb1: if n>3 generate
	b4: mux_task port map(in1=>a(n),in2=> '0',S=>b(2),out1=>s1(n));
end generate msb1;
end generate n4_bit;	

n2_bit :for n in 0 to 7 generate
lsb2: if n<6 generate
	b5: mux_task port map(in1=>s1(n),in2=> s1(n+2),S=>b(1),out1=>s2(n));
end generate lsb2;
msb2: if n>5 generate
	b6: mux_task port map( in1=>s1(n),in2=> '0',S=>b(1),out1=>s2(n));
end generate msb2;
end generate n2_bit;

n1_bit : for n in 0 to 7 generate
	lsb3: if n<7 generate
	b7: mux_task port map(in1=>s2(n),in2=> s2(n+1),S=>b(0),out1=>s3(n));
	end generate lsb3;
	msb3: if n>6 generate
	b8: mux_task port map(in1=>s2(n),in2=> '0',S=>b(0),out1=>s3(n));
end generate msb3;
end generate n1_bit;

rev1 : for n in 0 to 7 generate
lsb :if n<8 generate
b9: mux_task port map(in1 =>s3(n),in2 =>s3(7-n),s => l,out1=>out1(n));
end generate lsb;
end generate rev1;

end struct;