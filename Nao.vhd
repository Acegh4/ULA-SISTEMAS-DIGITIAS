library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nao is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           Sa : out  STD_LOGIC_VECTOR(3 downto 0);
           Sb : out  STD_LOGIC_VECTOR(3 downto 0));
end Nao;

architecture Behavioral of Nao is

begin

	Sa <= not A;
	Sb <= not B;

end Behavioral;

