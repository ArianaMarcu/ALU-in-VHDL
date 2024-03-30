----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/16/2023 09:38:24 PM
-- Design Name: 
-- Module Name: MUX1bit - Behavioral
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

entity MUX1bit is
    Port ( 
        Sel: in STD_LOGIC;
        X, Y: in STD_LOGIC;
        Res: out STD_LOGIC
    );
end MUX1bit;

architecture Behavioral of MUX1bit is

begin
process (Sel, X, Y)
begin
       if Sel = '0' then
           Res <= X;
       else
           Res <= Y;
       end if;
end process;

end Behavioral;
