library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ou is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           S : out  STD_LOGIC_VECTOR(3 downto 0));
end Ou;

architecture Behavioral of Ou is

begin

S <= A or B;

end Behavioral;

