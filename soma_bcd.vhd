library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity soma_bcd is
	Port (entrada: in STD_LOGIC_VECTOR(11 downto 0);
		   saida: out 	STD_LOGIC_VECTOR(11 downto 0)
			);
end soma_bcd;
architecture Behavioral of soma_bcd is

signal bcd_cen, bcd_dez, bcd_uni: STD_LOGIC_VECTOR(3 downto 0);
signal bcd_temp: STD_LOGIC_VECTOR(11 downto 0);
signal saida_somacen, saida_somadez, saida_somauni: STD_LOGIC_VECTOR(3 downto 0);

component Soma_3 is
	Port(entrada:	in STD_LOGIC_VECTOR(3 downto 0);
		  saida:    out STD_LOGIC_VECTOR(3 downto 0)
		 );
	end component;

begin
bcd_temp <= entrada;
bcd_cen  <= bcd_temp(11 downto 8);
bcd_dez  <= bcd_temp(7 downto 4);
bcd_uni  <= bcd_temp(3 downto 0);

somacen: Soma_3 port map(bcd_cen, saida_somacen);
somadez: Soma_3 port map(bcd_dez, saida_somadez);
somauni: Soma_3 port map(bcd_uni, saida_somauni);

process(entrada)
begin
if (bcd_cen > "0100") then
	saida(11 downto 8) <= saida_somacen;
else
	saida(11 downto 8) <= bcd_cen;
end if;
end process;

process(entrada)
begin
if (bcd_dez > "0100") then
	saida(7 downto 4) <= saida_somadez;
else
	saida(7 downto 4) <= bcd_dez;
end if;
end process;

process(entrada)
begin
if (bcd_uni > "0100") then
	saida(3 downto 0) <= saida_somauni;
else
	saida(3 downto 0) <= bcd_uni;
end if;	
end process;

end Behavioral;