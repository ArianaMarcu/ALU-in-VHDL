----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2024 08:47:42 PM
-- Design Name: 
-- Module Name: TestBenchFinal - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TestBenchFinal is
--  Port ( );
end TestBenchFinal;

architecture Behavioral of TestBenchFinal is

component ControlUnit
    Port (
        X: in STD_LOGIC_VECTOR(31 downto 0);
        Y: in STD_LOGIC_VECTOR(31 downto 0);
        SEL: in STD_LOGIC_VECTOR(3 downto 0);
        RESULT: out STD_LOGIC_VECTOR(63 downto 0);
        CLK: in STD_LOGIC;
        ENABLE: in STD_LOGIC
        );
end component;

constant period: time := 2 ns;

signal X_TB, Y_TB: STD_LOGIC_VECTOR(31 downto 0);
signal RESULT_TB: STD_LOGIC_VECTOR(63 downto 0);
signal SEL_TB: STD_LOGIC_VECTOR(3 downto 0);
signal CLK: STD_LOGIC := '0';  
signal ENABLE_TB: STD_LOGIC;
begin

TestareFinala: ControlUnit port map(X_TB, Y_TB, SEL_TB, RESULT_TB, CLK, ENABLE_TB);

process
begin
--    wait for 10 ns;
--    X_TB <= x"00000008"; 
--    Y_TB <= x"00000002";
--    SEL_TB <= "1010";
--    ENABLE_TB <= '1';
    
    wait for 200 ns;
    X_TB <= x"00000008"; 
    Y_TB <= x"00000002";
    SEL_TB <= "1010";
    ENABLE_TB <= '1';
    wait for 200 ns;
    
    wait;
end process;

--process
--begin
--    wait for 200 ns;
--    wait for period*100;
--    wait;
--end process;

process
begin
    clk <= '0';
	wait for 2 ns;
	clk <= '1';
	wait for 2 ns;
end process;

end Behavioral;
