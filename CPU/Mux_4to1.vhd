library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_4to1 is
    Port (
        I0  : in  STD_LOGIC_VECTOR(3 downto 0);
        I1  : in  STD_LOGIC_VECTOR(3 downto 0);
        I2  : in  STD_LOGIC_VECTOR(3 downto 0);
        I3  : in  STD_LOGIC_VECTOR(3 downto 0);
        SEL : in  STD_LOGIC_VECTOR(1 downto 0);
        Y   : out STD_LOGIC_VECTOR(3 downto 0)
    );
end MUX_4to1;

architecture Structural of MUX_4to1 is
begin

    with SEL select

        Y <= I0 when "00",
             I1 when "01",
             I2 when "10",
             I3 when "11";

end Structural;