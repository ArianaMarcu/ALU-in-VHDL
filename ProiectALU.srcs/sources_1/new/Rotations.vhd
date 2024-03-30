----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/16/2023 09:36:12 PM
-- Design Name: 
-- Module Name: Rotations - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Rotations is
  Port (
    nr: in STD_LOGIC_VECTOR(31 downto 0);
    rez: out STD_LOGIC_VECTOR(31 downto 0);
    stanga: in STD_LOGIC
  );
end Rotations;

architecture Behavioral of Rotations is

component MUX1bit is
    Port ( 
        Sel: in STD_LOGIC;
        X, Y: in STD_LOGIC;
        Res: out STD_LOGIC
    );
end component;

begin

mux1: MUX1bit port map(stanga, nr(0), nr(30), rez(31));
bucla: for i in 31 downto 2 generate
MUX: MUX1bit port map(stanga, nr(i), nr(i-2), rez(i-1));
end generate;
mux32: MUX1bit port map(stanga, nr(1), nr(31), rez(0));

end Behavioral;
