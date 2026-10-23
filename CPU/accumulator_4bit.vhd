library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity accumulator_4bit is
    Port (
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        LOAD  : in  STD_LOGIC;
        A     : in  STD_LOGIC_VECTOR(3 downto 0);
        B     : in  STD_LOGIC_VECTOR(3 downto 0);
        Q     : out STD_LOGIC_VECTOR(3 downto 0)
    );
end accumulator_4bit;

architecture Structural of accumulator_4bit is

    component adder_4bit
        Port (
            A    : in  STD_LOGIC_VECTOR(3 downto 0);
            B    : in  STD_LOGIC_VECTOR(3 downto 0);
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC_VECTOR(3 downto 0);
            Cout : out STD_LOGIC
        );
    end component;

    component register_4bit
        Port (
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            LOAD  : in  STD_LOGIC;
            D     : in  STD_LOGIC_VECTOR(3 downto 0);
            Q     : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal SUM  : STD_LOGIC_VECTOR(3 downto 0);
    signal COUT : STD_LOGIC;

begin

    ADDER: adder_4bit
        port map (
            A    => A,
            B    => B,
            Cin  => '0',
            Sum  => SUM,
            Cout => COUT
        );

    REG: register_4bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD,
            D     => SUM,
            Q     => Q
        );

end Structural;