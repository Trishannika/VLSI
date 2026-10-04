library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_1BIT_TB is
end ALU_1BIT_TB;

architecture Behavioral of ALU_1BIT_TB is

    component ALU_1BIT
        Port (
            A      : in  STD_LOGIC;
            B      : in  STD_LOGIC;
            OPCODE : in  STD_LOGIC_VECTOR(2 downto 0);
            RESULT : out STD_LOGIC;
            COUT   : out STD_LOGIC;
            ZERO   : out STD_LOGIC
        );
    end component;

    signal A      : STD_LOGIC := '0';
    signal B      : STD_LOGIC := '0';
    signal OPCODE : STD_LOGIC_VECTOR(2 downto 0) := "000";

    signal RESULT : STD_LOGIC;
    signal COUT   : STD_LOGIC;
    signal ZERO   : STD_LOGIC;

begin

    UUT : ALU_1BIT
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

        -- ADD : 0 + 0
        A <= '0';
        B <= '0';
        OPCODE <= "000";
        wait for 20 ns;

        -- ADD : 1 + 0
        A <= '1';
        B <= '0';
        OPCODE <= "000";
        wait for 20 ns;

        -- ADD : 1 + 1
        A <= '1';
        B <= '1';
        OPCODE <= "000";
        wait for 20 ns;


        -- SUB : 1 - 0
        A <= '1';
        B <= '0';
        OPCODE <= "001";
        wait for 20 ns;

        -- SUB : 0 - 1
        A <= '0';
        B <= '1';
        OPCODE <= "001";
        wait for 20 ns;


        -- AND : 1 AND 1
        A <= '1';
        B <= '1';
        OPCODE <= "010";
        wait for 20 ns;

        -- AND : 1 AND 0
        A <= '1';
        B <= '0';
        OPCODE <= "010";
        wait for 20 ns;


        -- OR : 0 OR 1
        A <= '0';
        B <= '1';
        OPCODE <= "011";
        wait for 20 ns;

        -- OR : 0 OR 0
        A <= '0';
        B <= '0';
        OPCODE <= "011";
        wait for 20 ns;


        -- NOR : 0 NOR 0
        A <= '0';
        B <= '0';
        OPCODE <= "100";
        wait for 20 ns;

        -- NOR : 1 NOR 0
        A <= '1';
        B <= '0';
        OPCODE <= "100";
        wait for 20 ns;


        -- NOT A : NOT 0
        A <= '0';
        B <= '0';
        OPCODE <= "101";
        wait for 20 ns;

        -- NOT A : NOT 1
        A <= '1';
        B <= '0';
        OPCODE <= "101";
        wait for 20 ns;


        wait;

    end process;

end Behavioral;