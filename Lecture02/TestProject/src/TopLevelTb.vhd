--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:17:01 06/29/2018
-- Design Name:   
-- Module Name:   /home/ise/ise-shared/TestProject/src/TopLevelTb.vhd
-- Project Name:  testProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TopLevel
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
 
ENTITY TopLevelTb IS
END TopLevelTb;
 
ARCHITECTURE behavior OF TopLevelTb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TopLevel
    PORT(
         CLK_33MHZ_SYSACE : IN  std_logic;
         GPIO_LED_0 : OUT  std_logic;
         GPIO_LED_1 : OUT  std_logic;
         GPIO_LED_2 : OUT  std_logic;
         GPIO_LED_3 : OUT  std_logic;
         FPGA_AWAKE : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_33MHZ_SYSACE : std_logic := '0';

 	--Outputs
   signal GPIO_LED_0 : std_logic;
   signal GPIO_LED_1 : std_logic;
   signal GPIO_LED_2 : std_logic;
   signal GPIO_LED_3 : std_logic;
   signal FPGA_AWAKE : std_logic;

   -- Clock period definitions
   constant CLK_33MHZ_SYSACE_period : time := 30.3 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TopLevel PORT MAP (
          CLK_33MHZ_SYSACE => CLK_33MHZ_SYSACE,
          GPIO_LED_0 => GPIO_LED_0,
          GPIO_LED_1 => GPIO_LED_1,
          GPIO_LED_2 => GPIO_LED_2,
          GPIO_LED_3 => GPIO_LED_3,
          FPGA_AWAKE => FPGA_AWAKE
        );

   -- Clock process definitions
   CLK_33MHZ_SYSACE_process :process
   begin
		CLK_33MHZ_SYSACE <= '0';
		wait for CLK_33MHZ_SYSACE_period/2;
		CLK_33MHZ_SYSACE <= '1';
		wait for CLK_33MHZ_SYSACE_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_33MHZ_SYSACE_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
