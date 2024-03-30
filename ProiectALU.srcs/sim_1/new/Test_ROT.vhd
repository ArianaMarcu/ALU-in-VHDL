----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/16/2023 10:39:34 PM
-- Design Name: 
-- Module Name: Test_ROT - Behavioral
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

entity Test_ROT is
--  Port ( );
end Test_ROT;

architecture Behavioral of Test_ROT is

component Rotations is
  Port (
    nr: in STD_LOGIC_VECTOR(31 downto 0);
    rez: out STD_LOGIC_VECTOR(31 downto 0);
    stanga: in STD_LOGIC
  );
end component;

signal nr: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal stanga: STD_LOGIC := '0';
signal rez: STD_LOGIC_VECTOR(31 downto 0);

begin

SimulareRotatii: Rotations port map (nr, rez, stanga);

process
    begin
    
    nr <= x"fff0ee7f";
    --nr <= "10000000000000000000010111101011";
    stanga <= '1';

    wait;
end process;

end Behavioral;
