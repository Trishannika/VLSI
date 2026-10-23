library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_master_slave_ff is
end tb_master_slave_ff;

architecture Behavioral of tb_master_slave_ff is

    component master_slave_ff
        Port (
            D     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            Q     : out STD_LOGIC;
            Q_n   : out STD_LOGIC
        );
    end component;

    signal D   : STD_LOGIC := '0';
    signal CLK : STD_LOGIC := '0';
    signal Q   : STD_LOGIC;
    signal Q_n : STD_LOGIC;

begin

    -- Instantiate master-slave flip-flop
    DUT: master_slave_ff
        port map (
            D   => D,
            CLK => CLK,
            Q   => Q,
            Q_n => Q_n
        );

    -- Clock generation
    CLK_PROCESS: process
    begin
        while true loop
            CLK <= '0';
            wait for 10 ns;

            CLK <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Test input D
    STIMULUS: process
    begin

        -- Initially D = 0
        D <= '0';
        wait for 15 ns;

        -- Change D to 1
        D <= '1';
        wait for 20 ns;

        -- Change D to 0
        D <= '0';
        wait for 20 ns;

        -- Change D to 1
        D <= '1';
        wait for 20 ns;

        -- Change D to 0
        D <= '0';
        wait for 20 ns;

        -- End simulation
        wait;

    end process;

end Behavioral;