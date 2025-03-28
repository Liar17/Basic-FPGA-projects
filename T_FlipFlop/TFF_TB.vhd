library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity TFF_TB is
end TFF_TB;

architecture testbench of TFF_TB is
    signal clk   : std_logic := '0';
    signal t     : std_logic := '0';
    signal q     : std_logic;

    constant clk_period : time := 10 ns; -- Clock period

begin
    -- Instantiate the T Flip-Flop module
    uut: entity work.TFF
        port map (
            clk => clk,
            t   => t,
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
        -- Initial state
        t <= '0';
        wait for 20 ns;

        -- Toggle Q by setting T to '1'
        t <= '1';
        wait for 30 ns;

        -- Keep T active to observe toggling behavior
        wait for 40 ns;

        -- Disable toggling
        t <= '0';
        wait for 30 ns;

        -- Toggle again
        t <= '1';
        wait for 50 ns;

        -- Stop simulation
        wait;
    end process;

end testbench;
