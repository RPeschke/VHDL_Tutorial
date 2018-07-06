----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:37:11 06/29/2018 
-- Design Name: 
-- Module Name:    ShiftReg32 - Behavioral 
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

entity ShiftRegMax32 is
   generic (
      BIT_CHOICE_G : integer range 1 to 31 := 31
   );
   port ( 
      clk       : in  STD_LOGIC;
      clkEn     : in  STD_LOGIC;
      toggleOut : out STD_LOGIC
   );
end ShiftRegMax32;

architecture Behavioral of ShiftRegMax32 is

   signal shiftReg : std_logic_vector(BIT_CHOICE_G downto 0) := (0 => '1', others => '0');

begin

   process(clk) begin
      if rising_edge(clk) then
         if clkEn = '1' then
            shiftReg <= shiftReg(shiftReg'left-1 downto 0) & shiftReg(shiftReg'left);
         end if;
      end if;
   end process;

   toggleOut <= shiftReg(BIT_CHOICE_G);

end Behavioral;

