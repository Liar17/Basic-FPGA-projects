library ieee;
use ieee.std_logic_1164.all;


--Applications of JK_FF (improved version of the SR (Set-Reset) flip-flop)

--Counters (Binary, Ripple, Up/Down)
--Frequency dividers
--Shift registers
--Memory storage units

-- TRUTH TABLE

-- J = 0, K = 0 ? No change (Qn).
-- J = 0, K = 1 ? Reset (Q = 0).
-- J = 1, K = 0 ? Set (Q = 1).
-- J = 1, K = 1 ? Toggle (Qn').


entity JKFF is
    port (
        clk : in std_logic;
        j   : in std_logic;
        k   : in std_logic;
        q   : out std_logic
    );
end JKFF;

architecture Behavioral of JKFF is
    signal q_int : std_logic := '0'; -- Internal signal for storing Q
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if j = '0' and k = '0' then
                q_int <= q_int;  -- No change
            elsif j = '0' and k = '1' then
                q_int <= '0';  -- Reset
            elsif j = '1' and k = '0' then
                q_int <= '1';  -- Set
            else
                q_int <= not q_int;  -- Toggle
            end if;
        end if;
    end process;
    q <= q_int;
end Behavioral;
