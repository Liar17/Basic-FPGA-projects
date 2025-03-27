library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF_TB is
end D_FF_TB;

architecture test of D_FF_TB is
    signal D   : STD_LOGIC := '0';
    signal clk : STD_LOGIC := '0';
    signal Q   : STD_LOGIC;
begin
    -- Instantiate D Flip-Flop
    uut: entity work.D_FF port map(D => D, clk => clk, Q => Q);

    -- Clock process (10 ns period)
    process
    begin
        while now < 100 ns loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process to test D input behavior
    process
    begin
        D <= '0'; wait for 15 ns;
        D <= '1'; wait for 20 ns;
        D <= '0'; wait for 10 ns;
        D <= '1'; wait for 30 ns;
        wait;
    end process;
end test;
