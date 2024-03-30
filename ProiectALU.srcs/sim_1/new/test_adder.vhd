----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 02:59:03 AM
-- Design Name: 
-- Module Name: test_adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_adder is
--  Port ( );
end test_adder;

architecture Behavioral of test_adder is

component project_1 is
    port(
        X, Y: in STD_LOGIC_VECTOR(31 downto 0);
        Cin: in STD_LOGIC;
        Cout: out STD_LOGIC;
        S: out STD_LOGIC_VECTOR(31 downto 0)
        );
end component; 

signal Xs, Ys: STD_LOGIC_VECTOR(31 downto 0);
signal Cins: STD_LOGIC;
signal Couts: STD_LOGIC;
signal Ss: STD_LOGIC_VECTOR(31 downto 0);

begin
TestBench: project_1 port map(X=>Xs, Y=>Ys, Cin=>Cins, Cout=>Couts, S=>Ss);

process
begin
--    Xs <= "00000000000000000000000000000001"; --1
--    Ys <= "00000000000000000000000000000010"; --2
--    Cins <= '0';
--    wait for 100ns; --3
    
--    Xs <= "00000000000000000000000000000111"; --7
--    Ys <= "00000000000000000000000000001010"; --10 = a
--    Cins <= '1'; --18
--    -- 0111+1010=10001=17(+carry=18=1 0010 => 12)

    Xs <= "11111111111111111111111111111011"; -- -5
    Ys <= "00000000000000000000010111101011"; -- 1515
    Cins <= '0';
    wait for 100ns;
    
    Xs <= "11111111111111111100111111000111"; -- -12345
    Ys <= "11111111111111111110000100101000"; -- -7896
    Cins <= '0';
    wait for 100ns;

    wait;
end process;

end Behavioral;
