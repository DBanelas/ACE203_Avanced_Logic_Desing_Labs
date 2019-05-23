library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--Input/Output declaration.
entity fulladder is
port(
cin : in std_logic;
a : in std_logic;
b : in std_logic;
sum : out std_logic;
cout: out std_logic);
end fulladder;

--Implementation of the design entity.
--Structural synthesis of a fulladder using 2 modules of halfadders.
architecture Behavioral of fulladder is
--Implementation of a halfadder in the architecture for later usage.
component halfadder is
port( 
x : in std_logic;
y : in std_logic;
cout1 : out std_logic;
sum1 : out std_logic);
end component;
--Temporary auxiliary signals to establish a connection between the two halfadder modules.
signal hs,hc,tc: std_logic;


begin
--Mapping the component signals to the entity's inputs and to the necessary auxiliary signals.
HA1:halfadder port map(
x=>a,
y=>b,
cout1=>hc,
sum1=>hs);
--Mapping the component signals to the entity's outputs and to the necessary auxiliary signals.
HA2:halfadder port map(
x=>hs,
y=>cin,
cout1=>tc,
sum1=>sum);
--decleration of cout function
cout<= tc or hc;



end Behavioral;

