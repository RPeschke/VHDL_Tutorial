----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:27:14 06/29/2018 
-- Design Name: 
-- Module Name:    ToggleCounter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ToggleCounter2 is
   Generic (
      BIT_SELECT_G : integer := 10
   );
   Port ( 
      clk       : in  STD_LOGIC;
      toggleOut : out  STD_LOGIC
   );
end ToggleCounter2;

architecture Behavioral of ToggleCounter2 is

   signal counter  : unsigned(BIT_SELECT_G downto 0) := (others => '0');

begin

   process(clk) begin
      if rising_edge(clk) then
         counter <= counter + 1;
      end if;
   end process;
   
   toggleOut <= counter(BIT_SELECT_G);

end Behavioral;

