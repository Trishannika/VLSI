library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_2to4 is
    Port (
        A  : in  STD_LOGIC_VECTOR(1 downto 0);
        EN : in  STD_LOGIC;
        Y  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end decoder_2to4;

architecture Structural of decoder_2to4 is

    component not_gate
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component and_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal A0_NOT : STD_LOGIC;
    signal A1_NOT : STD_LOGIC;

    signal D0 : STD_LOGIC;
    signal D1 : STD_LOGIC;
    signal D2 : STD_LOGIC;
    signal D3 : STD_LOGIC;

begin

    -- NOT gates
    U1: not_gate
        port map (
            A => A(0),
            Y => A0_NOT
        );

    U2: not_gate
        port map (
            A => A(1),
            Y => A1_NOT
        );

    -- Decoder logic
    U3: and_gate
        port map (
            A => A1_NOT,
            B => A0_NOT,
            Y => D0
        );

    U4: and_gate
        port map (
            A => A1_NOT,
            B => A(0),
            Y => D1
        );

    U5: and_gate
        port map (
            A => A(1),
            B => A0_NOT,
            Y => D2
        );

    U6: and_gate
        port map (
            A => A(1),
            B => A(0),
            Y => D3
        );

    -- Enable control
    U7: and_gate
        port map (
            A => D0,
            B => EN,
            Y => Y(0)
        );

    U8: and_gate
        port map (
            A => D1,
            B => EN,
            Y => Y(1)
        );

    U9: and_gate
        port map (
            A => D2,
            B => EN,
            Y => Y(2)
        );

    U10: and_gate
        port map (
            A => D3,
            B => EN,
            Y => Y(3)
        );

end Structural;