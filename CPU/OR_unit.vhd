library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_Unit is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end OR_Unit;

architecture Structural of OR_Unit is
begin

    Y(0) <= A(0) OR B(0);
    Y(1) <= A(1) OR B(1);
    Y(2) <= A(2) OR B(2);
    Y(3) <= A(3) OR B(3);

end Structural;