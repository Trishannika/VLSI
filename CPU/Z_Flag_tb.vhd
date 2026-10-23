library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Z_Flag_tb is
end Z_Flag_tb;

architecture Behavioral of Z_Flag_tb is

    component Z_Flag
        Port (
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            LOAD  : in  STD_LOGIC;
            ACC   : in  STD_LOGIC_VECTOR(7 downto 0);
            Z     : out STD_LOGIC
        );
    end component;

    signal CLK   : STD_LOGIC := '0';
    signal RESET : STD_LOGIC := '0';
    signal LOAD  : STD_LOGIC := '0';
    signal ACC   : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal Z     : STD_LOGIC;

begin

    -- Instantiate Z_Flag
    DUT: Z_Flag
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            ACC   => ACC,
            Z     => Z
        );

    -- Clock: 10 ns period
    CLK <= not CLK after 5 ns;

    -- Test process
    process
    begin

        -- Test 1: Reset
        RESET <= '1';
        LOAD  <= '0';
        ACC   <= "00000000";

        wait for 10 ns;

        -- Test 2: ACC = 00
        RESET <= '0';
        LOAD  <= '1';
        ACC   <= "00000000";

        wait for 10 ns;

        -- Test 3: ACC = 05
        ACC <= "00000101";

        wait for 10 ns;

        -- Test 4: ACC = FF
        ACC <= "11111111";

        wait for 10 ns;

        -- Test 5: ACC = 01
        ACC <= "00000001";

        wait for 10 ns;

        -- Test 6: ACC = 00 again
        ACC <= "00000000";

        wait for 10 ns;

        -- Hold test
        LOAD <= '0';
        ACC  <= "00000101";

        wait for 10 ns;

        wait;

    end process;

end Behavioral;