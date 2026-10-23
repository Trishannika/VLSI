
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU_8bit_Set7 is
    Port (
        CLK    : in  STD_LOGIC;
        RESET  : in  STD_LOGIC;
        Q      : out STD_LOGIC_VECTOR(7 downto 0);
        Z      : out STD_LOGIC;
        PC_OUT : out STD_LOGIC_VECTOR(3 downto 0)
    );
end CPU_8bit_Set7;

architecture Structural of CPU_8bit_Set7 is

    component PC_4bit
        Port (
            CLK     : in  STD_LOGIC;
            RESET   : in  STD_LOGIC;
            LOAD    : in  STD_LOGIC;
            JZ_ADDR : in  STD_LOGIC_VECTOR(3 downto 0);
            PC      : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component ROM_16x12
        Port (
            ADDRESS     : in  STD_LOGIC_VECTOR(3 downto 0);
            INSTRUCTION : out STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;

    component Control_Unit
        Port (
            OPCODE   : in  STD_LOGIC_VECTOR(3 downto 0);
            ACC_LOAD : out STD_LOGIC;
            Z_LOAD   : out STD_LOGIC;
            PC_INC   : out STD_LOGIC;
            ALU_SEL  : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    component ALU_8bit
        Port (
            A    : in  STD_LOGIC_VECTOR(7 downto 0);
            B    : in  STD_LOGIC_VECTOR(7 downto 0);
            SEL  : in  STD_LOGIC_VECTOR(1 downto 0);
            Y    : out STD_LOGIC_VECTOR(7 downto 0);
            COUT : out STD_LOGIC
        );
    end component;

    component accumulator_8bit
        Port (
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            LOAD  : in  STD_LOGIC;
            A     : in  STD_LOGIC_VECTOR(7 downto 0);
            B     : in  STD_LOGIC_VECTOR(7 downto 0);
            Q     : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component Z_Flag
        Port (
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            LOAD  : in  STD_LOGIC;
            ACC   : in  STD_LOGIC_VECTOR(7 downto 0);
            Z     : out STD_LOGIC
        );
    end component;

    component Opcode_Decoder
        Port (
            OPCODE : in  STD_LOGIC_VECTOR(3 downto 0);
            LDI_OP : out STD_LOGIC;
            ADD_OP : out STD_LOGIC;
            AND_OP : out STD_LOGIC;
            XOR_OP : out STD_LOGIC;
            SHR_OP : out STD_LOGIC
        );
    end component;

    component mux4
        Port (
            D0  : in  STD_LOGIC;
            D1  : in  STD_LOGIC;
            D2  : in  STD_LOGIC;
            D3  : in  STD_LOGIC;
            SEL : in  STD_LOGIC_VECTOR(1 downto 0);
            Y   : out STD_LOGIC
        );
    end component;

    signal PC_S        : STD_LOGIC_VECTOR(3 downto 0);
    signal INSTR       : STD_LOGIC_VECTOR(11 downto 0);
    signal OPCODE_S    : STD_LOGIC_VECTOR(3 downto 0);
    signal OPERAND     : STD_LOGIC_VECTOR(7 downto 0);

    signal ACC_LOAD_S  : STD_LOGIC;
    signal Z_LOAD_S    : STD_LOGIC;
    signal PC_INC_S    : STD_LOGIC;
    signal PC_LOAD_S   : STD_LOGIC;
    signal ALU_SEL_S   : STD_LOGIC_VECTOR(1 downto 0);

    signal ACC_S       : STD_LOGIC_VECTOR(7 downto 0);
    signal ALU_RESULT  : STD_LOGIC_VECTOR(7 downto 0);
    signal NEXT_ACC    : STD_LOGIC_VECTOR(7 downto 0);
    signal COUT_S      : STD_LOGIC;

    signal LDI_S       : STD_LOGIC;
    signal ADD_S       : STD_LOGIC;
    signal AND_S       : STD_LOGIC;
    signal XOR_S       : STD_LOGIC;
    signal SHR_S       : STD_LOGIC;

    signal NEXT_SEL    : STD_LOGIC_VECTOR(1 downto 0);

begin

    OPCODE_S <= INSTR(11 downto 8);
    OPERAND  <= INSTR(7 downto 0);

    -- PC: Set 7 increments after every instruction
    PC_LOAD_S <= not PC_INC_S;

    PC_INST : PC_4bit
        port map (
            CLK     => CLK,
            RESET   => RESET,
            LOAD    => PC_LOAD_S,
            JZ_ADDR => INSTR(3 downto 0),
            PC      => PC_S
        );

    -- Instruction ROM
    ROM_INST : ROM_16x12
        port map (
            ADDRESS     => PC_S,
            INSTRUCTION => INSTR
        );

    -- Control signals
    CTRL_INST : Control_Unit
        port map (
            OPCODE   => OPCODE_S,
            ACC_LOAD => ACC_LOAD_S,
            Z_LOAD   => Z_LOAD_S,
            PC_INC   => PC_INC_S,
            ALU_SEL  => ALU_SEL_S
        );

    -- Decode LDI
    DEC_INST : Opcode_Decoder
        port map (
            OPCODE => OPCODE_S,
            LDI_OP => LDI_S,
            ADD_OP => ADD_S,
            AND_OP => AND_S,
            XOR_OP => XOR_S,
            SHR_OP => SHR_S
        );

    -- ALU uses current ACC and instruction operand
    ALU_INST : ALU_8bit
        port map (
            A    => ACC_S,
            B    => OPERAND,
            SEL  => ALU_SEL_S,
            Y    => ALU_RESULT,
            COUT => COUT_S
        );

    -- LDI selects the immediate operand.
    -- Other instructions select the ALU result.
    NEXT_SEL <= '0' & LDI_S;

    GEN_NEXT_ACC : for i in 0 to 7 generate
        MUX_INST : mux4
            port map (
                D0  => ALU_RESULT(i),
                D1  => OPERAND(i),
                D2  => '0',
                D3  => '0',
                SEL => NEXT_SEL,
                Y   => NEXT_ACC(i)
            );
    end generate;

    -- Existing accumulator module
    ACC_INST : accumulator_8bit
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => ACC_LOAD_S,
            A     => NEXT_ACC,
            B     => "00000000",
            Q     => ACC_S
        );

    -- Existing zero flag module
    Z_INST : Z_Flag
        port map (
            CLK   => CLK,
            RESET => RESET,
            LOAD  => Z_LOAD_S,
            ACC   => NEXT_ACC,
            Z     => Z
        );

    Q      <= ACC_S;
    PC_OUT <= PC_S;

end Structural;