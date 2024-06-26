library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
    port (
        A : in std_logic_vector(3 downto 0); 
        B : in std_logic_vector(3 downto 0);
        S : in std_logic_vector(1 downto 0);
        Y : out std_logic_vector(7 downto 0)               
    );
end entity ALU;

architecture behav of ALU is

    function concat(A, B : std_logic_vector(3 downto 0)) return std_logic_vector is
    begin
        return A & B;
    end function;

    function sub(A, B : signed(3 downto 0)) return signed is
        variable A_EX, B_EX : signed(4 downto 0);
    begin
        A_EX := '0' & A;
        B_EX := '0' & B;
        return A_EX - B_EX;
    end function;

    function XOR_func(A, B : std_logic_vector(3 downto 0)) return std_logic_vector is
    begin
        return A xor B;
    end function;

    function shift(A : std_logic_vector(3 downto 0); B : std_logic_vector(3 downto 0)) return std_logic_vector is
        variable res : std_logic_vector(3 downto 0);
        variable direc : std_logic;
        variable shift_amt : integer;
    begin
        direc := B(3); 
        shift_amt := to_integer(unsigned(B(1 downto 0)));         
        if direc = '0' then
            res := std_logic_vector(shift_left(unsigned(A), shift_amt));
        else
            res := std_logic_vector(shift_right(unsigned(A), shift_amt));
        end if;
        return res;
    end function;

begin
    process (A, B, S)
        variable temp : signed(4 downto 0);
    begin
        if S = "00" then
            Y <= concat(A, B);
        elsif S = "01" then
            temp := sub(signed(A), signed(B));
            Y <= std_logic_vector(temp(4) & temp(4) & temp(4) & temp(4 downto 0));
        elsif S = "10" then
            Y <= "0000" & XOR_func(A, B);
        elsif S = "11" then
            Y <= "0000" & shift(A, B);
        else
            Y <= (others => '0');
        end if;
    end process;
end architecture;