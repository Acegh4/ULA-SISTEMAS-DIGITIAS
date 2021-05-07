library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latch1bit is
		Port(
			set	: in STD_LOGIC;
			reset	: in STD_LOGIC;
			enable: in STD_LOGIC;
			Q	: out STD_LOGIC);
end latch1bit;

architecture Behavioral of latch1bit is

	signal Q2	: STD_LOGIC;
	signal notQ	: STD_LOGIC;

begin
	
	Q    <= Q2;
	Q2   <= notQ nor (enable and reset);
	notQ <= Q2 nor (enable and set);
	
end Behavioral;