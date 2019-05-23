library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--Inputs/Outputs declaration.
entity halfadder is
port(
x : in std_logic;
y : in std_logic;
cout1 : out std_logic;
sum1 : out std_logic);

end halfadder;
--Implementation of the design entity, decleration of output functions.
architecture Behavioral of halfadder is

begin
sum1<= x xor y;
cout1<= x and y;
end Behavioral;

