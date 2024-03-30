----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2023 11:46:47 AM
-- Design Name: 
-- Module Name: Add64bit - Behavioral
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

entity Add64bit is
    port(
        X, Y: in STD_LOGIC_VECTOR(63 downto 0);
        Cin: in STD_LOGIC;
        Cout: out STD_LOGIC;
        S: out STD_LOGIC_VECTOR(63 downto 0)
    );
end Add64bit;

architecture Behavioral of Add64bit is
component FullAdder is
    Port(
            A, B: in STD_LOGIC;
            CarryIn: in STD_LOGIC;
            CarryOut: out STD_LOGIC;
            Si: out STD_LOGIC
        );
end component;
signal C: STD_LOGIC_VECTOR(62 downto 0);
begin
FullAdder0: FullAdder port map(X(0), Y(0), Cin, C(0), S(0));
FullAdderLoop: for i in 1 to 62 generate
FullAdder_inst: FullAdder port map(X(i), Y(i), C(i-1), C(i), S(i));
end generate;
FullAdder63: FullAdder port map(X(63), Y(63), C(62), Cout, S(63));
end Behavioral;
