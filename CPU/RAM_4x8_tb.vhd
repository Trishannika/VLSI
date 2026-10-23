library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RAM_4X8_TB is
end RAM_4X8_TB;

architecture Behavioral of RAM_4X8_TB is

    component RAM_4X8
        Port (
            CLK      : in  STD_LOGIC;
            RESET    : in  STD_LOGIC;
            WE       : in  STD_LOGIC;
            ADDRESS  : in  STD_LOGIC_VECTOR(1 downto 0);
            DATA_IN  : in  STD_LOGIC_VECTOR(7 downto 0);
            DATA_OUT : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal CLK      : STD_LOGIC := '0';
    signal RESET    : STD_LOGIC := '0';
    signal WE       : STD_LOGIC := '0';

    signal ADDRESS  : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal DATA_IN  : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal DATA_OUT : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- RAM Instance
    U1: RAM_4X8
        port map (
            CLK      => CLK,
            RESET    => RESET,
            WE       => WE,
            ADDRESS  => ADDRESS,
            DATA_IN  => DATA_IN,
            DATA_OUT => DATA_OUT
        );

    -- Clock Generation
    CLK <= not CLK after 5 ns;

    -- Test Process
    U2: process
    begin

        -- Reset RAM
        RESET <= '1';
        WE <= '0';
        wait for 10 ns;

        RESET <= '0';
        wait for 10 ns;


        -- Write DATA to Address 00
        ADDRESS <= "00";
        DATA_IN <= "10101010";
        WE <= '1';

        wait for 10 ns;

        WE <= '0';
        wait for 10 ns;


        -- Write DATA to Address 01
        ADDRESS <= "01";
        DATA_IN <= "11001100";
        WE <= '1';

        wait for 10 ns;

        WE <= '0';
        wait for 10 ns;


        -- Write DATA to Address 10
        ADDRESS <= "10";
        DATA_IN <= "11110000";
        WE <= '1';

        wait for 10 ns;

        WE <= '0';
        wait for 10 ns;


        -- Write DATA to Address 11
        ADDRESS <= "11";
        DATA_IN <= "00001111";
        WE <= '1';

        wait for 10 ns;

        WE <= '0';
        wait for 10 ns;


        -- Read Address 00
        ADDRESS <= "00";
        wait for 10 ns;


        -- Read Address 01
        ADDRESS <= "01";
        wait for 10 ns;


        -- Read Address 10
        ADDRESS <= "10";
        wait for 10 ns;


        -- Read Address 11
        ADDRESS <= "11";
        wait for 10 ns;


        wait;

    end process;

end Behavioral;