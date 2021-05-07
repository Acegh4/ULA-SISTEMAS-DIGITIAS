library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Complementode2 is
    Port ( A2 : in  STD_LOGIC_VECTOR(3 downto 0);
           S2 : out  STD_LOGIC_VECTOR(3 downto 0));
end Complementode2;

architecture Behavioral of Complementode2 is

component Somador4bits is
    Port ( A4 : in  STD_LOGIC_VECTOR(3 downto 0);
           B4 : in  STD_LOGIC_VECTOR(3 downto 0);
			  C_in4 :in STD_LOGIC;
           S4 : out  STD_LOGIC_VECTOR(3 downto 0);
			  C_out4: out std_logic
			  );
			  
end component;
signal ov: std_logic;

begin

		Soma1: component Somador4bits
		port map(
			A4 => not A2,
			B4 => "0001",
			C_in4 => '0',
			S4 => S2,
			C_out4=>ov);
	
end Behavioral;

