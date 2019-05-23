library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Inputs/Outputs decleration
entity CLA_adder is
port(
A : in std_logic_vector(3 downto 0); 
B : in std_logic_vector(3 downto 0); 
Cin: in std_logic;
Cout : out std_logic;
S: out std_logic_vector( 3 downto 0));
end CLA_adder;


--Implementation of the design entity
--Structural synthesis of a 4-bit carry-lookahead-adder using 3 units.
architecture Behavioral of CLA_adder is

--Implementation of PG, CLA and Sum unit in the architecture for later usage.

--PG unit component
component propagate_generate_module 
port(
A:in std_logic_vector(3 downto 0);
B:in std_logic_vector(3 downto 0);
P:out std_logic_vector(3 downto 0);
G:out std_logic_vector(3 downto 0));
end component;
--cla Unit component
component carry_look_ahead_unit 
port(
Pc: in std_logic_vector(3 downto 0);
Gc: in std_logic_vector(3 downto 0);
Cin: in std_logic;
Cout: out std_logic_vector(2 downto 0);
C3:out std_logic);

end component;
-- Sum unit component
component SumUnit 
port(
P : in std_logic_vector(3 downto 0);
Cs : in std_logic_vector(2 downto 0);
S: out std_logic_vector(3 downto 0);
Cin:in std_logic);
end component;

--Temporary auxiliary signals to establish a connection between the units.
signal tp,tg: std_logic_vector(3 downto 0);
signal tc : std_logic_vector(2 downto 0);

begin
--port mmapping the component signals 
PG:propagate_generate_module
port map(
A=>A,
B=>B,
P=>tp,
G=>tg);

CLA:carry_look_ahead_unit
port map(
Pc=>tp,
Gc=>tg,
Cin=>Cin,
Cout=>tc,
C3=>Cout);

Sum:SumUnit
port map(
P=>tp,
Cs=>tc,
S=>S,
Cin=>Cin);


end Behavioral;

