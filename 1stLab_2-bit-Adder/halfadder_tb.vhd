
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY halfadder_tb IS
END halfadder_tb;
 
ARCHITECTURE behavior OF halfadder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT halfadder
    PORT(
         x : IN  std_logic;
         y : IN  std_logic;
         cout1 : OUT  std_logic;
         sum1 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs initialization.
   signal x : std_logic := '0';
   signal y : std_logic := '0';

 	--Outputs
   signal cout1 : std_logic;
   signal sum1 : std_logic;
   
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: halfadder PORT MAP (
          x => x,
          y => y,
          cout1 => cout1,
          sum1 => sum1
        );

   

   -- Stimulus process
	stim_proc1: process
   begin		
      --Testing all posible combinations between variables A and B.
     -- Holding each combination for 100 ns to make simulation easily readable.
      wait for 100 ns;	
	  x<='0';
	  y<='0';
	  wait for 100 ns;	
	  x<='0';
	  y<='1';
	  wait for 100 ns;	
	  x<='1';
	  y<='0';
	  wait for 100 ns;	
	  x<='1';
	  y<='1';
      wait;
   end process;

END;
