library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Opcode_Decoder is
    Port (
        OPCODE : in  STD_LOGIC_VECTOR(3 downto 0);
        LDI_OP : out STD_LOGIC;
        ADD_OP : out STD_LOGIC;
        AND_OP : out STD_LOGIC;
        XOR_OP : out STD_LOGIC;
        SHR_OP : out STD_LOGIC
    );
end Opcode_Decoder;

architecture Behavioral of Opcode_Decoder is
begin
    LDI_OP <= '1' when OPCODE = "0001" else '0';
    ADD_OP <= '1' when OPCODE = "0010" else '0';
    AND_OP <= '1' when OPCODE = "0100" else '0';
    XOR_OP <= '1' when OPCODE = "0110" else '0';
    SHR_OP <= '1' when OPCODE = "1001" else '0';
end Behavioral;