library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memorymodule is
    Port ( 
	 --Main Signals
	 		  RdAddr : in std_logic_vector(17 downto 0);
           WrAddr : in std_logic_vector(17 downto 0);
           Din : in std_logic_vector(15 downto 0);
           MemRd : in std_logic;
           MemWr : in std_logic;
           ResetL : in std_logic;
           Dout : out std_logic_vector(15 downto 0);
           RdDone : out std_logic;
           WrDone : out std_logic;

	 --Signals For Given Memory Access Components
			  clk : in STD_LOGIC;
			  ppdata: in STD_LOGIC_VECTOR(7 downto 0);
	 		  ppstatus: out STD_LOGIC_VECTOR(6 downto 3);
			  lcen : out STD_LOGIC;
			  loen : out STD_LOGIC;
			  lwen : out STD_LOGIC;
			  ldata: inout STD_LOGIC_VECTOR(15 downto 0);
			  laddr: out STD_LOGIC_VECTOR(18 downto 0)
			);
end memorymodule;

architecture Behavioral of memorymodule is

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

		component memoryread
		    Port ( 
			  CLK : in std_logic; 
           Reset : in std_logic;
			  IssueRead: in std_logic;
			  DoRead : out std_logic;
           CanRead : in std_logic;
			  ReadDone	:	out std_logic
			  );
	   end component;

		component memorywrite 
			Port(
			 CLK : in std_logic;
			 Reset : in std_logic;
			 IssueWrite : in std_logic;
			 CanWrite : in std_logic;
			 DoWrite : out std_logic;
			 WriteDone : out std_logic
			);
	  	end component;

		-- Intermediate signals
			signal sramDoRead: std_logic;
			signal sramDoWrite: std_logic;
			signal sramCanRead: std_logic;
			signal sramCanWrite: std_logic;

begin
		alureadsram: memoryread port map(
			CLK => clk,
         Reset => ResetL,
			IssueRead => MemRd,
			DoRead => sramDoRead,
         CanRead => sramCanRead,
         ReadDone => RdDone
		);

		aluwritesram:	memorywrite port map(
			CLK => clk,
			Reset => ResetL,
			IssueWrite => MemWr,
			CanWrite => sramCanWrite,
			DoWrite => sramDoWrite,
			WriteDone => WrDone
		);
	 
	   pctofpgainterface : sraminterfacewithpport port map(
      	CLK => clk,
      	Resetn => ResetL,

			doRead => sramDoRead,
      	doWrite => sramDoWrite,
      	canRead => sramCanRead,
      	canWrite => sramCanWrite,

			readData => Dout,
      	writeData => Din,
		  	--Converting 18bits address to 19bits address
      	readAddr(18) => '0',
			readAddr(17 downto 0) => RdAddr,
			writeAddr(18) => '0',
			writeAddr(17 downto 0) => WrAddr,

			CELeftn => lcen,
      	OELeftn => loen,
      	WELeftn => lwen,
      	SRAMLeftAddr => laddr,
      	SRAMLeftData => ldata,
    		ppdata => ppdata,
			ppstatus => ppstatus
     	);

end Behavioral;
