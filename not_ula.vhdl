library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_ula is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           Sa : out  STD_LOGIC_VECTOR(3 downto 0));
end not_ula;

architecture Behavioral of not_ula is

begin

	Sa <= not A;
	
end Behavioral;