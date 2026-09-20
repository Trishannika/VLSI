library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_adder8bit_tb is
end Full_adder8bit_tb;

architecture Behavioral of Full_adder8bit_tb is

    signal A    : STD_LOGIC_VECTOR(7 downto 0);
    signal B    : STD_LOGIC_VECTOR(7 downto 0);
    signal Cin  : STD_LOGIC;
    signal Sum  : STD_LOGIC_VECTOR(7 downto 0);
    signal Cout : STD_LOGIC;

begin

    DUT: entity work.Full_adder8bit
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            Sum  => Sum,
            Cout => Cout
        );

    process
    begin

        A <= "00000101";
        B <= "00000011";
        Cin <= '0';
        wait for 10 ns;

        A <= "00001111";
        B <= "00000001";
        Cin <= '0';
        wait for 10 ns;

        A <= "11111111";
        B <= "00000001";
        Cin <= '0';
        wait for 10 ns;

        A <= "10101010";
        B <= "01010101";
        Cin <= '1';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;