library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex7display is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
        two_bit: in STD_LOGIC;
          seg7 : out  STD_LOGIC_VECTOR (6 downto 0)
             );
end hex7display;

architecture Behavioral of hex7display is
signal seg: STD_LOGIC_VECTOR(6 downto 0);
begin

--'a' corresponds to MSB of seg7 and 'g' corresponds to LSB of seg7.
process (A, two_bit)
BEGIN
    case A is
        when "0000"=> seg <="1000000";  -- '0'
        when "0001"=> seg <="1111001";  -- '1'
        when "0010"=> seg <="0100100";  -- '2'
        when "0011"=> seg <="0110000";  -- '3'
        when "0100"=> seg <="0011001";  -- '4' 
        when "0101"=> seg <="0010010";  -- '5'
        when "0110"=> seg <="0000010";  -- '6'
        when "0111"=> seg <="1111000";  -- '7'
        when "1000"=> seg <="0000000";  -- '8'
        when "1001"=> seg <="0011000";  -- '9'
        when "1010"=> seg <="0001000";
        when "1011"=> seg <="0000011";
        when "1100"=> seg <="1000110";
        when "1101"=> seg <="0100001";
        when "1110"=> seg <= "0000110";
        when "1111"=> 
        if (two_bit = '1') then seg <= "0001110";
            else seg <= "0111111";
        end if;
        when others =>  seg <= "1111111";
    end case;
end process;
seg7 <= seg;
end Behavioral;