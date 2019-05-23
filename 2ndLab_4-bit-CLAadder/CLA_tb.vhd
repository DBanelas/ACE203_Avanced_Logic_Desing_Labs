--------------------------------------------------------------------------------
-- Company: 
-- Engineer:

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CLA_tb IS
END CLA_tb;
 
ARCHITECTURE behavior OF CLA_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT carry_look_ahead_unit
    PORT(
         Pc : IN  std_logic_vector(3 downto 0);
         Gc : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic_vector(2 downto 0);
         C3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Pc : std_logic_vector(3 downto 0) := (others => '0');
   signal Gc : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic_vector(2 downto 0);
   signal C3 : std_logic;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: carry_look_ahead_unit PORT MAP (
          Pc => Pc,
          Gc => Gc,
          Cin => Cin,
          Cout => Cout,
          C3 => C3
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- testing the following combinations to indicate whether each minterm of each function is operational
      wait for 100 ns;	
		Pc<="0000";
		Gc<="0000";
		Cin<='0';
		wait for 100 ns;	
		Pc<="1111";
		Gc<="0000";
		Cin<='1';
		wait for 100 ns;	
		Pc<="1111";
		Gc<="0000";
		Cin<='0';
		wait for 100 ns;	
		Pc<="1110";
		Gc<="0001";
		Cin<='0';
		wait for 100 ns;	
		Pc<="1100";
		Gc<="0010";
		Cin<='0';
		wait for 100 ns;	
		Pc<="1000";
		Gc<="0100";
		Cin<='0';
		wait for 100 ns;	
		Pc<="0000";
		Gc<="1000";
		Cin<='0';
		wait for 100 ns;	
		Pc<="1111";
		Gc<="1111";
		Cin<='0';
      

      -- insert stimulus here 

      wait;
   end process;

END;
