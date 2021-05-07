library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shift20Bits is
	Port(	entrada: in STD_LOGIC_VECTOR(19 downto 0);
		 	saida:	out STD_LOGIC_VECTOR(19 downto 0)
		 );
end Shift20Bits;

architecture Behavioral of Shift20Bits is

begin

saida(19 downto 1) <= entrada(18 downto 0);
saida(0) <= '0';

end Behavioral;