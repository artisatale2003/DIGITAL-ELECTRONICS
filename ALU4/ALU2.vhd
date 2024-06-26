library ieee;
use ieee.std_logic_1164.all;


entity ALU2 is
	port (
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	op: out std_logic_vector(5 downto 0)
	) ;
end ALU2;

architecture a1 of ALU2 is

signal sel : std_logic_vector(1 downto 0):= (others => '0');

function MAX(A: in std_logic_vector(3 downto 0); B: in std_logic_vector(3 downto 0))
	return std_logic_vector is
	variable maximum : std_logic_vector(5 downto 0):=(others => '0');
	begin
			if (A > B) then
				maximum := "00" & A;
				
			elsif (B > A) then
				maximum := "00" & B;
			
			else
				maximum := "000000";
			
			end if;
			
			
		
	return maximum;
	end MAX;
	
function AND_12(A: in std_logic_vector(3 downto 0); B: in std_logic_vector(3 downto 0))
	return std_logic_vector is
	
	variable andmul : std_logic_vector(5 downto 0):=(others =>'0');
	begin
	
	andmul := "00" & (A and B);
	return andmul;
	end AND_12;
	
function Eq(A: in std_logic_vector(3 downto 0); B: in std_logic_vector(3 downto 0))
	return std_logic_vector is
	variable same : std_logic_vector(5 downto 0):=(others =>'0');
	
	begin
		if(A = b) then
			same := "00" & A;
		else
			same := (others => '0');
		end if;

	return same;
	end Eq;
	
function rotate_shift(A: in std_logic_vector(3 downto 0); B: in std_logic_vector(3 downto 0))
	return std_logic_vector is
	
	
	variable sig2: std_logic_vector(5 downto 0):=(others =>'0');

	begin
		
		if(b(1 downto 0) = "00") then
			sig2 := "00" & A;
		end if;
		
		
		if (B(3) = '1') then	
		
	
		if (b(1 downto 0) = "11") then
        sig2 := "00"& A(2 downto 0) & A(3) ;
		end if;
    
		if (b(1 downto 0) = "10") then
		  sig2 := "00" & A(1 downto 0) & A(3 downto 2);
		end if;
    
		if (b(1 downto 0) = "01") then
		  sig2 := "00" & A(0) & A(3 downto 1);      
      end if;
		
		elsif(B(3) = '0') then

		if (b(1 downto 0) = "11") then
        sig2 := "00" & A(0) & A(3 downto 1);
		end if;
    
		if (b(1 downto 0) = "10") then
		  sig2 := "00" & A(1 downto 0) & A(3 downto 2);
		end if;
    
		if (b(1 downto 0) = "01") then
		  sig2 := "00" & A(2 downto 0) & A(3);      
      end if;
		
		end if;

	return sig2;
	end rotate_shift;
	

begin
	alu : process( A, B, sel )
begin
	sel <= B(3) & A(3);
	case sel is
		when "00" => 
			op <= MAX(A,B);

		when "01" => 
			op <= AND_12(A,B);

		when "10"  => 
			op <= rotate_shift(A,B);
		
		when "11" => 
			op <= Eq(A, B);
		
		when others => 
			op <= "000000";
	end case;
end process ; --alu
end a1 ; -- a1
