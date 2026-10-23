
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_ROM_16x12 is
end TB_ROM_16x12;

architecture Behavioral of TB_ROM_16x12 is

    component ROM_16x12
        Port (
            ADDRESS     : in  STD_LOGIC_VECTOR(3 downto 0);
            INSTRUCTION : out STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;

    signal ADDRESS     : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal INSTRUCTION : STD_LOGIC_VECTOR(11 downto 0);

    type TEST_ARRAY is array (0 to 15)
        of STD_LOGIC_VECTOR(11 downto 0);

    constant EXPECTED : TEST_ARRAY := (
        0  => x"1F3",
        1  => x"43C",
        2  => x"611",
        3  => x"900",
        4  => x"230",
        5  => x"640",
        others => x"000"
    );

begin

    DUT: ROM_16x12
        port map (
            ADDRESS     => ADDRESS,
            INSTRUCTION => INSTRUCTION
        );

    TEST_PROCESS: process
    begin

        for i in 0 to 15 loop

            ADDRESS <= STD_LOGIC_VECTOR(to_unsigned(i, 4));

            wait for 10 ns;

            assert INSTRUCTION = EXPECTED(i)
                report "ERROR: ROM output mismatch at address "
                       & integer'image(i)
                severity error;

        end loop;

        report "ROM TEST FINISHED"
            severity note;

        wait;

    end process;

end Behavioral;