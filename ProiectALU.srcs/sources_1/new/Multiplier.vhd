----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2023 03:19:57 AM
-- Design Name: 
-- Module Name: Multiplier - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplier is
	port(
	      clk: in STD_LOGIC;
		  start: in STD_LOGIC;
		  multiplicand: in STD_LOGIC_VECTOR(31 downto 0);
		  multiplier: in STD_LOGIC_VECTOR(31 downto 0);
		  rez: out STD_LOGIC_VECTOR(63 downto 0)
     );
end Multiplier; -- ShiftAndAdd

architecture Behavioral of Multiplier is

signal A: STD_LOGIC_VECTOR(63 downto 0) := x"0000000000000000";
signal B: STD_LOGIC_VECTOR(63 downto 0) := x"0000000000000000";
signal Q: STD_LOGIC_VECTOR(31 downto 0);
signal add, scriere: STD_LOGIC := '0';
signal shiftR, shiftL: STD_LOGIC := '0';
signal res: STD_LOGIC := '0';
signal aux: STD_LOGIC_VECTOR(63 downto 0) := x"0000000000000000";
signal MUL1, MUL2: STD_LOGIC_VECTOR(31 downto 0);
	
component Add64bit is
    port(
        X, Y: in STD_LOGIC_VECTOR(63 downto 0);
        Cin: in STD_LOGIC;
        Cout: out STD_LOGIC;
        S: out STD_LOGIC_VECTOR(63 downto 0)
    );
end component;
	
begin
	
process(clk)
begin
	if rising_edge(clk) then
		if start = '1' then
		    if multiplicand(31) = '1' then
                MUL1 <= (not multiplicand) + x"00000001";
            else 
                MUL1 <= multiplicand;
            end if;
            if multiplier(31) = '1' then
                MUL2 <= (not multiplier) + x"00000001";
            else 
                MUL2 <= multiplier;
            end if;
			B(63 downto 32) <= x"00000000";
			B(31 downto 0) <= MUL1;
			A <= x"0000000000000000";
			Q <= MUL2;
		else
			if shiftL = '1' then
				B <=  B(62 downto 0) & "0"; -- shiftare la stanga
			end if;
			if shiftR = '1' then
				Q <= '0' & Q(31 downto 1); -- shiftare la dreapta
			end if;
			if scriere = '1' then
				A <= aux;
			end if;
		end if;
	end if;
end process;
	
process(clk)
begin
	shiftL <= '0';
	shiftR <= '0';
	scriere <= '0';
		
	if start = '0' then
		shiftL <= '1';
		shiftR <= '1';	
		if Q(0) = '1' then
			scriere <= '1';
		end if;
	end if;
		
end process;
	
ShiftAndAdd: Add64bit port map(A, B, '0', res, aux);

process(multiplicand, multiplier, A)
begin
    if (multiplicand(31) xor multiplier(31)) = '1' then
        rez <= (not A) + x"00000001";
    else 
        rez <= A;
    end if;
end process;

end Behavioral;