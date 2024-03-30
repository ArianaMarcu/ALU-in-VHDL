----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2024 06:27:45 PM
-- Design Name: 
-- Module Name: ControlUnit - Behavioral
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

entity ControlUnit is
    Port ( 
        X: in STD_LOGIC_VECTOR(31 downto 0);
        Y: in STD_LOGIC_VECTOR(31 downto 0);
        SEL: in STD_LOGIC_VECTOR(3 downto 0);
        RESULT: out STD_LOGIC_VECTOR(63 downto 0);
        CLK: in STD_LOGIC;
        ENABLE: in STD_LOGIC
     );
end ControlUnit;

architecture Behavioral of ControlUnit is

component project_1 is
    port(
        X, Y: in STD_LOGIC_VECTOR(31 downto 0);
        Cin: in STD_LOGIC;
        Cout: out STD_LOGIC;
        S: out STD_LOGIC_VECTOR(31 downto 0)
        );
end component; --SUMATOR

component Rotations is
  Port (
    nr: in STD_LOGIC_VECTOR(31 downto 0);
    rez: out STD_LOGIC_VECTOR(31 downto 0);
    stanga: in STD_LOGIC
  );
end component; --ROTATII

component subtractor_32biti is
    Port(
        X, Y: in STD_LOGIC_VECTOR(31 downto 0);
        BI: in STD_LOGIC;
        BO: out STD_LOGIC;
        Dif: out STD_LOGIC_VECTOR(31 downto 0)
    );
end component;

component Multiplier is
	port(
	      clk: in STD_LOGIC;
		  start: in STD_LOGIC;
		  multiplicand: in STD_LOGIC_VECTOR(31 downto 0);
		  multiplier: in STD_LOGIC_VECTOR(31 downto 0);
		  rez: out STD_LOGIC_VECTOR(63 downto 0)
     );
end component;

component Division is
    Port(
        clk: in STD_LOGIC;
        M: in STD_LOGIC_VECTOR(31 downto 0);
        A: out STD_LOGIC_VECTOR(31 downto 0);
        Q: in STD_LOGIC_VECTOR(31 downto 0);
        Q_out: out STD_LOGIC_VECTOR(31 downto 0)
    );
end component;

component OperatiiLogice is
    Port (
        Sel: in STD_LOGIC_VECTOR(1 downto 0);
        A, B: in STD_LOGIC_VECTOR(31 downto 0);
        Res: out STD_LOGIC_VECTOR(31 downto 0)
    );
end component;

signal carryIn, carryOut, borrowIn, borrowOut: STD_LOGIC; 
signal st: STD_LOGIC := '0';
signal suma, rotit_dreapta, rotit_stanga, dif, cat, rest, rezAND, rezOR, rezNOT, inc, dec: STD_LOGIC_VECTOR(31 downto 0);

signal produs: STD_LOGIC_VECTOR(63 downto 0);

begin

SUMATOR: project_1 port map(X, Y, '0', carryOut, suma);
ROTATIE_DREAPTA: Rotations port map(X, rotit_dreapta, '0');
ROTATIE_STANGA: Rotations port map(X, rotit_stanga, '1');
SCAZATOR: subtractor_32biti port map(X, Y, '0', borrowOut, dif);
INMULTITOR: Multiplier port map(CLK, st, X, Y, produs);
IMPARTITOR: Division port map(CLK, Y, rest, X, cat);
SI_LOGIC: OperatiiLogice port map("00", X, Y, rezAND);
SAU_LOGIC: OperatiiLogice port map("01", X, Y, rezOR);
NU_LOGIC: OperatiiLogice port map("10", X, Y, rezNOT);
INCREMENTARE: project_1 port map(X, x"00000001", '0', carryOut, inc);
DECREMENTARE: subtractor_32biti port map(X, x"00000001", '0', borrowOut, dec);

process(X, Y, SEL, CLK, ENABLE)
begin
    if rising_edge(CLK) then
        if ENABLE = '1' then
            case SEL is
                when "0000" =>
                    RESULT(31 downto 0) <= suma;
                    RESULT(63 downto 32) <= x"00000000";
                when "0001" =>
                    RESULT(31 downto 0) <= rotit_dreapta;
                    RESULT(63 downto 32) <= x"00000000";
                when "0010" =>
                    RESULT(31 downto 0) <= rotit_stanga;
                    RESULT(63 downto 32) <= x"00000000";
                when "0011" =>
                    RESULT(31 downto 0) <= dif;
                    RESULT(63 downto 32) <= x"00000000";
                when "0100" =>
                    RESULT <= produs; 
                when "0101" =>
                    RESULT(31 downto 0) <= cat;
                    RESULT(31 downto 0) <= rest;
                when "0110" =>
                    RESULT(31 downto 0) <= rezAND;
                    RESULT(63 downto 32) <= x"00000000";
                when "0111" =>
                    RESULT(31 downto 0) <= rezOR;
                    RESULT(63 downto 32) <= x"00000000";
                when"1000" =>
                    RESULT(31 downto 0) <= rezNOT;
                    RESULT(63 downto 32) <= x"00000000";
                when"1001" =>
                    RESULT(31 downto 0) <= inc;
                    RESULT(63 downto 32) <= x"00000000";
                when"1010" =>
                    RESULT(31 downto 0) <= dec;     
                    RESULT(63 downto 32) <= x"00000000";  
                when others => RESULT <= (others => '0');
            end case;
        end if;
    end if;
end process;

end Behavioral;
