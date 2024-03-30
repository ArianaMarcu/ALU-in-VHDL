----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2024 01:48:43 PM
-- Design Name: 
-- Module Name: Sign - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sign is
    Port (
        D, I: in STD_LOGIC_VECTOR(31 downto 0);
        C: out STD_LOGIC_VECTOR(31 downto 0);
        R: out STD_LOGIC_VECTOR(31 downto 0)
    );
end Sign;

architecture Behavioral of Sign is

signal rest, cat: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal clk : STD_LOGIC := '0';
component Division is
    Port(
        clk: in STD_LOGIC;
        M: in STD_LOGIC_VECTOR(31 downto 0); --impartitor
        A: out STD_LOGIC_VECTOR(31 downto 0); --rest
        Q: in STD_LOGIC_VECTOR(31 downto 0); --deimpartit
        Q_out: out STD_LOGIC_VECTOR(31 downto 0) --cat
    );
end component;

begin
process
  begin
    clk <= not clk after 5 ns;
    wait for 5 ns;
  end process;
SignDivision: Division port map(clk, I, rest, D, cat);
R <= cat;

end Behavioral;
