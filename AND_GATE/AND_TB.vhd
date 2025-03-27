library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_TB is
end AND_TB;

architecture test of AND_TB is
    signal A, B, Y : STD_LOGIC;
begin
    uut: entity work.AND_Gate port map(A => A, B => B, Y => Y);

    process
    begin
        -- TEST
        A <= '0'; B <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; wait for 10 ns;
        wait;
    end process;
end test;
