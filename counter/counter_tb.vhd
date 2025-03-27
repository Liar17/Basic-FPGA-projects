library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench entity (no ports needed)
entity counter_tb is
end counter_tb;

architecture test of counter_tb is
    signal clk   : STD_LOGIC := '0';  -- Clock signal
    signal count : INTEGER range 0 to 255;  -- Output signal to monitor counter
begin
    -- Instantiate the counter module
    uut: entity work.counter_int port map(clk => clk, count => count);

    -- Clock process: generates a clock signal with a period of 10 ns
    process
    begin
        while now < 100 ns loop  -- Simulate for 100 ns
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
				 clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
				 clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;
end test;
