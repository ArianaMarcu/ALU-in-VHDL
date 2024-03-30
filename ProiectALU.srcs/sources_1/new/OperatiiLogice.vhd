----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2023 10:39:20 PM
-- Design Name: 
-- Module Name: OperatiiLogice - Behavioral
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

entity OperatiiLogice is
    Port (
        Sel: in STD_LOGIC_VECTOR(1 downto 0);
        A, B: in STD_LOGIC_VECTOR(31 downto 0);
        Res: out STD_LOGIC_VECTOR(31 downto 0)
    );
end OperatiiLogice;

architecture Behavioral of OperatiiLogice is

begin

process(A, B, Sel)
begin
    case Sel is
        when "00" => Res <= A and B;
        when "01" => Res <= A or B;
        when "10" => Res <= not A;
        when others => Res <= x"FFFFFFFF";
    end case;
end process;
end Behavioral;
