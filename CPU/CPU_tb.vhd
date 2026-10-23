
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_CPU_8bit_Set7 is
end TB_CPU_8bit_Set7;

architecture Behavioral of TB_CPU_8bit_Set7 is

    signal CLK    : STD_LOGIC := '0';
    signal RESET  : STD_LOGIC := '1';
    signal RUN    : STD_LOGIC := '1';

    signal Q      : STD_LOGIC_VECTOR(7 downto 0);
    signal Z      : STD_LOGIC;
    signal PC_OUT : STD_LOGIC_VECTOR(3 downto 0);

begin

    DUT: entity work.CPU_8bit_Set7
        port map (
            CLK    => CLK,
            RESET  => RESET,
            Q      => Q,
            Z      => Z,
            PC_OUT => PC_OUT
        );

    -- Clock that stops without creating another rising edge
    CLOCK_PROCESS: process
    begin
        CLK <= '0';

        loop
            wait for 5 ns;
            exit when RUN = '0';

            CLK <= '1';
            wait for 5 ns;
            exit when RUN = '0';

            CLK <= '0';
        end loop;

        CLK <= '0';
        wait;
    end process;

    STIMULUS: process
    begin
        -- Reset for two rising edges
        RESET <= '1';

        wait until rising_edge(CLK);
        wait until rising_edge(CLK);
        wait for 1 ns;

        assert Q = x"00"
            report "FAIL: Reset ACC"
            severity error;

        assert Z = '1'
            report "FAIL: Reset Z should be 1"
            severity error;

        assert PC_OUT = "0000"
            report "FAIL: Reset PC should be 0"
            severity error;

        report "RESET PASSED" severity note;

        RESET <= '0';

        -- Cycle 1: LDI F3
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert Q = x"F3" and Z = '0' and PC_OUT = "0001"
            report "FAIL: LDI F3" severity error;

        -- Cycle 2: AND 3C
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert Q = x"30" and Z = '0' and PC_OUT = "0010"
            report "FAIL: AND 3C" severity error;

        -- Cycle 3: XOR 11
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert Q = x"21" and Z = '0' and PC_OUT = "0011"
            report "FAIL: XOR 11" severity error;

        -- Cycle 4: SHR
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert Q = x"10" and Z = '0' and PC_OUT = "0100"
            report "FAIL: SHR" severity error;

        -- Cycle 5: ADD 30
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert Q = x"40" and Z = '0' and PC_OUT = "0101"
            report "FAIL: ADD 30" severity error;

        -- Cycle 6: XOR 40
        wait until rising_edge(CLK);
        wait for 1 ns;
        assert Q = x"00" and Z = '1' and PC_OUT = "0110"
            report "FAIL: XOR 40" severity error;

        report "ALL SET 7 CHECKS PASSED"
            severity note;

        RUN <= '0';
        wait;
    end process;

end Behavioral;