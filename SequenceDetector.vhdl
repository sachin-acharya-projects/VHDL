LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Detect: 1001
ENTITY SequenceDetector IS
    PORT (
        X : IN STD_LOGIC;
        CLK, RESET : int STD_LOGIC;
        Z : OUT STD_LOGIC
    );
END SequenceDetector;
ARCHITECTURE OF SequenceDetector IS
    TYPE StateType IS (Q0, Q1, Q2, Q3, Q4);
    SIGNAL current_state, next_state : StateType := Q0;

BEGIN
    PROCESS (CLK, RESET)
    BEGIN
        IF RESET = '1' THEN
            current_state <= Q0;
        ELSIF rising_edge(CLK) THEN
            current_state <= next_state;
        END IF;
    END PROCESS;

    PROCESS (current_state, X)
    BEGIN
        -- next_state, +current_state;

        CASE current_state IS
            WHEN Q0 => Z <= 0;
                IF X = '1' THEN
                    next_state <= Q1;
                ELSE
                    next_state <= Q0;
                END IF;
        END CASE;
    END PROCESS
END ARCHITECTURE
-- Incomplete Lookup in the book for more