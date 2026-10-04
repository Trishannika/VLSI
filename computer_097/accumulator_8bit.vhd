library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity accumulator_8bit is
    Port (
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        LOAD  : in  STD_LOGIC;
        A     : in  STD_LOGIC_VECTOR(7 downto 0);
        B     : in  STD_LOGIC_VECTOR(7 downto 0);
        Q     : out STD_LOGIC_VECTOR(7 downto 0)
    );
end accumulator_8bit;

architecture Structural of accumulator_8bit is

    component adder_8bit
        Port (
            A    : in  STD_LOGIC_VECTOR(7 downto 0);
            B    : in  STD_LOGIC_VECTOR(7 downto 0);
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC_VECTOR(7 downto 0);
            Cout : out STD_LOGIC
        );
    end component;

    component register_8bit
        Port (
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            LOAD  : in  STD_LOGIC;
            D     : in  STD_LOGIC_VECTOR(7 downto 0);
            Q     : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal SUM  : STD_LOGIC_VECTOR(7 downto 0);
    signal COUT : STD_LOGIC;

begin

    -- 8-bit Adder
    ADDER: adder_8bit
        port map (
            A    => A,
            B    => B,
            Cin  => '0',
            Sum  => SUM,
            Cout => COUT
        );

    -- 8-bit Register
    REG: register_8bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => SUM,
            Q     => Q
        );

end Structural;