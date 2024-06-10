
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

entity LeftArrow is
Port ( 
           POSX: in integer;
           POSY: in integer;
           HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
           PAINT : out  STD_LOGIC);
end LeftArrow;
architecture Behavioral of LeftArrow is
Signal UbicacionX, UbicacionY: Integer;
signal cambio: std_logic;
begin
process (HCOUNT, VCOUNT, UbicacionX, UbicacionY)
begin
if(
(UbicacionX-2<=HCOUNT and UbicacionY-2<=VCOUNT and UbicacionX+2>HCOUNT and UbicacionY+2>VCOUNT)or
(UbicacionX+2<=HCOUNT and UbicacionY-4<=VCOUNT and UbicacionX+6>HCOUNT and UbicacionY+4>VCOUNT)or
(UbicacionX+6<=HCOUNT and UbicacionY-6<=VCOUNT and UbicacionX+10>HCOUNT and UbicacionY+6>VCOUNT)or
(UbicacionX+10<=HCOUNT and UbicacionY-8<=VCOUNT and UbicacionX+14>HCOUNT and UbicacionY+8>VCOUNT)or
(UbicacionX+14<=HCOUNT and UbicacionY-10<=VCOUNT and UbicacionX+18>HCOUNT and UbicacionY+10>VCOUNT)or
(UbicacionX+18<=HCOUNT and UbicacionY-12<=VCOUNT and UbicacionX+22>HCOUNT and UbicacionY+12>VCOUNT)or
(UbicacionX+22<=HCOUNT and UbicacionY-6<=VCOUNT and UbicacionX+46>HCOUNT and UbicacionY+6>VCOUNT)
)then
PAINT<='1';
cambio<='1';
else
PAINT<='0';
cambio<='0';
end if;
end process;
UbicacionX<=POSX;
UbicacionY<=POSY;
end Behavioral;



