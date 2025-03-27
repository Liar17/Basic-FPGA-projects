library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- TRUTH TABLE

-- D=0 , CLK=0 => Q=NO change
-- D=0 , CLK=1 => Q=0
-- D=1 , CLK=0 => Q=NO change
-- D=1 , CLK=1 => Q=1




entity D_FF is
    port (
        D   : in  STD_LOGIC;  -- Data input
        clk : in  STD_LOGIC;  -- Clock input
        Q   : out STD_LOGIC   -- Output
    );
end D_FF;

architecture behavioral of D_FF is
begin
    process(clk)
    begin
        if (clk'event AND clk='1') then  -- On rising edge of clock
            Q <= D;  -- Store the input value
        end if;
    end process;
end behavioral;

