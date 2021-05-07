library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ULA_8op is
	Port(
		SW: 			in STD_LOGIC_VECTOR(17 downto 0);
		KEY: 			in STD_LOGIC_VECTOR(3 downto 0);
		CLOCK_50:	in STD_LOGIC;
		LEDG:			out STD_LOGIC_VECTOR(8 downto 0);
		LEDR:			out STD_LOGIC_VECTOR(17 downto 0);
		HEX0, HEX1:	out STD_LOGIC_VECTOR(6 downto 0); 
		HEX2, HEX7, HEX6: out STD_LOGIC_VECTOR(6 downto 0);
		HEX5, HEX4: out STD_LOGIC_VECTOR(6 downto 0) 
		);
end ULA_8op;

architecture Behavioral of ULA_8op is

	signal centenas, dezenas, unidades: STD_LOGIC_VECTOR(3 downto 0);
	signal cen_7seg, dez_7seg, uni_7seg: STD_LOGIC_VECTOR(6 downto 0);
	signal led_ativo, hex_ativo: STD_LOGIC;
	signal operacao: STD_LOGIC_VECTOR(3 downto 0);
	signal op_7seg: STD_LOGIC_VECTOR(6 downto 0);
	signal binario:  STD_LOGIC_VECTOR(7 downto 0);
	signal op_one: STD_LOGIC_VECTOR(7 downto 0); 
	signal X_7seg_dig1, Y_7seg_dig1, X_7seg_dig2, Y_7seg_dig2: STD_LOGIC_VECTOR(6 downto 0);
	signal X_dig1, X_dig2, Y_dig1, Y_dig2: STD_LOGIC_VECTOR(3 downto 0);
	
	component software_final is
		Port(
		entrada0, entrada1: in STD_LOGIC_VECTOR(3 downto 0);
		saida_led, saida_HEX: out STD_LOGIC;
		clock_fpga, clock_manual: in STD_LOGIC;
		manual_ativado: in STD_LOGIC;
		reset, set: in STD_LOGIC;
		op_saida: out STD_LOGIC_VECTOR(3 downto 0);
		saida0, saida1, saida2: out STD_LOGIC_VECTOR(3 downto 0);
		saida_binario: out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;
	
	component hex7display is
		Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
			two_bit: in STD_LOGIC;
          seg7 : out  STD_LOGIC_VECTOR (6 downto 0)
             );
	end component;
	
	component conversorBCD is
		Port (entrada: in STD_LOGIC_VECTOR (7 downto 0);
			centena, dezena, unidade:	out STD_LOGIC_VECTOR (3 downto 0)
			);
	end component;
	
	component onehot is
		Port(entrada: in STD_LOGIC_VECTOR(3 downto 0);
		  saida:  out STD_LOGIC_VECTOR(7 downto 0));
	end component;

begin
operacao_software: software_final port map(
							entrada0 	 	=> SW(17 downto 14),
							entrada1 	 	=> SW(12 downto 9),
							saida_led 	 	=> led_ativo,
							saida_HEX 	 	=> hex_ativo,
							clock_fpga 	 	=> CLOCK_50,
							clock_manual 	=> not KEY(2),
							manual_ativado => SW(0),
							reset				=> not KEY(3),
							set				=> not KEY(0),
							op_saida			=> operacao,
							saida0			=> centenas,
							saida1			=> dezenas,
							saida2			=> unidades,
							saida_binario	=> binario);

conversorX: conversorBCD port map("0000" & SW(17 downto 14), open, X_dig1, X_dig2);			
conversorY: conversorBCD port map("0000" & SW(12 downto 9), open, Y_dig1, Y_dig2);		
				
hex_X_dig1: hex7display port map(X_dig1, '1', X_7seg_dig1);
hex_X_dig2: hex7display port map(X_dig2, '1', X_7seg_dig2);

hex_Y_dig1: hex7display port map(Y_dig1, '1', Y_7seg_dig1);
hex_Y_dig2: hex7display port map(Y_dig2, '1', Y_7seg_dig2);
			
hex_centenas: hex7display port map(centenas, '0', cen_7seg);
hex_dezenas:  hex7display port map(dezenas, '0', dez_7seg);
hex_unidades: hex7display port map(unidades, '0', uni_7seg);
hex_operacao: hex7display port map(operacao, '0', op_7seg);

uni_operacao: onehot      port map(operacao, op_one);


process(cen_7seg, dez_7seg, uni_7seg, led_ativo, hex_ativo)
begin

	if (hex_ativo = '1') then
		HEX0 <= uni_7seg;
		HEX1 <= dez_7seg;
		HEX2 <= cen_7seg;
		
		LEDR <= "000000000000000000";
	else
		HEX0 <= "1111111";
		HEX1 <= "1111111";
		HEX2 <= "1111111";
		
		LEDR <= "0000000000" & binario;
	end if;
		

end process;

HEX7 <= X_7seg_dig1;
HEX6 <= X_7seg_dig2;

HEX5 <= Y_7seg_dig1;
HEX4 <= Y_7seg_dig2;

LEDG <= '0' & op_one;
----HEX7 <= op_7seg;----

end Behavioral;