
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM_16x12 is
    Port (
        ADDRESS     : in  STD_LOGIC_VECTOR(3 downto 0);
        INSTRUCTION : out STD_LOGIC_VECTOR(11 downto 0)
    );
end ROM_16x12;

architecture Structural of ROM_16x12 is

    component Decoder_4to16
        Port (
            ADDRESS : in  STD_LOGIC_VECTOR(3 downto 0);
            S       : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component OR_Gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal SEL : STD_LOGIC_VECTOR(15 downto 0);

    signal B11_A, B11_B : STD_LOGIC;
    signal B10_A, B10_B : STD_LOGIC;
    signal B9_A, B9_B   : STD_LOGIC;
    signal B8_A          : STD_LOGIC;

    signal B7_A          : STD_LOGIC;
    signal B6_A          : STD_LOGIC;
    signal B5_A, B5_B    : STD_LOGIC;
    signal B4_A, B4_B    : STD_LOGIC;

    signal B3_A          : STD_LOGIC;
    signal B2_A          : STD_LOGIC;
    signal B1_A          : STD_LOGIC;
    signal B0_A          : STD_LOGIC;

begin

    DECODER_INST : Decoder_4to16
        port map (
            ADDRESS => ADDRESS,
            S       => SEL
        );

    -- Bit 11: addresses 3
    INSTRUCTION(11) <= SEL(3);

    -- Bit 10: addresses 1, 2, 5
    OR10_A : OR_Gate port map(SEL(1), SEL(2), B10_A);
    OR10_B : OR_Gate port map(B10_A, SEL(5), INSTRUCTION(10));

    -- Bit 9: addresses 2, 4, 5
    OR9_A : OR_Gate port map(SEL(2), SEL(4), B9_A);
    OR9_B : OR_Gate port map(B9_A, SEL(5), INSTRUCTION(9));

    -- Bit 8: addresses 0, 3
    OR8_A : OR_Gate port map(SEL(0), SEL(3), INSTRUCTION(8));

    -- Bit 7: address 0
    INSTRUCTION(7) <= SEL(0);

    -- Bit 6: addresses 0, 5
    OR6_A : OR_Gate port map(SEL(0), SEL(5), INSTRUCTION(6));

    -- Bit 5: addresses 0, 1, 4
    OR5_A : OR_Gate port map(SEL(0), SEL(1), B5_A);
    OR5_B : OR_Gate port map(B5_A, SEL(4), INSTRUCTION(5));

    -- Bit 4: addresses 0, 1, 2, 4
    OR4_A : OR_Gate port map(SEL(0), SEL(1), B4_A);
    OR4_B : OR_Gate port map(SEL(2), SEL(4), B4_B);
    OR4_C : OR_Gate port map(B4_A, B4_B, INSTRUCTION(4));

    -- Bit 3: address 1
    INSTRUCTION(3) <= SEL(1);

    -- Bit 2: address 1
    INSTRUCTION(2) <= SEL(1);

    -- Bit 1: address 0
    INSTRUCTION(1) <= SEL(0);

    -- Bit 0: addresses 0, 2
    OR0_A : OR_Gate port map(SEL(0), SEL(2), INSTRUCTION(0));

end Structural;