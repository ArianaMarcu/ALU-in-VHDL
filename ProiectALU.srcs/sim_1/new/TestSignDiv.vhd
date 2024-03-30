----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2023 12:23:42 AM
-- Design Name: 
-- Module Name: TestDivision - Behavioral
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

entity TestSignDiv is
--  Port ( );
end TestSignDiv;
 
architecture Behavioral of TestSignDiv is 
 
component Sign is
    Port (
        D, I: in STD_LOGIC_VECTOR(31 downto 0);
        C: out STD_LOGIC_VECTOR(31 downto 0);
        R: out STD_LOGIC_VECTOR(31 downto 0)
    );
end component;

constant period: time := 2 ns;

signal I: STD_LOGIC_VECTOR(31 downto 0) := x"00000004";-- 4
signal R: STD_LOGIC_VECTOR(31 downto 0);
signal D: STD_LOGIC_VECTOR(31 downto 0) := x"00000008";-- 8
signal C: STD_LOGIC_VECTOR(31 downto 0);

begin

SimulationS: Sign port map (D, I, C, R);

process
begin
    wait for 100 ns;
    wait for period*32;
    wait;
end process;

end Behavioral;