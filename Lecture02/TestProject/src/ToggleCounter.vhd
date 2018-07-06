library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ToggleCounter is
   Generic (
      CYCLES_PER_HALF_PERIOD_G : integer := 50000000
   );
   Port ( 
      clk       : in  STD_LOGIC;
      toggleOut : out  STD_LOGIC
   );
end ToggleCounter;

architecture Behavioral of ToggleCounter is

   signal counter  : unsigned(31 downto 0) := (others => '0');
   signal outValue : std_logic := '0';

begin

   process(clk) begin
--   process(counter) begin
      if rising_edge(clk) then
         counter <= counter + 1;
         if counter = CYCLES_PER_HALF_PERIOD_G then
            counter  <= (others => '0');
            outValue <= not(outValue);
         end if;
      end if;
   end process;
   
   toggleOut <= outValue;

end Behavioral;

