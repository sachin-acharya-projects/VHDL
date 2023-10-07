LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Counter IS
    PORT (
        CLR : IN STD_LOGIC;
        CLK : IN STD_LOGIC;
        Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END Counter;

ARCHITECTURE ARCH OF Counter IS
    SIGNAL count : UNSIGNED(3 DOWNTO 0);
BEGIN
    PROCESS (CLK, CLR)
    BEGIN
        IF RISING_EDGE(clk) THEN
            IF (CLR = '1') THEN
                count <= "0000";
            ELSE
                count <= count + 1;
            END IF;
        END IF;
    END PROCESS;
    Q <= STD_LOGIC_VECTOR(count);
END ARCH;