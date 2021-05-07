library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity permutador is
	Port(
		clock_per:	in std_logic;
		reset:		in STD_LOGIC := '1';
		troca_manual: in STD_LOGIC;
		manual_ativo: in STD_LOGIC;
		operacao:	out std_logic_vector(3 downto 0));
end permutador;

architecture Behavioral of permutador is
	
	signal set_botao	:			std_logic;
	signal clock_real, lixo:	std_logic;
	signal op_pre, op_pos:		std_logic_vector(3 downto 0) := "0000";
	signal ativacao:				std_logic;
	
	component Somador4Bits is
		Port ( A4 : in  STD_LOGIC_VECTOR(3 downto 0);
           B4 : in  STD_LOGIC_VECTOR(3 downto 0);
			  C_in4 :in STD_LOGIC;
           S4 : out  STD_LOGIC_VECTOR(3 downto 0);
			  C_out4: out std_logic
			  );
	end component;
	
	component maquina_estados is
		Port(
			clock:	in std_logic;
			ativa:	in std_logic;
			reset:	in std_logic;
			manual:	in std_logic;
			manual_ativo: in std_logic;
			saida:	out std_logic_vector);
	end component;
	
	component divisor_clock is
		Port(
			clk:			in std_logic;
			reset:		in std_logic;
			clock_out:	out std_logic);
	end component;
	
	component latch1bit is
		Port(
			set	: in STD_LOGIC;
			reset	: in STD_LOGIC;
			enable: in STD_LOGIC;
			Q	: out STD_LOGIC);
	end component;
	
begin

	ativacao_maquina: latch1bit port map(reset, '0', '1', ativacao);
		
	divisao:	divisor_clock port map(clock_per, reset, clock_real);
	
	estado_atual: maquina_estados port map(
		clock_real, ativacao, reset, troca_manual, manual_ativo, op_pre(2 downto 0));
	
	corrigir_op:  Somador4Bits port map(
		op_pre, "0001", '0', op_pos, lixo);

		operacao <= op_pos;
	

end Behavioral;