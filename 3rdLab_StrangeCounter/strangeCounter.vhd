----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 



entity strangeCounter is
port(
--Inputs/Outputs decleration
Clk: in std_logic;
RST: in std_logic;
Control: in std_logic_vector(2 downto 0);
Count: inout std_logic_vector(7 downto 0);
Overflow: out std_logic;
Underflow: out std_logic;
Valid: out std_logic);

end strangeCounter;

architecture Behavioral of strangeCounter is

--Temporary auxiliary signals 
signal c_temp: std_logic_vector(7 downto 0);
signal t_valid, t_overflow, t_underflow: std_logic;
begin


process
begin
	wait until Clk'EVENT AND Clk='1';
	--If signal reset=1 strange counter outputs and signals overflow/underflow, valid are initialized to restart the counter
		if RST='1' then
			c_temp<="00000000";
			t_valid<='1';
			t_overflow<='0';
			t_underflow<='0';
		else
		--if signal valid=0, the counter freezes at its current state, until signal reset=1.
			if t_valid='0' then
				c_temp<=c_temp;
			else
			--For each possible combination of the control input signals, counter assigns to its next output the addition
         --between its current output and a 'step' corresponding to each control condition
			--in each if statement, the counter checks for overflows or underflows and assigns the appropriate values to overflow, underflow and valid signals 
				if Control="000" then
					if c_temp<5 then
						t_underflow<='1';
						t_valid<='0';
					end if;
					c_temp<=c_temp-5;
				elsif Control="001" then
					if c_temp<2 then
						t_underflow<='1';
						t_valid<='0';
					end if;
					c_temp<=c_temp-2;
				elsif Control="010" then
					c_temp<=c_temp;
				elsif Control="011" then
					if c_temp>254 then
						t_overflow<='1';
						t_valid<='0';
					end if;
					c_temp<=c_temp+1;
				elsif Control="100" then
					if c_temp>253 then
						t_overflow<='1';
						t_valid<='0';
					end if;
					c_temp<=c_temp+2;
				elsif Control="101" then
					if c_temp>250 then
						t_overflow<='1';
						t_valid<='0';
					end if;
					c_temp<=c_temp+5;
				elsif Control="110" then
					if c_temp>249 then
						t_overflow<='1';
						t_valid<='0';
					end if;
					c_temp<=c_temp+6;
				else
					if c_temp>243 then
						t_overflow<='1';
						t_valid<='0';
					end if;
					c_temp<=c_temp+12;
				end if;
				

			end if;
		end if;

end process;
--Assigning the auxiliary signals to the final outputs of the circuit
Count<=c_temp;
Valid<=t_valid;
Overflow<= t_overflow;
Underflow<= t_underflow;
end Behavioral;

