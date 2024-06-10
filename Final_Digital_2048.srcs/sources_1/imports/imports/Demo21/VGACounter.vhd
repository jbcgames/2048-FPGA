----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:33:54 05/20/2014 
-- Design Name: 
-- Module Name:    VGACounter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;



entity VGACounter is
    Port ( CLK : in  STD_LOGIC;
           Selector: in STD_LOGIC;
           BUP: in  STD_LOGIC;
           PBTON: in std_logic;
           W: in std_logic_vector(11 downto 0);
           BDW : in  STD_LOGIC;
           BLF: in  STD_LOGIC;
           BRG: in  STD_LOGIC;
           P2Data: inout Std_logic;
           P2Clk: inout std_logic;
           led: out std_logic_vector(6 downto 0);
           IndicadorSalida: out std_logic;
           HS : out  STD_LOGIC;
           press: out std_logic_vector(3 downto 0):="0000";
           VS : out  STD_LOGIC;
           RGB : out  STD_LOGIC_VECTOR (11 downto 0));
			  
end VGACounter;

architecture Behavioral of VGACounter is
COMPONENT MouseCtl
  GENERIC
  (
     SYSCLK_FREQUENCY_HZ : integer := 100000000;
     CHECK_PERIOD_MS     : integer := 500;
     TIMEOUT_PERIOD_MS   : integer := 100
  );
  PORT(
      clk : IN std_logic;
      rst : IN std_logic;
      value : IN std_logic_vector(11 downto 0);
      setx : IN std_logic;
      sety : IN std_logic;
      setmax_x : IN std_logic;
      setmax_y : IN std_logic;    
      ps2_clk : INout std_logic;
      ps2_data : INout std_logic;      
      xpos : OUT std_logic_vector(11 downto 0);
      ypos : OUT std_logic_vector(11 downto 0);
      zpos : OUT std_logic_vector(3 downto 0);
      left : OUT std_logic;
      middle : OUT std_logic;
      right : OUT std_logic;
      new_event : OUT std_logic
      );
  END COMPONENT;
	COMPONENT vga_ctrl_640x480_60Hz
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		rgb_in : IN std_logic_vector(11 downto 0);          
		HS : OUT std_logic;
		VS : OUT std_logic;
		hcount : OUT std_logic_vector(10 downto 0);
		vcount : OUT std_logic_vector(10 downto 0);
		rgb_out : OUT std_logic_vector(11 downto 0);
		blank : OUT std_logic
		);
	END COMPONENT;
	component BIN2BCD_0a999 is
           Port ( BIN : in  integer;
               BCD5 : out  integer;
               BCD4 : out  integer;
               BCD3 : out  integer; 
               BCD2 : out  integer;
               BCD1 : out  integer;
               BCD0 : out  integer);
                   end component;
component Mouse_Movement 
                     Port (
                        posx : in integer;
                          posy : in integer;
                          clk  : in std_logic;
                          click: in std_logic;
                          MouseUp: out std_logic;
                          MouseDown: out std_logic;
                          MouseLeft: out std_logic;
                          MouseRight: out std_logic);
                   end component;                  
COMPONENT display34segm
                       
                          PORT (  
                              posx: in integer;
                              posy: in integer;
                              hcount : in  STD_LOGIC_VECTOR (10 downto 0);
                                  vcount : in  STD_LOGIC_VECTOR (10 downto 0);
                                  segments : in STD_LOGIC_VECTOR (33 downto 0);
                                  paint : out  STD_LOGIC);
                           end COMPONENT;
COMPONENT Panel
        PORT(
            POSX: in integer;
            POSY: in integer;
            HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
            VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
            PAINT : out  STD_LOGIC
            );
        END COMPONENT;
COMPONENT Dos
                PORT(
                    POSX: in integer;
                    POSY: in integer;
                    HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                    VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                    PAINT : out  STD_LOGIC;
                    FONDO : out  STD_LOGIC
                    );
                END COMPONENT;
COMPONENT Cuatro
                        PORT(
                            POSX: in integer;
                            POSY: in integer;
                            HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                            VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                            PAINT : out  STD_LOGIC;
                                                FONDO : out  STD_LOGIC
                            );
                        END COMPONENT;
COMPONENT Ocho
                                PORT(
                                    POSX: in integer;
                                    POSY: in integer;
                                    HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                                    VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                                    PAINT : out  STD_LOGIC;
                                                        FONDO : out  STD_LOGIC
                                    );
                                END COMPONENT;
COMPONENT diesyseis
                                        PORT(
                                            POSX: in integer;
                                            POSY: in integer;
                                            HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                                            VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                                            PAINT : out  STD_LOGIC;
                                                                FONDO : out  STD_LOGIC
                                            );
                                        END COMPONENT;
COMPONENT treintaydos
                                                PORT(
                                                    POSX: in integer;
                                                    POSY: in integer;
                                                    HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                                                    VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                                                    PAINT : out  STD_LOGIC;
                                                                        FONDO : out  STD_LOGIC
                                                    );
                                                END COMPONENT;
COMPONENT Sesentaycuatro
                                                        PORT(
                                                            POSX: in integer;
                                                            POSY: in integer;
                                                            HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                                                            VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                                                            PAINT : out  STD_LOGIC;
                                                                                FONDO : out  STD_LOGIC
                                                            );
                                                        END COMPONENT;
COMPONENT cientoveintiocho
                                                                PORT(
                                                                    POSX: in integer;
                                                                    POSY: in integer;
                                                                    HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                                                                    VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                                                                    PAINT : out  STD_LOGIC;
                                                                                        FONDO : out  STD_LOGIC
                                                                    );
                                                                END COMPONENT;
COMPONENT doscientoscincuentayseis
                                                                        PORT(
                                                                            POSX: in integer;
                                                                            POSY: in integer;
                                                                            HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                                                                            VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                                                                            PAINT : out  STD_LOGIC;
                                                                                                FONDO : out  STD_LOGIC
                                                                            );
                                                                        END COMPONENT;
COMPONENT quinientosdoce
                                                                                PORT(
                                                                                    POSX: in integer;
                                                                                    POSY: in integer;
                                                                                    HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                                                                                    VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                                                                                    PAINT : out  STD_LOGIC;
                                                                                                        FONDO : out  STD_LOGIC
                                                                                    );
                                                                                END COMPONENT;
 COMPONENT milveinticuatro
                                                                                        PORT(
                                                                                            POSX: in integer;
                                                                                            POSY: in integer;
                                                                                            HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                                                                                            VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                                                                                            PAINT : out  STD_LOGIC;
                                                                                            FONDO : out  STD_LOGIC
                                                                                            );
                                                                                        END COMPONENT;
   COMPONENT dosmilcuarentayocho
                                                                                                        PORT(
                                                                                                            POSX: in integer;
                                                                                                            POSY: in integer;
                                                                                                            HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                                                                                                            VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                                                                                                            PAINT : out  STD_LOGIC;
                                                                                                            FONDO : out  STD_LOGIC
                                                                                                            );
                                                                                                        END COMPONENT;
    
    Component Numero Port (  
                          DW: in integer;
                          LW: in integer;
                          DL: in integer;
                          POSX: in integer;
                          POSY: in integer; 
                           HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                           VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                           VALUE : in  integer;
                           PAINT : out  STD_LOGIC);
                end Component;
	component ps2_keyboard_to_ascii
	Port(
	      rst        : IN  STD_LOGIC;
          clk        : IN  STD_LOGIC;          
          ps2_clk    : IN  STD_LOGIC;            
          ps2_data   : IN  STD_LOGIC;                   
          ascii_new  : OUT STD_LOGIC;                     
          ascii_code : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
	end component;
	
	signal hcount : STD_LOGIC_VECTOR (10 downto 0);
	signal vcount : STD_LOGIC_VECTOR (10 downto 0);
	signal rgb_aux1 : STD_LOGIC_VECTOR (11 downto 0);
	signal rgb_aux2 : STD_LOGIC_VECTOR (11 downto 0);
	signal rgb_aux3 : STD_LOGIC_VECTOR (11 downto 0);
	signal puntaje: integer:=0;
	Signal sumado: std_logic:='0';
	Signal paint1: std_logic:='0';
	Signal paint2: std_logic:='0';
	Signal paint3: std_logic:='0';
	Signal paint4: std_logic:='0';
	Signal paint5: std_logic:='0';
	Signal paint6: std_logic:='0';
	Signal paint7: std_logic:='0';
	Signal paint8: std_logic:='0';
	Signal paint9: std_logic:='0';
	Signal paint10: std_logic:='0';
	Signal paint11: std_logic:='0';
	Signal paint101: std_logic:='0';
	Signal paint102: std_logic:='0';
	Signal paint103: std_logic:='0';
	Signal paint104: std_logic:='0';
	Signal senal: std_logic:='0';
	Signal paint105: std_logic:='0';
	Signal paint106: std_logic:='0';
	signal directo1: std_logic;
	signal MOUSE_X_POS: std_logic_vector (11 downto 0);
    signal MOUSE_Y_POS: std_logic_vector (11 downto 0);
	signal n1: integer:=0;
	signal n2: integer:=0;
	signal n3: integer:=0;
	signal n4: integer:=0;
	signal n5: integer:=0;
	Signal mouse_clk: std_logic;
	Signal mouse_data:std_logic;
	signal n6: integer:=0;
	signal n7: integer:=0;
	signal n8: integer:=0;
	signal red_mouse: std_logic_vector(3 downto 0):="0000";
	signal green_mouse: std_logic_vector(3 downto 0):="0000";
	signal blue_mouse: std_logic_vector(3 downto 0):="0000";
	signal n9: integer:=0;
	signal n10: integer:=0;
	signal n11: integer:=0;
	signal n12: integer:=0;
	signal n13: integer:=0;
	signal n14: integer:=0;
	signal n15: integer:=0;
	signal n16: integer:=0;
	signal n1p: integer:=0;
	signal eup: std_logic:='0';
	signal edw: std_logic:='0';
	signal elf: std_logic:='0';
	signal erg: std_logic:='0';
	signal x:integer:=0;
        signal n2p: integer:=0;
        signal n3p: integer:=0;
        signal n4p: integer:=0;
        signal n5p: integer:=0;
        signal n6p: integer:=0;
        signal n7p: integer:=0;
        signal n8p: integer:=0;
        signal n9p: integer:=0;
        signal n10p: integer:=0;
        signal n11p: integer:=0;
        signal n12p: integer:=0;
        signal n13p: integer:=0;
        signal n14p: integer:=0;
        signal n15p: integer:=0;
        signal n16p: integer:=0;
	Signal random_number: integer:=0;
        signal PosXn2: integer:=1000;
        signal PosXn4: integer:=1000;
        signal PosXn8: integer:=1000;
        signal PosXn16: integer:=1000;
        signal PosXn32: integer:=1000;
        signal PosXn64: integer:=1000;
        signal PosXn128: integer:=1000;
        signal PosXn256: integer:=1000;
        signal PosXn512: integer:=1000;
        signal PosXn1024: integer:=1000;
        signal PosXn2048: integer:=1000;
        signal PosYn2: integer:=1000;
            signal PosYn4: integer:=1000;
            signal PosYn8: integer:=1000;
            signal PosYn16: integer:=1000;
            signal PosYn32: integer:=1000;
            signal PosYn64: integer:=1000;
            signal PosYn128: integer:=1000;
            signal PosYn256: integer:=1000;
            signal PosYn512: integer:=1000;
            signal PosYn1024: integer:=1000;
            signal PosYn2048: integer:=1000;
            signal apress: std_logic_vector(3 downto 0);
	signal e2: std_logic:='0';
        signal e4: std_logic:='0';
        signal e8: std_logic:='0';
        signal e16: std_logic:='0';
        signal e32: std_logic:='0';
        signal e64: std_logic:='0';
        signal e128: std_logic:='0';
        signal e256: std_logic:='0';
        signal e512: std_logic:='0';
        signal e1024: std_logic:='0';
        signal e2048: std_logic:='0';
        signal numero1: integer;
            signal numero2: integer;
            signal numero3: integer;
            signal numero4: integer;
            signal numero5: integer;
            signal numero6: integer;
            signal siempre: std_logic:='1';
	Signal ndos: std_logic:='0';
	Signal fondodos: std_logic:='0';
	Signal fondocuatro: std_logic:='0';
	Signal fondoocho: std_logic:='0';
	Signal fondodiez: std_logic:='0';
	TYPE Button_Press IS(Up, Down, Left, Right, Ready, Aleatory, Create);
	Signal Presionado: Button_Press:=Aleatory;
	Signal fondotreinta: std_logic:='0';
	Signal fondosesenta: std_logic:='0';
	Signal fondocien: std_logic:='0';
	Signal fondodosientos: std_logic:='0';
	Signal fondoquinientos: std_logic:='0';
	Signal fondomil: std_logic:='0';
	Signal fondodosmil: std_logic:='0';
	Signal ncuatro: std_logic:='0';
	Signal clk_count: integer:=0;
	Signal nocho: std_logic:='0';
	Signal ndiez: std_logic:='0';
	Signal ntreinta: std_logic:='0';
	Signal nsesenta: std_logic:='0';
	Signal ncien: std_logic:='0';
	Signal ndosientos: std_logic:='0';
	Signal nquinientos: std_logic:='0';
	Signal nmil: std_logic:='0';
	Signal ndosmil: std_logic:='0';
	signal unidades : integer:=0;
	signal prite: std_logic:='0';
	signal movimiento: integer:=0;
	signal decenas : integer:=0;
	Signal directo: std_logic;
	signal ud,di: integer:=0;
	signal centenas : integer:=100;
	signal CLK_1Hz : STD_LOGIC:='0';
	signal count_clk : INTEGER:=0;
	Signal pause: std_logic:='0';
	Signal Tiempo: integer:=2500000;
	signal clk_interno : STD_LOGIC;
	Signal Tecladocl: std_logic;
	Signal tecladoda: std_logic;
	Signal TecladoSalida: std_logic_vector(6 downto 0);
	Signal indicador: std_logic;
	signal play: integer:=0;
	Signal Xplay:integer:=0;
	Signal apertura: std_logic:='1';
	Signal YPlay:integer:=0;
	Signal paintnumero: std_logic:='0';
	signal touch:std_logic:='0';
	signal Mup:std_logic:='0';
	signal Mdw:std_logic:='0';
	signal Mlf:std_logic:='0';
	signal Mrg:std_logic:='0';
	--n1  n2  n3  n4
	--n5  n6  n7  n8
	--n9  n10 n11 n12
	--n13 n14 n15 n16
begin

        IndicadorSalida<=indicador;
        directo<=clk;
        led<=TecladoSalida;
 
    process(clk_interno)
    begin
    if(clk_interno'event and clk_interno='1')then
    if(Hcount>=100 and Hcount<200 and vcount>=40 and vcount<140)then
    e2<='0';
    e4<='0';
    e8<='0';
    e16<='0';
    e32<='0';
    e64<='0';
    e128<='0';
    e256<='0';
    e512<='0';
    e1024<='0';
    e2048<='0';
    if(n1=2)then
    posxn2<=100;
    posyn2<=40;
    e2<='1';    
    elsif(n1=4)then
    posxn4<=100;
    posyn4<=40;
    e4<='1';
    elsif(n1=8)then
    posxn8<=100;
    posyn8<=40;
    e8<='1';
    elsif(n1=16)then
    posxn16<=100;
    posyn16<=40;
    e16<='1';
    elsif(n1=32)then
    posxn32<=100;
    posyn32<=40;
    e32<='1';            
    elsif(n1=64)then
    posxn64<=100;
    posyn64<=40;
    e64<='1'; 
    elsif(n1=128)then
    posxn128<=100;
    posyn128<=40;
    e128<='1'; 
    elsif(n1=256)then
    posxn256<=100;
    posyn256<=40;
    e256<='1'; 
    elsif(n1=512)then
    posxn512<=100;
    posyn512<=40;
    e512<='1'; 
    elsif(n1=1024)then
    posxn1024<=100;
    posyn1024<=40;
    e1024<='1'; 
    elsif(n1=2048)then
    posxn2048<=100;
    posyn2048<=40;
    e2048<='1';
    end if;
    elsif(Hcount>=200 and Hcount<300 and vcount>=40 and vcount<140)then
        e2<='0';
        e4<='0';
        e8<='0';
        e16<='0';
        e32<='0';
        e64<='0';
        e128<='0';
        e256<='0';
        e512<='0';
        e1024<='0';
        e2048<='0';
        if(n2=2)then
        posxn2<=200;
        posyn2<=40;
        e2<='1';    
        elsif(n2=4)then
        posxn4<=200;
        posyn4<=40;
        e4<='1';
        elsif(n2=8)then
        posxn8<=200;
        posyn8<=40;
        e8<='1';
        elsif(n2=16)then
        posxn16<=200;
        posyn16<=40;
        e16<='1';
        elsif(n2=32)then
        posxn32<=200;
        posyn32<=40;
        e32<='1';            
        elsif(n2=64)then
        posxn64<=200;
        posyn64<=40;
        e64<='1'; 
        elsif(n2=128)then
        posxn128<=200;
        posyn128<=40;
        e128<='1'; 
        elsif(n2=256)then
        posxn256<=200;
        posyn256<=40;
        e256<='1'; 
        elsif(n2=512)then
        posxn512<=200;
        posyn512<=40;
        e512<='1'; 
        elsif(n2=1024)then
        posxn1024<=200;
        posyn1024<=40;
        e1024<='1'; 
        elsif(n2=2048)then
        posxn2048<=200;
        posyn2048<=40;
        e2048<='1';
        
        end if;
        elsif(Hcount>=300 and Hcount<400 and vcount>=40 and vcount<140)then
            e2<='0';
            e4<='0';
            e8<='0';
            e16<='0';
            e32<='0';
            e64<='0';
            e128<='0';
            e256<='0';
            e512<='0';
            e1024<='0';
            e2048<='0';
            if(n3=2)then
            posxn2<=300;
            posyn2<=40;
            e2<='1';    
            elsif(n3=4)then
            posxn4<=300;
            posyn4<=40;
            e4<='1';
            elsif(n3=8)then
            posxn8<=300;
            posyn8<=40;
            e8<='1';
            elsif(n3=16)then
            posxn16<=300;
            posyn16<=40;
            e16<='1';
            elsif(n3=32)then
            posxn32<=300;
            posyn32<=40;
            e32<='1';            
            elsif(n3=64)then
            posxn64<=300;
            posyn64<=40;
            e64<='1'; 
            elsif(n3=128)then
            posxn128<=300;
            posyn128<=40;
            e128<='1'; 
            elsif(n3=256)then
            posxn256<=300;
            posyn256<=40;
            e256<='1'; 
            elsif(n3=512)then
            posxn512<=300;
            posyn512<=40;
            e512<='1'; 
            elsif(n3=1024)then
            posxn1024<=300;
            posyn1024<=40;
            e1024<='1'; 
            elsif(n3=2048)then
            posxn2048<=300;
            posyn2048<=40;
            e2048<='1';
            end if;
    elsif(Hcount>=400 and Hcount<500 and vcount>=40 and vcount<140)then
                e2<='0';
        e4<='0';
        e8<='0';
        e16<='0';
        e32<='0';
        e64<='0';
        e128<='0';
        e256<='0';
        e512<='0';
        e1024<='0';
        e2048<='0';
                if(n4=2)then
                posxn2<=400;
                posyn2<=40;
                e2<='1';    
                elsif(n4=4)then
                posxn4<=400;
                posyn4<=40;
                e4<='1';
                elsif(n4=8)then
                posxn8<=400;
                posyn8<=40;
                e8<='1';
                elsif(n4=16)then
                posxn16<=400;
                posyn16<=40;
                e16<='1';
                elsif(n4=32)then
                posxn32<=400;
                posyn32<=40;
                e32<='1';            
                elsif(n4=64)then
                posxn64<=400;
                posyn64<=40;
                e64<='1'; 
                elsif(n4=128)then
                posxn128<=400;
                posyn128<=40;
                e128<='1'; 
                elsif(n4=256)then
                posxn256<=400;
                posyn256<=40;
                e256<='1'; 
                elsif(n4=512)then
                posxn512<=400;
                posyn512<=40;
                e512<='1'; 
                elsif(n4=1024)then
                posxn1024<=400;
                posyn1024<=40;
                e1024<='1'; 
                elsif(n4=2048)then
                posxn2048<=400;
                posyn2048<=40;
                e2048<='1';
                end if;

    elsif(Hcount>=100 and Hcount<200 and vcount>=140 and vcount<240)then
                    e2<='0';
        e4<='0';
        e8<='0';
        e16<='0';
        e32<='0';
        e64<='0';
        e128<='0';
        e256<='0';
        e512<='0';
        e1024<='0';
        e2048<='0';
                    if(n5=2)then
                    posxn2<=100;
                    posyn2<=140;
                    e2<='1';    
                    elsif(n5=4)then
                    posxn4<=100;
                    posyn4<=140;
                    e4<='1';
                    elsif(n5=8)then
                    posxn8<=100;
                    posyn8<=140;
                    e8<='1';
                    elsif(n5=16)then
                    posxn16<=100;
                    posyn16<=140;
                    e16<='1';
                    elsif(n5=32)then
                    posxn32<=100;
                    posyn32<=140;
                    e32<='1';            
                    elsif(n5=64)then
                    posxn64<=100;
                    posyn64<=140;
                    e64<='1'; 
                    elsif(n5=128)then
                    posxn128<=100;
                    posyn128<=140;
                    e128<='1'; 
                    elsif(n5=256)then
                    posxn256<=100;
                    posyn256<=140;
                    e256<='1'; 
                    elsif(n5=512)then
                    posxn512<=100;
                    posyn512<=140;
                    e512<='1'; 
                    elsif(n5=1024)then
                    posxn1024<=100;
                    posyn1024<=140;
                    e1024<='1'; 
                    elsif(n5=2048)then
                    posxn2048<=100;
                    posyn2048<=140;
                    e2048<='1';
                    end if;
    elsif(Hcount>=200 and Hcount<300 and vcount>=140 and vcount<240)then
                        e2<='0';
        e4<='0';
        e8<='0';
        e16<='0';
        e32<='0';
        e64<='0';
        e128<='0';
        e256<='0';
        e512<='0';
        e1024<='0';
        e2048<='0';
                        if(n6=2)then
                        posxn2<=200;
                        posyn2<=140;
                        e2<='1';    
                        elsif(n6=4)then
                        posxn4<=200;
                        posyn4<=140;
                        e4<='1';
                        elsif(n6=8)then
                        posxn8<=200;
                        posyn8<=140;
                        e8<='1';
                        elsif(n6=16)then
                        posxn16<=200;
                        posyn16<=140;
                        e16<='1';
                        elsif(n6=32)then
                        posxn32<=200;
                        posyn32<=140;
                        e32<='1';            
                        elsif(n6=64)then
                        posxn64<=200;
                        posyn64<=140;
                        e64<='1'; 
                        elsif(n6=128)then
                        posxn128<=200;
                        posyn128<=140;
                        e128<='1'; 
                        elsif(n6=256)then
                        posxn256<=200;
                        posyn256<=140;
                        e256<='1'; 
                        elsif(n6=512)then
                        posxn512<=200;
                        posyn512<=140;
                        e512<='1'; 
                        elsif(n6=1024)then
                        posxn1024<=200;
                        posyn1024<=140;
                        e1024<='1'; 
                        elsif(n6=2048)then
                        posxn2048<=200;
                        posyn2048<=140;
                        e2048<='1';
                        end if;
                
    elsif(Hcount>=300 and Hcount<400 and vcount>=140 and vcount<240)then
                            e2<='0';
        e4<='0';
        e8<='0';
        e16<='0';
        e32<='0';
        e64<='0';
        e128<='0';
        e256<='0';
        e512<='0';
        e1024<='0';
        e2048<='0';
                            if(n7=2)then
                            posxn2<=300;
                            posyn2<=140;
                            e2<='1';    
                            elsif(n7=4)then
                            posxn4<=300;
                            posyn4<=140;
                            e4<='1';
                            elsif(n7=8)then
                            posxn8<=300;
                            posyn8<=140;
                            e8<='1';
                            elsif(n7=16)then
                            posxn16<=300;
                            posyn16<=140;
                            e16<='1';
                            elsif(n7=32)then
                            posxn32<=300;
                            posyn32<=140;
                            e32<='1';            
                            elsif(n7=64)then
                            posxn64<=300;
                            posyn64<=140;
                            e64<='1'; 
                            elsif(n7=128)then
                            posxn128<=300;
                            posyn128<=140;
                            e128<='1'; 
                            elsif(n7=256)then
                            posxn256<=300;
                            posyn256<=140;
                            e256<='1'; 
                            elsif(n7=512)then
                            posxn512<=300;
                            posyn512<=140;
                            e512<='1'; 
                            elsif(n7=1024)then
                            posxn1024<=300;
                            posyn1024<=140;
                            e1024<='1'; 
                            elsif(n7=2048)then
                            posxn2048<=300;
                            posyn2048<=140;
                            e2048<='1';
                            end if;
    elsif(Hcount>=400 and Hcount<500 and vcount>=140 and vcount<240)then
                                e2<='0';
        e4<='0';
        e8<='0';
        e16<='0';
        e32<='0';
        e64<='0';
        e128<='0';
        e256<='0';
        e512<='0';
        e1024<='0';
        e2048<='0';
                                if(n8=2)then
                                posxn2<=400;
                                posyn2<=140;
                                e2<='1';    
                                elsif(n8=4)then
                                posxn4<=400;
                                posyn4<=140;
                                e4<='1';
                                elsif(n8=8)then
                                posxn8<=400;
                                posyn8<=140;
                                e8<='1';
                                elsif(n8=16)then
                                posxn16<=400;
                                posyn16<=140;
                                e16<='1';
                                elsif(n8=32)then
                                posxn32<=400;
                                posyn32<=140;
                                e32<='1';            
                                elsif(n8=64)then
                                posxn64<=400;
                                posyn64<=140;
                                e64<='1'; 
                                elsif(n8=128)then
                                posxn128<=400;
                                posyn128<=140;
                                e128<='1'; 
                                elsif(n8=256)then
                                posxn256<=400;
                                posyn256<=140;
                                e256<='1'; 
                                elsif(n8=512)then
                                posxn512<=400;
                                posyn512<=140;
                                e512<='1'; 
                                elsif(n8=1024)then
                                posxn1024<=400;
                                posyn1024<=140;
                                e1024<='1'; 
                                elsif(n8=2048)then
                                posxn2048<=400;
                                posyn2048<=140;
                                e2048<='1';
                                end if;
    elsif(Hcount>=100 and Hcount<200 and vcount>=240 and vcount<340)then
                                                                e2<='0';
                                        e4<='0';
                                        e8<='0';
                                        e16<='0';
                                        e32<='0';
                                        e64<='0';
                                        e128<='0';
                                        e256<='0';
                                        e512<='0';
                                        e1024<='0';
                                        e2048<='0';
                                                                if(n9=2)then
                                                                posxn2<=100;
                                                                posyn2<=240;
                                                                e2<='1';    
                                                                elsif(n9=4)then
                                                                posxn4<=100;
                                                                posyn4<=240;
                                                                e4<='1';
                                                                elsif(n9=8)then
                                                                posxn8<=100;
                                                                posyn8<=240;
                                                                e8<='1';
                                                                elsif(n9=16)then
                                                                posxn16<=100;
                                                                posyn16<=240;
                                                                e16<='1';
                                                                elsif(n9=32)then
                                                                posxn32<=100;
                                                                posyn32<=240;
                                                                e32<='1';            
                                                                elsif(n9=64)then
                                                                posxn64<=100;
                                                                posyn64<=240;
                                                                e64<='1'; 
                                                                elsif(n9=128)then
                                                                posxn128<=100;
                                                                posyn128<=240;
                                                                e128<='1'; 
                                                                elsif(n9=256)then
                                                                posxn256<=100;
                                                                posyn256<=240;
                                                                e256<='1'; 
                                                                elsif(n9=512)then
                                                                posxn512<=100;
                                                                posyn512<=240;
                                                                e512<='1'; 
                                                                elsif(n9=1024)then
                                                                posxn1024<=100;
                                                                posyn1024<=240;
                                                                e1024<='1'; 
                                                                elsif(n9=2048)then
                                                                posxn2048<=100;
                                                                posyn2048<=240;
                                                                e2048<='1';
                                                                end if;
    elsif(Hcount>=200 and Hcount<300 and vcount>=240 and vcount<340)then
                                                                                                e2<='0';
                                                                        e4<='0';
                                                                        e8<='0';
                                                                        e16<='0';
                                                                        e32<='0';
                                                                        e64<='0';
                                                                        e128<='0';
                                                                        e256<='0';
                                                                        e512<='0';
                                                                        e1024<='0';
                                                                        e2048<='0';
                                                                                                if(n10=2)then
                                                                                                posxn2<=200;
                                                                                                posyn2<=240;
                                                                                                e2<='1';    
                                                                                                elsif(n10=4)then
                                                                                                posxn4<=200;
                                                                                                posyn4<=240;
                                                                                                e4<='1';
                                                                                                elsif(n10=8)then
                                                                                                posxn8<=200;
                                                                                                posyn8<=240;
                                                                                                e8<='1';
                                                                                                elsif(n10=16)then
                                                                                                posxn16<=200;
                                                                                                posyn16<=240;
                                                                                                e16<='1';
                                                                                                elsif(n10=32)then
                                                                                                posxn32<=200;
                                                                                                posyn32<=240;
                                                                                                e32<='1';            
                                                                                                elsif(n10=64)then
                                                                                                posxn64<=200;
                                                                                                posyn64<=240;
                                                                                                e64<='1'; 
                                                                                                elsif(n10=128)then
                                                                                                posxn128<=200;
                                                                                                posyn128<=240;
                                                                                                e128<='1'; 
                                                                                                elsif(n10=256)then
                                                                                                posxn256<=200;
                                                                                                posyn256<=240;
                                                                                                e256<='1'; 
                                                                                                elsif(n10=512)then
                                                                                                posxn512<=200;
                                                                                                posyn512<=240;
                                                                                                e512<='1'; 
                                                                                                elsif(n10=1024)then
                                                                                                posxn1024<=200;
                                                                                                posyn1024<=240;
                                                                                                e1024<='1'; 
                                                                                                elsif(n10=2048)then
                                                                                                posxn2048<=200;
                                                                                                posyn2048<=240;
                                                                                                e2048<='1';
                                                                                                end if;
    elsif(Hcount>=300 and Hcount<400 and vcount>=240 and vcount<340)then
                                                                                                                                e2<='0';
                                                                                                        e4<='0';
                                                                                                        e8<='0';
                                                                                                        e16<='0';
                                                                                                        e32<='0';
                                                                                                        e64<='0';
                                                                                                        e128<='0';
                                                                                                        e256<='0';
                                                                                                        e512<='0';
                                                                                                        e1024<='0';
                                                                                                        e2048<='0';
                                                                                                                                if(n11=2)then
                                                                                                                                posxn2<=300;
                                                                                                                                posyn2<=240;
                                                                                                                                e2<='1';    
                                                                                                                                elsif(n11=4)then
                                                                                                                                posxn4<=300;
                                                                                                                                posyn4<=240;
                                                                                                                                e4<='1';
                                                                                                                                elsif(n11=8)then
                                                                                                                                posxn8<=300;
                                                                                                                                posyn8<=240;
                                                                                                                                e8<='1';
                                                                                                                                elsif(n11=16)then
                                                                                                                                posxn16<=300;
                                                                                                                                posyn16<=240;
                                                                                                                                e16<='1';
                                                                                                                                elsif(n11=32)then
                                                                                                                                posxn32<=300;
                                                                                                                                posyn32<=240;
                                                                                                                                e32<='1';            
                                                                                                                                elsif(n11=64)then
                                                                                                                                posxn64<=300;
                                                                                                                                posyn64<=240;
                                                                                                                                e64<='1'; 
                                                                                                                                elsif(n11=128)then
                                                                                                                                posxn128<=300;
                                                                                                                                posyn128<=240;
                                                                                                                                e128<='1'; 
                                                                                                                                elsif(n11=256)then
                                                                                                                                posxn256<=300;
                                                                                                                                posyn256<=240;
                                                                                                                                e256<='1'; 
                                                                                                                                elsif(n11=512)then
                                                                                                                                posxn512<=300;
                                                                                                                                posyn512<=240;
                                                                                                                                e512<='1'; 
                                                                                                                                elsif(n11=1024)then
                                                                                                                                posxn1024<=300;
                                                                                                                                posyn1024<=240;
                                                                                                                                e1024<='1'; 
                                                                                                                                elsif(n11=2048)then
                                                                                                                                posxn2048<=300;
                                                                                                                                posyn2048<=240;
                                                                                                                                e2048<='1';
                                                                                                                                end if;
    elsif(Hcount>=400 and Hcount<500 and vcount>=240 and vcount<340)then
                                                                                                                                                                e2<='0';
                                                                                                                                        e4<='0';
                                                                                                                                        e8<='0';
                                                                                                                                        e16<='0';
                                                                                                                                        e32<='0';
                                                                                                                                        e64<='0';
                                                                                                                                        e128<='0';
                                                                                                                                        e256<='0';
                                                                                                                                        e512<='0';
                                                                                                                                        e1024<='0';
                                                                                                                                        e2048<='0';
                                                                                                                                                                if(n12=2)then
                                                                                                                                                                posxn2<=400;
                                                                                                                                                                posyn2<=240;
                                                                                                                                                                e2<='1';    
                                                                                                                                                                elsif(n12=4)then
                                                                                                                                                                posxn4<=400;
                                                                                                                                                                posyn4<=240;
                                                                                                                                                                e4<='1';
                                                                                                                                                                elsif(n12=8)then
                                                                                                                                                                posxn8<=400;
                                                                                                                                                                posyn8<=240;
                                                                                                                                                                e8<='1';
                                                                                                                                                                elsif(n12=16)then
                                                                                                                                                                posxn16<=400;
                                                                                                                                                                posyn16<=240;
                                                                                                                                                                e16<='1';
                                                                                                                                                                elsif(n12=32)then
                                                                                                                                                                posxn32<=400;
                                                                                                                                                                posyn32<=240;
                                                                                                                                                                e32<='1';            
                                                                                                                                                                elsif(n12=64)then
                                                                                                                                                                posxn64<=400;
                                                                                                                                                                posyn64<=240;
                                                                                                                                                                e64<='1'; 
                                                                                                                                                                elsif(n12=128)then
                                                                                                                                                                posxn128<=400;
                                                                                                                                                                posyn128<=240;
                                                                                                                                                                e128<='1'; 
                                                                                                                                                                elsif(n12=256)then
                                                                                                                                                                posxn256<=400;
                                                                                                                                                                posyn256<=240;
                                                                                                                                                                e256<='1'; 
                                                                                                                                                                elsif(n12=512)then
                                                                                                                                                                posxn512<=400;
                                                                                                                                                                posyn512<=240;
                                                                                                                                                                e512<='1'; 
                                                                                                                                                                elsif(n12=1024)then
                                                                                                                                                                posxn1024<=400;
                                                                                                                                                                posyn1024<=240;
                                                                                                                                                                e1024<='1'; 
                                                                                                                                                                elsif(n12=2048)then
                                                                                                                                                                posxn2048<=400;
                                                                                                                                                                posyn2048<=240;
                                                                                                                                                                e2048<='1';
                                                                                                                                                                end if;
                                                                                                                                                                    elsif(Hcount>=100 and Hcount<200 and vcount>=340 and vcount<440)then
                                                                                                                                                                                                                            e2<='0';
                                                                                                                                                                                                    e4<='0';
                                                                                                                                                                                                    e8<='0';
                                                                                                                                                                                                    e16<='0';
                                                                                                                                                                                                    e32<='0';
                                                                                                                                                                                                    e64<='0';
                                                                                                                                                                                                    e128<='0';
                                                                                                                                                                                                    e256<='0';
                                                                                                                                                                                                    e512<='0';
                                                                                                                                                                                                    e1024<='0';
                                                                                                                                                                                                    e2048<='0';
                                                                                                                                                                                                                            if(n13=2)then
                                                                                                                                                                                                                            posxn2<=100;
                                                                                                                                                                                                                            posyn2<=340;
                                                                                                                                                                                                                            e2<='1';    
                                                                                                                                                                                                                            elsif(n13=4)then
                                                                                                                                                                                                                            posxn4<=100;
                                                                                                                                                                                                                            posyn4<=340;
                                                                                                                                                                                                                            e4<='1';
                                                                                                                                                                                                                            elsif(n13=8)then
                                                                                                                                                                                                                            posxn8<=100;
                                                                                                                                                                                                                            posyn8<=340;
                                                                                                                                                                                                                            e8<='1';
                                                                                                                                                                                                                            elsif(n13=16)then
                                                                                                                                                                                                                            posxn16<=100;
                                                                                                                                                                                                                            posyn16<=340;
                                                                                                                                                                                                                            e16<='1';
                                                                                                                                                                                                                            elsif(n13=32)then
                                                                                                                                                                                                                            posxn32<=100;
                                                                                                                                                                                                                            posyn32<=340;
                                                                                                                                                                                                                            e32<='1';            
                                                                                                                                                                                                                            elsif(n13=64)then
                                                                                                                                                                                                                            posxn64<=100;
                                                                                                                                                                                                                            posyn64<=340;
                                                                                                                                                                                                                            e64<='1'; 
                                                                                                                                                                                                                            elsif(n13=128)then
                                                                                                                                                                                                                            posxn128<=100;
                                                                                                                                                                                                                            posyn128<=340;
                                                                                                                                                                                                                            e128<='1'; 
                                                                                                                                                                                                                            elsif(n13=256)then
                                                                                                                                                                                                                            posxn256<=100;
                                                                                                                                                                                                                            posyn256<=340;
                                                                                                                                                                                                                            e256<='1'; 
                                                                                                                                                                                                                            elsif(n13=512)then
                                                                                                                                                                                                                            posxn512<=100;
                                                                                                                                                                                                                            posyn512<=340;
                                                                                                                                                                                                                            e512<='1'; 
                                                                                                                                                                                                                            elsif(n13=1024)then
                                                                                                                                                                                                                            posxn1024<=100;
                                                                                                                                                                                                                            posyn1024<=340;
                                                                                                                                                                                                                            e1024<='1'; 
                                                                                                                                                                                                                            elsif(n13=2048)then
                                                                                                                                                                                                                            posxn2048<=100;
                                                                                                                                                                                                                            posyn2048<=340;
                                                                                                                                                                                                                            e2048<='1';
                                                                                                                                                                                                                            end if;
                                                                                                                                                                elsif(Hcount>=200 and Hcount<300 and vcount>=340 and vcount<440)then
                                                                                                                                                                                                                                                            e2<='0';
                                                                                                                                                                                                                                    e4<='0';
                                                                                                                                                                                                                                    e8<='0';
                                                                                                                                                                                                                                    e16<='0';
                                                                                                                                                                                                                                    e32<='0';
                                                                                                                                                                                                                                    e64<='0';
                                                                                                                                                                                                                                    e128<='0';
                                                                                                                                                                                                                                    e256<='0';
                                                                                                                                                                                                                                    e512<='0';
                                                                                                                                                                                                                                    e1024<='0';
                                                                                                                                                                                                                                    e2048<='0';
                                                                                                                                                                                                                                                            if(n14=2)then
                                                                                                                                                                                                                                                            posxn2<=200;
                                                                                                                                                                                                                                                            posyn2<=340;
                                                                                                                                                                                                                                                            e2<='1';    
                                                                                                                                                                                                                                                            elsif(n14=4)then
                                                                                                                                                                                                                                                            posxn4<=200;
                                                                                                                                                                                                                                                            posyn4<=340;
                                                                                                                                                                                                                                                            e4<='1';
                                                                                                                                                                                                                                                            elsif(n14=8)then
                                                                                                                                                                                                                                                            posxn8<=200;
                                                                                                                                                                                                                                                            posyn8<=340;
                                                                                                                                                                                                                                                            e8<='1';
                                                                                                                                                                                                                                                            elsif(n14=16)then
                                                                                                                                                                                                                                                            posxn16<=200;
                                                                                                                                                                                                                                                            posyn16<=340;
                                                                                                                                                                                                                                                            e16<='1';
                                                                                                                                                                                                                                                            elsif(n14=32)then
                                                                                                                                                                                                                                                            posxn32<=200;
                                                                                                                                                                                                                                                            posyn32<=340;
                                                                                                                                                                                                                                                            e32<='1';            
                                                                                                                                                                                                                                                            elsif(n14=64)then
                                                                                                                                                                                                                                                            posxn64<=200;
                                                                                                                                                                                                                                                            posyn64<=340;
                                                                                                                                                                                                                                                            e64<='1'; 
                                                                                                                                                                                                                                                            elsif(n14=128)then
                                                                                                                                                                                                                                                            posxn128<=200;
                                                                                                                                                                                                                                                            posyn128<=340;
                                                                                                                                                                                                                                                            e128<='1'; 
                                                                                                                                                                                                                                                            elsif(n14=256)then
                                                                                                                                                                                                                                                            posxn256<=200;
                                                                                                                                                                                                                                                            posyn256<=340;
                                                                                                                                                                                                                                                            e256<='1'; 
                                                                                                                                                                                                                                                            elsif(n14=512)then
                                                                                                                                                                                                                                                            posxn512<=200;
                                                                                                                                                                                                                                                            posyn512<=340;
                                                                                                                                                                                                                                                            e512<='1'; 
                                                                                                                                                                                                                                                            elsif(n14=1024)then
                                                                                                                                                                                                                                                            posxn1024<=200;
                                                                                                                                                                                                                                                            posyn1024<=340;
                                                                                                                                                                                                                                                            e1024<='1'; 
                                                                                                                                                                                                                                                            elsif(n14=2048)then
                                                                                                                                                                                                                                                            posxn2048<=200;
                                                                                                                                                                                                                                                            posyn2048<=340;
                                                                                                                                                                                                                                                            e2048<='1';
                                                                                                                                                                                                                                                            end if;
                                                                                                                                                                elsif(Hcount>=300 and Hcount<400 and vcount>=340 and vcount<440)then
                                                                                                                                                                                                                                                                                            e2<='0';
                                                                                                                                                                                                                                                                    e4<='0';
                                                                                                                                                                                                                                                                    e8<='0';
                                                                                                                                                                                                                                                                    e16<='0';
                                                                                                                                                                                                                                                                    e32<='0';
                                                                                                                                                                                                                                                                    e64<='0';
                                                                                                                                                                                                                                                                    e128<='0';
                                                                                                                                                                                                                                                                    e256<='0';
                                                                                                                                                                                                                                                                    e512<='0';
                                                                                                                                                                                                                                                                    e1024<='0';
                                                                                                                                                                                                                                                                    e2048<='0';
                                                                                                                                                                                                                                                                                            if(n15=2)then
                                                                                                                                                                                                                                                                                            posxn2<=300;
                                                                                                                                                                                                                                                                                            posyn2<=340;
                                                                                                                                                                                                                                                                                            e2<='1';    
                                                                                                                                                                                                                                                                                            elsif(n15=4)then
                                                                                                                                                                                                                                                                                            posxn4<=300;
                                                                                                                                                                                                                                                                                            posyn4<=340;
                                                                                                                                                                                                                                                                                            e4<='1';
                                                                                                                                                                                                                                                                                            elsif(n15=8)then
                                                                                                                                                                                                                                                                                            posxn8<=300;
                                                                                                                                                                                                                                                                                            posyn8<=340;
                                                                                                                                                                                                                                                                                            e8<='1';
                                                                                                                                                                                                                                                                                            elsif(n15=16)then
                                                                                                                                                                                                                                                                                            posxn16<=300;
                                                                                                                                                                                                                                                                                            posyn16<=340;
                                                                                                                                                                                                                                                                                            e16<='1';
                                                                                                                                                                                                                                                                                            elsif(n15=32)then
                                                                                                                                                                                                                                                                                            posxn32<=300;
                                                                                                                                                                                                                                                                                            posyn32<=340;
                                                                                                                                                                                                                                                                                            e32<='1';            
                                                                                                                                                                                                                                                                                            elsif(n15=64)then
                                                                                                                                                                                                                                                                                            posxn64<=300;
                                                                                                                                                                                                                                                                                            posyn64<=340;
                                                                                                                                                                                                                                                                                            e64<='1'; 
                                                                                                                                                                                                                                                                                            elsif(n15=128)then
                                                                                                                                                                                                                                                                                            posxn128<=300;
                                                                                                                                                                                                                                                                                            posyn128<=340;
                                                                                                                                                                                                                                                                                            e128<='1'; 
                                                                                                                                                                                                                                                                                            elsif(n15=256)then
                                                                                                                                                                                                                                                                                            posxn256<=300;
                                                                                                                                                                                                                                                                                            posyn256<=340;
                                                                                                                                                                                                                                                                                            e256<='1'; 
                                                                                                                                                                                                                                                                                            elsif(n15=512)then
                                                                                                                                                                                                                                                                                            posxn512<=300;
                                                                                                                                                                                                                                                                                            posyn512<=340;
                                                                                                                                                                                                                                                                                            e512<='1'; 
                                                                                                                                                                                                                                                                                            elsif(n15=1024)then
                                                                                                                                                                                                                                                                                            posxn1024<=300;
                                                                                                                                                                                                                                                                                            posyn1024<=340;
                                                                                                                                                                                                                                                                                            e1024<='1'; 
                                                                                                                                                                                                                                                                                            elsif(n15=2048)then
                                                                                                                                                                                                                                                                                            posxn2048<=300;
                                                                                                                                                                                                                                                                                            posyn2048<=340;
                                                                                                                                                                                                                                                                                            e2048<='1';
                                                                                                                                                                                                                                                                                            end if;
                                                                                                                                                                elsif(Hcount>=400 and Hcount<500 and vcount>=340 and vcount<440)then
                                                                                                                                                                                                                                                                                                                            e2<='0';
                                                                                                                                                                                                                                                                                                    e4<='0';
                                                                                                                                                                                                                                                                                                    e8<='0';
                                                                                                                                                                                                                                                                                                    e16<='0';
                                                                                                                                                                                                                                                                                                    e32<='0';
                                                                                                                                                                                                                                                                                                    e64<='0';
                                                                                                                                                                                                                                                                                                    e128<='0';
                                                                                                                                                                                                                                                                                                    e256<='0';
                                                                                                                                                                                                                                                                                                    e512<='0';
                                                                                                                                                                                                                                                                                                    e1024<='0';
                                                                                                                                                                                                                                                                                                    e2048<='0';
                                                                                                                                                                                                                                                                                                                            if(n16=2)then
                                                                                                                                                                                                                                                                                                                            posxn2<=400;
                                                                                                                                                                                                                                                                                                                            posyn2<=340;
                                                                                                                                                                                                                                                                                                                            e2<='1';    
                                                                                                                                                                                                                                                                                                                            elsif(n16=4)then
                                                                                                                                                                                                                                                                                                                            posxn4<=400;
                                                                                                                                                                                                                                                                                                                            posyn4<=340;
                                                                                                                                                                                                                                                                                                                            e4<='1';
                                                                                                                                                                                                                                                                                                                            elsif(n16=8)then
                                                                                                                                                                                                                                                                                                                            posxn8<=400;
                                                                                                                                                                                                                                                                                                                            posyn8<=340;
                                                                                                                                                                                                                                                                                                                            e8<='1';
                                                                                                                                                                                                                                                                                                                            elsif(n16=16)then
                                                                                                                                                                                                                                                                                                                            posxn16<=400;
                                                                                                                                                                                                                                                                                                                            posyn16<=340;
                                                                                                                                                                                                                                                                                                                            e16<='1';
                                                                                                                                                                                                                                                                                                                            elsif(n16=32)then
                                                                                                                                                                                                                                                                                                                            posxn32<=400;
                                                                                                                                                                                                                                                                                                                            posyn32<=340;
                                                                                                                                                                                                                                                                                                                            e32<='1';            
                                                                                                                                                                                                                                                                                                                            elsif(n16=64)then
                                                                                                                                                                                                                                                                                                                            posxn64<=400;
                                                                                                                                                                                                                                                                                                                            posyn64<=340;
                                                                                                                                                                                                                                                                                                                            e64<='1'; 
                                                                                                                                                                                                                                                                                                                            elsif(n16=128)then
                                                                                                                                                                                                                                                                                                                            posxn128<=400;
                                                                                                                                                                                                                                                                                                                            posyn128<=340;
                                                                                                                                                                                                                                                                                                                            e128<='1'; 
                                                                                                                                                                                                                                                                                                                            elsif(n16=256)then
                                                                                                                                                                                                                                                                                                                            posxn256<=400;
                                                                                                                                                                                                                                                                                                                            posyn256<=340;
                                                                                                                                                                                                                                                                                                                            e256<='1'; 
                                                                                                                                                                                                                                                                                                                            elsif(n16=512)then
                                                                                                                                                                                                                                                                                                                            posxn512<=400;
                                                                                                                                                                                                                                                                                                                            posyn512<=340;
                                                                                                                                                                                                                                                                                                                            e512<='1'; 
                                                                                                                                                                                                                                                                                                                            elsif(n16=1024)then
                                                                                                                                                                                                                                                                                                                            posxn1024<=400;
                                                                                                                                                                                                                                                                                                                            posyn1024<=340;
                                                                                                                                                                                                                                                                                                                            e1024<='1'; 
                                                                                                                                                                                                                                                                                                                            elsif(n16=2048)then
                                                                                                                                                                                                                                                                                                                            posxn2048<=400;
                                                                                                                                                                                                                                                                                                                            posyn2048<=340;
                                                                                                                                                                                                                                                                                                                            e2048<='1';
                                                                                                                                                                                                                                                                                                                            end if;                                                                                                                                                                                                                                                                                                                                                           
                                                                                                                                                                                            end if;                                                                                                                                                                                                                                                                                                                                                           
    end if;
    end process;
    
    process(clk_interno)
    begin
    if(clk_interno'event and clk_interno='1')then
    case Presionado is
    When Ready=>
    n1p<=n1;
             n2p<=n2;
             n3p<=n3;
             n4p<=n4;
             n5p<=n5;
             n6p<=n6;
             n7p<=n7;
             n8p<=n8;
             n9p<=n9;
             n10p<=n10;
             n11p<=n11;
             n12p<=n12;
             n13p<=n13;
             n14p<=n14;
             n15p<=n15;
             n16p<=n16;
    if(random_number=0 or Random_number=17)then
    Presionado<=Aleatory;
    elsif(BUP='1' or (TecladoSalida="1110111" and indicador='1'and selector='1'))then
    Presionado<=Up;
    elsif(BDW='1' or (TecladoSalida="1110011" and indicador='1'and selector='1'))then
    Presionado<=Down;
    elsif(BLF='1' or (TecladoSalida="1100001" and indicador='1'and selector='1'))then
    Presionado<=Left;
    elsif(TecladoSalida="0011011"and indicador='1'and selector='1')then
    n1<=2;
            n2<=4;
            n3<=8;
            n4<=16;
            n5<=32;
            n6<=64;
            n7<=128;
            n8<=256;
            n9<=512;
            n10<=1024;
            n11<=2048;
            n12<=2;
            n13<=4;
            n14<=8;
            n15<=16;
            n16<=32;
            apress<="1111";
    elsif(BRG='1' or (TecladoSalida="1100100" and indicador='1'))then
    Presionado<=Right;
    elsif(apress="1111")then
        if(PBTON='1' or (TecladoSalida="0001101" and indicador='1' and selector='1'))then
        n1<=0;
        n2<=0;
        n3<=0;
        n4<=0;
        n5<=0;
        n6<=0;
        n7<=0;
        n8<=0;
        n9<=0;
        n10<=0;
        n11<=0;
        n12<=0;
        n13<=0;
        n14<=0;
        n15<=0;
        n16<=0;
        eup<='0';
            edw<='0';
            elf<='0';
            erg<='0';
            apress<="0000";
            puntaje<=0;
            random_number<=0;
        Presionado<=Aleatory;
        end if;
    else
    Presionado<=Ready;
    end if;
    
    --n1  n2  n3  n4
    --n5  n6  n7  n8
    --n9  n10 n11 n12
    --n13 n14 n15 n16
    When Up=>
         
         if(clk_count=1 or clk_count=4 or clk_count=7 or clk_count=10 or clk_count=13)then
                if(n1 = n5  and clk_count=7)then
                n1<=n5+n1;
                puntaje<=n1+puntaje;
                n5<=0;
                elsif(n1=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
                n1<=n5;
                n5<=0;
                else
                n5<=n5;
                end if;
                
                if(n2 = n6 and clk_count=7)then
                n2<=n2+n6;
                puntaje<=n2+puntaje;
                n6<=0;
                elsif(n2=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
                n2<=n6;
                n6<=0;
                else
                n6<=n6;
                end if;
                
                if(n3 = n7 and clk_count=7)then
                n3<=n7+n3;
                puntaje<=n3+puntaje;
                n7<=0;
                elsif(n3=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
                n3<=n7;
                n7<=0;
                else
                n7<=n7;
                end if;
               
                if(n4 = n8 and clk_count=7)then
                n4<=n8+n4;
                puntaje<=n4+puntaje;
                n8<=0;
                elsif(n4=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
                n4<=n8;
                n8<=0;
                else
                n8<=n8;
                end if;            
                end if;
                   
                             if(clk_count=3 or clk_count=6 or clk_count=9 or clk_count=12 or clk_count=15)then
                             if(n5 = n9 and clk_count=9)then
                             n5<=n5+n9;
                             puntaje<=n5+puntaje;
                             n9<=0;
                             elsif(n5=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                             n5<=n9;
                             n9<=0;
                             else
                             n9<=n9;
                             end if;
                             
                             if(n6 = n10 and clk_count=9)then
                             n6<=n6+n10;
                             puntaje<=n6+puntaje;
                             n10<=0;
                             elsif(n6=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                             n6<=n10;
                             n10<=0;
                             else
                             n10<=n10;
                             end if;
                             
                             if(n11 = n7 and clk_count=9)then
                             n7<=n11+n7;
                             puntaje<=n7+puntaje;
                             n11<=0;
                             elsif(n7=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                             n7<=n11;
                             n11<=0;
                             else
                             n11<=n11;
                             end if;
                            
                             if(n8 = n12 and clk_count=9)then
                             n8<=n8+n12;
                             puntaje<=n8+puntaje;
                             n12<=0;
                             elsif(n8=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                             n8<=n12;
                             n12<=0;
                             else
                             n12<=n12;
                             end if;            
                             end if;
                                             --n1  n2  n3  n4
                                             --n5  n6  n7  n8
                                             --n9  n10 n11 n12
                                             --n13 n14 n15 n16
                                                       if(clk_count=2 or clk_count=5  or clk_count=8 or clk_count=11 or clk_count=14)then
                                                       if(n9 = n13 and clk_count=8)then
                                                       n9<=n13+n9;
                                                       puntaje<=n9+puntaje;
                                                       n13<=0;
                                                       elsif(n9=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                       n9<=n13;
                                                       n13<=0;
                                                       else
                                                       n13<=n13;
                                                       end if;
                                                       
                                                       if(n10 = n14 and clk_count=8)then
                                                       n10<=n14+n10;
                                                       puntaje<=n10+puntaje;
                                                       n14<=0;
                                                       elsif(n10=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                       n10<=n14;
                                                       n14<=0;
                                                       else
                                                       n14<=n14;
                                                       end if;
                                                       
                                                       if(n11 = n15 and clk_count=8)then
                                                       n11<=n15+n11;
                                                       puntaje<=n11+puntaje;
                                                       n15<=0;
                                                       elsif(n11=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                       n11<=n15;
                                                       n15<=0;
                                                       else
                                                       n15<=n15;
                                                       end if;
                                                      
                                                       if(n12 = n16 and clk_count=8)then
                                                       n12<=n12+n16;
                                                       puntaje<=n12+puntaje;
                                                       n16<=0;
                                                       elsif(n12=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                       n12<=n16;
                                                       n16<=0;
                                                       else
                                                       n16<=n16;
                                                       end if;            
                                                       end if;
         if(clk_count=25000000)then
         clk_count<=0;
         if(n1=n1p and n2=n2p and n3=n3p and n4=n4p and n5=n5p and n6=n6p and n7=n7p and n8=n8p and n9=n9p and n10=n10p and n11=n11p and n12=n12p and n13=n13p and n14=n14p and n15=n15p and n16=n16p)then
         eup<='1';
         press(0)<='1';
         apress(0)<='1';
         Presionado<=Ready;
         else
         Presionado<=Create;
         end if;
         else 
         clk_count<=clk_count+1;
         Presionado<=Up;
         end if;

    
    When Down=>
    
     
             if(clk_count=1 or clk_count=4 or clk_count=7 or clk_count=10 or clk_count=13)then
             if(n12 = n16 and clk_count=7)then
             n16<=n12+n16;
             puntaje<=n16+puntaje;
             n12<=0;
             elsif(n16=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
             n16<=n12;
             n12<=0;
             else
             n12<=n12;
             end if;
             
             if(n11 = n15 and clk_count=7)then
             n15<=n11+n15;
             puntaje<=n15+puntaje;
             n11<=0;
             elsif(n15=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
             n15<=n11;
             n11<=0;
             else
             n11<=n11;
             end if;
             
             if(n10 = n14 and clk_count=7)then
             n14<=n10+n14;
             puntaje<=n14+puntaje;
             n10<=0;
             elsif(n14=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
             n14<=n10;
             n10<=0;
             else
             n10<=n10;
             end if;
            
             if(n9 = n13 and clk_count=7)then
             n13<=n9+n13;
             puntaje<=n13+puntaje;
             n9<=0;
             elsif(n13=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
             n13<=n9;
             n9<=0;
             else
             n9<=n9;
             end if;            
             end if;
                
                          if(clk_count=3 or clk_count=6 or clk_count=9 or clk_count=12 or clk_count=15)then
                          if(n8 = n12 and clk_count=9)then
                          n12<=n8+n12;
                          puntaje<=n12+puntaje;
                          n8<=0;
                          elsif(n12=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                          n12<=n8;
                          n8<=0;
                          else
                          n8<=n8;
                          end if;
                          
                          if(n11 = n7 and clk_count=9)then
                          n11<=n7+n11;
                          puntaje<=n11+puntaje;
                          n7<=0;
                          elsif(n11=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                          n11<=n7;
                          n7<=0;
                          else
                          n7<=n7;
                          end if;
                          
                          if(n10 = n6 and clk_count=9)then
                          n10<=n10+n6;
                          puntaje<=n10+puntaje;
                          n6<=0;
                          elsif(n10=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                          n10<=n6;
                          n6<=0;
                          else
                          n6<=n6;
                          end if;
                         
                          if(n9 = n5 and clk_count=9)then
                          n9<=n9+n5;
                          puntaje<=n9+puntaje;
                          n5<=0;
                          elsif(n9=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                          n9<=n5;
                          n5<=0;
                          else
                          n5<=n5;
                          end if;            
                          end if;
                                          --n1  n2  n3  n4
                                          --n5  n6  n7  n8
                                          --n9  n10 n11 n12
                                          --n13 n14 n15 n16
                                                    if(clk_count=2 or clk_count=5  or clk_count=8 or clk_count=11 or clk_count=14)then
                                                    if(n8 = n4 and clk_count=8)then
                                                    n8<=n8+n4;
                                                    puntaje<=n8+puntaje;
                                                    n4<=0;
                                                    elsif(n8=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                    n8<=n4;
                                                    n4<=0;
                                                    else
                                                    n4<=n4;
                                                    end if;
                                                    
                                                    if(n7 = n3 and clk_count=8)then
                                                    n7<=n7+n3;
                                                    puntaje<=n7+puntaje;
                                                    n3<=0;
                                                    elsif(n7=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                    n7<=n3;
                                                    n3<=0;
                                                    else
                                                    n3<=n3;
                                                    end if;
                                                    
                                                    if(n2 = n6 and clk_count=8)then
                                                    n6<=n2+n6;
                                                    puntaje<=n6+puntaje;
                                                    n2<=0;
                                                    elsif(n6=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                    n6<=n2;
                                                    n2<=0;
                                                    else
                                                    n2<=n2;
                                                    end if;
                                                   
                                                    if(n1 = n5 and clk_count=8)then
                                                    n5<=n1+n5;
                                                    puntaje<=n5+puntaje;
                                                    n1<=0;
                                                    elsif(n5=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                    n5<=n1;
                                                    n1<=0;
                                                    else
                                                    n1<=n1;
                                                    end if;            
                                                    end if;
             if(clk_count=25000000)then
             clk_count<=0;
                      if(n1=n1p and n2=n2p and n3=n3p and n4=n4p and n5=n5p and n6=n6p and n7=n7p and n8=n8p and n9=n9p and n10=n10p and n11=n11p and n12=n12p and n13=n13p and n14=n14p and n15=n15p and n16=n16p)then
                      press(1)<='1';
                      apress(1)<='1';
                      edw<='1';
                      Presionado<=Ready;
                      else
                      Presionado<=Create;
                      end if;
             else 
             clk_count<=clk_count+1;
             Presionado<=Down;
             end if;

    When Right=>
             if(clk_count=1 or clk_count=4 or clk_count=7 or clk_count=10 or clk_count=13)then
                    if(n4 = n3 and clk_count=7)then
                    n4<=n3+n4;
                    puntaje<=n4+puntaje;
                    n3<=0;
                    elsif(n4=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
                    n4<=n3;
                    n3<=0;
                    else
                    n3<=n3;
                    end if;
                    
                    if(n8 = n7 and clk_count=7)then
                    n8<=n8+n7;
                    puntaje<=n8+puntaje;
                    n7<=0;
                    elsif(n8=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
                    n8<=n7;
                    n7<=0;
                    else
                    n7<=n7;
                    end if;
                    
                    if(n11 = n12 and clk_count=7)then
                    n12<=n12+n11;
                    puntaje<=n12+puntaje;
                    n11<=0;
                    elsif(n12=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
                    n12<=n11;
                    n11<=0;
                    else
                    n12<=n12;
                    end if;
                   
                    if(n16 = n15 and clk_count=7)then
                    n16<=n15+n16;
                    puntaje<=n16+puntaje;
                    n15<=0;
                    elsif(n16=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
                    n16<=n15;
                    n15<=0;
                    else
                    n15<=n15;
                    end if;            
                    end if;
                       
                                 if(clk_count=3 or clk_count=6 or clk_count=9 or clk_count=12 or clk_count=15)then
                                 if(n2 = n3 and clk_count=9)then
                                 n3<=n2+n3;
                                 puntaje<=n3+puntaje;
                                 n2<=0;
                                 elsif(n3=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                                 n3<=n2;
                                 n2<=0;
                                 else
                                 n2<=n2;
                                 end if;
                                 
                                 if(n6 = n7 and clk_count=9)then
                                 n7<=n6+n7;
                                 puntaje<=n7+puntaje;
                                 n6<=0;
                                 elsif(n7=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                                 n7<=n6;
                                 n6<=0;
                                 else
                                 n6<=n6;
                                 end if;
                                 
                                 if(n11 = n10 and clk_count=9)then
                                 n11<=n11+n10;
                                 puntaje<=n11+puntaje;
                                 n10<=0;
                                 elsif(n11=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                                 n11<=n10;
                                 n10<=0;
                                 else
                                 n10<=n10;
                                 end if;
                                
                                 if(n14 = n15 and clk_count=9)then
                                 n15<=n14+n15;
                                 puntaje<=n15+puntaje;
                                 n14<=0;
                                 elsif(n15=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                                 n15<=n14;
                                 n14<=0;
                                 else
                                 n14<=n14;
                                 end if;            
                                 end if;
                                                 --n1  n2  n3  n4
                                                 --n5  n6  n7  n8
                                                 --n9  n10 n11 n12
                                                 --n13 n14 n15 n16
                                                           if(clk_count=2 or clk_count=5  or clk_count=8 or clk_count=11 or clk_count=14)then
                                                           if(n2 = n1 and clk_count=8)then
                                                           n2<=n2+n1;
                                                           puntaje<=n2+puntaje;
                                                           n1<=0;
                                                           elsif(n2=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                           n2<=n1;
                                                           n1<=0;
                                                           else
                                                           n1<=n1;
                                                           end if;
                                                           
                                                           if(n5 = n6 and clk_count=8)then
                                                           n6<=n5+n6;
                                                           puntaje<=n6+puntaje;
                                                           n5<=0;
                                                           elsif(n6=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                           n6<=n5;
                                                           n5<=0;
                                                           else
                                                           n5<=n5;
                                                           end if;
                                                           
                                                           if(n9 = n10 and clk_count=8)then
                                                           n10<=n9+n10;
                                                           puntaje<=n10+puntaje;
                                                           n9<=0;
                                                           elsif(n10=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                           n10<=n9;
                                                           n9<=0;
                                                           else
                                                           n9<=n9;
                                                           end if;
                                                          
                                                           if(n13 = n14 and clk_count=8)then
                                                           n14<=n13+n14;
                                                           puntaje<=n14+puntaje;
                                                           n13<=0;
                                                           elsif(n14=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                           n14<=n13;
                                                           n13<=0;
                                                           else
                                                           n13<=n13;
                                                           end if;            
                                                           end if;
             
             if(clk_count=25000000)then
             clk_count<=0;
                      if(n1=n1p and n2=n2p and n3=n3p and n4=n4p and n5=n5p and n6=n6p and n7=n7p and n8=n8p and n9=n9p and n10=n10p and n11=n11p and n12=n12p and n13=n13p and n14=n14p and n15=n15p and n16=n16p)then
                      press(2)<='1';
                      apress(2)<='1';
                      erg<='1';
                      Presionado<=Ready;
                      else
                      Presionado<=Create;
                      end if;
             else 
             clk_count<=clk_count+1;
             Presionado<=Right;
             end if;

 
--    if(not(n3=0)and clk_count=0)then
--     if(n4=0)then
--     n4<=n3;
--     elsif(n4=n3)then
--     n4<=n3+n3;
--     else
--     n3<=n3;
--     end if;
--    end if;
    When Left=>
                if(clk_count=1 or clk_count=4 or clk_count=7 or clk_count=10 or clk_count=13)then
                        if(n1 = n2 and clk_count=7)then
                        n1<=n1+n2;
                        puntaje<=n1+puntaje;
                        n2<=0;
                        elsif(n1=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
                        n1<=n2;
                        n2<=0;
                        else
                        n2<=n2;
                        end if;
                        
                        if(n5 = n6 and clk_count=7)then
                        n5<=n6+n5;
                        puntaje<=n5+puntaje;
                        n6<=0;
                        elsif(n5=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
                        n5<=n6;
                        n6<=0;
                        else
                        n6<=n6;
                        end if;
                        
                        if(n9 = n10 and clk_count=7)then
                        n9<=n9+n10;
                        puntaje<=n9+puntaje;
                        n10<=0;
                        elsif(n9=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
                        n9<=n10;
                        n10<=0;
                        else
                        n10<=n10;
                        end if;
                       
                        if(n13 = n14 and clk_count=7)then
                        n13<=n13+n14;
                        puntaje<=n13+puntaje;
                        n14<=0;
                        elsif(n13=0 and (clk_count=1 or clk_count=4 or clk_count=10 or clk_count=13))then
                        n13<=n14;
                        n14<=0;
                        else
                        n14<=n14;
                        end if;            
                        end if;
                           
                                     if(clk_count=3 or clk_count=6 or clk_count=9 or clk_count=12 or clk_count=15)then
                                     if(n2 = n3 and clk_count=9)then
                                     n2<=n2+n3;
                                     puntaje<=n2+puntaje;
                                     n3<=0;
                                     elsif(n2=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                                     n2<=n3;
                                     n3<=0;
                                     else
                                     n3<=n3;
                                     end if;
                                     
                                     if(n6 = n7 and clk_count=9)then
                                     n6<=n6+n7;
                                     puntaje<=n6+puntaje;
                                     n7<=0;
                                     elsif(n6=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                                     n6<=n7;
                                     n7<=0;
                                     else
                                     n7<=n7;
                                     end if;
                                     
                                     if(n10 = n11 and clk_count=9)then
                                     n10<=n11+n10;
                                     puntaje<=n10+puntaje;
                                     n11<=0;
                                     elsif(n10=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                                     n10<=n11;
                                     n11<=0;
                                     else
                                     n11<=n11;
                                     end if;
                                    
                                     if(n14 = n15 and clk_count=9)then
                                     n14<=n14+n15;
                                     puntaje<=n14+puntaje;
                                     n15<=0;
                                     elsif(n14=0 and (clk_count=3 or clk_count=6 or clk_count=12 or clk_count=15))then
                                     n14<=n15;
                                     n15<=0;
                                     else
                                     n15<=n15;
                                     end if;            
                                     end if;
                                                     --n1  n2  n3  n4
                                                     --n5  n6  n7  n8
                                                     --n9  n10 n11 n12
                                                     --n13 n14 n15 n16
                                                               if(clk_count=2 or clk_count=5  or clk_count=8 or clk_count=11 or clk_count=14)then
                                                               if(n3 = n4 and clk_count=8)then
                                                               n3<=n4+n3;
                                                               puntaje<=n3+puntaje;
                                                               n4<=0;
                                                               elsif(n3=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                               n3<=n4;
                                                               n4<=0;
                                                               else
                                                               n4<=n4;
                                                               end if;
                                                               
                                                               if(n8 = n7 and clk_count=8)then
                                                               n7<=n7+n8;
                                                               puntaje<=n7+puntaje;
                                                               n8<=0;
                                                               elsif(n7=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                               n7<=n8;
                                                               n8<=0;
                                                               else
                                                               n8<=n8;
                                                               end if;
                                                               
                                                               if(n11 = n12 and clk_count=8)then
                                                               n11<=n11+n12;
                                                               puntaje<=n11+puntaje;
                                                               n12<=0;
                                                               elsif(n11=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                               n11<=n12;
                                                               n12<=0;
                                                               else
                                                               n12<=n12;
                                                               end if;
                                                              
                                                               if(n15 = n16 and clk_count=8)then
                                                               n15<=n15+n16;
                                                               puntaje<=n15+puntaje;
                                                               n16<=0;
                                                               elsif(n15=0 and (clk_count=2 or clk_count=5 or clk_count=11 or clk_count=14))then
                                                               n15<=n16;
                                                               n16<=0;
                                                               else
                                                               n16<=n16;
                                                               end if;            
                                                               end if;
                 
             
             if(clk_count=25000000)then
             clk_count<=0;
                      if(n1=n1p and n2=n2p and n3=n3p and n4=n4p and n5=n5p and n6=n6p and n7=n7p and n8=n8p and n9=n9p and n10=n10p and n11=n11p and n12=n12p and n13=n13p and n14=n14p and n15=n15p and n16=n16p)then
                      press(3)<='1';
                      apress(3)<='1';
                      elf<='1';
                      Presionado<=Ready;
                      else
                      Presionado<=Create;
                      end if;
             else 
             clk_count<=clk_count+1;
             Presionado<=Left;
             end if;
    when Aleatory=>
    if(clk_count=17 and random_number=0)then
    clk_count<=1;
    Presionado<=Aleatory;
    elsif(PBTON='1' or (TecladoSalida="0001101" and indicador='1'and selector='1'))then
    random_number<=clk_count;
    if(random_number=1)then
    n1<=2;
    elsif(random_number=2)then
    n2<=2;
    elsif(random_number=3)then
        n3<=2;
        elsif(random_number=4)then
            n4<=2;
            elsif(random_number=5)then
                n5<=2;
                elsif(random_number=6)then
                    n6<=2;
                    elsif(random_number=7)then
                        n7<=2;
                        elsif(random_number=8)then
                            n8<=2;
                            elsif(random_number=9)then
                                n9<=2;
                                elsif(random_number=10)then
                                    n10<=2;
                                    elsif(random_number=11)then
                                        n11<=2;
                                        elsif(random_number=12)then
                                            n12<=2;
                                            elsif(random_number=13)then
                                                n13<=2;
                                                elsif(random_number=14)then
                                                    n14<=2;
                                                    elsif(random_number=15)then
                                                        n15<=2;
                                                        elsif(random_number=16)then
                                                            n16<=2;
                                                                
    end if;
    if(random_number<=6)then
     if(random_number=1)then
        n11<=2;
        elsif(random_number=2)then
        n12<=2;
        elsif(random_number=3)then
            n13<=2;
            elsif(random_number=4)then
                n14<=2;
                elsif(random_number=5)then
                    n15<=2;
                    elsif(random_number=6)then
                        n16<=2; 
        end if;
    elsif(random_number>=7)then
    if(random_number=7)then
        n1<=2;
        elsif(random_number=8)then
        n2<=2;
        elsif(random_number=9)then
            n3<=2;
            elsif(random_number=10)then
                n4<=2;
                elsif(random_number=11)then
                    n5<=2;
                    elsif(random_number=12)then
                        n6<=2;
                        elsif(random_number=13)then
                            n7<=2;
                            elsif(random_number=14)then
                                n8<=2;
                                elsif(random_number=15)then
                                    n9<=2;
                                    elsif(random_number=16)then
                                        n10<=2;
                                        
        end if;
    end if;
    else
    clk_count<=clk_count+1;
    Presionado<=Aleatory;
    end if;
    if(not (random_number=0))then
    clk_count<=0;
    press<="0000";
    Presionado<=Ready;
    end if;
    when Create=>
    eup<='0';
    edw<='0';
    elf<='0';
    erg<='0';
    press<="0000";
    if(n1=0)then
    n1<=2;
    Presionado<=Ready;
    elsif(not(n1=0)and n2=0)then
    n2<=2;
    Presionado<=Ready;
    elsif(not(n2=0)and n3=0)then
        n3<=2;
        Presionado<=Ready;
        elsif(not(n3=0)and n4=0)then
            n4<=2;
            Presionado<=Ready;
            elsif(not(n4=0)and n5=0)then
                n5<=2;
                Presionado<=Ready;
                elsif(not(n5=0)and n6=0)then
                    n6<=2;
                    Presionado<=Ready;
                    elsif(not(n6=0)and n7=0)then
                        n7<=2;
                        Presionado<=Ready;
                        elsif(not(n7=0)and n8=0)then
                            n8<=2;
                            Presionado<=Ready;
                            elsif(not(n8=0)and n9=0)then
                                n9<=2;
                                Presionado<=Ready;
                                elsif(not(n9=0)and n10=0)then
                                    n10<=2;
                                    Presionado<=Ready;
                                    elsif(not(n10=0)and n11=0)then
                                        n11<=2;
                                        Presionado<=Ready;
                                        elsif(not(n11=0)and n12=0)then
                                            n12<=2;
                                            Presionado<=Ready;
                                            elsif(not(n12=0)and n13=0)then
                                                n13<=2;
                                                Presionado<=Ready;
                                                elsif(not(n13=0)and n14=0)then
                                                    n14<=2;
                                                    Presionado<=Ready;
                                                    elsif(not(n14=0)and n15=0)then
                                                        n15<=2;
                                                        Presionado<=Ready;
                                                        elsif(not(n15=0)and n16=0)then
                                                            n16<=2;
                                                            Presionado<=Ready;
                                                            else
                                                            Presionado<=Ready;
    end if;
    
    end case;
    end if;
    end process;
    Mouse :Mouse_Movement
    Port Map(
    posx=>to_integer(unsigned(MOUSE_X_POS)),
    posy=>to_integer(unsigned(MOUSE_Y_POS)),
    clk=>clk_interno,
         click=>touch,
         MouseUp=>Mup,
         MouseDown=>Mdw,
         MouseLeft=>Mlf,
         MouseRight=>Mrg);
    Inst_MouseCtl: MouseCtl
           GENERIC MAP
        (
           SYSCLK_FREQUENCY_HZ => 108000000,
           CHECK_PERIOD_MS     => 500,
           TIMEOUT_PERIOD_MS   => 100
        )
    PORT MAP
           (
              clk            => directo,
              rst            => selector,
              xpos           => MOUSE_X_POS,
              ypos           => MOUSE_Y_POS,
              zpos           => open,
              left           => touch,
              middle         => open,
              right          => open,
              new_event      => open,
              value          => x"000",
              setx           => '0',
              sety           => '0',
              setmax_x       => '0',
              setmax_y       => '0',
              ps2_clk        => p2clk,
              ps2_data       => p2data
           );
    LetraP: display34segm PORT MAP(
                                                segments=>"1111001111000011000000000000000000",
                                                POSX =>10,
                                                POSY =>50,
                                            HCOUNT => hcount,
                                            VCOUNT => vcount,
                                            PAINT => paint2
                                        );
    LetraR: display34segm PORT MAP(
                                                                                        segments=>"1111001111000011000000100100000000",
                                                                                        POSX => 35,
                                                                                        POSY => 50,
                                                                                    HCOUNT => hcount,
                                                                                    VCOUNT => vcount,
                                                                                    PAINT => paint3
                                                                                );
    LetraE: display34segm PORT MAP(
                                                                                                                                segments=>"1110111111000000000000000000000000",
                                                                                                                                POSX => 60,
                                                                                                                                POSY => 50,
                                                                                                                            HCOUNT => hcount,
                                                                                                                            VCOUNT => vcount,
                                                                                                                            PAINT => paint4
                                                                                                                        );
    LetraS: display34segm PORT MAP(
                                                                                                                                                                        segments=>"1111111100000000110000000000000000",
                                                                                                                                                                        POSX => 85,
                                                                                                                                                                        POSY => 50,
                                                                                                                                                                    HCOUNT => hcount,
                                                                                                                                                                    VCOUNT => vcount,
                                                                                                                                                                    PAINT => paint5
                                                                                                                                                                );
    LetraS1: display34segm PORT MAP(
                                                                                                                                                                                                                                                                                                                                        segments=>"1111111100000000110000000000000000",
                                                                                                                                                                                                                                                                                                                                        POSX => 110,
                                                                                                                                                                                                                                                                                                                                        POSY => 50,
                                                                                                                                                                                                                                                                                                                                    HCOUNT => hcount,
                                                                                                                                                                                                                                                                                                                                    VCOUNT => vcount,
                                                                                                                                                                                                                                                                                                                                    PAINT => paint6
                                                                                                                                                                                                                                                                                                                                );
   LetraS2: display34segm PORT MAP(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        segments=>"1111111100000000110000000000000000",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        POSX => 160,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        POSY => 50,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    HCOUNT => hcount,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    VCOUNT => vcount,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    PAINT => paint7
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                );                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    LetraT: display34segm PORT MAP(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        segments=>"1100000000111100000000000000000000",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        POSX => 185,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        POSY => 50,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    HCOUNT => hcount,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    VCOUNT => vcount,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    PAINT => paint8);
    LetraA: display34segm PORT MAP(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            segments=>"0011000111000001110100000010000000",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            POSX => 210,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            POSY => 50,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        HCOUNT => hcount,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        VCOUNT => vcount,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        PAINT => paint9
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    );    
    LetraR1: display34segm PORT MAP(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            segments=>"1111001111000011000000100100000000",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            POSX => 235,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            POSY => 50,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        HCOUNT => hcount,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        VCOUNT => vcount,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        PAINT => paint10);
       LetraT1: display34segm PORT MAP(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             segments=>"1100000000111100000000000000000000",
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             POSX => 260,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             POSY => 50,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         HCOUNT => hcount,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         VCOUNT => vcount,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         PAINT => paint11);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    Num6: Numero
            PORT MAP(
            DW=>12,
            LW=>1,
            DL=>20,
            POSX=> 400,
            POSY=> 3, 
            HCOUNT=> hcount,
            VCOUNT=> vcount,
            VALUE=> numero6,
            PAINT=> paint106
            );
            
            Num5: Numero
            PORT MAP(
            DW=>12,
            LW=>1,
            DL=>20,
            POSX=> 420,
            POSY=> 3, 
            HCOUNT=> hcount,
            VCOUNT=> vcount,
            VALUE=> numero5,
            PAINT=> paint105
            );
            Num4: Numero
                PORT MAP(
                DW=>12,
                LW=>1,
                DL=>20,
                POSX=> 440,
                POSY=> 3, 
                HCOUNT=> hcount,
                VCOUNT=> vcount,
                VALUE=> numero4,
                PAINT=> paint104
                );
Num3: Numero
        PORT MAP(
        DW=>12,
        LW=>1,
        DL=>20,
        POSX=> 460,
        POSY=> 3, 
        HCOUNT=> hcount,
        VCOUNT=> vcount,
        VALUE=> numero3,
        PAINT=> paint103
        );
        
        num2: Numero
        PORT MAP(
        DW=>12,
        LW=>1,
        DL=>20,
        POSX=> 480,
        POSY=> 3, 
        HCOUNT=> hcount,
        VCOUNT=> vcount,
        VALUE=> numero2,
        PAINT=> paint102
        );
        num1: Numero
            PORT MAP(
            DW=>12,
            LW=>1,
            DL=>20,
            POSX=> 500,
            POSY=> 3, 
            HCOUNT=> hcount,
            VCOUNT=> vcount,
            VALUE=> numero1,
            PAINT=> paint101
            );
    Teclado: ps2_keyboard_to_ascii
        port map(
        rst=> selector,
        clk=> directo,                 
        ps2_clk=>p2clk,             
        ps2_data=>p2data,
        ascii_code=>TecladoSalida,
        ascii_new=>Indicador);
    Conversor : Bin2BCD_0a999
            Port map ( 
            BIN=>to_integer(unsigned(MOUSE_X_POS)),
            BCD5=>numero6,
            BCD4=>numero5,
            BCD3=>numero4,
            BCD2=>numero3,
            BCD1=>numero2,           
            BCD0=>numero1);
    Principal: Panel
        port map(
        POSX=>0,
        POSY=>0,
        HCOUNT=>hcount,
        VCOUNT=>vcount,
        PAINT=>paint1);  
    Numa2: dos
                port map(
                POSX=>posxn2,
                POSY=>posyn2,
                HCOUNT=>hcount,
                VCOUNT=>vcount,
                PAINT=>ndos,
                FONDO=>fondodos); 
    Numa4: cuatro
       port map(
       POSX=>posxn4,
       POSY=>posyn4,
       HCOUNT=>hcount,
       VCOUNT=>vcount,
       PAINT=>ncuatro,
                       FONDO=>fondocuatro); 
    Num8: Ocho
              port map(
              POSX=>posxn8,
              POSY=>posyn8,
              HCOUNT=>hcount,
              VCOUNT=>vcount,
              PAINT=>nocho,
                              FONDO=>fondoocho);
    Num16: diesyseis
                     port map(
                     POSX=>posxn16,
                     POSY=>posyn16,
                     HCOUNT=>hcount,
                     VCOUNT=>vcount,
                     PAINT=>ndiez,
                                     FONDO=>fondodiez);   
    Num32: treintaydos
                             port map(
                             POSX=>posxn32,
                             POSY=>posyn32,
                             HCOUNT=>hcount,
                             VCOUNT=>vcount,
                             PAINT=>ntreinta,
                                             FONDO=>fondotreinta);   
    Num64: Sesentaycuatro
                                     port map(
                                     POSX=>posxn64,
                                     POSY=>posyn64,
                                     HCOUNT=>hcount,
                                     VCOUNT=>vcount,
                                     PAINT=>nsesenta,
                                                     FONDO=>fondosesenta);                                                                             
	Num128: Cientoveintiocho
                                            port map(
                                            POSX=>posxn128,
                                            POSY=>posyn128,
                                            HCOUNT=>hcount,
                                            VCOUNT=>vcount,
                                            PAINT=>ncien,
                                                            FONDO=>fondocien); 
	Num256: doscientoscincuentayseis
                                                   port map(
                                                   POSX=>posxn256,
                                                   POSY=>posyn256,
                                                   HCOUNT=>hcount,
                                                   VCOUNT=>vcount,
                                                   PAINT=>ndosientos,
                                                                   FONDO=>fondodosientos); 
	Num512: quinientosdoce
                                                          port map(
                                                          POSX=>posxn512,
                                                          POSY=>posyn512,
                                                          HCOUNT=>hcount,
                                                          VCOUNT=>vcount,
                                                          PAINT=>nquinientos,
                                                                          FONDO=>fondoquinientos); 
	Num1024: milveinticuatro
                                                                                          port map(
                                                                                          POSX=>posxn1024,
                                                                                          POSY=>posyn1024,
                                                                                          HCOUNT=>hcount,
                                                                                          VCOUNT=>vcount,
                                                                                          PAINT=>nmil,
                                                                                          FONDO=>fondomil); 
	Num2048: dosmilcuarentayocho
                                                                                                 port map(
                                                                                                 POSX=>posxn2048,
                                                                                                 POSY=>posyn2048,
                                                                                                 HCOUNT=>hcount,
                                                                                                 VCOUNT=>vcount,
                                                                                                 PAINT=>ndosmil,
                                                                                                 FONDO=>fondodosmil); 
	process
	begin
	if((random_number=0 or Random_number=17 or apress="1111") and (paint2='1'or paint3='1'or paint4='1'or paint5='1'or paint6='1'or paint7='1'or paint8='1'or paint9='1'or paint10='1'or paint11='1'))then
	rgb_aux1 <=  "111100000000";
	elsif((paint1='1'or paint101='1'or paint102='1'or paint103='1'or paint104='1'or paint105='1'or paint106='1')and not(random_number=0 or Random_number=17 or apress="1111"))then
    rgb_aux1 <=  "111111101110";
	elsif(ndos='1' and e2='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
	rgb_aux1 <=  W+20;
	elsif(ncuatro='1' and e4='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
        rgb_aux1 <=  W+30;
        elsif(nocho='1'and e8='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
            rgb_aux1 <=  W+40;
            elsif(ndiez='1'and e16='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                rgb_aux1 <=  W+50;
                elsif(ntreinta='1'and e32='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                    rgb_aux1 <=  W+60;
                    elsif(nsesenta ='1'and e64='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                        rgb_aux1 <=  W+70;
                        elsif(ncien='1'and e128='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                            rgb_aux1 <=  W+80;
                            elsif(ndosientos ='1'and e256='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                rgb_aux1 <=  W+90;
                                elsif( nquinientos='1'and e512='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                    rgb_aux1 <=  W+100;
                                    elsif( nmil='1'and e1024='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                    rgb_aux1 <=  W+110;
                                    elsif( ndosmil='1'and e2048='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                    rgb_aux1 <=  W+120;
                                    elsif( fondodos='1'and e2='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                      rgb_aux1 <=  Not(W+20);
                                        elsif( fondocuatro='1'and e4='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                        rgb_aux1 <=  Not(W+30);
                                        elsif( fondoocho='1'and e8='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                          rgb_aux1 <=  Not(W+40);
                                        elsif( fondodiez='1'and e16='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                            rgb_aux1 <=  Not(W+50);
                                        elsif( fondotreinta='1'and e32='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                              rgb_aux1 <=  Not(W+60);
                                        elsif( fondosesenta='1'and e64='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                                rgb_aux1 <=  Not(W+70);
                                        elsif( fondocien='1'and e128='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                                  rgb_aux1 <=  Not(W+80);
                                                    elsif( fondodosientos='1'and e256='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                                    rgb_aux1 <=  Not(W+90);
                                                      elsif( fondoquinientos='1' and e512='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                                      rgb_aux1 <=  Not(W+100);
                                                      elsif( fondomil='1'and e1024='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                                      rgb_aux1 <=  Not(W+110);
                                                      elsif( fondodosmil='1'and e2048='1'and not(random_number=0 or Random_number=17 or apress="1111"))then
                                                      rgb_aux1 <=  Not(W+120);
                                                                                    
	else 
	rgb_aux1 <= "000000000000";
	end if;
	end process;
	
	Inst_vga_ctrl_640x480_60Hz: vga_ctrl_640x480_60Hz PORT MAP(
		rst => '0',
		clk => clk_interno,
		rgb_in => rgb_aux1,
		HS => HS,
		VS => VS,
		hcount => hcount,
		vcount => vcount,
		rgb_out => rgb_aux2,
		blank => open
	);
	
	RGB <= rgb_aux2;
    process (CLK)
        begin  
            if (CLK'event and CLK = '1') then
                clk_interno <= NOT clk_interno;
            end if;
        end process;
	
end Behavioral;

