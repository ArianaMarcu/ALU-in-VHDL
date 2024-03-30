----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2023 03:17:58 PM
-- Design Name: 
-- Module Name: FullSubtractor - Behavioral
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

entity FullSubtractor is
    Port(
        A, B: in STD_LOGIC;
        BorrowIn: in STD_LOGIC;
        BorrowOut: out STD_LOGIC;
        Diff: out STD_LOGIC
    );
end FullSubtractor;
architecture Behavioral of FullSubtractor is
begin
    Diff <= (A XOR B) XOR BorrowIn;
    BorrowOut <= ((not A) AND (B OR BorrowIn)) OR (B AND BorrowIn);
end Behavioral;
