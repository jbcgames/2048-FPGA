
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cuatro is
Port ( 
           POSX: in integer;
           POSY: in integer;
           HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
           PAINT : out  STD_LOGIC);
end cuatro;
architecture Behavioral of cuatro is
Signal UbicacionX, UbicacionY: Integer;
signal cambio: integer:=0;
begin
process (HCOUNT, VCOUNT, UbicacionX, UbicacionY)
begin
if(
(UbicacionX+20<=HCOUNT and UbicacionY+20<=VCOUNT and UbicacionX+25>HCOUNT and UbicacionY+50>VCOUNT)or
(UbicacionX+55<=HCOUNT and UbicacionY+20<=VCOUNT and UbicacionX+60>HCOUNT and UbicacionY+50>VCOUNT)or
(UbicacionX+20<=HCOUNT and UbicacionY+50<=VCOUNT and UbicacionX+60>HCOUNT and UbicacionY+55>VCOUNT)or
(UbicacionX+55<=HCOUNT and UbicacionY+50<=VCOUNT and UbicacionX+60>HCOUNT and UbicacionY+85>VCOUNT)
)then
PAINT<='1';
else
PAINT<='0';
end if;
end process;
UbicacionX<=POSX;
UbicacionY<=POSY;
end Behavioral;
