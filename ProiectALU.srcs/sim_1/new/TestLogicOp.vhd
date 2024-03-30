----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2023 11:07:57 PM
-- Design Name: 
-- Module Name: TestLogicOp - Behavioral
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

entity TestLogicOp is
--  Port ( );
end TestLogicOp;

architecture Behavioral of TestLogicOp is

component OperatiiLogice is
    Port (
        Sel: in STD_LOGIC_VECTOR(1 downto 0);
        A, B: in STD_LOGIC_VECTOR(31 downto 0);
        Res: out STD_LOGIC_VECTOR(31 downto 0)
    );
end component;

signal A, B, Res: STD_LOGIC_VECTOR(31 downto 0);
signal Sel: STD_LOGIC_VECTOR(1 downto 0);

begin

SimulareOpLogice: OperatiiLogice port map(Sel, A, B, Res);

process
begin
    A <= "00011100011100011100011100000000";
    B <= "10010000000000000000000011111111";
    Sel <= "01";
    wait;
end process;

end Behavioral;
