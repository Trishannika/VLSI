library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_8bit is
    Port (
        A    : in  STD_LOGIC_VECTOR(7 downto 0);
        B    : in  STD_LOGIC_VECTOR(7 downto 0);
        SEL  : in  STD_LOGIC_VECTOR(1 downto 0);
        Y    : out STD_LOGIC_VECTOR(7 downto 0);
        COUT : out STD_LOGIC
    );
end ALU_8bit;


architecture Structural of ALU_8bit is

    -- AND gate
    component and_gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;


    -- XOR gate
    component xor_gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;


    -- Full adder
    component full_adder
        Port (
            A    : in STD_LOGIC;
            B    : in STD_LOGIC;
            CIN  : in STD_LOGIC;
            SUM  : out STD_LOGIC;
            COUT : out STD_LOGIC
        );
    end component;


    -- Existing 1-bit 4:1 MUX
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


    -- Internal signals
    signal AND_RESULT : STD_LOGIC_VECTOR(7 downto 0);
    signal XOR_RESULT : STD_LOGIC_VECTOR(7 downto 0);
    signal ADD_RESULT : STD_LOGIC_VECTOR(7 downto 0);
    signal SHR_RESULT : STD_LOGIC_VECTOR(7 downto 0);

    signal C : STD_LOGIC_VECTOR(8 downto 0);

begin

    ----------------------------------------------------------------
    -- Initial carry
    ----------------------------------------------------------------

    C(0) <= '0';


    ----------------------------------------------------------------
    -- AND OPERATION
    ----------------------------------------------------------------

    U_AND0 : and_gate
        port map (
            A => A(0),
            B => B(0),
            Y => AND_RESULT(0)
        );

    U_AND1 : and_gate
        port map (
            A => A(1),
            B => B(1),
            Y => AND_RESULT(1)
        );

    U_AND2 : and_gate
        port map (
            A => A(2),
            B => B(2),
            Y => AND_RESULT(2)
        );

    U_AND3 : and_gate
        port map (
            A => A(3),
            B => B(3),
            Y => AND_RESULT(3)
        );

    U_AND4 : and_gate
        port map (
            A => A(4),
            B => B(4),
            Y => AND_RESULT(4)
        );

    U_AND5 : and_gate
        port map (
            A => A(5),
            B => B(5),
            Y => AND_RESULT(5)
        );

    U_AND6 : and_gate
        port map (
            A => A(6),
            B => B(6),
            Y => AND_RESULT(6)
        );

    U_AND7 : and_gate
        port map (
            A => A(7),
            B => B(7),
            Y => AND_RESULT(7)
        );


    ----------------------------------------------------------------
    -- XOR OPERATION
    ----------------------------------------------------------------

    U_XOR0 : xor_gate
        port map (
            A => A(0),
            B => B(0),
            Y => XOR_RESULT(0)
        );

    U_XOR1 : xor_gate
        port map (
            A => A(1),
            B => B(1),
            Y => XOR_RESULT(1)
        );

    U_XOR2 : xor_gate
        port map (
            A => A(2),
            B => B(2),
            Y => XOR_RESULT(2)
        );

    U_XOR3 : xor_gate
        port map (
            A => A(3),
            B => B(3),
            Y => XOR_RESULT(3)
        );

    U_XOR4 : xor_gate
        port map (
            A => A(4),
            B => B(4),
            Y => XOR_RESULT(4)
        );

    U_XOR5 : xor_gate
        port map (
            A => A(5),
            B => B(5),
            Y => XOR_RESULT(5)
        );

    U_XOR6 : xor_gate
        port map (
            A => A(6),
            B => B(6),
            Y => XOR_RESULT(6)
        );

    U_XOR7 : xor_gate
        port map (
            A => A(7),
            B => B(7),
            Y => XOR_RESULT(7)
        );


    ----------------------------------------------------------------
    -- ADD OPERATION
    ----------------------------------------------------------------

    U_FA0 : full_adder
        port map (
            A    => A(0),
            B    => B(0),
            CIN  => C(0),
            SUM  => ADD_RESULT(0),
            COUT => C(1)
        );

    U_FA1 : full_adder
        port map (
            A    => A(1),
            B    => B(1),
            CIN  => C(1),
            SUM  => ADD_RESULT(1),
            COUT => C(2)
        );

    U_FA2 : full_adder
        port map (
            A    => A(2),
            B    => B(2),
            CIN  => C(2),
            SUM  => ADD_RESULT(2),
            COUT => C(3)
        );

    U_FA3 : full_adder
        port map (
            A    => A(3),
            B    => B(3),
            CIN  => C(3),
            SUM  => ADD_RESULT(3),
            COUT => C(4)
        );

    U_FA4 : full_adder
        port map (
            A    => A(4),
            B    => B(4),
            CIN  => C(4),
            SUM  => ADD_RESULT(4),
            COUT => C(5)
        );

    U_FA5 : full_adder
        port map (
            A    => A(5),
            B    => B(5),
            CIN  => C(5),
            SUM  => ADD_RESULT(5),
            COUT => C(6)
        );

    U_FA6 : full_adder
        port map (
            A    => A(6),
            B    => B(6),
            CIN  => C(6),
            SUM  => ADD_RESULT(6),
            COUT => C(7)
        );

    U_FA7 : full_adder
        port map (
            A    => A(7),
            B    => B(7),
            CIN  => C(7),
            SUM  => ADD_RESULT(7),
            COUT => C(8)
        );


    ----------------------------------------------------------------
    -- SHR OPERATION
    --
    -- Example:
    -- A = 10110010
    -- SHR = 01011001
    ----------------------------------------------------------------

    SHR_RESULT(7) <= '0';
    SHR_RESULT(6) <= A(7);
    SHR_RESULT(5) <= A(6);
    SHR_RESULT(4) <= A(5);
    SHR_RESULT(3) <= A(4);
    SHR_RESULT(2) <= A(3);
    SHR_RESULT(1) <= A(2);
    SHR_RESULT(0) <= A(1);


    ----------------------------------------------------------------
    -- 8-BIT MUX
    --
    -- Existing mux4 is used 8 times.
    --
    -- SEL = 00 -> AND
    -- SEL = 01 -> ADD
    -- SEL = 10 -> XOR
    -- SEL = 11 -> SHR
    ----------------------------------------------------------------

    U_MUX0 : mux4
        port map (
            D0  => AND_RESULT(0),
            D1  => ADD_RESULT(0),
            D2  => XOR_RESULT(0),
            D3  => SHR_RESULT(0),
            SEL => SEL,
            Y   => Y(0)
        );

    U_MUX1 : mux4
        port map (
            D0  => AND_RESULT(1),
            D1  => ADD_RESULT(1),
            D2  => XOR_RESULT(1),
            D3  => SHR_RESULT(1),
            SEL => SEL,
            Y   => Y(1)
        );

    U_MUX2 : mux4
        port map (
            D0  => AND_RESULT(2),
            D1  => ADD_RESULT(2),
            D2  => XOR_RESULT(2),
            D3  => SHR_RESULT(2),
            SEL => SEL,
            Y   => Y(2)
        );

    U_MUX3 : mux4
        port map (
            D0  => AND_RESULT(3),
            D1  => ADD_RESULT(3),
            D2  => XOR_RESULT(3),
            D3  => SHR_RESULT(3),
            SEL => SEL,
            Y   => Y(3)
        );

    U_MUX4 : mux4
        port map (
            D0  => AND_RESULT(4),
            D1  => ADD_RESULT(4),
            D2  => XOR_RESULT(4),
            D3  => SHR_RESULT(4),
            SEL => SEL,
            Y   => Y(4)
        );

    U_MUX5 : mux4
        port map (
            D0  => AND_RESULT(5),
            D1  => ADD_RESULT(5),
            D2  => XOR_RESULT(5),
            D3  => SHR_RESULT(5),
            SEL => SEL,
            Y   => Y(5)
        );

    U_MUX6 : mux4
        port map (
            D0  => AND_RESULT(6),
            D1  => ADD_RESULT(6),
            D2  => XOR_RESULT(6),
            D3  => SHR_RESULT(6),
            SEL => SEL,
            Y   => Y(6)
        );

    U_MUX7 : mux4
        port map (
            D0  => AND_RESULT(7),
            D1  => ADD_RESULT(7),
            D2  => XOR_RESULT(7),
            D3  => SHR_RESULT(7),
            SEL => SEL,
            Y   => Y(7)
        );


    ----------------------------------------------------------------
    -- CARRY OUTPUT
    -- Carry is valid only for ADD
    ----------------------------------------------------------------

    COUT <= C(8) when SEL = "01" else '0';

end Structural;