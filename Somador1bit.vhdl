library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Somador1bit is
    Port ( C_in : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  S : out  STD_LOGIC;
           C_out : out  STD_LOGIC);
end Somador1bit;

architecture Behavioral of Somador1bit is

begin

	C_out <= (A and B) or (A and C_in) or (B and C_in);
	S <= A xor B xor C_in;
	
end Behavioral;