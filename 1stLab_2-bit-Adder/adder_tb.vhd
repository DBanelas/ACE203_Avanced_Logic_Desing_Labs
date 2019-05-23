
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY adder_tb IS
END adder_tb;
 
ARCHITECTURE behavior OF adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder
    PORT(
         CIN : IN  std_logic;
			--MSB=A(1) , LSB=A(0).
         A : IN  std_logic_vector(1 downto 0);
			--MSB=B(1) , LSB=B(0).
         B : IN  std_logic_vector(1 downto 0);
			--MSB=RESULT(1) , LSB=RESULT(0).
         RESULT : OUT  std_logic_vector(1 downto 0);
         COUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs initialization.
   signal CIN : std_logic := '0';
   signal A : std_logic_vector(1 downto 0) := (others => '0');
   signal B : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal RESULT : std_logic_vector(1 downto 0);
   signal COUT : std_logic;
   
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder PORT MAP (
          CIN => CIN,
          A => A,
          B => B,
          RESULT => RESULT,
          COUT => COUT
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      --Testing all posible combinations between variables A and B.
     -- Holding each combination for 30 ns to make simulation easily readable.
      wait for 30 ns;	
		CIN<='0';
		A(1)<='0';
		A(0)<='0';
		B(1)<='0';
		B(0)<='0';
		wait for 30 ns;

		CIN<='0';
		A(1)<='0';
		A(0)<='0';
		B(1)<='0';
		B(0)<='1';
		wait for 30 ns;

		CIN<='0';
		A(1)<='0';
		A(0)<='0';
		B(1)<='1';
		B(0)<='0';
		wait for 30 ns;

		CIN<='0';
		A(1)<='0';
		A(0)<='0';
		B(1)<='1';
		B(0)<='1';
		wait for 30 ns;

		CIN<='0';
		A(1)<='0';
		A(0)<='1';
		B(1)<='0';
		B(0)<='0';
		wait for 30 ns;

		CIN<='0';
		A(1)<='0';
		A(0)<='1';
		B(1)<='0';
		B(0)<='1';
		wait for 30 ns;

		CIN<='0';
A(1)<='0';
A(0)<='1';
B(1)<='1';
B(0)<='0';
wait for 30 ns;

CIN<='0';
A(1)<='0';
A(0)<='1';
B(1)<='1';
B(0)<='1';
wait for 30 ns;

CIN<='0';
A(1)<='1';
A(0)<='0';
B(1)<='0';
B(0)<='0';
wait for 30 ns;

CIN<='0';
A(1)<='1';
A(0)<='0';
B(1)<='0';
B(0)<='1';
wait for 30 ns;

CIN<='0';
A(1)<='1';
A(0)<='0';
B(1)<='1';
B(0)<='0';
wait for 30 ns;

CIN<='0';
A(1)<='1';
A(0)<='0';
B(1)<='1';
B(0)<='1';
wait for 30 ns;

CIN<='0';
A(1)<='1';
A(0)<='1';
B(1)<='0';
B(0)<='0';
wait for 30 ns;

CIN<='0';
A(1)<='1';
A(0)<='1';
B(1)<='0';
B(0)<='1';
wait for 30 ns;

CIN<='0';
A(1)<='1';
A(0)<='1';
B(1)<='1';
B(0)<='0';
wait for 30 ns;

CIN<='0';
A(1)<='1';
A(0)<='1';
B(1)<='1';
B(0)<='1';
wait for 30 ns;

CIN<='1';
A(1)<='0';
A(0)<='0';
B(1)<='0';
B(0)<='0';
wait for 30 ns;

CIN<='1';
A(1)<='0';
A(0)<='0';
B(1)<='0';
B(0)<='1';
wait for 30 ns;

CIN<='1';
A(1)<='0';
A(0)<='0';
B(1)<='1';
B(0)<='0';
wait for 30 ns;

CIN<='1';
A(1)<='0';
A(0)<='0';
B(1)<='1';
B(0)<='1';
wait for 30 ns;

CIN<='1';
A(1)<='0';
A(0)<='1';
B(1)<='0';
B(0)<='0';
wait for 30 ns;

CIN<='1';
A(1)<='0';
A(0)<='1';
B(1)<='0';
B(0)<='1';
wait for 30 ns;

CIN<='1';
A(1)<='0';
A(0)<='1';
B(1)<='1';
B(0)<='0';
wait for 30 ns;

CIN<='1';
A(1)<='0';
A(0)<='1';
B(1)<='1';
B(0)<='1';
wait for 30 ns;

CIN<='1';
A(1)<='1';
A(0)<='0';
B(1)<='0';
B(0)<='0';
wait for 30 ns;

CIN<='1';
A(1)<='1';
A(0)<='0';
B(1)<='0';
B(0)<='1';
wait for 30 ns;

CIN<='1';
A(1)<='1';
A(0)<='0';
B(1)<='1';
B(0)<='0';
wait for 30 ns;

CIN<='1';
A(1)<='1';
A(0)<='0';
B(1)<='1';
B(0)<='1';
wait for 30 ns;

CIN<='1';
A(1)<='1';
A(0)<='1';
B(1)<='0';
B(0)<='0';
wait for 30 ns;

CIN<='1';
A(1)<='1';
A(0)<='1';
B(1)<='0';
B(0)<='1';
wait for 30 ns;

CIN<='1';
A(1)<='1';
A(0)<='1';
B(1)<='1';
B(0)<='0';
wait for 30 ns;

CIN<='1';
A(1)<='1';
A(0)<='1';
B(1)<='1';
B(0)<='1';
wait for 30 ns;


      wait;
   end process;

END;
