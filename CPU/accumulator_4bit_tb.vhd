library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity accumulator_4bit_tb is
end accumulator_4bit_tb;

architecture Behavioral of accumulator_4bit_tb is

    component accumulator_4bit
        Port (
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            LOAD  : in  STD_LOGIC;
            A     : in  STD_LOGIC_VECTOR(3 downto 0);
            B     : in  STD_LOGIC_VECTOR(3 downto 0);
            Q     : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal CLK   : STD_LOGIC := '0';
    signal RESET : STD_LOGIC := '0';
    signal LOAD  : STD_LOGIC := '0';
    signal A     : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal B     : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Q     : STD_LOGIC_VECTOR(3 downto 0);

begin

    UUT: accumulator_4bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            A     => A,
            B     => B,
            Q     => Q
        );

    -- Clock generation
    CLK <= not CLK after 10 ns;

    -- Test cases
    process
    begin

        -- Test 1: RESET
        RESET <= '1';
        LOAD  <= '0';
        A     <= "0000";
        B     <= "0000";

        wait for 20 ns;

        -- Test 2: 3 + 5 = 8
        RESET <= '0';
        LOAD  <= '1';
        A     <= "0011";
        B     <= "0101";

        wait for 20 ns;

        -- Test 3: 2 + 1 = 3
        A     <= "0010";
        B     <= "0001";

        wait for 20 ns;

        -- Test 4: 15 + 1 = 0 (4-bit overflow)
        A     <= "1111";
        B     <= "0001";

        wait for 20 ns;

        -- Test 5: 10 + 5 = 15
        A     <= "1010";
        B     <= "0101";

        wait for 20 ns;

        -- Hold previous value
        LOAD <= '0';
        A    <= "0011";
        B    <= "0011";

        wait for 20 ns;

        wait;

    end process;

end Behavioral;