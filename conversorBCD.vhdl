library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity conversorBCD is

	Port (entrada: in STD_LOGIC_VECTOR (7 downto 0);
			centena, dezena, unidade:	out STD_LOGIC_VECTOR (3 downto 0)
			);
end conversorBCD;

architecture Behavioral of conversorBCD is
	
	signal entrada_loop0, saida_loop0: STD_LOGIC_VECTOR(19 downto 0);
	signal entrada_loop1, saida_loop1: STD_LOGIC_VECTOR(19 downto 0);
	signal entrada_loop2, saida_loop2: STD_LOGIC_VECTOR(19 downto 0);
	signal entrada_loop3, saida_loop3: STD_LOGIC_VECTOR(19 downto 0);
	signal entrada_loop4, saida_loop4: STD_LOGIC_VECTOR(19 downto 0);
	signal entrada_loop5, saida_loop5: STD_LOGIC_VECTOR(19 downto 0);
	signal entrada_loop6, saida_loop6: STD_LOGIC_VECTOR(19 downto 0);
	signal entrada_loop7, saida_loop7: STD_LOGIC_VECTOR(19 downto 0);
	
	signal saida_final: STD_LOGIC_VECTOR(11 downto 0);
	
	signal bcd_centena, bcd_dezena, bcd_unidade: STD_LOGIC_VECTOR(3 downto 0) := "0000";

	component soma_bcd is
		Port (entrada: in STD_LOGIC_VECTOR(11 downto 0);
		      saida: out 	STD_LOGIC_VECTOR(11 downto 0)
			   );
	end component;
		
	component Shift20Bits is
		Port(entrada: in STD_LOGIC_VECTOR(19 downto 0);
			  saida:   out STD_LOGIC_VECTOR(19 downto 0)
			  );
	end component;		

begin
entrada_loop0 <= "000000000000" & entrada;


shift0: Shift20Bits port map(entrada_loop0, saida_loop0);
soma0:  soma_bcd    port map(saida_loop0(19 downto 8), entrada_loop1(19 downto 8));
entrada_loop1(7 downto 0) <= saida_loop0(7 downto 0);

shift1: Shift20Bits port map(entrada_loop1, saida_loop1);
soma1:  soma_bcd    port map(saida_loop1(19 downto 8), entrada_loop2(19 downto 8));
entrada_loop2(7 downto 0) <= saida_loop1(7 downto 0);

shift2: Shift20Bits port map(entrada_loop2, saida_loop2);
soma2:  soma_bcd    port map(saida_loop2(19 downto 8), entrada_loop3(19 downto 8));
entrada_loop3(7 downto 0) <= saida_loop2(7 downto 0);

shift3: Shift20Bits port map(entrada_loop3, saida_loop3);
soma3:  soma_bcd    port map(saida_loop3(19 downto 8), entrada_loop4(19 downto 8));
entrada_loop4(7 downto 0) <= saida_loop3(7 downto 0);

shift4: Shift20Bits port map(entrada_loop4, saida_loop4);
soma4:  soma_bcd    port map(saida_loop4(19 downto 8), entrada_loop5(19 downto 8));
entrada_loop5(7 downto 0) <= saida_loop4(7 downto 0);

shift5: Shift20Bits port map(entrada_loop5, saida_loop5);
soma5:  soma_bcd    port map(saida_loop5(19 downto 8), entrada_loop6(19 downto 8));
entrada_loop6(7 downto 0) <= saida_loop5(7 downto 0);

shift6: Shift20Bits port map(entrada_loop6, saida_loop6);
soma6:  soma_bcd    port map(saida_loop6(19 downto 8), entrada_loop7(19 downto 8));
entrada_loop7(7 downto 0) <= saida_loop6(7 downto 0);

shift7: Shift20Bits port map(entrada_loop7, saida_loop7);
saida_final <= saida_loop7(19 downto 8);


centena <= saida_final(11 downto 8) or "0000";
dezena  <= saida_final(7 downto 4) or "0000";
unidade <= saida_final(3 downto 0) or "0000";


end Behavioral;
