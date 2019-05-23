library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Inputs/Outputs decleration
entity SumUnit is
port(
P : in std_logic_vector(3 downto 0);
Cs : in std_logic_vector(2 downto 0);
S: out std_logic_vector(3 downto 0);
Cin:in std_logic);
end SumUnit;

--Implementation of the design entity, decleration of output functions.
architecture Behavioral of SumUnit is

begin
S(0)<=P(0) XOR Cin;
S(1)<=P(1) XOR Cs(0);
S(2)<=P(2) XOR Cs(1);
S(3)<=P(3) XOR Cs(2);


end Behavioral;

