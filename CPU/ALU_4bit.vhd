library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_4bit is
    Port (
        A    : in  STD_LOGIC_VECTOR(3 downto 0);
        B    : in  STD_LOGIC_VECTOR(3 downto 0);
        SEL  : in  STD_LOGIC_VECTOR(1 downto 0);
        Y    : out STD_LOGIC_VECTOR(3 downto 0);
        COUT : out STD_LOGIC
    );
end ALU_4bit;

architecture Structural of ALU_4bit is

    component AND_Unit
        Port (
            A : in  STD_LOGIC_VECTOR(3 downto 0);
            B : in  STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component OR_Unit
        Port (
            A : in  STD_LOGIC_VECTOR(3 downto 0);
            B : in  STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component adder_4bit
        Port (
            A    : in  STD_LOGIC_VECTOR(3 downto 0);
            B    : in  STD_LOGIC_VECTOR(3 downto 0);
            CIN  : in  STD_LOGIC;
            SUM  : out STD_LOGIC_VECTOR(3 downto 0);
            COUT : out STD_LOGIC
        );
    end component;

    component MUX_4to1
        Port (
            I0  : in  STD_LOGIC_VECTOR(3 downto 0);
            I1  : in  STD_LOGIC_VECTOR(3 downto 0);
            I2  : in  STD_LOGIC_VECTOR(3 downto 0);
            I3  : in  STD_LOGIC_VECTOR(3 downto 0);
            SEL : in  STD_LOGIC_VECTOR(1 downto 0);
            Y   : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal AND_RESULT : STD_LOGIC_VECTOR(3 downto 0);
    signal OR_RESULT  : STD_LOGIC_VECTOR(3 downto 0);
    signal ADD_RESULT : STD_LOGIC_VECTOR(3 downto 0);
    signal MUX_RESULT : STD_LOGIC_VECTOR(3 downto 0);

    signal ADD_COUT : STD_LOGIC;
    signal ZERO     : STD_LOGIC_VECTOR(3 downto 0);

begin

    ZERO <= "0000";

    U_AND : AND_Unit
        port map (
            A => A,
            B => B,
            Y => AND_RESULT
        );

    U_OR : OR_Unit
        port map (
            A => A,
            B => B,
            Y => OR_RESULT
        );

    U_ADD : adder_4bit
        port map (
            A    => A,
            B    => B,
            CIN  => '0',
            SUM  => ADD_RESULT,
            COUT => ADD_COUT
        );

    U_MUX : MUX_4to1
        port map (
            I0  => AND_RESULT,
            I1  => OR_RESULT,
            I2  => ADD_RESULT,
            I3  => ZERO,
            SEL => SEL,
            Y   => MUX_RESULT
        );

    Y <= MUX_RESULT;

    COUT <= ADD_COUT when SEL = "10" else '0';

end Structural;