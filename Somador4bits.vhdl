library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Somador4bits is
    Port ( A4 : in  STD_LOGIC_VECTOR(3 downto 0);
           B4 : in  STD_LOGIC_VECTOR(3 downto 0);
			  C_in4 :in STD_LOGIC;
           S4 : out  STD_LOGIC_VECTOR(3 downto 0);
			  C_out4: out std_logic
			  );
			  
end Somador4bits;

architecture Behavioral of Somador4bits is

component Somador1bit 
    Port ( C_in : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  S : out  STD_LOGIC;
           C_out : out  STD_LOGIC);
end component;
signal c1,c2,c3: STD_LOGIC;
begin

	Soma0: component Somador1bit
		port map(
			A => A4(3),
			B => B4(3),
			C_in => c3,
			C_out => C_out4,
			S => S4(3));
			
	Soma1:  component Somador1bit
		port map(
			A => A4(2),
			B => B4(2),
			C_in => c2,
			C_out => c3,
			S => S4(2));
	
	Soma2:  component Somador1bit
		port map(
			A => A4(1),
			B => B4(1),
			C_in => C1,	
			C_out => c2,
			S => S4(1));
			
	Soma3:  component Somador1bit
		port map(
			A => A4(0),
			B => B4(0),
			C_in => C_in4,
			C_out => C1,
			S => S4(0));

	
	
end Behavioral;

