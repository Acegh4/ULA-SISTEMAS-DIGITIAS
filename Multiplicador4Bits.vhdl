library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 use ieee.numeric_std.all;  

entity Multiplicador4Bits is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (7 downto 0));
end Multiplicador4Bits;

architecture Behavioral of Multiplicador4Bits is
component and_ula is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           S : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component Shiftde8Bits is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
			  N : in integer;
           S : out  STD_LOGIC_VECTOR(7 downto 0));
end component;

component Somador8Bits is
Port ( A8 : in  STD_LOGIC_VECTOR(7 downto 0);
           B8 : in  STD_LOGIC_VECTOR(7 downto 0);
			  C_in8 :in STD_LOGIC;
           S8 : out  STD_LOGIC_VECTOR(7 downto 0);
			  C_out8: out std_logic
			  );
end component;

signal P1,P2,P3,P4,S1,S2,ps2,ps3,ps4 : STD_LOGIC_VECTOR (7 downto 0);
signal m1,m2,m3,m4,t1,t2,t3,t4 : STD_LOGIC_VECTOR (3 downto 0);
begin

	m4(0) <= A(0);
	m4(1) <= A(0);
	m4(2) <= A(0);
	m4(3) <= A(0);
	
	m3(0) <= A(1);
	m3(1) <= A(1);
	m3(2) <= A(1);
	m3(3) <= A(1);
	
	m2(0) <= A(2);
	m2(1) <= A(2);
	m2(2) <= A(2);
	m2(3) <= A(2);
	
	m1(0) <= A(3);
	m1(1) <= A(3);
	m1(2) <= A(3);
	m1(3) <= A(3);
	
	
	and1:component and_ula
    Port map( A => B,
           B => m4,
           S => t1);
	and2:component and_ula
    Port map( A => B,
           B => m3,
           S => t2);
	and3:component and_ula
    Port map( A => B,
           B => m2,
           S => t3);
	and4:component and_ula
    Port map( A => B,
           B => m1,
           S => t4);
			  
	P1 <="0000" & t1;
	P2 <="0000" & t2;
	P3 <="0000" & t3;
	P4 <="0000" & t4;

	shift1: component Shiftde8Bits 
    Port map( A=>P2,
				  N=> 1,
				  S =>Ps2);
	
	shift2: component Shiftde8Bits 
    Port map( A=>P3,
				  N=> 2,
				  S =>Ps3);
	
	shift3: component Shiftde8Bits 
    Port map( A=>P4,
				  N=> 3,
				  S =>Ps4);
	
Soma0:component Somador8Bits
    Port map ( A8 => P1,
           B8 => Ps2,
			  C_in8 =>'0',
           S8 => S1);
Soma1:component Somador8Bits
    Port map ( A8 => Ps3,
           B8 => Ps4,
			  C_in8 =>'0',
           S8 => S2);
Soma2:component Somador8Bits
    Port map ( A8 => S1,
           B8 => S2,
			  C_in8 =>'0',
           S8 => P);

end Behavioral;

