LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4to1 IS
    PORT (
        A, B, C, D : IN STD_LOGIC_VECTOR(0 TO 2);
        SEL : IN STD_LOGIC_VECTOR(0 TO 1);
        Y : OUT STD_LOGIC_VECTOR(0 TO 2)
    );
END mux4to1;

ARCHITECTURE Behavioural OF mux4to1 IS
BEGIN
    PROCESS (SEL, A, B, C, D)
    BEGIN
        CASE SEL IS
            WHEN "00" => y <= A;
            WHEN "01" => y <= B;
            WHEN "10" => y <= C;
            WHEN "11" => y <= D;
            WHEN OTHERS => Y <= D;
        END CASE;
    END PROCESS;
END Behavioural;