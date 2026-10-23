library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_PC_4bit is
end TB_PC_4bit;

architecture Behavioral of TB_PC_4bit is

    component PC_4bit
        Port (
            CLK     : in  STD_LOGIC;
            RESET   : in  STD_LOGIC;
            LOAD    : in  STD_LOGIC;
            JZ_ADDR : in  STD_LOGIC_VECTOR(3 downto 0);
            PC      : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal CLK     : STD_LOGIC := '0';
    signal RESET   : STD_LOGIC := '0';
    signal LOAD    : STD_LOGIC := '0';
    signal JZ_ADDR : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal PC      : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Unit Under Test
    DUT: PC_4bit
        port map (
            CLK     => CLK,
            RESET   => RESET,
            LOAD    => LOAD,
            JZ_ADDR => JZ_ADDR,
            PC      => PC
        );

    -- Clock: 10 ns period
    CLK <= not CLK after 5 ns;


    -- Test process
    PROCESS
    begin

        ------------------------------------------------
        -- TEST 1: RESET
        ------------------------------------------------
        RESET <= '1';
        LOAD  <= '0';
        JZ_ADDR <= "0000";

        wait for 10 ns;

        -- After rising edge:
        -- PC should become 0000


        ------------------------------------------------
        -- TEST 2: Normal PC increment
        ------------------------------------------------
        RESET <= '0';
        LOAD  <= '0';

        wait for 10 ns;
        -- PC = 0001

        wait for 10 ns;
        -- PC = 0010

        wait for 10 ns;
        -- PC = 0011

        wait for 10 ns;
        -- PC = 0100


        ------------------------------------------------
        -- TEST 3: JZ / LOAD
        ------------------------------------------------
        JZ_ADDR <= "0111";   -- Address 7
        LOAD    <= '1';

        wait for 10 ns;
        -- PC should become 0111


        ------------------------------------------------
        -- TEST 4: Continue increment after jump
        ------------------------------------------------
        LOAD <= '0';

        wait for 10 ns;
        -- PC = 1000

        wait for 10 ns;
        -- PC = 1001

        wait for 10 ns;
        -- PC = 1010


        ------------------------------------------------
        -- TEST 5: Another RESET
        ------------------------------------------------
        RESET <= '1';

        wait for 10 ns;
        -- PC should return to 0000


        ------------------------------------------------
        -- End simulation
        ------------------------------------------------
        RESET <= '0';

        wait;

    end process;

end Behavioral;