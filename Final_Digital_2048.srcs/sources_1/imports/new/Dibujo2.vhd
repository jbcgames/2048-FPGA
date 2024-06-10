----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.08.2022 12:49:14
-- Design Name: 
-- Module Name: Dibujo - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


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

entity Panel is
Port ( 
           POSX: in integer;
           POSY: in integer;
           HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
           PAINT : out  STD_LOGIC);
end Panel;
architecture Behavioral of Panel is
Signal UbicacionX, UbicacionY: Integer;
signal cambio: integer:=0;
begin
process (HCOUNT, VCOUNT, UbicacionX, UbicacionY)
begin
if(
(UbicacionX+100<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+500>HCOUNT and UbicacionY+50>VCOUNT)or
(UbicacionX+100<=HCOUNT and UbicacionY+140<=VCOUNT and UbicacionX+500>HCOUNT and UbicacionY+150>VCOUNT)or
(UbicacionX+100<=HCOUNT and UbicacionY+240<=VCOUNT and UbicacionX+500>HCOUNT and UbicacionY+250>VCOUNT)or
(UbicacionX+100<=HCOUNT and UbicacionY+340<=VCOUNT and UbicacionX+500>HCOUNT and UbicacionY+350>VCOUNT)or
(UbicacionX+100<=HCOUNT and UbicacionY+440<=VCOUNT and UbicacionX+500>HCOUNT and UbicacionY+450>VCOUNT)or
(UbicacionX+100<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+110>HCOUNT and UbicacionY+450>VCOUNT)or
(UbicacionX+200<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+210>HCOUNT and UbicacionY+450>VCOUNT)or
(UbicacionX+300<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+310>HCOUNT and UbicacionY+450>VCOUNT)or
(UbicacionX+400<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+410>HCOUNT and UbicacionY+450>VCOUNT)or
(UbicacionX+500<=HCOUNT and UbicacionY+40<=VCOUNT and UbicacionX+510>HCOUNT and UbicacionY+450>VCOUNT)
)then
PAINT<='1';
else
PAINT<='0';
end if;
end process;
UbicacionX<=POSX;
UbicacionY<=POSY;
end Behavioral;

