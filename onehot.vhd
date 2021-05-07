library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity onehot is
	Port(entrada: in STD_LOGIC_VECTOR(3 downto 0);
		  saida:  out STD_LOGIC_VECTOR(7 downto 0));
end onehot;

architecture Behavioral of onehot is

begin

process (entrada)
begin
    case entrada is
        when "0001"=> saida <="00000001";  -- '0'
        when "0010"=> saida <="00000010";  -- '1'
        when "0011"=> saida <="00000100";  -- '2'
        when "0100"=> saida <="00001000";  -- '3'
        when "0101"=> saida <="00010000";  -- '4' 
        when "0110"=> saida <="00100000";  -- '5'
        when "0111"=> saida <="01000000";  -- '6'
		  when "1000"=> saida <="10000000";
        when others =>  NULL;
    end case;
end process;

end Behavioral;