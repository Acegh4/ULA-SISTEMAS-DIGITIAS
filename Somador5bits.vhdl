library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Somador5bits is
    Port ( A5 : in  STD_LOGIC_VECTOR(4 downto 0);
           B5 : in  STD_LOGIC_VECTOR(4 downto 0);
			  C_in5 :in STD_LOGIC;
           S5 : out  STD_LOGIC_VECTOR(4 downto 0);
			  C_out5: out std_logic
			  );
			  
end Somador5bits;

architecture Behavioral of Somador5bits is

component Somador1bit 
    Port ( C_in : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  S : out  STD_LOGIC;
           C_out : out  STD_LOGIC);
end component;
signal c1,c2,c3,c4: STD_LOGIC;
begin

	Soma0: component Somador1bit
		port map(
			A => A5(4),
			B => B5(4),
			C_in => c4,
			C_out => C_out5,
			S => S5(4));
			
	Soma1:  component Somador1bit
		port map(
			A => A5(3),
			B => B5(3),
			C_in => c3,
			C_out => c4,
			S => S5(3));
	
	Soma2:  component Somador1bit
		port map(
			A => A5(2),
			B => B5(2),
			C_in => C2,	
			C_out => c3,
			S => S5(2));
			
	Soma3:  component Somador1bit
		port map(
			A => A5(1),
			B => B5(1),
			C_in => C1,
			C_out => C2,
			S => S5(1));
	Soma4:  component Somador1bit
		port map(
			A => A5(0),
			B => B5(0),
			C_in => C_in5,
			C_out => C1,
			S => S5(0));
	
	
end Behavioral;

