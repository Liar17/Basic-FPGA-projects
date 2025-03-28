library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity DFF_Reset_TB is
end DFF_Reset_TB;

architecture testbench of DFF_Reset_TB is
    signal clk   : std_logic := '0';
    signal d     : std_logic := '0';
    signal rst   : std_logic := '0';
    signal q     : std_logic;

    constant clk_period : time := 10 ns; -- Clock period

begin
    -- Instantiate the DFF_Reset module
    uut: entity work.DFF_Reset
        port map (
            clk => clk,
            d   => d,
            rst => rst,
            q   => q
        );

    -- Clock process
    clk_process: process
    begin
        while now < 200 ns loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_process: process
    begin
        -- Apply reset
        rst <= '1';
        wait for 20 ns;
        rst <= '0';

        -- Apply inputs
        d <= '1'; wait for 15 ns;
        d <= '0'; wait for 15 ns;
        d <= '1'; wait for 20 ns;
        d <= '0'; wait for 20 ns;
        d <= '1'; wait for 15 ns;
        d <= '0'; wait for 15 ns;
        d <= '1'; wait for 20 ns;
        d <= '0'; wait for 20 ns;
        d <= '1'; wait for 15 ns;
        d <= '0'; wait for 15 ns;
        d <= '1'; wait for 20 ns;
        d <= '0'; wait for 20 ns;

        -- Activate reset during operation
        rst <= '1';
        wait for 10 ns;
        rst <= '0';

        -- Continue with more input values
        d <= '1'; wait for 25 ns;
        d <= '0'; wait for 25 ns;

        -- Stop simulation
        wait;
    end process;

end testbench;
