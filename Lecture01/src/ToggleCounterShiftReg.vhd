----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:18:19 06/29/2018 
-- Design Name: 
-- Module Name:    ToggleCounterShiftReg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ToggleCounterShiftReg is
   port ( 
      clk       : in  STD_LOGIC;
      toggleOut : out STD_LOGIC
   );
end ToggleCounterShiftReg;

architecture Behavioral of ToggleCounterShiftReg is

   signal stage0   : std_logic;
   signal stage1   : std_logic;
   signal stage2   : std_logic;
   signal stage3   : std_logic;
   signal stage4   : std_logic;
   signal doToggle : std_logic;
   signal outValue : std_logic := '0';

begin

   doToggle <= stage0 and stage1 and stage2 and stage3 and stage4;
   
   process(clk) begin
      if rising_edge(clk) then
         if doToggle = '1' then
            outValue <= not(outValue);
         end if;
      end if;
   end process;

   toggleOut <= outValue;

   U_ShiftReg0 : entity work.ShiftReg32 
      generic map (
         BIT_CHOICE_G => 31
      )
      port map ( 
         clk       => clk,
         clkEn     => '1',
         toggleOut => stage0
      );

   U_ShiftReg1 : entity work.ShiftReg32 
      generic map (
         BIT_CHOICE_G => 31
      )
      port map ( 
         clk       => clk,
         clkEn     => stage0,
         toggleOut => stage1
      );

   U_ShiftReg2 : entity work.ShiftReg32 
      generic map (
         BIT_CHOICE_G => 31
      )
      port map ( 
         clk       => clk,
         clkEn     => stage0 and stage1,
         toggleOut => stage2
      );

   U_ShiftReg3 : entity work.ShiftReg32 
      generic map (
         BIT_CHOICE_G => 31
      )
      port map ( 
         clk       => clk,
         clkEn     => stage0 and stage1 and stage2,
         toggleOut => stage3
      );

   U_ShiftReg4 : entity work.ShiftReg32 
      generic map (
         BIT_CHOICE_G => 7
      )
      port map ( 
         clk       => clk,
         clkEn     => stage0 and stage1 and stage2 and stage3,
         toggleOut => stage4
      );


end Behavioral;

