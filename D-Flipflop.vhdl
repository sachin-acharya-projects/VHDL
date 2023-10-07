LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY D_FF IS
    PORT (
        D, clk : IN STD_LOGIC;
        Q : OUT STD_LOGIC
    );
END D_FF;

ARCHITECTURE ARCH OF D_FF IS
BEGIN
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            Q <= D;
        END IF;
    END PROCESS;
END ARCH;