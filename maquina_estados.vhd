library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maquina_estados is
	Port(
		clock		: IN STD_LOGIC;
		ativa 	: IN STD_LOGIC;
		reset 	: IN STD_LOGIC;
		manual	: IN STD_LOGIC;
		manual_ativo: in STD_LOGIC;
		saida		: OUT STD_LOGIC_VECTOR(2 downto 0));
end maquina_estados;

architecture Behavioral of maquina_estados is
	type clock_ativo_type is (c0, c1, c2, c3, c4, c5, c6, c7);
	signal clock_ativo : clock_ativo_type;
	
	type estado_ativo_type is (e0, e1, e2, e3, e4, e5, e6, e7);
	signal estado_ativo : estado_ativo_type;

begin
	process (clock, reset)
	begin
		if reset = '1' then
			clock_ativo <= c0;
		elsif ((clock'event and clock = '1')) then
			case clock_ativo is
				when c0 =>
					if ativa = '1' then
						clock_ativo <= c1;
					else
						clock_ativo <= c0;
					end if;
				when c1 =>
					if ativa = '1' then
						clock_ativo <= c2;
					else
						clock_ativo <= c1;
					end if;
				when c2 =>
					if ativa = '1' then
						clock_ativo <= c3;
					else
						clock_ativo <= c2;
					end if;
				when c3 =>
					if ativa = '1' then
						clock_ativo <= c4;
					else
						clock_ativo <= c3;
					end if;
				when c4 =>
					if ativa = '1' then
						clock_ativo <= c5;
					else
						clock_ativo <= c4;
					end if;
				when c5 =>
					if ativa = '1' then
						clock_ativo <= c6;
					else
						clock_ativo <= c5;
					end if;
				when c6 =>
					if ativa = '1' then
						clock_ativo <= c7;
					else
						clock_ativo <= c6;
					end if;
				when c7 =>
					if ativa = '1' then
						clock_ativo <= c0;
					else
						clock_ativo <= c7;
					end if;
			end case;
		end if;
	end process;
	
	process (manual, reset)
	begin
		if reset = '1' then
			estado_ativo <= e0;
		elsif ((manual'event and manual = '1')) then
			case estado_ativo is
				when e0 =>
					if ativa = '1' then
						estado_ativo <= e1;
					else
						estado_ativo <= e0;
					end if;
				when e1 =>
					if ativa = '1' then
						estado_ativo <= e2;
					else
						estado_ativo <= e1;
					end if;
				when e2 =>
					if ativa = '1' then
						estado_ativo <= e3;
					else
						estado_ativo <= e2;
					end if;
				when e3 =>
					if ativa = '1' then
						estado_ativo <= e4;
					else
						estado_ativo <= e3;
					end if;
				when e4 =>
					if ativa = '1' then
						estado_ativo <= e5;
					else
						estado_ativo <= e4;
					end if;
				when e5 =>
					if ativa = '1' then
						estado_ativo <= e6;
					else
						estado_ativo <= e5;
					end if;
				when e6 =>
					if ativa = '1' then
						estado_ativo <= e7;
					else
						estado_ativo <= e6;
					end if;
				when e7 =>
					if ativa = '1' then
						estado_ativo <= e0;
					else
						estado_ativo <= e7;
					end if;
			end case;
		end if;
	end process;
	
	
	process (clock_ativo, estado_ativo)
	begin
		if (manual_ativo = '0') then
			case clock_ativo is
				when c0 =>
					saida <= "000";
				when c1 =>
					saida <= "001";
				when c2 =>
					saida <= "010";
				when c3 =>
					saida <= "011";
				when c4 =>
					saida <= "100";
				when c5 =>
					saida <= "101";
				when c6 =>
					saida <= "110";
				when c7 =>
					saida <= "111";
				end case;
		elsif(manual_ativo ='1') then
			case estado_ativo is
				when e0 =>
					saida <= "000";
				when e1 =>
					saida <= "001";
				when e2 =>
					saida <= "010";
				when e3 =>
					saida <= "011";
				when e4 =>
					saida <= "100";
				when e5 =>
					saida <= "101";
				when e6 =>
					saida <= "110";
				when e7 =>
					saida <= "111";
		end case;
		end if;
	end process;
end Behavioral;