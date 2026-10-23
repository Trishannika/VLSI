
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Z_Flag is
    Port (
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        LOAD  : in  STD_LOGIC;
        ACC   : in  STD_LOGIC_VECTOR(7 downto 0);
        Z     : out STD_LOGIC
    );
end Z_Flag;

architecture Structural of Z_Flag is

    component NOT_GATE
        Port ( A : in STD_LOGIC; Y : out STD_LOGIC );
    end component;

    component AND_GATE
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               Y : out STD_LOGIC );
    end component;

    component register_1bit
        Port (
            CLK   : in STD_LOGIC;
            RESET : in STD_LOGIC;
            LOAD  : in STD_LOGIC;
            D     : in STD_LOGIC;
            Q     : out STD_LOGIC
        );
    end component;

    signal N0, N1, N2, N3, N4, N5, N6, N7 : STD_LOGIC;
    signal A1, A2, A3, A4, A5, A6, A7 : STD_LOGIC;
    signal Z_D       : STD_LOGIC;
    signal Z_LOAD_EN : STD_LOGIC;

begin

    NOT0: NOT_GATE port map (ACC(0), N0);
    NOT1: NOT_GATE port map (ACC(1), N1);
    NOT2: NOT_GATE port map (ACC(2), N2);
    NOT3: NOT_GATE port map (ACC(3), N3);
    NOT4: NOT_GATE port map (ACC(4), N4);
    NOT5: NOT_GATE port map (ACC(5), N5);
    NOT6: NOT_GATE port map (ACC(6), N6);
    NOT7: NOT_GATE port map (ACC(7), N7);

    AND1: AND_GATE port map (N0, N1, A1);
    AND2: AND_GATE port map (N2, N3, A2);
    AND3: AND_GATE port map (N4, N5, A3);
    AND4: AND_GATE port map (N6, N7, A4);

    AND5: AND_GATE port map (A1, A2, A5);
    AND6: AND_GATE port map (A3, A4, A6);
    AND7: AND_GATE port map (A5, A6, A7);

    -- PDF expects Z = 1 during reset
    Z_D       <= '1' when RESET = '1' else A7;
    Z_LOAD_EN <= LOAD or RESET;

    ZREG: register_1bit
        port map (
            CLK   => CLK,
            RESET => '0',
            LOAD  => Z_LOAD_EN,
            D     => Z_D,
            Q     => Z
        );

end Structural;