library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latch4bit is
	Port(
		entrada:	in STD_LOGIC_VECTOR(3 downto 0);
		resetar, enable:	in STD_LOGIC;
		saida:	out STD_LOGIC_VECTOR(3 downto 0));
end latch4bit;

architecture Behavioral of latch4bit is

	component latch1bit is
		Port (set	: in STD_LOGIC;
				reset	: in STD_LOGIC;
				enable: in STD_LOGIC;
				Q		: out STD_LOGIC);
	end component;

begin

	bit0:	latch1bit port map(entrada(0), resetar, enable, saida(0));
	bit1: latch1bit port map(entrada(1), resetar, enable, saida(1));
	bit2: latch1bit port map(entrada(2), resetar, enable, saida(2));
	bit3: latch1bit port map(entrada(3), resetar, enable, saida(3));
end Behavioral;