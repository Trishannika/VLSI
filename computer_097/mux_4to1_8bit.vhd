library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4to1_8bit is
    Port (
        I0 : in  STD_LOGIC_VECTOR(7 downto 0);
        I1 : in  STD_LOGIC_VECTOR(7 downto 0);
        I2 : in  STD_LOGIC_VECTOR(7 downto 0);
        I3 : in  STD_LOGIC_VECTOR(7 downto 0);

        S  : in  STD_LOGIC_VECTOR(1 downto 0);

        Y  : out STD_LOGIC_VECTOR(7 downto 0)
    );
end mux_4to1_8bit;

architecture Structural of mux_4to1_8bit is

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

    component or_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal S0_NOT : STD_LOGIC;
    signal S1_NOT : STD_LOGIC;

    signal A0 : STD_LOGIC_VECTOR(7 downto 0);
    signal A1 : STD_LOGIC_VECTOR(7 downto 0);
    signal A2 : STD_LOGIC_VECTOR(7 downto 0);
    signal A3 : STD_LOGIC_VECTOR(7 downto 0);

    signal B0 : STD_LOGIC_VECTOR(7 downto 0);
    signal B1 : STD_LOGIC_VECTOR(7 downto 0);
    signal B2 : STD_LOGIC_VECTOR(7 downto 0);
    signal B3 : STD_LOGIC_VECTOR(7 downto 0);

    signal O0 : STD_LOGIC_VECTOR(7 downto 0);
    signal O1 : STD_LOGIC_VECTOR(7 downto 0);
    signal O2 : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- NOT gates

    U1: not_gate
        port map (
            A => S(0),
            Y => S0_NOT
        );

    U2: not_gate
        port map (
            A => S(1),
            Y => S1_NOT
        );

    -- I0 selected when S = 00

    U3:  and_gate port map (A => I0(0), B => S0_NOT, Y => A0(0));
    U4:  and_gate port map (A => A0(0), B => S1_NOT, Y => B0(0));

    U5:  and_gate port map (A => I0(1), B => S0_NOT, Y => A0(1));
    U6:  and_gate port map (A => A0(1), B => S1_NOT, Y => B0(1));

    U7:  and_gate port map (A => I0(2), B => S0_NOT, Y => A0(2));
    U8:  and_gate port map (A => A0(2), B => S1_NOT, Y => B0(2));

    U9:  and_gate port map (A => I0(3), B => S0_NOT, Y => A0(3));
    U10: and_gate port map (A => A0(3), B => S1_NOT, Y => B0(3));

    U11: and_gate port map (A => I0(4), B => S0_NOT, Y => A0(4));
    U12: and_gate port map (A => A0(4), B => S1_NOT, Y => B0(4));

    U13: and_gate port map (A => I0(5), B => S0_NOT, Y => A0(5));
    U14: and_gate port map (A => A0(5), B => S1_NOT, Y => B0(5));

    U15: and_gate port map (A => I0(6), B => S0_NOT, Y => A0(6));
    U16: and_gate port map (A => A0(6), B => S1_NOT, Y => B0(6));

    U17: and_gate port map (A => I0(7), B => S0_NOT, Y => A0(7));
    U18: and_gate port map (A => A0(7), B => S1_NOT, Y => B0(7));

    -- I1 selected when S = 01

    U19: and_gate port map (A => I1(0), B => S0_NOT, Y => A1(0));
    U20: and_gate port map (A => A1(0), B => S(1), Y => B1(0));

    U21: and_gate port map (A => I1(1), B => S0_NOT, Y => A1(1));
    U22: and_gate port map (A => A1(1), B => S(1), Y => B1(1));

    U23: and_gate port map (A => I1(2), B => S0_NOT, Y => A1(2));
    U24: and_gate port map (A => A1(2), B => S(1), Y => B1(2));

    U25: and_gate port map (A => I1(3), B => S0_NOT, Y => A1(3));
    U26: and_gate port map (A => A1(3), B => S(1), Y => B1(3));

    U27: and_gate port map (A => I1(4), B => S0_NOT, Y => A1(4));
    U28: and_gate port map (A => A1(4), B => S(1), Y => B1(4));

    U29: and_gate port map (A => I1(5), B => S0_NOT, Y => A1(5));
    U30: and_gate port map (A => A1(5), B => S(1), Y => B1(5));

    U31: and_gate port map (A => I1(6), B => S0_NOT, Y => A1(6));
    U32: and_gate port map (A => A1(6), B => S(1), Y => B1(6));

    U33: and_gate port map (A => I1(7), B => S0_NOT, Y => A1(7));
    U34: and_gate port map (A => A1(7), B => S(1), Y => B1(7));

    -- I2 selected when S = 10

    U35: and_gate port map (A => I2(0), B => S(0), Y => A2(0));
    U36: and_gate port map (A => A2(0), B => S1_NOT, Y => B2(0));

    U37: and_gate port map (A => I2(1), B => S(0), Y => A2(1));
    U38: and_gate port map (A => A2(1), B => S1_NOT, Y => B2(1));

    U39: and_gate port map (A => I2(2), B => S(0), Y => A2(2));
    U40: and_gate port map (A => A2(2), B => S1_NOT, Y => B2(2));

    U41: and_gate port map (A => I2(3), B => S(0), Y => A2(3));
    U42: and_gate port map (A => A2(3), B => S1_NOT, Y => B2(3));

    U43: and_gate port map (A => I2(4), B => S(0), Y => A2(4));
    U44: and_gate port map (A => A2(4), B => S1_NOT, Y => B2(4));

    U45: and_gate port map (A => I2(5), B => S(0), Y => A2(5));
    U46: and_gate port map (A => A2(5), B => S1_NOT, Y => B2(5));

    U47: and_gate port map (A => I2(6), B => S(0), Y => A2(6));
    U48: and_gate port map (A => A2(6), B => S1_NOT, Y => B2(6));

    U49: and_gate port map (A => I2(7), B => S(0), Y => A2(7));
    U50: and_gate port map (A => A2(7), B => S1_NOT, Y => B2(7));

    -- I3 selected when S = 11

    U51: and_gate port map (A => I3(0), B => S(0), Y => A3(0));
    U52: and_gate port map (A => A3(0), B => S(1), Y => B3(0));

    U53: and_gate port map (A => I3(1), B => S(0), Y => A3(1));
    U54: and_gate port map (A => A3(1), B => S(1), Y => B3(1));

    U55: and_gate port map (A => I3(2), B => S(0), Y => A3(2));
    U56: and_gate port map (A => A3(2), B => S(1), Y => B3(2));

    U57: and_gate port map (A => I3(3), B => S(0), Y => A3(3));
    U58: and_gate port map (A => A3(3), B => S(1), Y => B3(3));

    U59: and_gate port map (A => I3(4), B => S(0), Y => A3(4));
    U60: and_gate port map (A => A3(4), B => S(1), Y => B3(4));

    U61: and_gate port map (A => I3(5), B => S(0), Y => A3(5));
    U62: and_gate port map (A => A3(5), B => S(1), Y => B3(5));

    U63: and_gate port map (A => I3(6), B => S(0), Y => A3(6));
    U64: and_gate port map (A => A3(6), B => S(1), Y => B3(6));

    U65: and_gate port map (A => I3(7), B => S(0), Y => A3(7));
    U66: and_gate port map (A => A3(7), B => S(1), Y => B3(7));

    -- OR all selected outputs

    U67: or_gate port map (A => B0(0), B => B1(0), Y => O0(0));
    U68: or_gate port map (A => B2(0), B => B3(0), Y => O1(0));
    U69: or_gate port map (A => O0(0), B => O1(0), Y => Y(0));

    U70: or_gate port map (A => B0(1), B => B1(1), Y => O0(1));
    U71: or_gate port map (A => B2(1), B => B3(1), Y => O1(1));
    U72: or_gate port map (A => O0(1), B => O1(1), Y => Y(1));

    U73: or_gate port map (A => B0(2), B => B1(2), Y => O0(2));
    U74: or_gate port map (A => B2(2), B => B3(2), Y => O1(2));
    U75: or_gate port map (A => O0(2), B => O1(2), Y => Y(2));

    U76: or_gate port map (A => B0(3), B => B1(3), Y => O0(3));
    U77: or_gate port map (A => B2(3), B => B3(3), Y => O1(3));
    U78: or_gate port map (A => O0(3), B => O1(3), Y => Y(3));

    U79: or_gate port map (A => B0(4), B => B1(4), Y => O0(4));
    U80: or_gate port map (A => B2(4), B => B3(4), Y => O1(4));
    U81: or_gate port map (A => O0(4), B => O1(4), Y => Y(4));

    U82: or_gate port map (A => B0(5), B => B1(5), Y => O0(5));
    U83: or_gate port map (A => B2(5), B => B3(5), Y => O1(5));
    U84: or_gate port map (A => O0(5), B => O1(5), Y => Y(5));

    U85: or_gate port map (A => B0(6), B => B1(6), Y => O0(6));
    U86: or_gate port map (A => B2(6), B => B3(6), Y => O1(6));
    U87: or_gate port map (A => O0(6), B => O1(6), Y => Y(6));

    U88: or_gate port map (A => B0(7), B => B1(7), Y => O0(7));
    U89: or_gate port map (A => B2(7), B => B3(7), Y => O1(7));
    U90: or_gate port map (A => O0(7), B => O1(7), Y => Y(7));

end Structural;