--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:49:28 03/24/2019
-- Design Name:   
-- Module Name:   /home/ise/Documents/strangecounter/strangeCounter_TB.vhd
-- Project Name:  strangecounter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: strangeCounter
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
 
ENTITY strangeCounter_TB IS
END strangeCounter_TB;
 
ARCHITECTURE behavior OF strangeCounter_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT strangeCounter
    PORT(
         Clk : IN  std_logic;
         RST : IN  std_logic;
         Control : IN  std_logic_vector(2 downto 0);
         Count : INOUT  std_logic_vector(7 downto 0);
         Overflow : OUT  std_logic;
         Underflow : OUT  std_logic;
         Valid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal RST : std_logic := '0';
   signal Control : std_logic_vector(2 downto 0) := (others => '0');

	--BiDirs
   signal Count : std_logic_vector(7 downto 0);

 	--Outputs
   signal Overflow : std_logic;
   signal Underflow : std_logic;
   signal Valid : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: strangeCounter PORT MAP (
          Clk => Clk,
          RST => RST,
          Control => Control,
          Count => Count,
          Overflow => Overflow,
          Underflow => Underflow,
          Valid => Valid
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
			RST<='1';
      wait for Clk_period*10;
		RST<='0';
		Control<="011";
		wait for Clk_period;
		Control<="100";
		wait for Clk_period;
		Control<="101";
		wait for Clk_period;
		Control<="110";
		wait for Clk_period;
		Control<="111";
		wait for Clk_period;
		Control<="010";
		wait for Clk_period*2;
		Control<="000";
		wait for Clk_period*4;
		Control<="001";
		wait for Clk_period*6;
		RST<='1';
		wait for Clk_period;
		RST<='0';
		Control<="111";
		wait for Clk_period*20;
		

      -- insert stimulus here 

      wait;
   end process;

END;
