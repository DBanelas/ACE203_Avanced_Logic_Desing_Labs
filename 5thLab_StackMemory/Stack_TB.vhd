LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Stack_TB IS
END Stack_TB;
 
ARCHITECTURE behavior OF Stack_TB IS 
 
    COMPONENT stack
    PORT(
         CLK : IN  std_logic;
         Push : IN  std_logic;
         Pop : IN  std_logic;
         RST : IN  std_logic;
         NumberIN : IN  std_logic_vector(3 downto 0);
         NumberOUT : OUT  std_logic_vector(3 downto 0);
         Empty : OUT  std_logic;
         Full : OUT  std_logic;
         AlmostEmpty : OUT  std_logic;
         AlmostFull : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal Push : std_logic := '0';
   signal Pop : std_logic := '0';
   signal RST : std_logic := '0';
   signal NumberIN : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal NumberOUT : std_logic_vector(3 downto 0);
   signal Empty : std_logic;
   signal Full : std_logic;
   signal AlmostEmpty : std_logic;
   signal AlmostFull : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: stack PORT MAP (
          CLK => CLK,
          Push => Push,
          Pop => Pop,
          RST => RST,
          NumberIN => NumberIN,
          NumberOUT => NumberOUT,
          Empty => Empty,
          Full => Full,
          AlmostEmpty => AlmostEmpty,
          AlmostFull => AlmostFull
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		RST<='1';
		wait for CLK_period;
		RST<='0';
		NumberIN<="1111";
		Push<='1';
      wait for CLK_period*4;
		NumberIN<="1001";
		wait for CLK_period*2;
		NumberIN<="1011";
		wait for CLK_period*2;
		NumberIN<="0011";
		wait for CLK_period*2;
		NumberIN<="0101";
		wait for CLK_period*2;
		NumberIN<="0001";
		wait for CLK_period*2;
		NumberIN<="0111";
		wait for CLK_period*2;
		NumberIN<="1000";
		wait for CLK_period*2;
		NumberIN<="1100";
		wait for CLK_period*2;
		NumberIN<="0100";
		wait for CLK_period*2;
		Push<='0';
		Pop<='1';
		wait for CLK_period*22;
		Push<='1';

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
