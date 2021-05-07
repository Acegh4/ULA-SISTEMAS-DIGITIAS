library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Incrementa is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           S : out  STD_LOGIC_VECTOR(3 downto 0);
			  Carry: out STD_LOGIC);
end Incrementa;

architecture Behavioral of Incrementa is

component Somador4bits is
    Port ( A4 : in  STD_LOGIC_VECTOR(3 downto 0);
           B4 : in  STD_LOGIC_VECTOR(3 downto 0);
			  C_in4 :in STD_LOGIC;
           S4 : out  STD_LOGIC_VECTOR(3 downto 0);
			  C_out4: out std_logic
			  );
			  
end component;

signal zero: STD_LOGIC_VECTOR(3 downto 0);

begin
	zero <= "0000";
	S0: Somador4bits Port map(A, zero, '1', S, Carry);
end Behavioral;	