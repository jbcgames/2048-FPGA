----------------------------------------------------------------------------------
-- Company:        Universidad de Antioquia
-- Engineer:       Ricardo Andr�s Vel�squez V�lez
-- 
-- Create Date:    04:57:21 05/20/2014 
-- Design Name: 
-- Module Name:    BIN2BCD_0a999 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    Convierte de binario de 10 bits sin signo a 3 digitos BCD
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

entity BIN2BCD_0a999 is
    Port ( BIN : in  integer;
           BCD5 : out  integer;
           BCD4 : out  integer;
           BCD3 : out  integer; 
           BCD2 : out  integer;
           BCD1 : out  integer;
           BCD0 : out  integer);
end BIN2BCD_0a999;

architecture Behavioral of BIN2BCD_0a999 is
	signal unid: integer;
	signal dec: integer;
	signal cent: integer;
	Signal mil: integer;
	Signal diezmil: integer;
	Signal cienmil: integer;
begin
cienmil <=      9 when (BIN>=900000) else
                8 when (BIN>=800000) else
				7 when (BIN>=700000) else
                6 when (BIN>=600000) else
                5 when (BIN>=500000) else
                4 when (BIN>=400000) else
                3 when (BIN>=300000) else
                2 when (BIN>=200000) else
                1 when (BIN>=100000) else
			 		 0;
diezmil<=       9 when (BIN-(cienmil*100000)>=90000) else
                8 when (BIN-(cienmil*100000)>=80000) else
				7 when (BIN-(cienmil*100000)>=70000) else
                6 when (BIN-(cienmil*100000)>=60000) else
                5 when (BIN-(cienmil*100000)>=50000) else
                4 when (BIN-(cienmil*100000)>=40000) else
                3 when (BIN-(cienmil*100000)>=30000) else
                2 when (BIN-(cienmil*100000)>=20000) else
                1 when (BIN-(cienmil*100000)>=10000) else
					 0;
					 
mil <=          9 when (BIN-(cienmil*100000)-(diezmil*10000)>=9000) else
                8 when (BIN-(cienmil*100000)-(diezmil*10000)>=8000) else
				7 when (BIN-(cienmil*100000)-(diezmil*10000)>=7000) else
                6 when (BIN-(cienmil*100000)-(diezmil*10000)>=6000) else
                5 when (BIN-(cienmil*100000)-(diezmil*10000)>=5000) else
                4 when (BIN-(cienmil*100000)-(diezmil*10000)>=4000) else
                3 when (BIN-(cienmil*100000)-(diezmil*10000)>=3000) else
                2 when (BIN-(cienmil*100000)-(diezmil*10000)>=2000) else
                1 when (BIN-(cienmil*100000)-(diezmil*10000)>=1000) else
					 0;
    cent <=     9 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)>=900) else
                8 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)>=800) else
			    7 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)>=700) else
                6 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)>=600) else
                5 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)>=500) else
                4 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)>=400) else
                3 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)>=300) else
                2 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)>=200) else
                1 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)>=100) else
					 0;
   dec <=       9 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)>=90) else
                8 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)>=80) else
				7 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)>=70) else
                6 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)>=60) else
                5 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)>=50) else
                4 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)>=40) else
                3 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)>=30) else
                2 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)>=20) else
                1 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)>=10) else
					 0;
unid<= 9 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)-(dec*10)=9) else
                                     8 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)-(dec*10)=8) else
                                     7 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)-(dec*10)=7) else
                                     6 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)-(dec*10)=6) else
                                     5 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)-(dec*10)=5) else
                                     4 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)-(dec*10)=4) else
                                     3 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)-(dec*10)=3) else
                                     2 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)-(dec*10)=2) else
                                     1 when (BIN-(cienmil*100000)-(diezmil*10000)-(mil*1000)-(cent*100)-(dec*10)=1) else
                                     0;					 

					 
	BCD0 <= unid;
	BCD1 <= dec;
	BCD2 <= cent;
    BCD3 <= mil;
    BCD4 <= diezmil;
    BCD5 <= cienmil;
end Behavioral;

