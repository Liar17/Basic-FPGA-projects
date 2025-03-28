library ieee;
use ieee.std_logic_1164.all;

-- TRUTH TABLE

-- D=0 , CLK=0 => Q=NO change
-- D=0 , CLK=1 => Q=0
-- D=1 , CLK=0 => Q=NO change
-- D=1 , CLK=1 => Q=1


entity DFF_Reset is
    port (
        clk   : in std_logic;
        d     : in std_logic;
        rst   : in std_logic; -- Reset signal
        q     : out std_logic
    );
end DFF_Reset;

architecture Behavioral of DFF_Reset is
    signal q_int : std_logic := '0'; -- Internal signal for output storage
begin
    process (clk, rst)
    begin
        if rst = '1' then  -- Reset is active
            q_int <= '0';
        elsif rising_edge(clk) then  -- On rising edge of clock
            q_int <= d;
        end if;
    end process;
    q <= q_int;
end Behavioral;
