library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 

entity Control is
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
end Control;

architecture Behavioral of Control is

type state is (spush,sidle,spop);

signal FSM_state: state;
signal tEmpty,tFull,tAlmostFull,tAlmostEmpty:std_logic;
signal taddr:std_logic_vector(3 downto 0);
signal tWe : std_logic_vector(0 downto 0);


begin

process
	begin
		WAIT UNTIL CLK'EVENT AND CLK='1';
			if RST='1' THEN
				FSM_state<=sidle;
				taddr<="0000";
				tWe(0)<='0';
				tAlmostEmpty<='0';
				tAlmostFull<='0';
				tFull<='0';
				tEmpty<='1';
			else
				C: case FSM_state is 
						when sidle=>
							tWe(0)<='0';
							taddr<=taddr;
							if taddr="0000" then
								tEmpty<='1';
								if Push='1' and Pop ='0' then 
									tEmpty<='0';
								end if;
							elsif taddr="1010" then
								tFull<='1';
								tAlmostFull<='1';
								if Pop='1' and Push ='0' then
									tFull<='0';
								end if;
							elsif taddr="1000" or taddr="1001"  then
								tAlmostFull<='1';
								if taddr="1000" and Pop='1' then 
									tAlmostFull<='0';
								end if;
							elsif taddr="0001" or taddr="0010" or taddr="0011" then
								tAlmostEmpty<='1';
								if taddr="0011" and Push='1' then
									tAlmostEmpty<='0';
								end if;
							else
								tEmpty<='0';
								tFull<='0';
								tAlmostFull<='0';
								tAlmostEmpty<='0';
							end if;
							if (Push='1' and Pop='0') and taddr<10 then 
								FSM_state<=spush;
							elsif (Pop='1' and Push='0') and taddr>0 then
								FSM_state<=spop;
							else
								FSM_state<=sidle;
							end if;
						when spush=>
							taddr<=taddr+1;
							tWe(0)<='1';
							FSM_state<=sidle;
						when spop=>
							tWe(0)<='0';
							taddr<=taddr-1;
							FSM_state<=sidle;
						when others=>
							taddr<=taddr;
							tWe(0)<='0';
							FSM_state<=sidle;
					end case C;	
			end if; 
end process;

We(0)<=tWe(0);
addr<=taddr;
Empty<=tEmpty;
Full<=tFull;
AlmostFull<=tAlmostFull;
AlmostEmpty<=tAlmostEmpty;
				
				
end Behavioral;

