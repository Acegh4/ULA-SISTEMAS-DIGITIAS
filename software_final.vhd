library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity software_final is
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
		
end software_final;

architecture Behavioral of software_final is
	
	signal op_atual: STD_LOGIC_VECTOR(3 downto 0);
	
	signal latch_reset: STD_LOGIC;
	signal latch_entrada0, latch_entrada1: STD_LOGIC_VECTOR(3 downto 0);
	
	signal resultado8bit: STD_LOGIC_VECTOR(7 downto 0);
	signal cen_tmp, dez_tmp, uni_tmp: STD_LOGIC_VECTOR(3 downto 0);
	signal cen_tmp_ex, dez_tmp_ex, uni_tmp_ex: STD_LOGIC_VECTOR(3 downto 0);
	signal magnitude: BOOLEAN;
	signal overflow: STD_LOGIC;
	
	signal correcao_soma: STD_LOGIC_VECTOR(7 downto 0);
	signal cen_soma, dez_soma, uni_soma: STD_LOGIC_VECTOR(3 downto 0);
	signal dez_sub, uni_sub: STD_LOGIC_VECTOR(3 downto 0);
	
	component permutador is
		Port(
			clock_per:	in std_logic;
			reset:		in STD_LOGIC;
			troca_manual: in STD_LOGIC;
			manual_ativo: in STD_LOGIC;
			operacao:	out std_logic_vector(3 downto 0));
	end component;
	
	component latch1bit is
		Port(
			set	: in STD_LOGIC;
			reset	: in STD_LOGIC;
			enable: in STD_LOGIC;
			Q	: out STD_LOGIC);
	end component;
	
	component latch4bit is
		Port(
			entrada:	in STD_LOGIC_VECTOR(3 downto 0);
			resetar, enable:	in STD_LOGIC;
			saida:	out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	
	component ULA is
		Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
				 Y : in STD_LOGIC_VECTOR (3 downto 0);
				Op : in STD_LOGIC_VECTOR (3 downto 0);
				RES: out STD_LOGIC_VECTOR (7 downto 0);
				sin: out boolean;
				over: out STD_LOGIC);
	end component;
	
	component conversorBCD is
		Port (entrada: in STD_LOGIC_VECTOR (7 downto 0);
			centena, dezena, unidade:	out STD_LOGIC_VECTOR (3 downto 0)
			);
	end component;

begin

latcher_reset: latch1bit port map(reset, set, '1', latch_reset);

operacao_atual: permutador port map(clock_fpga, latch_reset, clock_manual, manual_ativado, op_atual);

process(op_atual)
begin

if (op_atual = "0001" or op_atual = "0010" or op_atual = "0011" or op_atual = "0101") then
	saida_led <= '1';
		saida_HEX <= '0';
	else
		saida_led <= '0';
		saida_HEX <= '1';
end if;
end process;




latcher_entrada0: latch4bit port map(entrada0, reset, set xor reset, latch_entrada0);
latcher_entrada1: latch4bit port map(entrada1, reset, set xor reset, latch_entrada1);

operacoes: ULA port map(latch_entrada0, latch_entrada1, op_atual, resultado8bit, magnitude, overflow);

correcao_soma <= "000" & overflow & resultado8bit(3 downto 0);

BCD_somador:  conversorBCD port map(correcao_soma, cen_soma, dez_soma, uni_soma);
converterBCD: conversorBCD port map(resultado8bit, cen_tmp, dez_tmp, uni_tmp);
BCD_subtrator: conversorBCD port map(resultado8bit, open, dez_sub, uni_sub); 

process(cen_tmp_ex, dez_tmp_ex, uni_tmp_ex, magnitude, overflow)
begin

if (magnitude = TRUE) then
	cen_tmp_ex <= "1111";
	dez_tmp_ex <= dez_sub;
	uni_tmp_ex <= uni_sub;
elsif(op_atual = "0100" or op_atual = "0111") then
	cen_tmp_ex <= cen_soma;
	dez_tmp_ex <= dez_soma;
	uni_tmp_ex <= uni_soma;
else
	cen_tmp_ex <= cen_tmp;
	dez_tmp_ex <= dez_tmp;
	uni_tmp_ex <= uni_tmp;
end if;
end process;

process(op_atual)
begin
	if (latch_reset = '1') then
		op_saida <= "0000";
	else
		op_saida <= op_atual;
	end if;
end process;

saida_binario <= resultado8bit;


saida0 <= cen_tmp_ex;
saida1 <= dez_tmp_ex;
saida2 <= uni_tmp_ex;

end Behavioral;