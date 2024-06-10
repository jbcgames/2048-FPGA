
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

entity diesyseis is
Port ( 
           POSX: in integer;
           POSY: in integer;
           HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
           PAINT : out  STD_LOGIC);
end diesyseis;
architecture Behavioral of diesyseis is
Signal UbicacionX, UbicacionY: Integer;
signal cambio: integer:=0;
begin
process (HCOUNT, VCOUNT, UbicacionX, UbicacionY)
begin
if(
(UbicacionX+15<=HCOUNT and UbicacionY+30<=VCOUNT and UbicacionX+20>HCOUNT and UbicacionY+65>VCOUNT)or
(UbicacionX+30<=HCOUNT and UbicacionY+30<=VCOUNT and UbicacionX+70>HCOUNT and UbicacionY+35>VCOUNT)or
(UbicacionX+30<=HCOUNT and UbicacionY+45<=VCOUNT and UbicacionX+70>HCOUNT and UbicacionY+50>VCOUNT)or
(UbicacionX+30<=HCOUNT and UbicacionY+60<=VCOUNT and UbicacionX+70>HCOUNT and UbicacionY+65>VCOUNT)or
(UbicacionX+30<=HCOUNT and UbicacionY+30<=VCOUNT and UbicacionX+35>HCOUNT and UbicacionY+65>VCOUNT)or
(UbicacionX+65<=HCOUNT and UbicacionY+45<=VCOUNT and UbicacionX+70>HCOUNT and UbicacionY+65>VCOUNT)
)then
PAINT<='1';
else
PAINT<='0';
end if;
end process;
UbicacionX<=POSX;
UbicacionY<=POSY;
end Behavioral;