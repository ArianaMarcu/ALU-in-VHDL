----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2023 03:48:48 PM
-- Design Name: 
-- Module Name: subtractor_32biti - Behavioral
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

entity subtractor_32biti is
    Port(
        X, Y: in STD_LOGIC_VECTOR(31 downto 0);
        BI: in STD_LOGIC;
        BO: out STD_LOGIC;
        Dif: out STD_LOGIC_VECTOR(31 downto 0)
    );
end subtractor_32biti;

architecture Behavioral of subtractor_32biti is
signal C: STD_LOGIC_VECTOR(31 downto 0);
component FullSubtractor is
    Port(
            A, B: in STD_LOGIC;
            BorrowIn: in STD_LOGIC;
            BorrowOut: out STD_LOGIC;
            Diff: out STD_LOGIC
        );
end component;
begin
sub0: FullSubtractor port map(X(0), Y(0), BI, C(0), Dif(0));
subtractor_i: for i in 1 to 30 generate
FullSubtractor_i: FullSubtractor port map (X(i), Y(i), C(i-1), C(i), Dif(i));
end generate;
sub31: FullSubtractor port map(X(31), Y(31), C(30), BO, Dif(31));

end Behavioral;