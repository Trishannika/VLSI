library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity accumulator_8bit_tb is
end accumulator_8bit_tb;

architecture Behavioral of accumulator_8bit_tb is

    component accumulator_8bit
        Port (
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            LOAD  : in  STD_LOGIC;
            A     : in  STD_LOGIC_VECTOR(7 downto 0);
            B     : in  STD_LOGIC_VECTOR(7 downto 0);
            Q     : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal CLK   : STD_LOGIC := '0';
    signal RESET : STD_LOGIC := '0';
    signal LOAD  : STD_LOGIC := '1';

    signal A     : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal B     : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal Q     : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- Unit Under Test
    UUT: accumulator_8bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            A     => A,
            B     => B,
            Q     => Q
        );

    -- Clock Generation
    CLK <= not CLK after 10 ns;

    -- Test Sequence
    process
    begin

        ------------------------------------------------
        -- STEP 1: RESET
        -- Expected Q = 00000000
        ------------------------------------------------
        RESET <= '1';
        A     <= "00000000";
        B     <= "00000000";

        wait for 20 ns;


        ------------------------------------------------
        -- STEP 2: 3 + 5 = 8
        -- Expected Q = 00001000
        ------------------------------------------------
        RESET <= '0';
        A     <= "00000011";
        B     <= "00000101";

        wait for 20 ns;


        ------------------------------------------------
        -- STEP 3: 2 + 1 = 3
        -- Expected Q = 00000011
        ------------------------------------------------
        A     <= "00000010";
        B     <= "00000001";

        wait for 20 ns;


        ------------------------------------------------
        -- STEP 4: 255 + 1 = 256
        -- 8-bit result = 00000000
        ------------------------------------------------
        A     <= "11111111";
        B     <= "00000001";

        wait for 20 ns;


        ------------------------------------------------
        -- STEP 5: 170 + 5 = 175
        -- Expected Q = 10101111
        ------------------------------------------------
        A     <= "10101010";
        B     <= "00000101";

        wait for 20 ns;


        -- End simulation
        wait;

    end process;

end Behavioral;