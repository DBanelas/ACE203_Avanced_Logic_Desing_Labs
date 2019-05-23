
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Inputs/Outputs decleration
entity carry_look_ahead_unit is
port(
Pc: in std_logic_vector(3 downto 0);
Gc: in std_logic_vector(3 downto 0);
Cin: in std_logic;
Cout: out std_logic_vector(2 downto 0);
C3:out std_logic);

end carry_look_ahead_unit;

--Implementation of the design entity, decleration of output functions.
architecture Behavioral of carry_look_ahead_unit is

begin

Cout(0)<=Gc(0) OR (Pc(0) AND Cin);
Cout(1)<=Gc(1) OR (Pc(1) AND Gc(0)) OR (Pc(1) AND Pc(0) AND Cin);
Cout(2)<=Gc(2) OR (Pc(2) AND Gc(1)) OR (Pc(2) AND Pc(1) AND Gc(0)) OR (Pc(2) AND Pc(1) AND Pc(0) AND Cin);
C3<=Gc(3) OR (Pc(3) AND Gc(2)) OR (Pc(3) AND Pc(2) AND Gc(1)) OR (Pc(3) AND Pc(2) AND Pc(1) AND Gc(0)) OR (Pc(3) AND Pc(2) AND Pc(1) AND Pc(0) AND Cin); 

end Behavioral;

