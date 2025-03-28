library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity JKFF_TB is
end JKFF_TB;

architecture testbench of JKFF_TB is
    signal clk : std_logic := '0';
    signal j   : std_logic := '0';
    signal k   : std_logic := '0';
    signal q   : std_logic;

    constant clk_period : time := 10 ns; -- Clock period

begin
    -- Instantiate the JK Flip-Flop module
    uut: entity work.JKFF
        port map (
            clk => clk,
            j   => j,
            k   => k,
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
        -- No change (J=0, K=0)
        j <= '0'; k <= '0';
        wait for 20 ns;

        -- Reset (J=0, K=1)
        j <= '0'; k <= '1';
        wait for 20 ns;

        -- Set (J=1, K=0)
        j <= '1'; k <= '0';
        wait for 20 ns;

        -- Toggle (J=1, K=1)
        j <= '1'; k <= '1';
        wait for 40 ns;

        -- No change again (J=0, K=0)
        j <= '0'; k <= '0';
        wait for 20 ns;

        -- More toggling tests
        j <= '1'; k <= '1';
        wait for 30 ns;

        -- Stop simulation
        wait;
    end process;

end testbench;
