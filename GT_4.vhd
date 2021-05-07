library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GT_4 is
	Port( entrada: in STD_LOGIC_VECTOR(3 downto 0);
			estado: 	out STD_LOGIC
		  );
end GT_4;

architecture Behavioral of GT_4 is

begin

	process (entrada)
		begin
			if (entrada > "0100") then
				estado <= '1';
			else
				estado <= '0';
			end if;
	end process;
end Behavioral;