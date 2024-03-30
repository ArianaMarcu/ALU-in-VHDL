----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2023 11:03:53 PM
-- Design Name: 
-- Module Name: Division - Behavioral
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

entity Division is
    Port(
        clk: in STD_LOGIC;
        M: in STD_LOGIC_VECTOR(31 downto 0); --impartitor
        A: out STD_LOGIC_VECTOR(31 downto 0); --rest
        Q: in STD_LOGIC_VECTOR(31 downto 0); --deimpartit
        Q_out: out STD_LOGIC_VECTOR(31 downto 0) --cat
    );
end entity;

architecture Behavioral of Division is

type STARI is (S0, shiftLeftAQ, nextShift, AQSplit, A_minus_M, condition1, restoreA, n_minus_1, condition2, finish_state);
signal state: STARI := S0;
signal next_state: STARI := shiftLeftAQ;

signal Q1: STD_LOGIC_VECTOR(31 downto 0);
signal AQ: STD_LOGIC_VECTOR(63 downto 0);
signal n: STD_LOGIC_VECTOR(5 downto 0);
signal A1: STD_LOGIC_VECTOR(31 downto 0);
signal sM, sQ, sOut: STD_LOGIC_VECTOR(31 downto 0);
--A1 si Q1 sunt A si Q temporare de-a lungul algoritmului
begin

process(clk)
	begin
		if rising_edge(clk) then
			state <= next_state;
		end if;
end process;

process(state, M, Q, sM, sQ)
	begin
		case state is
			when S0 =>
			    if M(31) = '1' then
                    sM <= (not M) + x"00000001";
                else 
                    sM <= M;
                end if;
                if Q(31) = '1' then
                    sQ <= (not Q) + x"00000001";
                else 
                    sQ <= Q;
                end if; 
				A1 <= X"00000000";
                AQ <= A1 & sQ;
				Q1 <= sQ;
				n <= "100000";--numarul de biti ai deimpartitului = 32
				next_state <= shiftLeftAQ;		
			when shiftLeftAQ =>
                AQ <= A1 & Q1;
				next_state <= nextShift;
			when nextShift => 
				AQ <= AQ(62 downto 0) & '0';
				next_state <= AQSplit;
			when AQSplit =>
				A1 <= AQ(63 downto 32);
				Q1 <= AQ(31 downto 0);
				next_state <= A_minus_M;
			when A_minus_M => 
				A1  <= STD_LOGIC_VECTOR(unsigned(A1)-unsigned(sM)); 
				next_state <= condition1;
            when condition1 => 
				if A1(31) = '1' then
					Q1(0) <= '0';
					next_state <= restoreA;
				else 
					Q1(0) <= '1';
					next_state <= n_minus_1;
				end if;
			when restoreA => 
				A1 <= STD_LOGIC_VECTOR(unsigned(A1)+unsigned(sM)); 
				next_state <= n_minus_1;
			when n_minus_1 =>
				n <= STD_LOGIC_VECTOR(unsigned(n)-"000001");
				next_state <= condition2;
			when condition2 =>
				if n = "000000" then 
				    next_state <= finish_state;
				else 
					next_state <= shiftLeftAQ;
				end if;
			when finish_state => 
			    A <= A1;	
			    if (M(31) xor Q(31)) = '1' then
                    Q_out <= (not Q1) + x"00000001";
                else 
                    Q_out <= Q1;
                end if;		 
		end case;
end process;

end Behavioral;