library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RAM_4X8 is
    Port (
        CLK      : in  STD_LOGIC;
        RESET    : in  STD_LOGIC;
        WE       : in  STD_LOGIC;
        ADDRESS  : in  STD_LOGIC_VECTOR(1 downto 0);
        DATA_IN  : in  STD_LOGIC_VECTOR(7 downto 0);
        DATA_OUT : out STD_LOGIC_VECTOR(7 downto 0)
    );
end RAM_4X8;

architecture Structural of RAM_4X8 is

    component decoder_2to4
        Port (
            A  : in  STD_LOGIC_VECTOR(1 downto 0);
            EN : in  STD_LOGIC;
            Y  : out STD_LOGIC_VECTOR(3 downto 0)
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

    component mux_4to1_8bit
        Port (
            I0 : in  STD_LOGIC_VECTOR(7 downto 0);
            I1 : in  STD_LOGIC_VECTOR(7 downto 0);
            I2 : in  STD_LOGIC_VECTOR(7 downto 0);
            I3 : in  STD_LOGIC_VECTOR(7 downto 0);
            S  : in  STD_LOGIC_VECTOR(1 downto 0);
            Y  : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal LOAD : STD_LOGIC_VECTOR(3 downto 0);

    signal Q0 : STD_LOGIC_VECTOR(7 downto 0);
    signal Q1 : STD_LOGIC_VECTOR(7 downto 0);
    signal Q2 : STD_LOGIC_VECTOR(7 downto 0);
    signal Q3 : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- 2-to-4 Decoder
    U1: decoder_2to4
        port map (
            A  => ADDRESS,
            EN => WE,
            Y  => LOAD
        );

    -- Register 0
    U2: register_8bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD(0),
            D     => DATA_IN,
            Q     => Q0
        );

    -- Register 1
    U3: register_8bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD(1),
            D     => DATA_IN,
            Q     => Q1
        );

    -- Register 2
    U4: register_8bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD(2),
            D     => DATA_IN,
            Q     => Q2
        );

    -- Register 3
    U5: register_8bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => LOAD(3),
            D     => DATA_IN,
            Q     => Q3
        );

    -- 4-to-1 Multiplexer
    U6: mux_4to1_8bit
        port map (
            I0 => Q0,
            I1 => Q1,
            I2 => Q2,
            I3 => Q3,
            S  => ADDRESS,
            Y  => DATA_OUT
        );

end Structural;