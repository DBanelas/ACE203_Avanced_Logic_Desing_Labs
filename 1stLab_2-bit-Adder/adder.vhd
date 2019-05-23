
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Input/Output declaration.
entity adder is
port(
			CIN : IN  std_logic;
			--MSB=A(1) , LSB=A(0).
         A : IN  std_logic_vector(1 downto 0);
			--MSB=B(1) , LSB=B(0).
         B : IN  std_logic_vector(1 downto 0);
			--MSB=RESULT(1) , LSB=RESULT(0).
         RESULT : OUT  std_logic_vector(1 downto 0);
         COUT : OUT  std_logic
        );
end adder;
--Implementation of the design entity.
--Structural synthesis of a 2bit-adder using 2 modules of fulladders.
architecture Behavioral of adder is
component fulladder is
port(
cin : in std_logic;
a : in std_logic;
b : in std_logic;
sum : out std_logic;
cout: out std_logic);
end component;
--Temporary auxiliary signals to establish a connection between the two fulladder modules.
signal tc2:STD_LOGIC;
begin
--Mapping the component signals to the entity's inputs and to the necessary auxiliary signals.
FA1:fulladder
port map(
a=>A(0),
b=>B(0),
cin=>CIN,
sum=>RESULT(0),
cout=>tc2);
--Mapping the component signals to the entity's outputs and to the necessary auxiliary signals.
FA2:fulladder
port map(
a=>A(1),
b=>B(1),
cin=>tc2,
sum=>RESULT(1),
cout=>COUT);


end Behavioral;

