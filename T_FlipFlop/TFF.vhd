library ieee;
use ieee.std_logic_1164.all;


--APPLICATION

--counters and frequency division circuits 
--due to its ability to change state in response to a single toggle input and its simple functionality.


-- TRUTH TABLE

-- CLK=0 , T=0 => Qn
-- CLK=0 , T=1 => Qn
-- CLK=1 , T=0 => Qn
-- CLK=1 , T=1 => Qn'



entity TFF is
    port (
        clk : in std_logic;
        t   : in std_logic;
        q   : out std_logic
    );
end TFF;

architecture Behavioral of TFF is
    signal q_int : std_logic := '0'; -- Internal signal for storing Q
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if t = '1' then
                q_int <= not q_int;  -- Toggle Q
            end if;
        end if;
    end process;
    q <= q_int;
end Behavioral;
