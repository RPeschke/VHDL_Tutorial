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
 
ENTITY ShiftReg32Tb IS
END ShiftReg32Tb;
 
ARCHITECTURE behavior OF ShiftReg32Tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)

--    COMPONENT ShiftReg32 is
--       generic (
--          BIT_CHOICE_G : integer range 0 to 31 := 31
--       );
--       port ( 
--          clk       : in  STD_LOGIC;
--          clkEn     : in  STD_LOGIC;
--          toggleOut : out STD_LOGIC
--       );
--    END COMPONENT;
    

   --Inputs
   signal clk   : std_logic := '0';
   signal clkEn : std_logic := '1';

 	--Outputs
   signal toggleOut : std_logic;

   -- Clock period definitions
   constant CLK_PERIOD_C : time := 30.3 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
  SR_BIT31 : entity work.ShiftReg32 
      generic map (
         BIT_CHOICE_G => 31
      )
      PORT MAP (
         clk       => clk,
         clkEn     => clkEn,
         toggleOut => toggleOut
      );

  SR_BIT15 : entity work.ShiftReg32 
      generic map (
         BIT_CHOICE_G => 15
      )
      PORT MAP (
         clk       => clk,
         clkEn     => clkEn,
         toggleOut => toggleOut
      );


   -- Clock process definitions
   CLK_33MHZ_process :process
   begin
		clk <= '0';
		wait for CLK_PERIOD_C/2;
		clk <= '1';
		wait for CLK_PERIOD_C/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_PERIOD_C*10;

      -- insert stimulus here 

      wait;
   end process;

END;
