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

begin


end Behavioral;
