library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX8_1 is
    Port (
        D0 : in  STD_LOGIC;
        D1 : in  STD_LOGIC;
        D2 : in  STD_LOGIC;
        D3 : in  STD_LOGIC;
        D4 : in  STD_LOGIC;
        D5 : in  STD_LOGIC;
        D6 : in  STD_LOGIC;
        D7 : in  STD_LOGIC;
        S0 : in  STD_LOGIC;
        S1 : in  STD_LOGIC;
        S2 : in  STD_LOGIC;
        Y  : out STD_LOGIC
    );
end MUX8_1;


architecture Behavioral of MUX8_1 is

begin

    process(S0, S1, S2, D0, D1, D2, D3, D4, D5, D6, D7)
    begin

        if S2 = '0' and S1 = '0' and S0 = '0' then
            Y <= D0;

        elsif S2 = '0' and S1 = '0' and S0 = '1' then
            Y <= D1;

        elsif S2 = '0' and S1 = '1' and S0 = '0' then
            Y <= D2;

        elsif S2 = '0' and S1 = '1' and S0 = '1' then
            Y <= D3;

        elsif S2 = '1' and S1 = '0' and S0 = '0' then
            Y <= D4;

        elsif S2 = '1' and S1 = '0' and S0 = '1' then
            Y <= D5;

        elsif S2 = '1' and S1 = '1' and S0 = '0' then
            Y <= D6;

        elsif S2 = '1' and S1 = '1' and S0 = '1' then
            Y <= D7;

        else
            Y <= '0';

        end if;

    end process;

end Behavioral;