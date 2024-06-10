----------------------------------------------------------------------------------
-- Company:        Universidad de Antioquia
-- Engineer:       Ricardo Andr�s Vel�squez V�lez
-- 
-- Create Date:    03:57:35 05/20/2014 
-- Design Name: 
-- Module Name:    Display - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Dibuja un Display de 7 segementos en la pantalla
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

entity Numero is
	
   Port (  
          DW: in integer;
          LW: in integer;
          DL: in integer;
          POSX: in integer;
          POSY: in integer; 
           HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
           VALUE : in  integer;
           PAINT : out  STD_LOGIC);
end Numero;

architecture Behavioral of Numero is
	-- Segmentos del display
	signal segments : STD_LOGIC_VECTOR (7 downto 0);
	
--	signal xrectapos : STD_LOGIC_VECTOR (10 downto 0);
--	signal xrectapos1 : STD_LOGIC_VECTOR (10 downto 0);
--	signal xrectapos2 : STD_LOGIC_VECTOR (10 downto 0);
	
	signal xrectaneg : STD_LOGIC_VECTOR (10 downto 0);
	signal xrectaneg1 : STD_LOGIC_VECTOR (10 downto 0);
	signal xrectaneg2 : STD_LOGIC_VECTOR (10 downto 0);
	
	-- Constantes Geometricas Display
	-- Segmentos horizaontales
	constant SHX1 : INTEGER := POSX;
	constant SHX2 : INTEGER := POSX + DW;
	constant SHY1 : INTEGER := POSY;
	constant SHY2 : INTEGER := POSY + LW;
	constant SHY3 : INTEGER := POSY + DL/2 - LW/2;
	constant SHY4 : INTEGER := POSY + DL/2 + LW/2;
	constant SHY5 : INTEGER := POSY + DL - LW;
	constant SHY6 : INTEGER := POSY + DL;
	-- Segmentos Verticales
	constant SVY1 : INTEGER := POSY;
	constant SVY2 : INTEGER := POSY + DL/2 + LW/2;
	constant SVY3 : INTEGER := POSY + DL/2 - LW/2;
	constant SVY4 : INTEGER := POSY + DL;
	constant SVX1 : INTEGER := POSX;
	constant SVX2 : INTEGER := POSX + LW;
	constant SVX3 : INTEGER := POSX + DW - LW;
	constant SVX4 : INTEGER := POSX + DW;
begin

--	xrectapos <= ( ('0'&vcount(10 downto 1)) + (POSX+LW/2) - POSY/2);
--	xrectapos1 <= xrectapos - LW/2;
--	xrectapos2 <= xrectapos + LW/2;
	
	xrectaneg <= ( (POSX-LW/2+DW) + POSY/2 -('0'&vcount(10 downto 1)));
	xrectaneg1 <= xrectaneg - LW/2;
	xrectaneg2 <= xrectaneg + LW/2;
   with value select
	--          "abcdefgh"
   segments <= "11111101" when 0,
                        "01100000" when 1,
                        "11011010" when 2,
                        "11110010" when 3,
                        "01100110" when 4,
                        "10110110" when 5,
                        "10111110" when 6,
                        "11100000" when 7,
                        "11111110" when 8,
                        "11100110" when 9,
                        "11101110" when 10,
                        "00111110" when 11,
                        "10011100" when 12,
                        "01111010" when 13,
                        "10011110" when 14,
                        "10001110" when 15,
                        "00000000" when others;
	DIPLAY: process(segments,HCOUNT,VCOUNT,xrectaneg,xrectaneg2,xrectaneg1)
	begin
		-- segmento a
		if(segments(7)='1' and (HCOUNT>=SHX1)and(HCOUNT<=SHX2)and(VCOUNT>=SHY1)and(VCOUNT<=SHY2)) then
			PAINT <= '1';
		-- segmento g
		elsif (segments(1)='1' and (HCOUNT>=SHX1)and(HCOUNT<=SHX2)and(VCOUNT>=SHY3)and(VCOUNT<=SHY4)) then
			PAINT <= '1';
		-- segmento d
		elsif (segments(4)='1' and (HCOUNT>=SHX1)and(HCOUNT<=SHX2)and(VCOUNT>=SHY5)and(VCOUNT<=SHY6)) then
			PAINT <= '1';
		-- segmento b
		elsif (segments(6)='1' and (HCOUNT>=SVX3)and(HCOUNT<=SVX4)and(VCOUNT>=SVY1)and(VCOUNT<=SVY2)) then
			PAINT <= '1';
		-- segmento c
		elsif (segments(5)='1' and (HCOUNT>=SVX3)and(HCOUNT<=SVX4)and(VCOUNT>=SVY3)and(VCOUNT<=SVY4)) then
			PAINT <= '1';
		-- segmento f
		elsif (segments(2)='1' and (HCOUNT>=SVX1)and(HCOUNT<=SVX2)and(VCOUNT>=SVY1)and(VCOUNT<=SVY2)) then
			PAINT <= '1';
		-- segmento e
		elsif (segments(3)='1' and (HCOUNT>=SVX1)and(HCOUNT<=SVX2)and(VCOUNT>=SVY3)and(VCOUNT<=SVY4)) then
			PAINT <= '1';
		else
			PAINT <= '0';
		end if;
	end process;
end Behavioral;

