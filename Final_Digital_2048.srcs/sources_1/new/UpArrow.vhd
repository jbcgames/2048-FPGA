
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

entity UpArrow is
Port ( 
           POSX: in integer;
           POSY: in integer;
           HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
           PAINT : out  STD_LOGIC);
end UpArrow;
architecture Behavioral of UpArrow is
Signal UbicacionX, UbicacionY: Integer;
signal cambio: std_logic;
begin
process (HCOUNT, VCOUNT, UbicacionX, UbicacionY)
begin
if(
(UbicacionX-2<=HCOUNT and UbicacionY-2<=VCOUNT and UbicacionX+2>HCOUNT and UbicacionY+2>VCOUNT)or
(UbicacionX-4<=HCOUNT and UbicacionY+2<=VCOUNT and UbicacionX+4>HCOUNT and UbicacionY+6>VCOUNT)or
(UbicacionX-6<=HCOUNT and UbicacionY+6<=VCOUNT and UbicacionX+6>HCOUNT and UbicacionY+10>VCOUNT)or
(UbicacionX-8<=HCOUNT and UbicacionY+10<=VCOUNT and UbicacionX+8>HCOUNT and UbicacionY+14>VCOUNT)or
(UbicacionX-10<=HCOUNT and UbicacionY+14<=VCOUNT and UbicacionX+10>HCOUNT and UbicacionY+18>VCOUNT)or
(UbicacionX-12<=HCOUNT and UbicacionY+18<=VCOUNT and UbicacionX+12>HCOUNT and UbicacionY+22>VCOUNT)or
(UbicacionX-6<=HCOUNT and UbicacionY+22<=VCOUNT and UbicacionX+6>HCOUNT and UbicacionY+46>VCOUNT)

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



