----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 03:56:06 AM
-- Design Name: 
-- Module Name: test_multiplier - Behavioral
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

entity test_multiplier is
end test_multiplier;

architecture TB_ARCH of test_multiplier is
signal clk, start: std_logic := '0';
signal multiplicand, multiplier: std_logic_vector(31 downto 0);
signal rez: std_logic_vector(63 downto 0);
begin

uut: entity work.Multiplier
        port map (
            clk => clk,
            start => start,
            multiplicand => multiplicand,
            multiplier => multiplier,
            rez => rez
        );

process
begin
    wait for 5 ns;
    clk <= not clk;
end process;

process
begin
--    wait for 10 ns;
--    start <= '1';
--    multiplicand <= x"00000002";
--    multiplier <= x"00000003";
--    wait for 50 ns;
--    start <= '0';
--    wait for 100 ns;
    
--    start <= '1';
--    multiplicand <= x"00000052";
--    multiplier <= x"00000033";
--    wait for 50 ns;
--    start <= '0';
--    wait for 100 ns;

    wait for 10 ns;
    start <= '1';
    multiplicand <= x"ffffff1c"; -- -228
    multiplier <= x"00000744"; -- 1860
    wait for 50 ns;
    start <= '0';
    wait for 100 ns;
end process;

end TB_ARCH;