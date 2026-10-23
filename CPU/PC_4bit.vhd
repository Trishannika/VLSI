library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_4bit is
    Port (
        CLK     : in  STD_LOGIC;
        RESET   : in  STD_LOGIC;
        LOAD    : in  STD_LOGIC;
        JZ_ADDR : in  STD_LOGIC_VECTOR(3 downto 0);
        PC      : out STD_LOGIC_VECTOR(3 downto 0)
    );
end PC_4bit;

architecture Structural of PC_4bit is

    component register_4bit
        Port (
            CLK   : in STD_LOGIC;
            RESET : in STD_LOGIC;
            LOAD  : in STD_LOGIC;
            D     : in STD_LOGIC_VECTOR(3 downto 0);
            Q     : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component incrementer_4bit
        Port (
            A : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component mux4
        Port (
            D0  : in STD_LOGIC;
            D1  : in STD_LOGIC;
            D2  : in STD_LOGIC;
            D3  : in STD_LOGIC;
            SEL : in STD_LOGIC_VECTOR(1 downto 0);
            Y   : out STD_LOGIC
        );
    end component;

    signal PC_current : STD_LOGIC_VECTOR(3 downto 0);
    signal PC_plus1   : STD_LOGIC_VECTOR(3 downto 0);
    signal PC_next    : STD_LOGIC_VECTOR(3 downto 0);

    signal SEL : STD_LOGIC_VECTOR(1 downto 0);

begin

    -- PC + 1
    INC: incrementer_4bit
        port map (
            A => PC_current,
            Y => PC_plus1
        );

    -- MUX selection
    -- LOAD = 0 -> PC + 1
    -- LOAD = 1 -> JZ address

    SEL(1) <= '0';
    SEL(0) <= LOAD;

    -- Bit 0
    MUX0: mux4
        port map (
            D0  => PC_plus1(0),
            D1  => JZ_ADDR(0),
            D2  => '0',
            D3  => '0',
            SEL => SEL,
            Y   => PC_next(0)
        );

    -- Bit 1
    MUX1: mux4
        port map (
            D0  => PC_plus1(1),
            D1  => JZ_ADDR(1),
            D2  => '0',
            D3  => '0',
            SEL => SEL,
            Y   => PC_next(1)
        );

    -- Bit 2
    MUX2: mux4
        port map (
            D0  => PC_plus1(2),
            D1  => JZ_ADDR(2),
            D2  => '0',
            D3  => '0',
            SEL => SEL,
            Y   => PC_next(2)
        );

    -- Bit 3
    MUX3: mux4
        port map (
            D0  => PC_plus1(3),
            D1  => JZ_ADDR(3),
            D2  => '0',
            D3  => '0',
            SEL => SEL,
            Y   => PC_next(3)
        );

    -- PC register
    PC_REG: register_4bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => '1',
            D     => PC_next,
            Q     => PC_current
        );

    PC <= PC_current;

end Structural;