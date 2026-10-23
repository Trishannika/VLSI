library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_8bit_tb is
end register_8bit_tb;

architecture Behavioral of register_8bit_tb is

    component register_8bit
        Port (
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            LOAD  : in  STD_LOGIC;
            D     : in  STD_LOGIC_VECTOR(7 downto 0);
            Q     : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal CLK   : STD_LOGIC := '0';
    signal RESET : STD_LOGIC := '0';
    signal LOAD  : STD_LOGIC := '0';
    signal D     : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal Q     : STD_LOGIC_VECTOR(7 downto 0);

begin

    UUT: register_8bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => D,
            Q     => Q
        );

    -- Clock: 20 ns period
    CLK <= not CLK after 10 ns;

    stimulus: process
    begin

        -- =========================
        -- TEST 1: RESET
        -- =========================
        RESET <= '1';
        LOAD  <= '0';
        D     <= "00000000";

        wait for 20 ns;


        -- =========================
        -- TEST 2: LOAD 10101010
        -- =========================
        RESET <= '0';
        LOAD  <= '1';
        D     <= "10101010";

        wait for 20 ns;


        -- =========================
        -- TEST 3: LOAD 11110000
        -- =========================
        D <= "11110000";

        wait for 20 ns;


        -- =========================
        -- TEST 4: LOAD 01010101
        -- =========================
        D <= "01010101";

        wait for 20 ns;


        -- =========================
        -- TEST 5: HOLD
        -- =========================
        LOAD <= '0';
        D    <= "11111111";

        wait for 20 ns;


        -- =========================
        -- TEST 6: LOAD 11111111
        -- =========================
        LOAD <= '1';
        D    <= "11111111";

        wait for 20 ns;


        -- STOP
        wait;

    end process;

end Behavioral;