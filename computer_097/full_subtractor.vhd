library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_subtractor is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Bin  : in  STD_LOGIC;
        D    : out STD_LOGIC;
        Bout : out STD_LOGIC
    );
end full_subtractor;

architecture Structural of full_subtractor is

    component xor_gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component not_gate
        Port (
            A : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component and_gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component or_gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal X1      : STD_LOGIC;
    signal NOT_A   : STD_LOGIC;
    signal NOT_X1  : STD_LOGIC;
    signal AND1    : STD_LOGIC;
    signal AND2    : STD_LOGIC;

begin

    -- A XOR B
    XOR1 : xor_gate
        port map(A, B, X1);

    -- Difference = (A XOR B) XOR Bin
    XOR2 : xor_gate
        port map(X1, Bin, D);

    -- NOT A
    NOT1 : not_gate
        port map(A, NOT_A);

    -- NOT A AND B
    AND1_G : and_gate
        port map(NOT_A, B, AND1);

    -- NOT (A XOR B)
    NOT2 : not_gate
        port map(X1, NOT_X1);

    -- NOT (A XOR B) AND Bin
    AND2_G : and_gate
        port map(NOT_X1, Bin, AND2);

    -- Borrow Out
    OR1 : or_gate
        port map(AND1, AND2, Bout);

end Structural;