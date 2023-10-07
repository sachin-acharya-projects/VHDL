library ieee;
use ieee.std_logic_1164.all;

entity NAND_GATE is (
    Port (
        A, B: in std_logic;
        o: out std_logic
    );
)
END NAND_GATE;

architecture arch of NAND_GATE is
    begin
        proc: process(a, b)
        begin
            o <= a nand b;
        end process proc;
end arch ; -- arch