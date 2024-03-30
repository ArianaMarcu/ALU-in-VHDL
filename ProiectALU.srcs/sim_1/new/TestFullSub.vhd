library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TestFullSub is
end TestFullSub;

architecture testbench of TestFullSub is
signal A, B, BorrowIn, BorrowOut, Diff: STD_LOGIC;

component FullSubtractor
    Port(
            A, B: in STD_LOGIC;
            BorrowIn: in STD_LOGIC;
            BorrowOut: out STD_LOGIC;
            Diff: out STD_LOGIC
        );
end component;

begin
SimulareS: FullSubtractor port map(A, B, BorrowIn, BorrowOut, Diff);

process
    begin
        A <= '0';
        B <= '0';
        BorrowIn <= '0';
        wait for 10 ns;

        A <= '1';
        B <= '0';
        BorrowIn <= '1';
        wait for 10 ns;

        A <= '1';
        B <= '1';
        BorrowIn <= '0';
        wait for 10 ns;

        A <= '0';
        B <= '1';
        BorrowIn <= '1';
        wait for 10 ns;

        wait;
end process;
end testbench;
