library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity cientoveintiocho is
Port ( 
           POSX: in integer;
           POSY: in integer;
           HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
           PAINT : out  STD_LOGIC);
end cientoveintiocho;
architecture Behavioral of cientoveintiocho is
Signal UbicacionX, UbicacionY: Integer;
signal cambio: integer:=0;
begin
process (HCOUNT, VCOUNT, UbicacionX, UbicacionY)
begin
if(
(UbicacionX+25<=HCOUNT and UbicacionY+30<=VCOUNT and UbicacionX+30>HCOUNT and UbicacionY+70>VCOUNT)or
(UbicacionX+35<=HCOUNT and UbicacionY+30<=VCOUNT and UbicacionX+60>HCOUNT and UbicacionY+35>VCOUNT)or
(UbicacionX+35<=HCOUNT and UbicacionY+30<=VCOUNT and UbicacionX+60>HCOUNT and UbicacionY+35>VCOUNT)or

)then
PAINT<='1';
else
PAINT<='0';
end if;
end process;
UbicacionX<=POSX;
UbicacionY<=POSY;
end Behavioral;