library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_8BIT is
    Port (
        A      : in  STD_LOGIC_VECTOR(7 downto 0);
        B      : in  STD_LOGIC_VECTOR(7 downto 0);
        OPCODE : in  STD_LOGIC_VECTOR(2 downto 0);

        RESULT : out STD_LOGIC_VECTOR(7 downto 0);
        COUT   : out STD_LOGIC;
        ZERO   : out STD_LOGIC
    );
end ALU_8BIT;


architecture Structural of ALU_8BIT is

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


    signal CARRY : STD_LOGIC_VECTOR(8 downto 0);

    signal RESULT_INT : STD_LOGIC_VECTOR(7 downto 0);

    signal ZERO_BIT : STD_LOGIC_VECTOR(7 downto 0);

begin

    --------------------------------------------------
    -- Initial Carry
    --------------------------------------------------

    CARRY(0) <= '0';


    --------------------------------------------------
    -- ALU BIT 0
    --------------------------------------------------

    ALU0 : ALU_1BIT
        port map (
            A      => A(0),
            B      => B(0),
            OPCODE => OPCODE,
            RESULT => RESULT_INT(0),
            COUT   => CARRY(1),
            ZERO   => ZERO_BIT(0)
        );


    --------------------------------------------------
    -- ALU BIT 1
    --------------------------------------------------

    ALU1 : ALU_1BIT
        port map (
            A      => A(1),
            B      => B(1),
            OPCODE => OPCODE,
            RESULT => RESULT_INT(1),
            COUT   => CARRY(2),
            ZERO   => ZERO_BIT(1)
        );


    --------------------------------------------------
    -- ALU BIT 2
    --------------------------------------------------

    ALU2 : ALU_1BIT
        port map (
            A      => A(2),
            B      => B(2),
            OPCODE => OPCODE,
            RESULT => RESULT_INT(2),
            COUT   => CARRY(3),
            ZERO   => ZERO_BIT(2)
        );


    --------------------------------------------------
    -- ALU BIT 3
    --------------------------------------------------

    ALU3 : ALU_1BIT
        port map (
            A      => A(3),
            B      => B(3),
            OPCODE => OPCODE,
            RESULT => RESULT_INT(3),
            COUT   => CARRY(4),
            ZERO   => ZERO_BIT(3)
        );


    --------------------------------------------------
    -- ALU BIT 4
    --------------------------------------------------

    ALU4 : ALU_1BIT
        port map (
            A      => A(4),
            B      => B(4),
            OPCODE => OPCODE,
            RESULT => RESULT_INT(4),
            COUT   => CARRY(5),
            ZERO   => ZERO_BIT(4)
        );


    --------------------------------------------------
    -- ALU BIT 5
    --------------------------------------------------

    ALU5 : ALU_1BIT
        port map (
            A      => A(5),
            B      => B(5),
            OPCODE => OPCODE,
            RESULT => RESULT_INT(5),
            COUT   => CARRY(6),
            ZERO   => ZERO_BIT(5)
        );


    --------------------------------------------------
    -- ALU BIT 6
    --------------------------------------------------

    ALU6 : ALU_1BIT
        port map (
            A      => A(6),
            B      => B(6),
            OPCODE => OPCODE,
            RESULT => RESULT_INT(6),
            COUT   => CARRY(7),
            ZERO   => ZERO_BIT(6)
        );


    --------------------------------------------------
    -- ALU BIT 7
    --------------------------------------------------

    ALU7 : ALU_1BIT
        port map (
            A      => A(7),
            B      => B(7),
            OPCODE => OPCODE,
            RESULT => RESULT_INT(7),
            COUT   => CARRY(8),
            ZERO   => ZERO_BIT(7)
        );


    --------------------------------------------------
    -- Connect Internal Result to Output
    --------------------------------------------------

    RESULT <= RESULT_INT;


    --------------------------------------------------
    -- Final Carry Output
    --------------------------------------------------

    COUT <= CARRY(8);


    --------------------------------------------------
    -- ZERO FLAG
    --------------------------------------------------

    process(RESULT_INT)
    begin

        if RESULT_INT = "00000000" then
            ZERO <= '1';
        else
            ZERO <= '0';
        end if;

    end process;


end Structural;