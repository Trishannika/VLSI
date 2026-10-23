
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_4to16 is
    Port (
        ADDRESS : in  STD_LOGIC_VECTOR(3 downto 0);
        S       : out STD_LOGIC_VECTOR(15 downto 0)
    );
end Decoder_4to16;

architecture Structural of Decoder_4to16 is

    component decoder_2to4
        Port (
            A  : in  STD_LOGIC_VECTOR(1 downto 0);
            EN : in  STD_LOGIC;
            Y  : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component and_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal HIGH_SEL : STD_LOGIC_VECTOR(3 downto 0);
    signal LOW_SEL  : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Decode the upper two address bits
    U1: decoder_2to4
        port map (
            A  => ADDRESS(3 downto 2),
            EN => '1',
            Y  => HIGH_SEL
        );

    -- Decode the lower two address bits
    U2: decoder_2to4
        port map (
            A  => ADDRESS(1 downto 0),
            EN => '1',
            Y  => LOW_SEL
        );

    -- Combine both decoder outputs
    GEN_HIGH: for i in 0 to 3 generate
        GEN_LOW: for j in 0 to 3 generate

            U_AND: and_gate
                port map (
                    A => HIGH_SEL(i),
                    B => LOW_SEL(j),
                    Y => S(i*4 + j)
                );

        end generate GEN_LOW;
    end generate GEN_HIGH;

end Structural;