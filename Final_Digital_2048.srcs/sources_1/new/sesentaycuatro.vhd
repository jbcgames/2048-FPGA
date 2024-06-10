library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity sesentaycuatro is
Port ( 
           POSX: in integer;
           POSY: in integer;
           HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
           PAINT : out  STD_LOGIC);
end sesentaycuatro;
architecture Behavioral of sesentaycuatro is
Signal UbicacionX, UbicacionY: Integer;
signal cambio: integer:=0;
begin
process (HCOUNT, VCOUNT, UbicacionX, UbicacionY)
begin
if(
(UbicacionX+15<=HCOUNT and UbicacionY+30<=VCOUNT and UbicacionX+40>HCOUNT and UbicacionY+35>VCOUNT)or
(UbicacionX+15<=HCOUNT and UbicacionY+45<=VCOUNT and UbicacionX+40>HCOUNT and UbicacionY+50>VCOUNT)or
(UbicacionX+15<=HCOUNT and UbicacionY+60<=VCOUNT and UbicacionX+40>HCOUNT and UbicacionY+65>VCOUNT)or
(UbicacionX+15<=HCOUNT and UbicacionY+30<=VCOUNT and UbicacionX+20>HCOUNT and UbicacionY+65>VCOUNT)or
(UbicacionX+35<=HCOUNT and UbicacionY+45<=VCOUNT and UbicacionX+40>HCOUNT and UbicacionY+65>VCOUNT)or
(UbicacionX+50<=HCOUNT and UbicacionY+45<=VCOUNT and UbicacionX+75>HCOUNT and UbicacionY+50>VCOUNT)or
(UbicacionX+50<=HCOUNT and UbicacionY+30<=VCOUNT and UbicacionX+55>HCOUNT and UbicacionY+50>VCOUNT)or
(UbicacionX+70<=HCOUNT and UbicacionY+30<=VCOUNT and UbicacionX+75>HCOUNT and UbicacionY+65>VCOUNT)
)then
PAINT<='1';
else
PAINT<='0';
end if;
end process;
UbicacionX<=POSX;
UbicacionY<=POSY;
end Behavioral;