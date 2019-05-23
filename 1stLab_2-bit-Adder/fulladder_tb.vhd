
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY fulladder_tb IS
END fulladder_tb;
 
ARCHITECTURE behavior OF fulladder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fulladder
    PORT(
         cin : IN  std_logic;
         a : IN  std_logic;
         b : IN  std_logic;
         sum : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs initialization.
   signal cin : std_logic := '0';
   signal a : std_logic := '0';
   signal b : std_logic := '0';

 	--Outputs
   signal sum : std_logic;
   signal cout : std_logic;
  
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fulladder PORT MAP (
          cin => cin,
          a => a,
          b => b,
          sum => sum,
          cout => cout
        );

   
 

   stim_proc: process
   begin		
      --Testing all posible combinations between variables A and B.
     -- Holding each combination for 100 ns to make simulation easily readable.
      wait for 100 ns;	

		a<='0';
		b<='0';
		cin<='0';
		wait for 100 ns;

		a<='0';
		b<='1';
		cin<='0';
		wait for 100 ns;

		a<='1';
		b<='0';
		cin<='0';
		wait for 100 ns;

		a<='1';
		b<='1';
		cin<='0';
		wait for 100 ns;

		a<='0';
		b<='0';
		cin<='1';
		wait for 100 ns;

		a<='0';
		b<='1';
		cin<='1';
		wait for 100 ns;

		a<='1';
		b<='0';
		cin<='1';
		wait for 100 ns;

		a<='1';
		b<='1';
		cin<='1';
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
