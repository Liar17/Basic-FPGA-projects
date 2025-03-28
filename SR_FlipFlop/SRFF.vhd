library ieee;
use ieee.std_logic_1164.all;

--Applications OS SRFF (S=>SET , R=>RESET)

--imple memory storage
--Data latches
--Control circuits
--Debouncing mechanical switches

--  TRUTH TABLE 
--S = 0, R = 0 ? No change (Qn).
--S = 0, R = 1 ? Reset (Qn = 0).
--S = 1, R = 0 ? Set (Qn = 1).
--S = 1, R = 1 ? Invalid state (Qn is unpredictable, represented as 'X').


entity SRFF is
    port (
        clk : in std_logic;
        s   : in std_logic;
        r   : in std_logic;
        q   : out std_logic
    );
end SRFF;

architecture Behavioral of SRFF is
    signal q_int : std_logic := '0'; -- Internal signal for storing Q
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if s = '0' and r = '0' then
                q_int <= q_int;  -- No change
            elsif s = '0' and r = '1' then
                q_int <= '0';  -- Reset
            elsif s = '1' and r = '0' then
                q_int <= '1';  -- Set
            else
                q_int <= 'X';  -- Invalid state (S = 1, R = 1)
            end if;
        end if;
    end process;
    q <= q_int;
end Behavioral;
