----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.11.2022 16:39:24
-- Design Name: 
-- Module Name: Mouse_Movement - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mouse_Movement is
  Port (
     
     posx : in integer;
     posy : in integer;
     clk  : in std_logic;
     click: in std_logic;
     MouseUp: out std_logic;
     MouseDown: out std_logic;
     MouseLeft: out std_logic;
     MouseRight: out std_logic
     );
end Mouse_Movement;

architecture Behavioral of Mouse_Movement is
signal primaryX: integer:=posx;
signal primaryY: integer:=posy;
signal clk_count: integer:=0;
begin

process(clk)
begin
if(clk'event and clk='1')then

if(clk_count=50000000)then
clk_count<=0;
else 
clk_count<=clk_count+1;
end if;
end if;
end process;
process
begin
if(click'event and click='1')then
primaryX<=posx;
primaryY<=posy;
end if;
if((posx-primaryX)<=-200 and ((posy-primaryY)>-150 and (posy-primaryY)<150) and clk_count=49999999)then
MouseLeft<='1';
else
MouseLeft<='0';
end if;
if((posx-primaryX)>=200 and ((posy-primaryY)>-150 and (posy-primaryY)<150) and clk_count=49999999)then
MouseRight<='1';
else
MouseRight<='0';
end if;
if((posY-primaryY)<=-150 and ((posx-primaryX)>-200 and (posx-primaryX)<200) and clk_count=49999999)then
MouseUp<='1';
else
MouseUp<='0';
end if;
if((posY-primaryY)>=150 and ((posx-primaryX)>-200 and (posx-primaryX)<200) and clk_count=49999999)then
MouseDown<='1';
else
MouseDown<='0';
end if;
if(clk_count=50000000)then
MouseDown<='0';
MouseUp<='0';
MouseRight<='0';
MouseLeft<='0';
end if;
end process;
end Behavioral;
