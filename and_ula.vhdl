library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_ula is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           S : out  STD_LOGIC_VECTOR(3 downto 0));
end and_ula;

architecture Behavioral of and_ula is

begin

S <= A and B;

end Behavioral;
