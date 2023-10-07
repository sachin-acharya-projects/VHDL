LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY GCD IS
    PORT (
        RESET, CLK : IN STD_LOGIC;
        GO : IN std_login;
        NUM1, NUM2 : IN INTEGER;
        GCD : OUT INTEGER;
    );
END GCD;
ARCHITECTURE ARCH OF GCD IS
    TYPE state IS (start, input, check, updatex, updatey, output);
    SIGNAL ps, ns : state;

BEGIN
    PROCESS (CLK, GO, RESET)
    BEGIN
        IF GO = '1' THEN
            IF RESET = '1' THEN
                PS <= start;
            ELSIF rising_edge(CLK) THEN
                PS <= NS;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (NUM1, NUM2, PS)
        VARIABLE X, Y : INTEGER;
    BEGIN
        CASE PS IS
            WHEN start => GCD <= 0;
                NS <= input;
            WHEN input =>
                X := NUM1;
                Y := NUM2;
                NS <= check;
            WHEN check =>
                IF (X > Y) THEN
                    NS <= updatex;
                ELSIF (X < Y) THEN
                    NS <= UPDATEY;
                ELSE
                    NS <= OUTPUT;
                END IF;
            WHEN UPDATEX =>
                X := X - Y;
                NS <= check;
            WHEN updatey =>
                Y := Y - X;
                ns <= check;
            WHEN OUTPUT =>
                GCD <= 0;
                NS <= INPUT;
        END CASE;
    END PROCESS;
END ARCH;