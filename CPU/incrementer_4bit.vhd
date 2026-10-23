library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity incrementer_4bit is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end incrementer_4bit;

architecture Structural of incrementer_4bit is

    component NOT_GATE
        Port (
            A : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component XOR_GATE
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component AND_GATE
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal C1, C2, C3 : STD_LOGIC;

begin

    -- Bit 0: Y0 = NOT A0
    NOT0: NOT_GATE
        port map (
            A => A(0),
            Y => Y(0)
        );

    -- Carry 1
    C1 <= A(0);

    -- Bit 1
    XOR1: XOR_GATE
        port map (
            A => A(1),
            B => C1,
            Y => Y(1)
        );

    AND1: AND_GATE
        port map (
            A => A(1),
            B => C1,
            Y => C2
        );

    -- Bit 2
    XOR2: XOR_GATE
        port map (
            A => A(2),
            B => C2,
            Y => Y(2)
        );

    AND2: AND_GATE
        port map (
            A => A(2),
            B => C2,
            Y => C3
        );

    -- Bit 3
    XOR3: XOR_GATE
        port map (
            A => A(3),
            B => C3,
            Y => Y(3)
        );

end Structural;