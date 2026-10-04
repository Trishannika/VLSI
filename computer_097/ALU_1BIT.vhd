library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_1BIT is
    Port (
        A      : in  STD_LOGIC;
        B      : in  STD_LOGIC;
        OPCODE : in  STD_LOGIC_VECTOR(2 downto 0);
        RESULT : out STD_LOGIC;
        COUT   : out STD_LOGIC;
        ZERO   : out STD_LOGIC
    );
end ALU_1BIT;


architecture Structural of ALU_1BIT is

    --------------------------------------------------
    -- FULL ADDER
    --------------------------------------------------
    component full_adder
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            CIN  : in  STD_LOGIC;
            SUM  : out STD_LOGIC;
            COUT : out STD_LOGIC
        );
    end component;


    --------------------------------------------------
    -- FULL SUBTRACTOR
    --------------------------------------------------
    component full_subtractor
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Bin  : in  STD_LOGIC;
            D    : out STD_LOGIC;
            Bout : out STD_LOGIC
        );
    end component;


    --------------------------------------------------
    -- AND GATE
    --------------------------------------------------
    component and_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;


    --------------------------------------------------
    -- OR GATE
    --------------------------------------------------
    component or_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;


    --------------------------------------------------
    -- NOT GATE
    --------------------------------------------------
    component not_gate
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;


    --------------------------------------------------
    -- MUX 8 TO 1
    --------------------------------------------------
    component MUX8_1
        Port (
            D0 : in  STD_LOGIC;
            D1 : in  STD_LOGIC;
            D2 : in  STD_LOGIC;
            D3 : in  STD_LOGIC;
            D4 : in  STD_LOGIC;
            D5 : in  STD_LOGIC;
            D6 : in  STD_LOGIC;
            D7 : in  STD_LOGIC;
            S0 : in  STD_LOGIC;
            S1 : in  STD_LOGIC;
            S2 : in  STD_LOGIC;
            Y  : out STD_LOGIC
        );
    end component;


    --------------------------------------------------
    -- INTERNAL SIGNALS
    --------------------------------------------------

    signal ADD_RESULT : STD_LOGIC;
    signal ADD_COUT   : STD_LOGIC;

    signal SUB_RESULT : STD_LOGIC;
    signal SUB_BOUT   : STD_LOGIC;

    signal AND_RESULT : STD_LOGIC;
    signal OR_RESULT  : STD_LOGIC;

    signal NOR_TEMP   : STD_LOGIC;
    signal NOR_RESULT : STD_LOGIC;

    signal NOT_RESULT : STD_LOGIC;

    signal ALU_RESULT : STD_LOGIC;


begin

    --------------------------------------------------
    -- ADD
    -- OPCODE = 000
    --------------------------------------------------

    ADD1 : full_adder
        port map (
            A    => A,
            B    => B,
            CIN  => '0',
            SUM  => ADD_RESULT,
            COUT => ADD_COUT
        );


    --------------------------------------------------
    -- SUBTRACT
    -- OPCODE = 001
    --
    -- A - B
    -- Full Subtractor
    -- Bin = 0
    --------------------------------------------------

    SUB1 : full_subtractor
        port map (
            A    => A,
            B    => B,
            Bin  => '0',
            D    => SUB_RESULT,
            Bout => SUB_BOUT
        );


    --------------------------------------------------
    -- AND
    -- OPCODE = 010
    --------------------------------------------------

    AND1 : and_gate
        port map (
            A => A,
            B => B,
            Y => AND_RESULT
        );


    --------------------------------------------------
    -- OR
    -- OPCODE = 011
    --------------------------------------------------

    OR1 : or_gate
        port map (
            A => A,
            B => B,
            Y => OR_RESULT
        );


    --------------------------------------------------
    -- NOR
    -- OPCODE = 100
    --
    -- NOR = NOT(A OR B)
    --------------------------------------------------

    NOR_OR : or_gate
        port map (
            A => A,
            B => B,
            Y => NOR_TEMP
        );

    NOR_NOT : not_gate
        port map (
            A => NOR_TEMP,
            Y => NOR_RESULT
        );


    --------------------------------------------------
    -- NOT
    -- OPCODE = 101
    --
    -- NOT A
    --------------------------------------------------

    NOT1 : not_gate
        port map (
            A => A,
            Y => NOT_RESULT
        );


    --------------------------------------------------
    -- MUX 8 TO 1
    --
    -- 000 = ADD
    -- 001 = SUB
    -- 010 = AND
    -- 011 = OR
    -- 100 = NOR
    -- 101 = NOT
    -- 110 = 0
    -- 111 = 0
    --------------------------------------------------

    MUX1 : MUX8_1
        port map (
            D0 => ADD_RESULT,
            D1 => SUB_RESULT,
            D2 => AND_RESULT,
            D3 => OR_RESULT,
            D4 => NOR_RESULT,
            D5 => NOT_RESULT,
            D6 => '0',
            D7 => '0',

            S0 => OPCODE(0),
            S1 => OPCODE(1),
            S2 => OPCODE(2),

            Y => ALU_RESULT
        );


    --------------------------------------------------
    -- RESULT
    --------------------------------------------------

    RESULT <= ALU_RESULT;


    --------------------------------------------------
    -- COUT
    --
    -- ADD -> ADD_COUT
    -- SUB -> SUB_BOUT
    -- Others -> 0
    --------------------------------------------------

    process(OPCODE, ADD_COUT, SUB_BOUT)
    begin

        if OPCODE = "000" then

            COUT <= ADD_COUT;

        elsif OPCODE = "001" then

            COUT <= SUB_BOUT;

        else

            COUT <= '0';

        end if;

    end process;


    --------------------------------------------------
    -- ZERO FLAG
    --
    -- RESULT = 0 -> ZERO = 1
    -- RESULT = 1 -> ZERO = 0
    --------------------------------------------------

    ZERO1 : not_gate
        port map (
            A => ALU_RESULT,
            Y => ZERO
        );


end Structural;