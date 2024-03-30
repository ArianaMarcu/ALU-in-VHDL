----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2023 12:22:05 PM
-- Design Name: 
-- Module Name: TestAdder64 - Behavioral
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

entity TestAdder64 is
--  Port ( );
end TestAdder64;

architecture Behavioral of TestAdder64 is

component Add64bit is
    port(
        X, Y: in STD_LOGIC_VECTOR(63 downto 0);
        Cin: in STD_LOGIC;
        Cout: out STD_LOGIC;
        S: out STD_LOGIC_VECTOR(63 downto 0)
    );
end component;

signal Xs, Ys: STD_LOGIC_VECTOR(63 downto 0);
signal Cins: STD_LOGIC;
signal Couts: STD_LOGIC;
signal Ss: STD_LOGIC_VECTOR(63 downto 0);

begin
TestBench: Add64bit port map(X=>Xs, Y=>Ys, Cin=>Cins, Cout=>Couts, S=>Ss);

process
begin
    Xs <= x"0000000000000002"; --2
    Ys <= x"0000000000000005"; --5
    Cins <= '0';
    wait for 100ns; --7
    
    Xs <= x"0000000000000007"; --7
    Ys <= x"0000000000000008"; --8
    Cins <= '1'; --16 = 0001_0000
   
    wait;
end process;

end Behavioral;