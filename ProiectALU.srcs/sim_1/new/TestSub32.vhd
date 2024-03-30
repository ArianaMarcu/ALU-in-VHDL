----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2023 08:11:12 PM
-- Design Name: 
-- Module Name: TestSub32 - Behavioral
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

entity TestSub32 is
--  Port ( );
end TestSub32;

architecture Behavioral of TestSub32 is

component subtractor_32biti is
    Port(
        X, Y: in STD_LOGIC_VECTOR(31 downto 0);
        BI: in STD_LOGIC;
        BO: out STD_LOGIC;
        Dif: out STD_LOGIC_VECTOR(31 downto 0)
    );
end component;

signal Xs, Ys: STD_LOGIC_VECTOR(31 downto 0);
signal Bins: STD_LOGIC;
signal Bouts: STD_LOGIC;
signal Diff: STD_LOGIC_VECTOR(31 downto 0);

begin
TestBench: subtractor_32biti port map(X=>Xs, Y=>Ys, BI=>Bins, BO=>Bouts, Dif=>Diff);

process
begin
--    Xs <= x"00000005"; --5
--    Ys <= x"00000002"; --2
--    Bins <= '1';
--    wait for 100ns; --2
    
--    Xs <= x"00000008"; --8
--    Ys <= x"00000009"; --9
--    Bins <= '0'; 
    
--    Xs <= x"fffffb2e"; -- -1234
--    Ys <= x"00000031"; -- 49
--    Bins <= '0'; 

    Xs <= x"78645091";
    Ys <= x"99999999";
    Bins <= '0'; 
   
    wait;
end process;
end Behavioral;
