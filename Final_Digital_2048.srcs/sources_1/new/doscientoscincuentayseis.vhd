library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
entity doscientoscincuentayseis is
Port ( 
           POSX: in integer;
           POSY: in integer;
           HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
           PAINT : out  STD_LOGIC;
                      FONDO : out std_logic);
end doscientoscincuentayseis;
architecture Behavioral of doscientoscincuentayseis is
Signal UbicacionX, UbicacionY: Integer;
signal cambio: std_logic;
begin
process (HCOUNT, VCOUNT, UbicacionX, UbicacionY)
begin
if(--2
(UbicacionX+14<=HCOUNT and UbicacionY+35-5<=VCOUNT and UbicacionX+39>HCOUNT and UbicacionY+39-5>VCOUNT)or
(UbicacionX+14<=HCOUNT and UbicacionY+54-5<=VCOUNT and UbicacionX+39>HCOUNT and UbicacionY+58-5>VCOUNT)or
(UbicacionX+14<=HCOUNT and UbicacionY+73-5<=VCOUNT and UbicacionX+39>HCOUNT and UbicacionY+77-5>VCOUNT)or
(UbicacionX+14<=HCOUNT and UbicacionY+54-5<=VCOUNT and UbicacionX+18>HCOUNT and UbicacionY+77-5>VCOUNT)or
(UbicacionX+35<=HCOUNT and UbicacionY+35-5<=VCOUNT and UbicacionX+39>HCOUNT and UbicacionY+58-5>VCOUNT)or
--5
(UbicacionX+44<=HCOUNT and UbicacionY+35-5<=VCOUNT and UbicacionX+69>HCOUNT and UbicacionY+39-5>VCOUNT)or
(UbicacionX+44<=HCOUNT and UbicacionY+54-5<=VCOUNT and UbicacionX+69>HCOUNT and UbicacionY+58-5>VCOUNT)or
(UbicacionX+44<=HCOUNT and UbicacionY+73-5<=VCOUNT and UbicacionX+69>HCOUNT and UbicacionY+77-5>VCOUNT)or
(UbicacionX+65<=HCOUNT and UbicacionY+54-5<=VCOUNT and UbicacionX+69>HCOUNT and UbicacionY+77-5>VCOUNT)or
(UbicacionX+44<=HCOUNT and UbicacionY+35-5<=VCOUNT and UbicacionX+49>HCOUNT and UbicacionY+58-5>VCOUNT)or
--6
(UbicacionX+73<=HCOUNT and UbicacionY+35-5<=VCOUNT and UbicacionX+98>HCOUNT and UbicacionY+39-5>VCOUNT)or
(UbicacionX+73<=HCOUNT and UbicacionY+54-5<=VCOUNT and UbicacionX+98>HCOUNT and UbicacionY+58-5>VCOUNT)or
(UbicacionX+73<=HCOUNT and UbicacionY+73-5<=VCOUNT and UbicacionX+98>HCOUNT and UbicacionY+77-5>VCOUNT)or
(UbicacionX+73<=HCOUNT and UbicacionY+35-5<=VCOUNT and UbicacionX+77>HCOUNT and UbicacionY+77-5>VCOUNT)or
(UbicacionX+94<=HCOUNT and UbicacionY+54-5<=VCOUNT and UbicacionX+98>HCOUNT and UbicacionY+77-5>VCOUNT)
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