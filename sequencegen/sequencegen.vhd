library ieee;
use ieee.std_logic_1164.all;

package Flipflops is
component dff_set is port(D,clock,set:in std_logic;Q:out std_logic);
end component dff_set;
component dff_reset is port(D,clock,reset:in std_logic;Q:out std_logic);
end component dff_reset;
end package Flipflops;
--D flip flop with set
library ieee;
use ieee.std_logic_1164.all;
entity dff_set is port(D,clock,set:in std_logic;Q:out std_logic);
end entity dff_set;
architecture behav of dff_set is
begin
dff_set_proc: process (clock,set)
begin
if(set='1')then -- set implies flip flip output logic high
Q <='1' ; -- write the flip flop output when set
elsif (clock'event and (clock='1')) then
Q <= D; -- write flip flop output when not set
end if ;
end process dff_set_proc;
end behav;
--D flip flop with reset
library ieee;
use ieee.std_logic_1164.all;
entity dff_reset is port(D,clock,reset:in std_logic;Q:out std_logic);
end entity dff_reset;
architecture behav of dff_reset is
begin
dff_reset_proc: process (clock,reset)
begin
if(reset='1')then -- reset implies flip flip output logic low
Q <= '0'; -- write the flip flop output when reset
elsif (clock'event and (clock='1')) then
Q <= D; -- write flip flop output when not reset
end if ;
end process dff_reset_proc;
end behav;



library ieee;
use ieee.std_logic_1164.all;

use work.Flipflops.all;
-- write the Flipflops packege declaration
entity sequencegen is
port (reset,clock: in std_logic;
y:out std_logic);
end entity sequencegen;
architecture struct of sequencegen is

component dff_set is port(D,clock,set:in std_logic;Q:out std_logic);
end component dff_set;
component dff_reset is port(D,clock,reset:in std_logic;Q:out std_logic);
end component dff_reset;
signal D :std_logic_vector(2 downto 0);
signal Q:std_logic_vector(2 downto 0);
begin

D(0)<= (q(2) or (q(0) and (not q(1)))or ((not q(0)) and q(1)));
D(1)<= not (q(1));
D(2)<= (q(1) and (not q(2))and (not q(0))) or ((q(0) and (not q(1)) and q(2))) ;

ff0  : dff_set port map (D(0),clock ,reset,q(0));
ff1 : dff_reset port map (D(1),clock ,reset,q(1));
ff2 : dff_reset port map (D(2),clock ,reset,q(2));
y<=q(0);
end struct;