library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity dosmilcuarentayocho is
Port ( 
           POSX: in integer;
           POSY: in integer;
           HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
           PAINT : out  STD_LOGIC;
                      FONDO : out std_logic);
end dosmilcuarentayocho;
architecture Behavioral of dosmilcuarentayocho is
Signal UbicacionX, UbicacionY: Integer;
signal cambio: std_logic;
begin
process (HCOUNT, VCOUNT, UbicacionX, UbicacionY)
begin
if(--2
(UbicacionX+12<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+30>HCOUNT and UbicacionY+43>VCOUNT)or
(UbicacionX+12<=HCOUNT and UbicacionY+49<=VCOUNT and UbicacionX+30>HCOUNT and UbicacionY+51>VCOUNT)or
(UbicacionX+12<=HCOUNT and UbicacionY+57<=VCOUNT and UbicacionX+30>HCOUNT and UbicacionY+60>VCOUNT)or
(UbicacionX+27<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+30>HCOUNT and UbicacionY+50>VCOUNT)or
(UbicacionX+12<=HCOUNT and UbicacionY+50<=VCOUNT and UbicacionX+15>HCOUNT and UbicacionY+60>VCOUNT)or
--0
(UbicacionX+33<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+51>HCOUNT and UbicacionY+43>VCOUNT)or
(UbicacionX+33<=HCOUNT and UbicacionY+57<=VCOUNT and UbicacionX+51>HCOUNT and UbicacionY+60>VCOUNT)or
(UbicacionX+33<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+37>HCOUNT and UbicacionY+60>VCOUNT)or
(UbicacionX+48<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+51>HCOUNT and UbicacionY+60>VCOUNT)or
--4
(UbicacionX+54<=HCOUNT and UbicacionY+49<=VCOUNT and UbicacionX+72>HCOUNT and UbicacionY+51>VCOUNT)or
(UbicacionX+54<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+57>HCOUNT and UbicacionY+50>VCOUNT)or
(UbicacionX+69<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+72>HCOUNT and UbicacionY+60>VCOUNT)or
--8
(UbicacionX+75<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+93>HCOUNT and UbicacionY+43>VCOUNT)or
(UbicacionX+75<=HCOUNT and UbicacionY+49<=VCOUNT and UbicacionX+93>HCOUNT and UbicacionY+51>VCOUNT)or
(UbicacionX+75<=HCOUNT and UbicacionY+57<=VCOUNT and UbicacionX+93>HCOUNT and UbicacionY+60>VCOUNT)or
(UbicacionX+75<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+78>HCOUNT and UbicacionY+60>VCOUNT)or
(UbicacionX+90<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+93>HCOUNT and UbicacionY+60>VCOUNT)
)then
PAINT<='1';
cambio<='1';
else
PAINT<='0';
cambio<='0';
end if;
end process;
process (HCOUNT, VCOUNT, UbicacionX, UbicacionY)
begin
if(
(UbicacionX<=HCOUNT and UbicacionY<=VCOUNT and UbicacionX+100>HCOUNT and UbicacionY+100>VCOUNT and cambio='0')
)then
FONDO<='1';
else
FONDO<='0';
end if;
end process;
UbicacionX<=POSX;
UbicacionY<=POSY;
end Behavioral;