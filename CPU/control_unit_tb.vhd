
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Control_Unit is
end TB_Control_Unit;

architecture Behavioral of TB_Control_Unit is

    component Control_Unit
        Port (
            OPCODE   : in  STD_LOGIC_VECTOR(3 downto 0);
            ACC_LOAD : out STD_LOGIC;
            Z_LOAD   : out STD_LOGIC;
            PC_INC   : out STD_LOGIC;
            ALU_SEL  : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    signal OPCODE   : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal ACC_LOAD : STD_LOGIC;
    signal Z_LOAD   : STD_LOGIC;
    signal PC_INC   : STD_LOGIC;
    signal ALU_SEL  : STD_LOGIC_VECTOR(1 downto 0);

begin

    DUT: Control_Unit
        port map (
            OPCODE   => OPCODE,
            ACC_LOAD => ACC_LOAD,
            Z_LOAD   => Z_LOAD,
            PC_INC   => PC_INC,
            ALU_SEL  => ALU_SEL
        );

    STIMULUS: process
    begin

        -- Test 1: LDI = 0001
        OPCODE <= "0001";
        wait for 100 ns;

        -- Test 2: ADD = 0010
        OPCODE <= "0010";
        wait for 100 ns;

        -- Test 3: AND = 0100
        OPCODE <= "0100";
        wait for 100 ns;

        -- Test 4: XOR = 0110
        OPCODE <= "0110";
        wait for 100 ns;

        -- Test 5: SHR = 1001
        OPCODE <= "1001";
        wait for 100 ns;

        -- Test 6: Invalid opcode = 1111
        OPCODE <= "1111";
        wait for 100 ns;

        wait;
    end process;

end Behavioral;