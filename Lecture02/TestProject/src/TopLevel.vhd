----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:46:00 06/29/2018 
-- Design Name: 
-- Module Name:    topLevel - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity TopLevel is
   port ( 
      CLK_33MHZ_SYSACE : in   STD_LOGIC;
      GPIO_LED_0       : out  STD_LOGIC;
      GPIO_LED_1       : out  STD_LOGIC;
      GPIO_LED_2       : out  STD_LOGIC;
      GPIO_LED_3       : out  STD_LOGIC;
      FPGA_AWAKE       : out  STD_LOGIC
   );
end TopLevel;

architecture Behavioral of TopLevel is

   signal coreClk : STD_LOGIC; -- '0', '1', 'Z', 'U', 'X'
   signal leds    : std_logic_vector(4 downto 0);
   
   constant BIT_HI_C : std_logic := '1';
   constant BIT_LO_C : std_logic := '0';

begin

   U_IBUF33 : IBUFG
      port map (
         I => CLK_33MHZ_SYSACE,
         O => coreClk
      );

   -- Simple assignments
   GPIO_LED_0 <= leds(0);
   GPIO_LED_1 <= leds(1);
   GPIO_LED_2 <= leds(2);
   GPIO_LED_3 <= leds(3);
   FPGA_AWAKE <= leds(4);

   -- Static driving example
   leds(0) <= BIT_HI_C or BIT_LO_C;
   leds(1) <= BIT_HI_C and BIT_LO_C;
   
   -- Blinky outputs
   U_ToggleCounter : entity work.ToggleCounter
      generic map (
         CYCLES_PER_HALF_PERIOD_G => 16500000
      )
      port map (
         clk       => coreClk,
         toggleOut => leds(2)
      );
   U_ToggleCounter2 : entity work.ToggleCounter2
      generic map (
         BIT_SELECT_G => 24
      )
      port map (
         clk       => coreClk,
         toggleOut => leds(3)
      );
   U_ToggleCounterShiftRegister : entity work.ToggleCounterShiftReg
      port map (
         clk       => coreClk,
         toggleOut => leds(4)
      );


end Behavioral;

