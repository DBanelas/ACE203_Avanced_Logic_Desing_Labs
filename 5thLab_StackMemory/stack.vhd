
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity stack is
port(
CLK : in std_logic;
Push:in std_logic;
Pop:in std_logic;
RST: in std_logic;
NumberIN:in std_logic_vector(3 downto 0);
NumberOUT:out std_logic_vector(3 downto 0);
Empty:out std_logic;
Full:out std_logic;
AlmostEmpty:out std_logic;
AlmostFull:out std_logic
);
end stack;

architecture Behavioral of stack is

--FSM component
component Control is
	port(
		CLK : in std_logic;
		RST: in std_logic;
		Push : in std_logic;
		Pop: in std_logic;
		Empty: out std_logic;
		Full: out std_logic;
		AlmostEmpty: out std_logic;
		AlmostFull:out std_logic;
		addr:out std_logic_vector(3 downto 0);
		We:out std_logic_vector(0 downto 0)
);
end component;

--Memory component
COMPONENT tinki
    PORT(
       clka : IN  std_logic;
       rsta : IN  std_logic;
       wea : IN  std_logic_vector(0 downto 0);
       addra : IN  std_logic_vector(3 downto 0);
       dina : IN  std_logic_vector(3 downto 0);
       douta : OUT  std_logic_vector(3 downto 0)
);
END COMPONENT;

--auxiliary signals
signal tWe:std_logic_vector(0 downto 0);
signal taddr:std_logic_vector(3 downto 0);

begin

Cont:Control
port map(
	CLK=>CLK,
	RST=>RST,
	Push=>Push,
	Pop=>Pop,
	Empty=>Empty,
	Full=>Full,
	AlmostFull=>AlmostFull,
	AlmostEmpty=>AlmostEmpty,
	We(0)=>tWe(0),
	addr=>taddr
);

Mem:tinki
port map(
	clka=>CLK,
	rsta=>RST,
	wea(0)=>tWe(0),
	addra=>taddr,
	dina=>NumberIN,
	douta=>NumberOUT
);


end Behavioral;

