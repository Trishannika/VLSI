library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_full_subtractor is
end tb_full_subtractor;

architecture Behavioral of tb_full_subtractor is

    component full_subtractor
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Bin  : in  STD_LOGIC;
            D    : out STD_LOGIC;
            Bout : out STD_LOGIC
        );
    end component;

    signal A    : STD_LOGIC := '0';
    signal B    : STD_LOGIC := '0';
    signal Bin  : STD_LOGIC := '0';
    signal D    : STD_LOGIC;
    signal Bout : STD_LOGIC;

begin

    UUT : full_subtractor
        port map (
            A    => A,
            B    => B,
            Bin  => Bin,
            D    => D,
            Bout => Bout
        );

    process
    begin

        -- 000
        A <= '0'; B <= '0'; Bin <= '0';
        wait for 10 ns;

        -- 001
        A <= '0'; B <= '0'; Bin <= '1';
        wait for 10 ns;

        -- 010
        A <= '0'; B <= '1'; Bin <= '0';
        wait for 10 ns;

        -- 011
        A <= '0'; B <= '1'; Bin <= '1';
        wait for 10 ns;

        -- 100
        A <= '1'; B <= '0'; Bin <= '0';
        wait for 10 ns;

        -- 101
        A <= '1'; B <= '0'; Bin <= '1';
        wait for 10 ns;

        -- 110
        A <= '1'; B <= '1'; Bin <= '0';
        wait for 10 ns;

        -- 111
        A <= '1'; B <= '1'; Bin <= '1';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;