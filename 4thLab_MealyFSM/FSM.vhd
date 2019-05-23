
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity FSM is
port(
CLK: in std_logic;
RST: in std_logic;
A: in std_logic;
B: in std_logic;
Control: out std_logic_vector(2 downto 0));

end FSM;

architecture Behavioral of FSM is
type state is (s0,s1,s2,s3,s4);
signal FSM_state: state;

begin

process
	begin
		WAIT UNTIL CLK'EVENT AND CLK='1';
			if RST='1' THEN
				FSM_state<=s0;
			else
				C: case FSM_state is 
					when s0 => 
						if (A xnor B)='1' then 
							FSM_state<=s0;
						elsif (A='1') AND (B='0') then
							FSM_state<=s1;
						elsif (A='0') AND (B='1') then
							FSM_state<=s4;
							end if;
					when s1 =>
						if (A xnor B)='1' then 
							FSM_state<=s1;
				
						elsif (A='1') AND (B='0') then
							FSM_state<=s2;
							
						elsif (A='0') AND (B='1') then
							FSM_state<=s0;
							end if; 
					when s2 =>
						if (A xnor B)='1' then 
							FSM_state<=s2;
							
						elsif (A='1') AND (B='0') then
							FSM_state<=s3;
							
						elsif (A='0') AND (B='1') then
							FSM_state<=s1;
							
							end if; 
					when s3 =>
						if (A xnor B)='1' then 
							FSM_state<=s3;
							
						elsif (A='1') AND (B='0') then
							FSM_state<=s4;
							
						elsif (A='0') AND (B='1') then
							FSM_state<=s2;
							
							end if; 
					when s4=>
						if (A xnor B)='1' then 
							FSM_state<=s4;
							
						elsif (A='1') AND (B='0') then
							FSM_state<=s0;
							
						elsif (A='0') AND (B='1') then
							FSM_state<=s3;
							
							end if; 
					when others => 
						FSM_state<=s0;
				end case C;	
			end if; 
						
						
end process;

Control(0)<= '1' when((FSM_state = s0 and (A='1' and B='0')) or (FSM_state = s1 and ((A xnor B)='1')) or (FSM_state = s2 and (A='0' and B='1')) or
							(FSM_state= s2 and (A='1' and B='0')) or (FSM_state = s3 and ((A xnor B)='1')) or (FSM_state = s4 and (A='0' and B='1'))) else '0';
							
Control(1)<= '1' when((FSM_state = s1 and (A='1' and B='0')) or (FSM_state = s2 and ((A xnor B)='1')) or (FSM_state = s2 and (A='1' and B='0')) or
							(FSM_state = s3 and (A='0' and B='1')) or (FSM_state = s3 and ((A xnor B)='1')) or (FSM_state= s4 and (A='0' and B='1'))) else '0';
							
Control(2)<= '1' when((FSM_state = s0 and (A='0' and B='1')) or (FSM_state = s4 and ((A xnor B)='1')) or (FSM_state = s3 and (A='1' and B='0'))) else '0';
end Behavioral;










