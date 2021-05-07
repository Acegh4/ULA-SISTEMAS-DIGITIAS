library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Complementode25bits is
    Port ( A25 : in  STD_LOGIC_VECTOR(4 downto 0);
           S25 : out  STD_LOGIC_VECTOR(4 downto 0));
end Complementode25bits;

architecture Behavioral of Complementode25bits is

component Somador5bits is
    Port ( A5 : in  STD_LOGIC_VECTOR(4 downto 0);
           B5 : in  STD_LOGIC_VECTOR(4 downto 0);
			  C_in5 :in STD_LOGIC;
           S5 : out  STD_LOGIC_VECTOR(4 downto 0);
			  C_out5: out std_logic
			  );
			  
end component;
signal ov: std_logic;

begin

		Soma1: component Somador5bits
		port map(
			A5 => not A25,
			B5 => "00001",
			C_in5 => '0',
			S5 => S25,
			C_out5=>ov);
	
end Behavioral;

