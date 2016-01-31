-------------------------------------------------------------------------------
-- sraminterfacewithpport-sv01.vhd
--
-- Author(s):     James Brennan
-- Created:       24 Jan 2001
-- Last Modified: 29 Jan 2001
-- 
-- Entity: sraminterfacewithpport
--
-- This entity is designed to allow another circuit on board the FPGA
-- to access the SRAM, while also allowing a PC access to the SRAM through
-- the parallel port.
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- To use this interface to the SRAM:
--
-- * This interface is designed to "replace" the usual interface to SRAM.
--   The usual interface to SRAM is an entity entitled "sraminterface".
-- * Wherever your existing circuit includes the sraminterface component,
--   replace such references with references to the entity defined in this
--   file, called "sraminterfacewithpport".
-- 
--	 The sraminterfacewithpport entity in this file is almost identical to the
--   sraminterface entity. The only difference is that it includes two extra
--	 signals:	ppdata and ppstatus.
-- * These two extra signals are designed to be connected to the data and
--   status lines of the parallel port that are made available to the FPGA
--   through the CPLD. Thus these two extra signals must be propagated through
--   your existing VHDL code up to the very top level entity. The signal
--   names ppdata and ppstatus are the same as the signals used in our
--   generic .ucf pin constraints file for the XSV board, called "xsv.ucf".
--   So to summarise this part, the two extra signals ppdata and ppstatus
--   must be connected to the pins of the Virtex FPGA defined for these
--   signals in "xsv.ucf".
-- * Finally, ensure that the necessary files have been added to your
--   design. See the documentation accompanying this file for details.
-------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;

entity sraminterfacewithpport is
    port (
        CLK: in STD_LOGIC;								-- Clock signal.
        Resetn: in STD_LOGIC;							-- Asynchronous reset
        doRead: in STD_LOGIC;							-- Currently unused but may be used in future.							
        doWrite: in STD_LOGIC;							-- Set to perform a write.
        readAddr: in STD_LOGIC_VECTOR (18 downto 0);	-- Address to read from (user-side).
        writeAddr: in STD_LOGIC_VECTOR (18 downto 0);	-- Address to write to (user-side).
        readData: out STD_LOGIC_VECTOR (15 downto 0);	-- Data read (user-side).
        writeData: in STD_LOGIC_VECTOR (15 downto 0);	-- Data to write (user-side).
        canRead: out STD_LOGIC;							-- Is '1' when a read can be performed.							
        canWrite: out STD_LOGIC;						-- Is '1' when a write can be performed.
        CELeftn: out STD_LOGIC;							-- CEn signal to left SRAM bank.
        OELeftn: out STD_LOGIC;							-- OEn signal to left SRAM bank.
        WELeftn: out STD_LOGIC;							-- WEn signal to left SRAM bank.
        SRAMLeftAddr: out STD_LOGIC_VECTOR (18 downto 0);	-- Address bus to left SRAM bank.
        SRAMLeftData: inout STD_LOGIC_VECTOR (15 downto 0);	-- Data bus to left SRAM bank.
    
		ppdata : in STD_LOGIC_VECTOR(7 downto 0);		-- Parallel port data lines (for PC SRAM access).
		ppstatus : out STD_LOGIC_VECTOR(6 downto 3)		-- Parallel port status lines (for PC SRAM acces).

	
    );
end sraminterfacewithpport;

architecture sraminterfacewithpport_arch of sraminterfacewithpport is

	-- ========================================
	-- Architechture declarations:
	-- ========================================	

	-- ========================================	
	-- Component declarations:
	-- ========================================	

	component pctosraminterface
	    port (
	        CLK: in STD_LOGIC;
	        Resetn : in STD_LOGIC;
	        Write: in STD_LOGIC;
	        Read: in STD_LOGIC;
	        NextSlice: in STD_LOGIC;
	        DataIn: in STD_LOGIC_VECTOR (4 downto 0);
	        DataOut: out STD_LOGIC_VECTOR (3 downto 0);
	        doSRAMWrite: out STD_LOGIC;
	        doSRAMRead: out STD_LOGIC;
	        canWrite: in STD_LOGIC;
	        canRead: in STD_LOGIC;
	        writeAddr: out STD_LOGIC_VECTOR (18 downto 0);
	        writeData: out STD_LOGIC_VECTOR (15 downto 0);
	        readAddr: out STD_LOGIC_VECTOR (18 downto 0);
	        readData: in STD_LOGIC_VECTOR (15 downto 0);
	
	--		Ports used when embedding this interface in
	--		a user design:
			active : out STD_LOGIC;
	
	--		Ports we expose for debugging purposes:
	--		It was originally intended that these ports would be
	--		removed, but it has been more convenient to leave them in:
	    	portInSliceNum : out STD_LOGIC_VECTOR(1 downto 0);
	    	portOutSliceNum : out STD_LOGIC_VECTOR(1 downto 0);
	    	stateOutput : out STD_LOGIC_VECTOR(3 downto 0)
	    );
	end component;
	
	component memorymultiplexor
	    port (
			CLK: in STD_LOGIC;
			Resetn: in STD_LOGIC;
			pcInterfaceActive: in STD_LOGIC;
	        memWriteAddr: out STD_LOGIC_VECTOR (18 downto 0);
	        memWriteData: out STD_LOGIC_VECTOR (15 downto 0);
	        memReadAddr: out STD_LOGIC_VECTOR (18 downto 0);
	        memReadData: in STD_LOGIC_VECTOR (15 downto 0);
	        memDoWrite: out STD_LOGIC;
	        memDoRead: out STD_LOGIC;
	        memCanWrite: in STD_LOGIC;
	        memCanRead: in STD_LOGIC;
	        visibleWriteAddr: in STD_LOGIC_VECTOR (18 downto 0);
	        visibleWriteData: in STD_LOGIC_VECTOR (15 downto 0);
	        visibleReadAddr: in STD_LOGIC_VECTOR (18 downto 0);
	        visibleReadData: out STD_LOGIC_VECTOR (15 downto 0);
	        visibleDoWrite: in STD_LOGIC;
	        visibleDoRead: in STD_LOGIC;
	        visibleCanWrite: out STD_LOGIC;
	        visibleCanRead: out STD_LOGIC;
	        pcWriteAddr: in STD_LOGIC_VECTOR (18 downto 0);
	        pcWriteData: in STD_LOGIC_VECTOR (15 downto 0);
	        pcReadAddr: in STD_LOGIC_VECTOR (18 downto 0);
	        pcReadData: out STD_LOGIC_VECTOR (15 downto 0);
	        pcDoWrite: in STD_LOGIC;
	        pcDoRead: in STD_LOGIC;
	        pcCanWrite: out STD_LOGIC;
	        pcCanRead: out STD_LOGIC
	    );
	end component;

	component sraminterface
	    port (
	        CLK: in STD_LOGIC;								-- Clock signal.
	        Resetn: in STD_LOGIC;							-- Asynchronous reset
	        doRead: in STD_LOGIC;							-- Currently unused but may be used in future.							
	        doWrite: in STD_LOGIC;							-- Set to perform a write.
	        readAddr: in STD_LOGIC_VECTOR (18 downto 0);	-- Address to read from (user-side).
	        writeAddr: in STD_LOGIC_VECTOR (18 downto 0);	-- Address to write to (user-side).
	        readData: out STD_LOGIC_VECTOR (15 downto 0);	-- Data read (user-side).
	        writeData: in STD_LOGIC_VECTOR (15 downto 0);	-- Data to write (user-side).
	        canRead: out STD_LOGIC;							-- Is '1' when a read can be performed.							
	        canWrite: out STD_LOGIC;						-- Is '1' when a write can be performed.
	        CELeftn: out STD_LOGIC;							-- CEn signal to left SRAM bank.
	        OELeftn: out STD_LOGIC;							-- OEn signal to left SRAM bank.
	        WELeftn: out STD_LOGIC;							-- WEn signal to left SRAM bank.
	        SRAMLeftAddr: out STD_LOGIC_VECTOR (18 downto 0);	-- Address bus to left SRAM bank.
	        SRAMLeftData: inout STD_LOGIC_VECTOR (15 downto 0)	-- Data bus to left SRAM bank.
	    );
	end component;


	signal pcInterfaceActive : STD_LOGIC;

	signal memWriteAddr : STD_LOGIC_VECTOR (18 downto 0);
	signal memWriteData : STD_LOGIC_VECTOR (15 downto 0);
	signal memReadAddr : STD_LOGIC_VECTOR (18 downto 0);
	signal memReadData : STD_LOGIC_VECTOR (15 downto 0);
	signal memDoWrite : STD_LOGIC;
	signal memDoRead : STD_LOGIC;
	signal memCanWrite : STD_LOGIC;
	signal memCanRead : STD_LOGIC;
	
	signal pcWriteAddr : STD_LOGIC_VECTOR (18 downto 0);
	signal pcWriteData : STD_LOGIC_VECTOR (15 downto 0);
	signal pcReadAddr : STD_LOGIC_VECTOR (18 downto 0);
	signal pcReadData : STD_LOGIC_VECTOR (15 downto 0);
	signal pcDoWrite : STD_LOGIC;
	signal pcDoRead : STD_LOGIC;
	signal pcCanWrite : STD_LOGIC;
	signal pcCanRead : STD_LOGIC;
begin
	-- ========================================
	-- Architecture body:
	-- ========================================

	-- ========================================	
	-- Component instantiations:
	-- ========================================	

	pportinterface : pctosraminterface port map (
        CLK => CLK,
        Resetn => Resetn,
        Write => ppdata(5),
        Read => ppdata(6),
        NextSlice => ppdata(7),
        DataIn => ppdata(4 downto 0),
        DataOut => ppstatus(6 downto 3),
        doSRAMWrite => pcDoWrite,
        doSRAMRead => pcDoRead,
        canWrite => pcCanWrite,
        canRead => pcCanRead,
        writeAddr => pcWriteAddr,
        writeData => pcWriteData,
        readAddr => pcReadAddr,
        readData => pcReadData,

		active => pcInterfaceActive,

		-- We don't use these debugging ports as we
		-- are embedding the PC-to-SRAM interface:
    	portInSliceNum => open,
    	portOutSliceNum => open,
    	stateOutput => open
    );

	theMemMultiplexor : memorymultiplexor port map (
		CLK => CLK,
		Resetn => Resetn,
		pcInterfaceActive => pcInterfaceActive,
        memWriteAddr => memWriteAddr,
        memWriteData => memWriteData,
        memReadAddr => memReadAddr,
        memReadData => memReadData,
        memDoWrite => memDoWrite,
        memDoRead => memDoRead,
        memCanWrite => memCanWrite,
        memCanRead => memCanRead,
        visibleWriteAddr => writeAddr,
        visibleWriteData => writeData,
        visibleReadAddr => readAddr,
        visibleReadData => readData,
        visibleDoWrite => doWrite,
        visibleDoRead => doRead,
        visibleCanWrite => canWrite, 
        visibleCanRead => canRead,
        pcWriteAddr => pcWriteAddr,
        pcWriteData => pcWriteData,
        pcReadAddr => pcReadAddr,
        pcReadData => pcReadData,
        pcDoWrite => pcDoWrite,
        pcDoRead => pcDoRead,
        pcCanWrite => pcCanWrite,
        pcCanRead => pcCanRead
    );

	fpgatosraminterface : sraminterface port map (
        CLK => CLK,
        Resetn => Resetn,
        doRead => memDoRead,
        doWrite => memDoWrite,
        readAddr =>memReadAddr,
        writeAddr => memWriteAddr,
        readData => memReadData,
        writeData => memWriteData,
        canRead => memCanRead,
        canWrite => memCanWrite,
        CELeftn => CELeftn,
        OELeftn => OELeftn,
        WELeftn => WELeftn,
        SRAMLeftAddr => SRAMLeftAddr,
        SRAMLeftData => SRAMLeftData
    );

end sraminterfacewithpport_arch;

-- ---------------------------------
-- Major features/changes:
-- ---------------------------------


