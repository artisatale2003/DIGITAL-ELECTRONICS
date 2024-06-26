library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ALU_TASK is
port(
A: in std_logic_vector(3 downto 0);
B: in std_logic_vector(3 downto 0);
sel: in std_logic_vector(1 downto 0);
out1: out std_logic_vector(7 downto 0));
end ALU_TASK;
--end entity;
 architecture behavioral of ALU_TASK is
  
function concate(A: in std_logic_vector(3 downto 0); B: in std_logic_vector(3 downto 0))
return std_logic_vector is	
variable out1: std_logic_vector (7 downto 0):=(others => '0');
begin
out1:= a & b;
return out1;
end concate;

function sub(A: in std_logic_vector(3 downto 0); B: in std_logic_vector(3 downto 0))
return std_logic_vector is	
variable diff: std_logic_vector (7 downto 0):=(others  => '0');
begin
diff :=  std_logic_vector(( "0000" & unsigned(a)) - ("0000" & unsigned(b)));

return diff;
end sub;

--    function sub(A, B : signed(3 downto 0)) return signed is
--        variable A_EX, B_EX : signed(4 downto 0);
--    begin
--        A_EX := '0' & A;
--        B_EX := '0' & B;
--        return A_EX - B_EX;
--    end function;


function xoor(A: in std_logic_vector(3 downto 0); B:in std_logic_vector(3 downto 0))
return std_logic_vector is	
variable out1 : std_logic_vector (3 downto 0):=(others  => '0');
begin 
out1:= a xor b;
return out1;
end xoor;
function shift(A: in std_logic_vector(3 downto 0);B: in std_logic_vector(3 downto 0))
return std_logic_vector is	
variable out1: std_logic_vector (7 downto 0):=(others  => '0');
begin 

if b(3)='0' then
case b( 1 downto 0) is 
when "00" => out1 := ("0000" & a) ;
when "01" => out1 := ("0000"& a(2 downto 0) & '0');
when "10" => out1 := ("0000" & a(1 downto 0) & "00");
when "11" => out1 := ("0000" & a(0) & "000");
when others =>null;
end case;
 else
case b( 1 downto 0) is 
when "00" => out1 := ("0000" & a) ;
when "01" => out1 := ("00000"& a(3 downto 1) );
when "10" => out1 :=("000000" & a(3 downto 2));
when "11" => out1 := ("0000000" & a(3));
when others =>null;
end case;
end if;
return out1;
--end if;
end shift;
begin

alu : process( A, B, sel )
--variable a,b : integer;
variable temp : std_logic_vector (3 downto 0);
variable res:std_logic_vector (7 downto 0);
begin
     case sel is 
	  when "00"=>
	  res:= concate (a,b) ;
	  
	  when "01"=>
	 
	  res := sub(A,B);
						
	  
	  when "10"=>
	  res:= "0000" & xoor(a,b);
	   
	  when "11"=>
	  res:= shift(a,b);
	  when others => res:="00000000";
	  
end case;  
out1 <= res;
end process;
  end architecture;8/+