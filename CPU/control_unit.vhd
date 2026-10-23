library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unit is
    Port (
        OPCODE   : in  STD_LOGIC_VECTOR(3 downto 0);
        ACC_LOAD : out STD_LOGIC;
        Z_LOAD   : out STD_LOGIC;
        PC_INC   : out STD_LOGIC;
        ALU_SEL  : out STD_LOGIC_VECTOR(1 downto 0)
    );
end Control_Unit;


architecture Structural of Control_Unit is

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

    component OR_Gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal LDI : STD_LOGIC;
    signal ADD : STD_LOGIC;
    signal ANDI : STD_LOGIC;
    signal XORI : STD_LOGIC;
    signal SHR : STD_LOGIC;

    signal VALID1 : STD_LOGIC;
    signal VALID2 : STD_LOGIC;
    signal VALID3 : STD_LOGIC;
    signal VALID : STD_LOGIC;

begin

    DECODER : Opcode_Decoder
        port map (
            OPCODE => OPCODE,
            LDI_OP => LDI,
            ADD_OP => ADD,
            AND_OP => ANDI,
            XOR_OP => XORI,
            SHR_OP => SHR
        );


    -- LDI OR ADD
    OR1 : OR_Gate
        port map (
            A => LDI,
            B => ADD,
            Y => VALID1
        );


    -- AND OR XOR
    OR2 : OR_Gate
        port map (
            A => ANDI,
            B => XORI,
            Y => VALID2
        );


    -- First two groups
    OR3 : OR_Gate
        port map (
            A => VALID1,
            B => VALID2,
            Y => VALID3
        );


    -- Add SHR
    OR4 : OR_Gate
        port map (
            A => VALID3,
            B => SHR,
            Y => VALID
        );


    -- Load ACC for all five instructions
    ACC_LOAD <= VALID;


    -- Update Z for all five instructions
    Z_LOAD <= VALID;


    -- Set 7 has no JZ
    PC_INC <= '1';


    -- ALU selection
    -- AND = 00
    -- ADD = 01
    -- XOR = 10
    -- SHR = 11

    ALU_SEL(1) <= XORI or SHR;
    ALU_SEL(0) <= ADD or SHR;

end Structural;