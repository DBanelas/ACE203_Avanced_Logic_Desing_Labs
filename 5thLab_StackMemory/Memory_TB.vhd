--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:17:17 05/11/2019
-- Design Name:   
-- Module Name:   /home/ise/Documents/Stack_memory/Memory_TB.vhd
-- Project Name:  Stack_memory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tinki
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
 
ENTITY Memory_TB IS
END Memory_TB;
 
ARCHITECTURE behavior OF Memory_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tinki
    PORT(
         clka : IN  std_logic;
         rsta : IN  std_logic;
         wea : IN  std_logic_vector(0 downto 0);
         addra : IN  std_logic_vector(3 downto 0);
         dina : IN  std_logic_vector(3 downto 0);
         douta : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clka : std_logic := '0';
   signal rsta : std_logic := '0';
   signal wea : std_logic_vector(0 downto 0) := (others => '0');
   signal addra : std_logic_vector(3 downto 0) := (others => '0');
   signal dina : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal douta : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clka_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tinki PORT MAP (
          clka => clka,
          rsta => rsta,
          wea => wea,
          addra => addra,
          dina => dina,
          douta => douta
        );

   -- Clock process definitions
   clka_process :process
   begin
		clka <= '0';
		wait for clka_period/2;
		clka <= '1';
		wait for clka_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
       rsta <= '1';	
		wait for clka_period;
		wea(0) <= '1';
      rsta <= '0';  
		addra <= X"0";
		dina <= X"F";
		wait for clka_period;
		addra <= X"4";
		dina <= X"b";
		wait for clka_period;
		wea(0) <='0';
		addra <= X"0";
		dina <= X"2";
		wait for clka_period;
		addra <= X"4";
		wait for clka_period;
		rsta <= '1';
		wait for clka_period;
		rsta <= '0';
		addra <= X"0";
		wait for clka_period*9;
      wait;
   end process;

END;
