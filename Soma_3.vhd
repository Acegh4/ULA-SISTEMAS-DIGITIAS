library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Soma_3 is
	Port (entrada: in STD_LOGIC_VECTOR (3 downto 0);
			saida:   out STD_LOGIC_VECTOR (3 downto 0)
			);
end Soma_3;

architecture Behavioral of Soma_3 is
	signal lixo: STD_LOGIC;
	
	component Somador4bits is
		Port(A4:   in  STD_LOGIC_VECTOR(3 downto 0);
			B4:     in  STD_LOGIC_VECTOR(3 downto 0);
			C_in4:  in STD_LOGIC;
         S4:     out  STD_LOGIC_VECTOR(3 downto 0);
			C_out4: out std_logic
			);
	end component;
	begin
		Soma: component Somador4bits
		port map(
			A4 => entrada,
			B4 => "0011",
			C_in4 => '0',
			S4 => saida,
			C_out4 => lixo
			);
	
end Behavioral;