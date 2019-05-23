LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Sum_tb IS
END Sum_tb;
 
ARCHITECTURE behavior OF Sum_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SumUnit
    PORT(
         P : IN  std_logic_vector(3 downto 0);
         Cs : IN  std_logic_vector(2 downto 0);
         S : OUT  std_logic_vector(3 downto 0);
         Cin : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal P : std_logic_vector(3 downto 0) := (others => '0');
   signal Cs : std_logic_vector(2 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SumUnit PORT MAP (
          P => P,
          Cs => Cs,
          S => S,
          Cin => Cin
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- testing the following combinations to indicate whether the S function is functional bit by bit(with Cin in mind)
      wait for 100 ns;	
		P<="0000";
		Cin<='0';
		Cs<="000";
		wait for 100 ns;	
		P<="1111";
		Cin<='0';
		Cs<="000";
		wait for 100 ns;	
		P<="0000";
		Cin<='1';
		Cs<="111";
		wait for 100 ns;	
		P<="1111";
		Cin<='1';
		Cs<="111";
		wait for 100 ns;	
		P<="0101";
		Cin<='1';
		Cs<="111";
		wait for 100 ns;	
		P<="1111";
		Cin<='0';
		Cs<="011";

      -- insert stimulus here 

      wait;
   end process;

END;
