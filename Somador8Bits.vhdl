
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Somador8Bits is
Port ( A8 : in  STD_LOGIC_VECTOR(7 downto 0);
           B8 : in  STD_LOGIC_VECTOR(7 downto 0);
			  C_in8 :in STD_LOGIC;
           S8 : out  STD_LOGIC_VECTOR(7 downto 0);
			  C_out8: out std_logic
			  );
end Somador8Bits;

architecture Behavioral of Somador8Bits is
component Somador1Bit 
    Port ( C_in : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  S : out  STD_LOGIC;
           C_out : out  STD_LOGIC);
end component;
signal c1,c2,c3,c4,c5,c6,c7: STD_LOGIC;
begin
Soma0: component Somador1Bit
		port map(
			A => A8(7),
			B => B8(7),
			C_in => c7,
			C_out => C_out8,
			S => S8(7));
Soma1: component Somador1Bit
		port map(
			A => A8(6),
			B => B8(6),
			C_in => c6,
			C_out => c7,
			S => S8(6));
Soma2: component Somador1Bit
		port map(
			A => A8(5),
			B => B8(5),
			C_in => c5,
			C_out => c6,
			S => S8(5));
Soma3: component Somador1Bit
		port map(
			A => A8(4),
			B => B8(4),
			C_in => c4,
			C_out => c5,
			S => S8(4));
Soma4: component Somador1Bit
		port map(
			A => A8(3),
			B => B8(3),
			C_in => c3,
			C_out => c4,
			S => S8(3));
Soma5: component Somador1Bit
		port map(
			A => A8(2),
			B => B8(2),
			C_in => c2,
			C_out => c3,
			S => S8(2));
Soma6: component Somador1Bit
		port map(
			A => A8(1),
			B => B8(1),
			C_in => c1,
			C_out => c2,
			S => S8(1));
Soma7: component Somador1Bit
		port map(
			A => A8(0),
			B => B8(0),
			C_in => C_in8,
			C_out => c1,
			S => S8(0));
end Behavioral;

