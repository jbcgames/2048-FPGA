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
           RST : in  STD_LOGIC;
           W: in std_logic_vector(11 downto 0);
           PBTON : in  STD_LOGIC;
           TecladoData: in Std_logic;
           led: out std_logic_vector(6 downto 0);
           IndicadorSalida: out std_logic;
           Indicadorestado:out std_logic_vector (1 downto 0);
           TecladoClk: in std_logic;
           HS : out  STD_LOGIC;
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
	signal numero1: integer:=0;
	signal numero2: integer:=0;
	signal numero3: integer:=0;
	signal numero4: integer:=0;
	signal numero5: integer:=0;
	signal numero6: integer:=0;
	signal numero7: integer:=0;
	signal numero8: integer:=0;
	signal numero9: integer:=0;
	signal numero10: integer:=0;
	signal numero11: integer:=0;
	signal numero12: integer:=0;
	Signal ndos: std_logic:='0';
	Signal fondodos: std_logic:='0';
	Signal fondocuatro: std_logic:='0';
	Signal fondoocho: std_logic:='0';
	Signal fondodiez: std_logic:='0';
	Signal fondotreinta: std_logic:='0';
	Signal fondosesenta: std_logic:='0';
	Signal fondocien: std_logic:='0';
	Signal fondodosientos: std_logic:='0';
	Signal fondoquinientos: std_logic:='0';
	Signal fondomil: std_logic:='0';
	Signal fondodosmil: std_logic:='0';
	Signal ncuatro: std_logic:='0';
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
	
begin
    
    tecladocl<=Tecladoclk;
        tecladoda<=TecladoData;
        IndicadorSalida<=indicador;
        directo<=clk;
        led<=TecladoSalida;
    
	Teclado: ps2_keyboard_to_ascii
	port map(
	clk=> directo,                 
    ps2_clk=>Tecladocl,             
    ps2_data=>Tecladoda,
    ascii_code=>TecladoSalida,
    ascii_new=>Indicador);
    Principal: Panel
        port map(
        POSX=>0,
        POSY=>0,
        HCOUNT=>hcount,
        VCOUNT=>vcount,
        PAINT=>paint1);  
    Num2: dos
                port map(
                POSX=>0+100,
                POSY=>0+40,
                HCOUNT=>hcount,
                VCOUNT=>vcount,
                PAINT=>ndos,
                FONDO=>fondodos); 
    Num4: cuatro
       port map(
       POSX=>100+100,
       POSY=>0+40,
       HCOUNT=>hcount,
       VCOUNT=>vcount,
       PAINT=>ncuatro,
                       FONDO=>fondocuatro); 
    Num8: Ocho
              port map(
              POSX=>200+100,
              POSY=>0+40,
              HCOUNT=>hcount,
              VCOUNT=>vcount,
              PAINT=>nocho,
                              FONDO=>fondoocho);
    Num16: diesyseis
                     port map(
                     POSX=>300+100,
                     POSY=>0+40,
                     HCOUNT=>hcount,
                     VCOUNT=>vcount,
                     PAINT=>ndiez,
                                     FONDO=>fondodiez);   
    Num32: treintaydos
                             port map(
                             POSX=>0+100,
                             POSY=>0+40+100,
                             HCOUNT=>hcount,
                             VCOUNT=>vcount,
                             PAINT=>ntreinta,
                                             FONDO=>fondotreinta);   
    Num64: Sesentaycuatro
                                     port map(
                                     POSX=>100+100,
                                     POSY=>0+40+100,
                                     HCOUNT=>hcount,
                                     VCOUNT=>vcount,
                                     PAINT=>nsesenta,
                                                     FONDO=>fondosesenta);                                                                             
	Num128: Cientoveintiocho
                                            port map(
                                            POSX=>200+100,
                                            POSY=>0+40+100,
                                            HCOUNT=>hcount,
                                            VCOUNT=>vcount,
                                            PAINT=>ncien,
                                                            FONDO=>fondocien); 
	Num256: doscientoscincuentayseis
                                                   port map(
                                                   POSX=>300+100,
                                                   POSY=>0+40+100,
                                                   HCOUNT=>hcount,
                                                   VCOUNT=>vcount,
                                                   PAINT=>ndosientos,
                                                                   FONDO=>fondodosientos); 
	Num512: quinientosdoce
                                                          port map(
                                                          POSX=>0+100,
                                                          POSY=>0+40+200,
                                                          HCOUNT=>hcount,
                                                          VCOUNT=>vcount,
                                                          PAINT=>nquinientos,
                                                                          FONDO=>fondoquinientos); 
	Num1024: milveinticuatro
                                                                                          port map(
                                                                                          POSX=>0+200,
                                                                                          POSY=>0+40+200,
                                                                                          HCOUNT=>hcount,
                                                                                          VCOUNT=>vcount,
                                                                                          PAINT=>nmil,
                                                                                          FONDO=>fondomil); 
	Num2048: dosmilcuarentayocho
                                                                                                 port map(
                                                                                                 POSX=>0+300,
                                                                                                 POSY=>0+40+200,
                                                                                                 HCOUNT=>hcount,
                                                                                                 VCOUNT=>vcount,
                                                                                                 PAINT=>ndosmil,
                                                                                                 FONDO=>fondodosmil); 
	process
	begin
	if(paint1='1')then
	rgb_aux1 <=  "111111101110";
	elsif(ndos='1')then
	rgb_aux1 <=  W+20;
	elsif(ncuatro='1')then
        rgb_aux1 <=  W+30;
        elsif(nocho='1')then
            rgb_aux1 <=  W+40;
            elsif(ndiez='1')then
                rgb_aux1 <=  W+50;
                elsif(ntreinta='1')then
                    rgb_aux1 <=  W+60;
                    elsif(nsesenta ='1')then
                        rgb_aux1 <=  W+70;
                        elsif(ncien='1')then
                            rgb_aux1 <=  W+80;
                            elsif(ndosientos ='1')then
                                rgb_aux1 <=  W+90;
                                elsif( nquinientos='1')then
                                    rgb_aux1 <=  W+100;
                                    elsif( nmil='1')then
                                    rgb_aux1 <=  W+110;
                                    elsif( ndosmil='1')then
                                    rgb_aux1 <=  W+120;
                                    elsif( fondodos='1')then
                                      rgb_aux1 <=  Not(W+20);
                                        elsif( fondocuatro='1')then
                                        rgb_aux1 <=  Not(W+30);
                                        elsif( fondoocho='1')then
                                          rgb_aux1 <=  Not(W+40);
                                        elsif( fondodiez='1')then
                                            rgb_aux1 <=  Not(W+50);
                                        elsif( fondotreinta='1')then
                                              rgb_aux1 <=  Not(W+60);
                                        elsif( fondosesenta='1')then
                                                rgb_aux1 <=  Not(W+70);
                                        elsif( fondocien='1')then
                                                  rgb_aux1 <=  Not(W+80);
                                                    elsif( fondodosientos='1')then
                                                    rgb_aux1 <=  Not(W+90);
                                                      elsif( fondoquinientos='1')then
                                                      rgb_aux1 <=  Not(W+100);
                                                      elsif( fondomil='1')then
                                                      rgb_aux1 <=  Not(W+110);
                                                      elsif( fondodosmil='1')then
                                                      rgb_aux1 <=  Not(W+120);
                                                                                    
	else 
	rgb_aux1 <= "000000000000";
	end if;
	end process;
	
	Inst_vga_ctrl_640x480_60Hz: vga_ctrl_640x480_60Hz PORT MAP(
		rst => RST,
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

