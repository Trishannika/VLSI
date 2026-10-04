library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_8BIT_TB is
end ALU_8BIT_TB;


architecture Behavioral of ALU_8BIT_TB is

    component ALU_8BIT
        Port (
            A      : in  STD_LOGIC_VECTOR(7 downto 0);
            B      : in  STD_LOGIC_VECTOR(7 downto 0);
            OPCODE : in  STD_LOGIC_VECTOR(2 downto 0);

            RESULT : out STD_LOGIC_VECTOR(7 downto 0);
            COUT   : out STD_LOGIC;
            ZERO   : out STD_LOGIC
        );
    end component;


    signal A : STD_LOGIC_VECTOR(7 downto 0)
             := "00000000";

    signal B : STD_LOGIC_VECTOR(7 downto 0)
             := "00000000";

    signal OPCODE : STD_LOGIC_VECTOR(2 downto 0)
                  := "000";


    signal RESULT : STD_LOGIC_VECTOR(7 downto 0);

    signal COUT : STD_LOGIC;

    signal ZERO : STD_LOGIC;


begin

    UUT : ALU_8BIT
        port map (
            A      => A,
            B      => B,
            OPCODE => OPCODE,

            RESULT => RESULT,
            COUT   => COUT,
            ZERO   => ZERO
        );


    process
    begin

        --------------------------------------------------
        -- ADD
        -- 5 + 3
        -- Expected = 8
        --------------------------------------------------

        A <= "00000101";
        B <= "00000011";
        OPCODE <= "000";

        wait for 20 ns;


        --------------------------------------------------
        -- ADD
        -- 10 + 20
        -- Expected = 30
        --------------------------------------------------

        A <= "00001010";
        B <= "00010100";
        OPCODE <= "000";

        wait for 20 ns;


        --------------------------------------------------
        -- SUBTRACT
        -- 8 - 3
        -- Expected = 5
        --------------------------------------------------

        A <= "00001000";
        B <= "00000011";
        OPCODE <= "001";

        wait for 20 ns;


        --------------------------------------------------
        -- SUBTRACT
        -- 10 - 5
        -- Expected = 5
        --------------------------------------------------

        A <= "00001010";
        B <= "00000101";
        OPCODE <= "001";

        wait for 20 ns;


        --------------------------------------------------
        -- AND
        --------------------------------------------------

        A <= "10101010";
        B <= "11001100";
        OPCODE <= "010";

        wait for 20 ns;


        --------------------------------------------------
        -- OR
        --------------------------------------------------

        A <= "10101010";
        B <= "11001100";
        OPCODE <= "011";

        wait for 20 ns;


        --------------------------------------------------
        -- NOR
        --------------------------------------------------

        A <= "10101010";
        B <= "11001100";
        OPCODE <= "100";

        wait for 20 ns;


        --------------------------------------------------
        -- NOT A
        --------------------------------------------------

        A <= "10101010";
        B <= "00000000";
        OPCODE <= "101";

        wait for 20 ns;


        --------------------------------------------------
        -- ZERO TEST
        -- 0 + 0 = 0
        --------------------------------------------------

        A <= "00000000";
        B <= "00000000";
        OPCODE <= "000";

        wait for 20 ns;


        --------------------------------------------------
        -- AND ZERO TEST
        -- 1010 AND 0101 = 0000
        --------------------------------------------------

        A <= "10101010";
        B <= "01010101";
        OPCODE <= "010";

        wait for 20 ns;


        wait;

    end process;

end Behavioral;