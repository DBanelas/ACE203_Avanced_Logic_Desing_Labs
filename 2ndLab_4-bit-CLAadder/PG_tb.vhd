LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY PG_tb IS
END PG_tb;
 
ARCHITECTURE behavior OF PG_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT propagate_generate_module
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(3 downto 0);
         G : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(3 downto 0);
   signal G : std_logic_vector(3 downto 0);
   
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: propagate_generate_module PORT MAP (
          A => A,
          B => B,
          P => P,
          G => G
        );

 
   -- Stimulus process
   stim_proc: process
   begin		
      -- testing the following combinations to indicate whether P,G functions are functional bit by bit
     
		wait for 100 ns;	
		A<="0000";
		B<="0000";
		wait for 100 ns;	
		A<="1111";
		B<="0000";
		wait for 100 ns;	
		A<="0000";
		B<="1111";
		wait for 100 ns;	
		A<="1111";
		B<="1111";
		wait for 100 ns;	
		A<="1100";
		B<="1010";
		wait for 100 ns;	
		A<="0101";
		B<="0100";
	 


      -- insert stimulus here 

      wait;
   end process;

END;
