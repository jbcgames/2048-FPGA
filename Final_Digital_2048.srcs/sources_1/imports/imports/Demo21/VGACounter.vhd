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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;


entity VGACounter is
    Port ( CLK : in  STD_LOGIC;
           BUP: in  STD_LOGIC;
           W: in std_logic_vector(11 downto 0);
           BDW : in  STD_LOGIC;
           BLF: in  STD_LOGIC;
           BRG: in  STD_LOGIC;
           TecladoData: in Std_logic;
           TecladoClk: in std_logic;
           HS : out  STD_LOGIC;
           press: out std_logic_vector(3 downto 0):="0000";
           VS : out  STD_LOGIC;
           RGB : out  STD_LOGIC_VECTOR (11 downto 0));
			  
end VGACounter;

architecture Behavioral of VGACounter is

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
    
    Component Display Port (  
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
	signal conteo : integer:=320;
	signal puntaje: integer:=0;
	Signal sumado: std_logic:='0';
	Signal paint1: std_logic:='0';
	signal n1: integer:=0;
	signal n2: integer:=0;
	signal n3: integer:=0;
	signal n4: integer:=0;
	signal n5: integer:=0;
	signal n6: integer:=0;
	signal n7: integer:=0;
	signal n8: integer:=0;
	signal n9: integer:=0;
	signal n10: integer:=0;
	signal n11: integer:=0;
	signal n12: integer:=2;
	signal n13: integer:=0;
	signal n14: integer:=0;
	signal n15: integer:=0;
	signal n16: integer:=0;
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
	Signal ndos: std_logic:='0';
	Signal fondodos: std_logic:='0';
	Signal fondocuatro: std_logic:='0';
	Signal fondoocho: std_logic:='0';
	Signal fondodiez: std_logic:='0';
	TYPE Button_Press IS(Up, Down, Left, Right, Ready);
	Signal Presionado: Button_Press;
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
	Signal YPlay:integer:=0;
	Signal paintnumero: std_logic:='0';
	--n1  n2  n3  n4
	--n5  n6  n7  n8
	--n9  n10 n11 n12
	--n13 n14 n15 n16
begin
    
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
            posxn4<=100;
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
    if(BUP='1')then
    Presionado<=Up;
    elsif(BDW='1')then
    Presionado<=Down;
    elsif(BLF='1')then
    Presionado<=Right;
    elsif(BRG='1')then
    Presionado<=Left;
    else
    press<="0000";
    Presionado<=Ready;
    end if;

    --n1  n2  n3  n4
    --n5  n6  n7  n8
    --n9  n10 n11 n12
    --n13 n14 n15 n16
    When Up=>
    press<="0001";
    
         if(clk_count=50000000)then
         clk_count<=0;
         Presionado<=Ready;
         else 
         clk_count<=clk_count+1;
         Presionado<=Up;
         end if;

    
    When Down=>
     press<="0010";

             if(clk_count=1)then
             if(n12 = n16)then
             n16<=n16+n16;
             elsif(n16=0)then
             n16<=n12;
             n12<=0;
             else
             n12<=n12;
             end if;
             end if;
             if(clk_count=50000000)then
             clk_count<=0;
             Presionado<=Ready;
             else 
             clk_count<=clk_count+1;
             Presionado<=Down;
             end if;

    When Right=>
    press<="0100";

             
             if(clk_count=50000000)then
             clk_count<=0;
             Presionado<=Ready;
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
    press<="1000";

             
             if(clk_count=50000000)then
             clk_count<=0;
             Presionado<=Ready;
             else 
             clk_count<=clk_count+1;
             Presionado<=Left;
             end if;
 
    end case;
    end if;
    end process;

    Principal: Panel
        port map(
        POSX=>0,
        POSY=>0,
        HCOUNT=>hcount,
        VCOUNT=>vcount,
        PAINT=>paint1);  
    Num2: dos
                port map(
                POSX=>posxn2,
                POSY=>posyn2,
                HCOUNT=>hcount,
                VCOUNT=>vcount,
                PAINT=>ndos,
                FONDO=>fondodos); 
    Num4: cuatro
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
	if(paint1='1')then
	rgb_aux1 <=  "111111101110";
	elsif(ndos='1' and e2='1')then
	rgb_aux1 <=  W+20;
	elsif(ncuatro='1' and e4='1')then
        rgb_aux1 <=  W+30;
        elsif(nocho='1'and e8='1')then
            rgb_aux1 <=  W+40;
            elsif(ndiez='1'and e16='1')then
                rgb_aux1 <=  W+50;
                elsif(ntreinta='1'and e32='1')then
                    rgb_aux1 <=  W+60;
                    elsif(nsesenta ='1'and e64='1')then
                        rgb_aux1 <=  W+70;
                        elsif(ncien='1'and e128='1')then
                            rgb_aux1 <=  W+80;
                            elsif(ndosientos ='1'and e256='1')then
                                rgb_aux1 <=  W+90;
                                elsif( nquinientos='1'and e512='1')then
                                    rgb_aux1 <=  W+100;
                                    elsif( nmil='1'and e1024='1')then
                                    rgb_aux1 <=  W+110;
                                    elsif( ndosmil='1'and e2048='1')then
                                    rgb_aux1 <=  W+120;
                                    elsif( fondodos='1'and e2='1')then
                                      rgb_aux1 <=  Not(W+20);
                                        elsif( fondocuatro='1'and e4='1')then
                                        rgb_aux1 <=  Not(W+30);
                                        elsif( fondoocho='1'and e8='1')then
                                          rgb_aux1 <=  Not(W+40);
                                        elsif( fondodiez='1'and e16='1')then
                                            rgb_aux1 <=  Not(W+50);
                                        elsif( fondotreinta='1'and e32='1')then
                                              rgb_aux1 <=  Not(W+60);
                                        elsif( fondosesenta='1'and e64='1')then
                                                rgb_aux1 <=  Not(W+70);
                                        elsif( fondocien='1'and e128='1')then
                                                  rgb_aux1 <=  Not(W+80);
                                                    elsif( fondodosientos='1'and e256='1')then
                                                    rgb_aux1 <=  Not(W+90);
                                                      elsif( fondoquinientos='1' and e512='1')then
                                                      rgb_aux1 <=  Not(W+100);
                                                      elsif( fondomil='1'and e1024='1')then
                                                      rgb_aux1 <=  Not(W+110);
                                                      elsif( fondodosmil='1'and e2048='1')then
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

