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

entity TestDivision is
--  Port ( );
end TestDivision;
 
architecture Behavioral OF TestDivision IS 
 
component Division is
    Port(
        clk: in STD_LOGIC;
        M: in STD_LOGIC_VECTOR(31 downto 0);
        A: out STD_LOGIC_VECTOR(31 downto 0);
        Q: in STD_LOGIC_VECTOR(31 downto 0);
        Q_out: out STD_LOGIC_VECTOR(31 downto 0)
--        semnQ: in STD_LOGIC;
--        semnM: in STD_LOGIC;
--        semnRezultat: out STD_LOGIC
    );
end component;

constant period: time := 2 ns;
signal clk: STD_LOGIC := '0';  
--signal M: STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000011110";--30
--signal A: STD_LOGIC_VECTOR(31 downto 0);
--signal Q: STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000010000000011";--1027
--signal Q_out: STD_LOGIC_VECTOR(31 downto 0);
--1027:30 = 34 REST 7

signal M: STD_LOGIC_VECTOR(31 downto 0) := x"00001b8e";-- 7054
signal A: STD_LOGIC_VECTOR(31 downto 0);
signal Q: STD_LOGIC_VECTOR(31 downto 0) := x"fff251dd";-- -896547
signal Q_out: STD_LOGIC_VECTOR(31 downto 0);
--signal semnQ: STD_LOGIC := '0';
--signal semnM: STD_LOGIC := '0';
--signal semnRezultat: STD_LOGIC;

begin

Simulation: Division port map (clk, M, A, Q, Q_out);

process
begin
    wait for 100 ns;
    wait for period*10;
    wait;
end process;

process
begin
    clk <= '0';
	wait for period/2;
	clk <= '1';
	wait for period/2;
end process;

end Behavioral;