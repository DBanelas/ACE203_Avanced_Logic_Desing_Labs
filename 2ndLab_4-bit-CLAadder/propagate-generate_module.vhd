
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Declaration of generate_propagate unit
entity propagate_generate_module is
--input/output declaration
port(
A:in std_logic_vector(3 downto 0);
B:in std_logic_vector(3 downto 0);
P:out std_logic_vector(3 downto 0);
G:out std_logic_vector(3 downto 0));
end propagate_generate_module;

--Implementation of the design entity, decleration of output functions.
architecture Behavioral of propagate_generate_module is
begin
G<=A AND B;
P<=A XOR B;

end Behavioral;

