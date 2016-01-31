library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity userpctosramtoplevel is
    Port ( 
	 
	 clk : in STD_LOGIC;
	 rstn : in STD_LOGIC;
	  --Ports for the parallel port connections
	 ppdata: in STD_LOGIC_VECTOR(7 downto 0);
	 ppstatus: out STD_LOGIC_VECTOR(6 downto 3);

	 -- Ports for left bank of SRAM
	 lcen : out STD_LOGIC;
	 loen : out STD_LOGIC;
	 lwen : out STD_LOGIC;
	 ldata: inout STD_LOGIC_VECTOR(15 downto 0);
	 laddr: out STD_LOGIC_VECTOR(18 downto 0);

    --Debugging ports
	 bar : out STD_LOGIC_VECTOR(9 downto 2);
	 dip : in STD_LOGIC_VECTOR(7 downto 1)

    );

end userpctosramtoplevel;

architecture Behavioral of userpctosramtoplevel is
	   ---------------------------------------------
	-- ---------------------------------------------
	-- Component declarations:
	-- ---------------------------------------------
	   ---------------------------------------------


		component sraminterfacewithpport 
	    port (
        CLK: in STD_LOGIC;								
        Resetn: in STD_LOGIC;							
        doRead: in STD_LOGIC;							
        doWrite: in STD_LOGIC;							
        readAddr: in STD_LOGIC_VECTOR (18 downto 0);	
        writeAddr: in STD_LOGIC_VECTOR (18 downto 0);	
        readData: out STD_LOGIC_VECTOR (15 downto 0);	
        writeData: in STD_LOGIC_VECTOR (15 downto 0);	
        canRead: out STD_LOGIC;							
        canWrite: out STD_LOGIC;						
        CELeftn: out STD_LOGIC;						
        OELeftn: out STD_LOGIC;						
        WELeftn: out STD_LOGIC;						
        SRAMLeftAddr: out STD_LOGIC_VECTOR (18 downto 0);	
        SRAMLeftData: inout STD_LOGIC_VECTOR (15 downto 0);	
    
		  ppdata : in STD_LOGIC_VECTOR(7 downto 0);	
		  ppstatus : out STD_LOGIC_VECTOR(6 downto 3)

       );
      end component;

		component wrdiptosram 
		    Port ( CLK : in std_logic; 
           RESETN : in std_logic;
			  WRITE : in std_logic;
			  READ: in std_logic;
			  DATAIN : in std_logic_vector(4 downto 0);
           DOREAD : out std_logic;
           DOWRITE : out std_logic;
           READADDR : out std_logic_vector(18 downto 0);
           WRITEADDR : out std_logic_vector(18 downto 0);
           READDATA : in std_logic_vector(15 downto 0);
           WRITEDATA : out std_logic_vector(15 downto 0);
           CANREAD : in std_logic;
           CANWRITE : in std_logic;
			  BARDATA: out std_logic_vector(9 downto 6 );
			  stateOutput: out std_logic_vector(3 downto 0)
			  );
	   end component;

		-- Intermediate signals
			signal sramDoRead: std_logic;
			signal sramDoWrite: std_logic;
			signal sramReadAddr : std_logic_vector(18 downto 0);
			signal sramWriteAddr: std_logic_vector(18 downto 0);
			signal sramReadData: std_logic_vector(15 downto 0);
			signal sramWriteData: std_logic_vector(15 downto 0);
			signal sramCanRead: std_logic;
			signal sramCanWrite: std_logic;



begin
	   ---------------------------------------------
	-- ---------------------------------------------
	-- Component instantiations:
	-- ---------------------------------------------
	   ---------------------------------------------

		user_design: wrdiptosram port map(
		     CLK => clk,
           RESETN => rstn,
			  WRITE => dip(6),
			  READ => dip(7),
			  DATAIN => dip(5 downto 1),
           DOREAD => sramDoRead,
           DOWRITE => sramDoWrite,
           READADDR => sramReadAddr,
           WRITEADDR => sramWriteAddr,
           READDATA => sramReadData,
           WRITEDATA => sramWriteData,
           CANREAD => sramCanRead,
           CANWRITE => sramCanWrite,
			  BARDATA => bar(9 downto 6),
			  stateOutput => bar(5 downto 2)
			  );
	 

	   pctofpgainterface : sraminterfacewithpport port map(

        CLK => clk,
        Resetn => rstn,
        doRead => sramDoRead,
        doWrite => sramDoWrite,
        readAddr => sramReadAddr,
        writeAddr => sramWriteAddr,
        readData => sramReadData,
        writeData => sramWriteData,
        canRead => sramCanRead,
        canWrite => sramCanWrite,
        CELeftn => lcen,
        OELeftn => loen,
        WELeftn => lwen,
        SRAMLeftAddr => laddr,
        SRAMLeftData => ldata,
    
		  ppdata => ppdata,
		  ppstatus => ppstatus
		
       );



end Behavioral;
