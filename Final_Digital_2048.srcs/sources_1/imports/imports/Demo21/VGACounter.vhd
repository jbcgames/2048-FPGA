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
                    PAINT : out  STD_LOGIC
                    );
                END COMPONENT;
COMPONENT Cuatro
                        PORT(
                            POSX: in integer;
                            POSY: in integer;
                            HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                            VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                            PAINT : out  STD_LOGIC
                            );
                        END COMPONENT;
COMPONENT Ocho
                                PORT(
                                    POSX: in integer;
                                    POSY: in integer;
                                    HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                                    VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                                    PAINT : out  STD_LOGIC
                                    );
                                END COMPONENT;
COMPONENT diesyseis
                                        PORT(
                                            POSX: in integer;
                                            POSY: in integer;
                                            HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                                            VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                                            PAINT : out  STD_LOGIC
                                            );
                                        END COMPONENT;
COMPONENT treintaydos
                                                PORT(
                                                    POSX: in integer;
                                                    POSY: in integer;
                                                    HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                                                    VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                                                    PAINT : out  STD_LOGIC
                                                    );
                                                END COMPONENT;
COMPONENT Sesentaycuatro
                                                        PORT(
                                                            POSX: in integer;
                                                            POSY: in integer;
                                                            HCOUNT : in  STD_LOGIC_VECTOR (10 downto 0);
                                                            VCOUNT : in  STD_LOGIC_VECTOR (10 downto 0); 
                                                            PAINT : out  STD_LOGIC
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
                PAINT=>ndos); 
    Num4: cuatro
       port map(
       POSX=>100+100,
       POSY=>0+40,
       HCOUNT=>hcount,
       VCOUNT=>vcount,
       PAINT=>ncuatro); 
    Num8: Ocho
              port map(
              POSX=>200+100,
              POSY=>0+40,
              HCOUNT=>hcount,
              VCOUNT=>vcount,
              PAINT=>nocho);
    Num16: diesyseis
                     port map(
                     POSX=>300+100,
                     POSY=>0+40,
                     HCOUNT=>hcount,
                     VCOUNT=>vcount,
                     PAINT=>ndiez);   
    Num32: treintaydos
                             port map(
                             POSX=>0+100,
                             POSY=>0+40+100,
                             HCOUNT=>hcount,
                             VCOUNT=>vcount,
                             PAINT=>ntreinta);   
    Num64: Sesentaycuatro
                                     port map(
                                     POSX=>0+200,
                                     POSY=>0+40+100,
                                     HCOUNT=>hcount,
                                     VCOUNT=>vcount,
                                     PAINT=>nsesenta);                                                                             
	rgb_aux1 <=  "111100110000" when paint1='1' or ndos='1' or ncuatro='1' or nocho='1' or ndiez='1'or ntreinta='1' or nsesenta ='1'
	else not W ;
	
	
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

