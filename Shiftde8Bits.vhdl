library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shiftde8Bits is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
			  N : in integer;
           S : out  STD_LOGIC_VECTOR(7 downto 0));
end Shiftde8Bits;

architecture Behavioral of Shiftde8Bits is
begin
process(N,A) 
begin 
	if (N = 1) then 
	S <= A(6) & A(5) & A(4) & A(3) & A(2) & A(1) & A(0) & '0';
	elsif (N = 2) then 
	S <= A(5) & A(4) & A(3) & A(2) & A(1) & A(0) & '0' & '0';
	elsif (N = 3) then 
	S <= A(4) & A(3) & A(2) & A(1) & A(0) & '0' & '0' & '0';
	end if;
end process;

end Behavioral;

