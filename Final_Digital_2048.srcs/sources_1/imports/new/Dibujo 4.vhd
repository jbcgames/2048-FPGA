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

entity Dibujo4 is
Port ( 
           POSX: in integer;
           POSY: in integer;
           HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
           PAINT2 : out  STD_LOGIC);
end Dibujo4;
           

architecture Behavioral of Dibujo4 is
Signal UbicacionX, UbicacionY: Integer;
begin
process (HCOUNT, VCOUNT, UbicacionX, UbicacionY)
begin
if(
(UbicacionX+104>=HCOUNT and UbicacionY+7>=VCOUNT and UbicacionX+98<HCOUNT and UbicacionY<VCOUNT)
)then
PAINT2<='1';
else
PAINT2<='0';
end if;
end process;
UbicacionX<=POSX;
UbicacionY<=POSY;
end Behavioral;
