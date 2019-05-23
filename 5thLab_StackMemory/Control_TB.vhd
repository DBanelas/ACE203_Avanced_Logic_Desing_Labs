--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:10:55 05/11/2019
-- Design Name:   
-- Module Name:   /home/ise/Documents/Stack_memory/Control_TB.vhd
-- Project Name:  Stack_memory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Control
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Control_TB IS
END Control_TB;
 
ARCHITECTURE behavior OF Control_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Control
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         Push : IN  std_logic;
         Pop : IN  std_logic;
         Empty : OUT  std_logic;
         Full : OUT  std_logic;
         AlmostEmpty : OUT  std_logic;
         AlmostFull : OUT  std_logic;
         addr : OUT  std_logic_vector(3 downto 0);
         We : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal Push : std_logic := '0';
   signal Pop : std_logic := '0';

 	--Outputs
   signal Empty : std_logic;
   signal Full : std_logic;
   signal AlmostEmpty : std_logic;
   signal AlmostFull : std_logic;
   signal addr : std_logic_vector(3 downto 0);
   signal We : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Control PORT MAP (
          CLK => CLK,
          RST => RST,
          Push => Push,
          Pop => Pop,
          Empty => Empty,
          Full => Full,
          AlmostEmpty => AlmostEmpty,
          AlmostFull => AlmostFull,
          addr => addr,
          We => We
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
		Push<='1';
      wait for CLK_period*22;
		Push<='0';
		Pop<='1';
		wait for CLK_period*20;
		push<='1';
      -- insert stimulus here 

      wait;
   end process;

END;
