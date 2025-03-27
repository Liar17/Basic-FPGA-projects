library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for the counter
entity counter_int is
    port (
        clk   : in  STD_LOGIC;  -- Clock signal
        count : out INTEGER range 0 to 255  -- Output counter value
    );
end counter_int;

architecture behavioral of counter_int is
    signal cnt : INTEGER range 0 to 255 := 0;  -- Internal counter register
begin
    process(clk)
    begin
          if (clk'event AND clk='1')then  -- Check for rising edge of clock
            cnt <= cnt + 1;  -- Increment counter on each clock cycle
        end if;
        count <= cnt;  -- Assign counter value to output
    end process;
end behavioral;
