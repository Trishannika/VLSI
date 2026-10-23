library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port (
        alu_sel : in  STD_LOGIC_VECTOR (3 downto 0); -- 4-bit opcode from Control Unit
        acc     : in  STD_LOGIC_VECTOR (7 downto 0); -- Accumulator data (Operand A)
        operand : in  STD_LOGIC_VECTOR (7 downto 0); -- Immediate operand from ROM
        result  : out STD_LOGIC_VECTOR (7 downto 0)  -- ALU result
    );
end ALU;

architecture Structural of ALU is

    -- 1-bit AND gate component 
    component and_gate is
        Port ( 
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    -- 1-bit XOR gate component 
    component xor_gate is
        Port ( 
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    -- 4-bit adder component (Update port names if yours are different)
    component adder_4bit is
        Port ( 
            A    : in  STD_LOGIC_VECTOR (3 downto 0);
            B    : in  STD_LOGIC_VECTOR (3 downto 0);
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC_VECTOR (3 downto 0);
            Cout : out STD_LOGIC
        );
    end component;

    -- Internal signals for storing outputs from different components
    signal add_out : STD_LOGIC_VECTOR (7 downto 0);
    signal and_out : STD_LOGIC_VECTOR (7 downto 0);
    signal xor_out : STD_LOGIC_VECTOR (7 downto 0);
    signal shr_out : STD_LOGIC_VECTOR (7 downto 0);
    
    signal mid_carry   : STD_LOGIC; -- Carry from lower 4-bit adder to upper 4-bit adder
    signal final_carry : STD_LOGIC; -- Final carry (discarded as per instruction)

begin

    -- 8-bit AND operation: Generating 8 instances of the 1-bit AND gate
    GEN_AND: for i in 0 to 7 generate
        AND_INST: and_gate port map (
            A => acc(i), 
            B => operand(i), 
            Y => and_out(i)
        );
    end generate;

    -- 8-bit XOR operation: Generating 8 instances of the 1-bit XOR gate
    GEN_XOR: for i in 0 to 7 generate
        XOR_INST: xor_gate port map (
            A => acc(i), 
            B => operand(i), 
            Y => xor_out(i)
        );
    end generate;

    -- 8-bit Addition: Cascading two 4-bit adders
    ADDER_LOWER: adder_4bit port map (
        A => acc(3 downto 0), 
        B => operand(3 downto 0), 
        Cin => '0', 
        Sum => add_out(3 downto 0), 
        Cout => mid_carry
    );
    
    ADDER_UPPER: adder_4bit port map (
        A => acc(7 downto 4), 
        B => operand(7 downto 4), 
        Cin => mid_carry, 
        Sum => add_out(7 downto 4), 
        Cout => final_carry
    );

    -- SHR (Shift Right) operation: Shifted right by 1, 0 enters MSB
    shr_out <= '0' & acc(7 downto 1);

    -- Output selection based on Control Unit signals (alu_sel)
    process(alu_sel, operand, add_out, and_out, xor_out, shr_out, acc)
    begin
        case alu_sel is
            when "0001" => result <= operand;  -- LDI instruction
            when "0010" => result <= add_out;  -- ADD instruction 
            when "0100" => result <= and_out;  -- AND instruction
            when "0110" => result <= xor_out;  -- XOR instruction
            when "1001" => result <= shr_out;  -- SHR instruction
            when others => result <= acc;      -- NOP (Accumulator remains unchanged)
        end case;
    end process;

end Structural;