
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_ROM is
    Port (
        ADDR  : in  STD_LOGIC_VECTOR(3 downto 0);
        INSTR : out STD_LOGIC_VECTOR(11 downto 0)
    );
end Program_ROM;

architecture Behavioral of Program_ROM is
begin
    process(ADDR)
    begin
        case ADDR is
            when "0000" => INSTR <= x"1F3"; -- LDI F3
            when "0001" => INSTR <= x"43C"; -- AND 3C
            when "0010" => INSTR <= x"611"; -- XOR 11
            when "0011" => INSTR <= x"900"; -- SHR
            when "0100" => INSTR <= x"230"; -- ADD 30
            when "0101" => INSTR <= x"640"; -- XOR 40
            when others => INSTR <= x"000"; -- NOP
        end case;
    end process;
end Behavioral;