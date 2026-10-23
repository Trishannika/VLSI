library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_Unit is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end AND_Unit;

architecture Structural of AND_Unit is
begin

    Y(0) <= A(0) AND B(0);
    Y(1) <= A(1) AND B(1);
    Y(2) <= A(2) AND B(2);
    Y(3) <= A(3) AND B(3);

end Structural;