library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_4bit_TB is
end ALU_4bit_TB;

architecture Behavioral of ALU_4bit_TB is

    component ALU_4bit
        Port (
            A    : in  STD_LOGIC_VECTOR(3 downto 0);
            B    : in  STD_LOGIC_VECTOR(3 downto 0);
            SEL  : in  STD_LOGIC_VECTOR(1 downto 0);
            Y    : out STD_LOGIC_VECTOR(3 downto 0);
            COUT : out STD_LOGIC
        );
    end component;

    signal A    : STD_LOGIC_VECTOR(3 downto 0);
    signal B    : STD_LOGIC_VECTOR(3 downto 0);
    signal SEL  : STD_LOGIC_VECTOR(1 downto 0);

    signal Y    : STD_LOGIC_VECTOR(3 downto 0);
    signal COUT : STD_LOGIC;

begin

    -- Unit Under Test
    DUT : ALU_4bit
        port map (
            A    => A,
            B    => B,
            SEL  => SEL,
            Y    => Y,
            COUT => COUT
        );

    process
    begin

        ----------------------------------------------------------------
        -- STEP 1
        -- SEL = 00
        -- A = 1100
        -- B = 1010
        -- Operation = A AND B
        -- Expected Y = 1000
        -- Expected COUT = 0
        ----------------------------------------------------------------
        SEL <= "00";
        A   <= "1100";
        B   <= "1010";

        wait for 10 ns;

        assert (Y = "1000" and COUT = '0')
            report "STEP 1 FAILED"
            severity error;


        ----------------------------------------------------------------
        -- STEP 2
        -- SEL = 00
        -- A = 1111
        -- B = 0101
        -- Operation = A AND B
        -- Expected Y = 0101
        -- Expected COUT = 0
        ----------------------------------------------------------------
        SEL <= "00";
        A   <= "1111";
        B   <= "0101";

        wait for 10 ns;

        assert (Y = "0101" and COUT = '0')
            report "STEP 2 FAILED"
            severity error;


        ----------------------------------------------------------------
        -- STEP 3
        -- SEL = 01
        -- A = 1100
        -- B = 0011
        -- Operation = A OR B
        -- Expected Y = 1111
        -- Expected COUT = 0
        ----------------------------------------------------------------
        SEL <= "01";
        A   <= "1100";
        B   <= "0011";

        wait for 10 ns;

        assert (Y = "1111" and COUT = '0')
            report "STEP 3 FAILED"
            severity error;


        ----------------------------------------------------------------
        -- STEP 4
        -- SEL = 01
        -- A = 1001
        -- B = 0100
        -- Operation = A OR B
        -- Expected Y = 1101
        -- Expected COUT = 0
        ----------------------------------------------------------------
        SEL <= "01";
        A   <= "1001";
        B   <= "0100";

        wait for 10 ns;

        assert (Y = "1101" and COUT = '0')
            report "STEP 4 FAILED"
            severity error;


        ----------------------------------------------------------------
        -- STEP 5
        -- SEL = 10
        -- A = 0011
        -- B = 0101
        -- Operation = 3 + 5
        -- Expected Y = 1000
        -- Expected COUT = 0
        ----------------------------------------------------------------
        SEL <= "10";
        A   <= "0011";
        B   <= "0101";

        wait for 10 ns;

        assert (Y = "1000" and COUT = '0')
            report "STEP 5 FAILED"
            severity error;


        ----------------------------------------------------------------
        -- STEP 6
        -- SEL = 10
        -- A = 1111
        -- B = 0001
        -- Operation = 15 + 1
        -- Expected Y = 0000
        -- Expected COUT = 1
        ----------------------------------------------------------------
        SEL <= "10";
        A   <= "1111";
        B   <= "0001";

        wait for 10 ns;

        assert (Y = "0000" and COUT = '1')
            report "STEP 6 FAILED"
            severity error;


        ----------------------------------------------------------------
        -- STEP 7
        -- SEL = 10
        -- A = 1010
        -- B = 0101
        -- Operation = 10 + 5
        -- Expected Y = 1111
        -- Expected COUT = 0
        ----------------------------------------------------------------
        SEL <= "10";
        A   <= "1010";
        B   <= "0101";

        wait for 10 ns;

        assert (Y = "1111" and COUT = '0')
            report "STEP 7 FAILED"
            severity error;


        ----------------------------------------------------------------
        -- STEP 8
        -- SEL = 11
        -- Operation = Unused
        -- Expected Y = 0000
        -- Expected COUT = 0
        ----------------------------------------------------------------
        SEL <= "11";
        A   <= "1010";
        B   <= "0101";

        wait for 10 ns;

        assert (Y = "0000" and COUT = '0')
            report "STEP 8 FAILED"
            severity error;


        ----------------------------------------------------------------
        -- ALL TESTS COMPLETED
        ----------------------------------------------------------------
        report "ALL 8 TESTS PASSED SUCCESSFULLY"
            severity note;

        wait;

    end process;

end Behavioral;