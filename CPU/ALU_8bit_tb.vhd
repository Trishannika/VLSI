
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_ALU_8bit is
end TB_ALU_8bit;

architecture Behavioral of TB_ALU_8bit is

    component ALU_8bit
        Port (
            A    : in  STD_LOGIC_VECTOR(7 downto 0);
            B    : in  STD_LOGIC_VECTOR(7 downto 0);
            SEL  : in  STD_LOGIC_VECTOR(1 downto 0);
            Y    : out STD_LOGIC_VECTOR(7 downto 0);
            COUT : out STD_LOGIC
        );
    end component;

    signal A    : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal B    : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal SEL  : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal Y    : STD_LOGIC_VECTOR(7 downto 0);
    signal COUT : STD_LOGIC;

begin

    DUT: ALU_8bit
        port map (
            A    => A,
            B    => B,
            SEL  => SEL,
            Y    => Y,
            COUT => COUT
        );

    STIMULUS: process
    begin

        -- Test 1: AND (5 AND 3 = 1)
        A <= "00000101";
        B <= "00000011";
        SEL <= "00";
        wait for 100 ns;

        -- Test 2: ADD (5 + 3 = 8)
        A <= "00000101";
        B <= "00000011";
        SEL <= "01";
        wait for 100 ns;

        -- Test 3: ADD with carry (255 + 1 = 256)
        A <= "11111111";
        B <= "00000001";
        SEL <= "01";
        wait for 100 ns;

        -- Test 4: XOR (5 XOR 3 = 6)
        A <= "00000101";
        B <= "00000011";
        SEL <= "10";
        wait for 100 ns;

        -- Test 5: SHR (178 >> 1 = 89)
        A <= "10110010";
        B <= "00000000";
        SEL <= "11";
        wait for 100 ns;

        -- Test 6: AND (170 AND 204 = 136)
        A <= "10101010";
        B <= "11001100";
        SEL <= "00";
        wait for 100 ns;

        -- Test 7: XOR (170 XOR 204 = 102)
        A <= "10101010";
        B <= "11001100";
        SEL <= "10";
        wait for 100 ns;

        -- Test 8: SHR (8 >> 1 = 4)
        A <= "00001000";
        B <= "00000000";
        SEL <= "11";
        wait for 100 ns;

        wait;
    end process;

end Behavioral;