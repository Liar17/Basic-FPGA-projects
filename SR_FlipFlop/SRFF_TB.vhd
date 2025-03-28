library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity SRFF_TB is
end SRFF_TB;

architecture testbench of SRFF_TB is
    signal clk : std_logic := '0';
    signal s   : std_logic := '0';
    signal r   : std_logic := '0';
    signal q   : std_logic;

    constant clk_period : time := 10 ns; -- Clock period

begin
    -- Instantiate the SR Flip-Flop module
    uut: entity work.SRFF
        port map (
            clk => clk,
            s   => s,
            r   => r,
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
        -- No change (S=0, R=0)
        s <= '0'; r <= '0';
        wait for 20 ns;

        -- Reset (S=0, R=1)
        s <= '0'; r <= '1';
        wait for 20 ns;

        -- Set (S=1, R=0)
        s <= '1'; r <= '0';
        wait for 20 ns;

        -- Invalid state (S=1, R=1)
        s <= '1'; r <= '1';
        wait for 20 ns;

        -- No change again (S=0, R=0)
        s <= '0'; r <= '0';
        wait for 20 ns;

        -- Set again (S=1, R=0)
        s <= '1'; r <= '0';
        wait for 30 ns;

        -- Stop simulation
        wait;
    end process;

end testbench;
