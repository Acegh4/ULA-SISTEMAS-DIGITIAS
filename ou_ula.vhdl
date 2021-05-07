library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ou_ula is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           S : out  STD_LOGIC_VECTOR(3 downto 0));
end ou_ula;

architecture Behavioral of ou_ula is

begin

S <= A or B;

end Behavioral;