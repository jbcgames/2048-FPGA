library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity milveinticuatro is
Port ( 
           POSX: in integer;
           POSY: in integer;
           HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
           PAINT : out  STD_LOGIC;
                      FONDO : out std_logic);
end milveinticuatro;
architecture Behavioral of milveinticuatro is
Signal UbicacionX, UbicacionY: Integer;
signal cambio: std_logic;
begin
process (HCOUNT, VCOUNT, UbicacionX, UbicacionY)
begin
if(--1
(UbicacionX+12<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+15>HCOUNT and UbicacionY+60>VCOUNT)or
--0
(UbicacionX+19<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+22>HCOUNT and UbicacionY+60>VCOUNT)or
(UbicacionX+40<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+44>HCOUNT and UbicacionY+60>VCOUNT)or
(UbicacionX+19<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+44>HCOUNT and UbicacionY+43>VCOUNT)or
(UbicacionX+19<=HCOUNT and UbicacionY+57<=VCOUNT and UbicacionX+44>HCOUNT and UbicacionY+60>VCOUNT)or
--2
(UbicacionX+48<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+69>HCOUNT and UbicacionY+43>VCOUNT)or
(UbicacionX+48<=HCOUNT and UbicacionY+49<=VCOUNT and UbicacionX+69>HCOUNT and UbicacionY+51>VCOUNT)or
(UbicacionX+48<=HCOUNT and UbicacionY+57<=VCOUNT and UbicacionX+69>HCOUNT and UbicacionY+60>VCOUNT)or
(UbicacionX+66<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+69>HCOUNT and UbicacionY+50>VCOUNT)or
(UbicacionX+48<=HCOUNT and UbicacionY+50<=VCOUNT and UbicacionX+51>HCOUNT and UbicacionY+60>VCOUNT)or
--4
(UbicacionX+73<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+77>HCOUNT and UbicacionY+50>VCOUNT)or
(UbicacionX+95<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+98>HCOUNT and UbicacionY+60>VCOUNT)or
(UbicacionX+73<=HCOUNT and UbicacionY+49<=VCOUNT and UbicacionX+98>HCOUNT and UbicacionY+51>VCOUNT)
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