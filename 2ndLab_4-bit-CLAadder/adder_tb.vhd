LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY adder_tb IS
END adder_tb;
 
ARCHITECTURE behavior OF adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CLA_adder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         S : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal S : std_logic_vector(3 downto 0);
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CLA_adder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          S => S
        );

   -- Stimulus process
   stim_proc: process
   begin		
      --Testing various combinations with overflow and cin in mind
      wait for 100 ns;	
		A<="1010";
		B<="0101";
		Cin<='0';
		wait for 100 ns;	
		A<="0111";
		B<="0011";
		Cin<='0';
		wait for 100 ns;	
		A<="1101";
		B<="0001";
		Cin<='0';
		wait for 100 ns;	
		A<="1001";
		B<="0111";
		Cin<='0';
		wait for 100 ns;	
		A<="1010";
		B<="0101";
		Cin<='1';
		wait for 100 ns;	
		A<="0111";
		B<="0011";
		Cin<='1';
		wait for 100 ns;	
		A<="1101";
		B<="0001";
		Cin<='1';
		wait for 100 ns;	
		A<="1001";
		B<="0111";
		Cin<='1';

		
      -- insert stimulus here 

      wait;
   end process;

END;
