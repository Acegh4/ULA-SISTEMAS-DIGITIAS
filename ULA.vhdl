library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ULA is 
		Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
				 Y : in STD_LOGIC_VECTOR (3 downto 0);
				Op : in STD_LOGIC_VECTOR (3 downto 0);
				RES: out STD_LOGIC_VECTOR (7 downto 0);
				sin: out boolean;
				over: out STD_LOGIC);
end ULA;

architecture Behavioral of ULA is

component and_ula is
		Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
             B : in  STD_LOGIC_VECTOR(3 downto 0);
             S : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component ou_ula is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           S : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component not_ula is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           Sa : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component Somador4bits is
    Port ( A4 : in  STD_LOGIC_VECTOR(3 downto 0);
           B4 : in  STD_LOGIC_VECTOR(3 downto 0);
			  C_in4 :in STD_LOGIC;
           S4 : out  STD_LOGIC_VECTOR(3 downto 0);
			  C_out4: out std_logic
			  );
			  
end component;

component Complementode2 is
    Port ( A2 : in  STD_LOGIC_VECTOR(3 downto 0);
           S2 : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

component Subtrator4bits is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           S : buffer  STD_LOGIC_VECTOR(3 downto 0);
			  sinal : buffer boolean);
end component;

component Multiplicador4Bits is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Incrementa is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           S : out  STD_LOGIC_VECTOR(3 downto 0);
			  Carry: out STD_LOGIC);
end component;

signal logicand, logicor, logicnot, soma, comp, sub, incr: STD_LOGIC_VECTOR (3 downto 0);
signal mult: STD_LOGIC_VECTOR (7 downto 0);
signal ov, ov2: STD_LOGIC;
signal mag: boolean;
begin	

		U0: and_ula Port map(X,Y,logicand);
		U1: ou_ula Port map(X,Y,logicor);
		U2: not_ula Port map(Y,logicnot);
		U3: Somador4bits Port map(X,Y,'0',soma,ov);
		U4: Complementode2 Port map(Y,comp);
		U5: Subtrator4bits Port map(X,Y,sub,mag);
		U6: Incrementa Port map(X,incr,ov2);
		U7: Multiplicador4Bits Port map(X,Y,mult);
		
process(logicand, logicor, logicnot, soma, comp, sub, incr, mult, mag, ov, ov2)
	begin 
		case Op is
			when "0001" => 
				RES  <= "0000" & logicand;
				sin  <= FALSE;
				over <= '0';
			when "0010" => 
				RES  <= "0000" & logicor;
				sin  <= FALSE;
				over <= '0';
			when "0011" => 
				RES  <= "0000" & logicnot;
				sin  <= FALSE;
				over <= '0';
			when "0100" => 
				RES  <= "0000" & soma;
				over <= ov;
				sin  <= FALSE;
			when "0101" => 
				RES <= "0000" & comp;
				sin  <= FALSE;
				over <= '0';
			when "0110" => 
				RES  <= "0000" & sub;
				sin  <= mag;
				over <= '0';
			when "0111" => 
				RES  <= "0000" & incr;
				over <= ov2;
				sin  <= FALSE;
			when "1000" => 
				RES  <= mult;
				sin  <= FALSE;
				over <= '0';
			when others =>
				RES  <= "00000000";
				sin  <= FALSE;
				over <= '0';
		end case;
	end process;
end Behavioral;

