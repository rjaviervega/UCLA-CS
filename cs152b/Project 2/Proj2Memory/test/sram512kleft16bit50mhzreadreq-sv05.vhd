-------------------------------------------------------------------------------
-- sram512kleft16bit50mhzreadreq-sv05.vhd
--
-- Author(s):     James Brennan
-- Created:       15 Feb 2001
-- Last Modified: 16 Feb 2001
-- 
-- Entity: sraminterface
--
-- * Provides a simple interface to the SRAM on an XSV Board, v1.0
-- * 512k address space (512 * 1024 addressable locations, meaning
--   that addresses are 19 bits wide).
-- * 16 bit data (each location holds 16 bits). 
-- * Only uses left-bank of SRAM. (Technically you could connect this entity
--   to either bank of SRAM in your top-level file. The data and address
--   lines have simply been named assuming that the entity will be connected
--   to the left bank of SRAM).
--
-- * Writes are performed in 2 clock cycles. Reads are performed in 2 clock
--   cycles.
--
-- * Read data is NOT registered internally. It must be registered externally.
-------------------------------------------------------------------------------

-- ---------------------------------
-- Clock:
-- 50Mhz or slower required.
-- Must have a 50% duty cycle.
-- ---------------------------------

-- The two signals canRead and canWrite are are high when new requests
-- for reads and writes respectively can be made. 

-- Writes and reads can be performed in any order and can be
-- interspersed in any way.

-- To perform a write:
-- *	Place the write address on writeAddr and the write data on 
--		writeData.
-- *	Wait until canWrite is '1'. Then assert doWrite (set to '1').
--		You can assert doWrite on the same clock cycle that canWrite
--		is high. Asserting doWrite is also called making a
--		"write request".
-- *	The sraminterface will see doWrite is '1' on the next rising
--		clock edge and on the same edge will register (i.e. place in
--		registers) writeAddr and writeData. The write will take place
--		in the 2 cycles after this first edge and will be completed at
--		the third rising clock edge after doWrite is asserted.
-- To perform a read:
-- *	Place the read address on readAddr.
-- *	Wait until canRead is '1'. Then assert doRead (set to '1').
--		You can assert doRead on the same clock cycle that canRead
--		is high. Asserting doRead is also called making a
--		"read request".
-- *	The sraminterface will see doRead is '1' on the next rising
--		clock edge and on the same edge will register (i.e. place in
--		registers) the value on readAddr. The read will take place
--		over two clock cycles. In the first cycle, canRead (and
--		canWrite will be low. In the second cycle, canRead (and
--		canWrite) will be high. This indicates both that the
--		readData will be valid at the end of this cycle	and that the
--		sraminterface can at this point handle another read or write
--		request.
-- *	At the end of the clock cycle in which canRead goes high
--		again, the user of the sraminterface must register the value
--		on readData. This value must be registered, as on the next
--		clock cycle it is not guaranteed to be the same and may
--		instead change.

library IEEE;
use IEEE.std_logic_1164.all;

entity sraminterface is
    port (
        CLK: in STD_LOGIC;								-- Clock signal.
        Resetn: in STD_LOGIC;							-- Asynchronous reset
        doRead: in STD_LOGIC;							-- Set this to make a read request.							
        doWrite: in STD_LOGIC;							-- Set this to make a write request.
        readAddr: in STD_LOGIC_VECTOR (18 downto 0);	-- Address to read from (user-side).
        writeAddr: in STD_LOGIC_VECTOR (18 downto 0);	-- Address to write to (user-side).
        readData: out STD_LOGIC_VECTOR (15 downto 0);	-- Data read (user-side).
        writeData: in STD_LOGIC_VECTOR (15 downto 0);	-- Data to write (user-side).
        canRead: out STD_LOGIC;							-- Is '1' when a read request can be handled.							
        canWrite: out STD_LOGIC;						-- Is '1' when a write request can be handled.
        CELeftn: out STD_LOGIC;							-- CEn signal to left SRAM bank.
        OELeftn: out STD_LOGIC;							-- OEn signal to left SRAM bank.
        WELeftn: out STD_LOGIC;							-- WEn signal to left SRAM bank.
        SRAMLeftAddr: out STD_LOGIC_VECTOR (18 downto 0);	-- Address bus to left SRAM bank.
        SRAMLeftData: inout STD_LOGIC_VECTOR (15 downto 0)	-- Data bus to left SRAM bank.
    );
end sraminterface;

architecture sraminterface_arch of sraminterface is

	-- ========================================
	-- Architechture declarations:
	-- ========================================	

	-- Constants:

	-- General enabled/disabled constants:
	constant CONST_ENABLED : STD_LOGIC := '1';
	constant CONST_DISABLED : STD_LOGIC := '0';
	
	-- Signals for registers:
	signal addrReg : STD_LOGIC_VECTOR(18 downto 0);
	signal writeDataReg : STD_LOGIC_VECTOR(15 downto 0);
	
	-- Clock-enable controls for the registers:
	signal regWriteAddr : STD_LOGIC;
	signal regReadAddr : STD_LOGIC;
	signal regWriteData : STD_LOGIC;
	
	-- Internal values of SRAM control signals:
	signal CEn : STD_LOGIC;
	signal OEn : STD_LOGIC;
	signal WEn : STD_LOGIC;

	-- Flip-flop signals for signalling when we are
	-- in the "write" states (these are effectively
	-- duplicating some of the presState signal to
	-- try and improve the timing of the circuit):
	signal doingWrite1 : STD_LOGIC;
	signal doingWrite2 : STD_LOGIC;

	-- Other control signals for the data path:
	signal enableWriteData : STD_LOGIC;

	-- 16-bit data bus:
	-- We are only using the left-hand side SRAM bank.
	signal SRAMData : STD_LOGIC_VECTOR(15 downto 0);
		
	-- Signals for latched-mealy outputs:
	signal nextOEn: STD_LOGIC;
	signal nextWEn: STD_LOGIC;
	signal nextDoingWrite1 : STD_LOGIC;
	signal nextDoingWrite2 : STD_LOGIC;
	
	-- Declarations required for the controller FSM.
	type STATE_TYPE is (stIdle, stWrite1, stWrite2,
			stRead1, stRead2);
	signal presState, nextState: STATE_TYPE;
	
begin
	-- ========================================
	-- Architecture body:
	-- ========================================

	-- ========================================
	-- Combinational signals
	-- ========================================

	-- Control signals:
	CELeftn <= CEn;
	OELeftn <= OEn;
	WELeftn <= WEn;

	-- SRAM address bus:
	SRAMLeftAddr <= addrReg;
	
	-- SRAM data bus:
	SRAMLeftData <= SRAMData;

	readData <= SRAMData;
	
	-- ========================================
	-- Implementation of specific structures	
	-- ========================================
	
	-- 3-state buffer placed after the writeDataReg register
	-- in the data path:
	process(writeDataReg, doingWrite1, doingWrite2, CLK)
	begin
		-- We drive the SRAM data I/O bus with data to be written
		-- ONLY at the following times:
		--		* For the 2nd half of write cycle 1
		--	and * For the entirety of write cycle 2
		--
		-- To do this we rely on the fact that CLK = '1' for the
		-- first half of a clock cycle and CLK = '0' for the
		-- second half of a cycle.
		-- The reason for the dependancy on CLK is as follows:
		-- At the start of the clock cycle in which we are
		-- performing a write, we raise OEn. This is to make the
		-- SRAM stop driving its bidirectional data lines and
		-- instead make its drivers high impedance. We wait half a
		-- clock cycle for the SRAM's data line drivers to go high
		-- impedance, and THEN we ourselves drive the SRAM's
		-- bidirectional data lines with the data that we wish to
		-- be written.
		if	(doingWrite1 = '1' and CLK = '0') or
			(doingWrite2 = '1') then
			SRAMData <= writeDataReg;
		else
			SRAMData <= (others => 'Z');
		end if;
	end process;

	-- Process for WEn signal:
	-- This process has been placed here simply because it is similar
	-- to the 3-state buffer on the write data output above. However
	-- we do NOT use a 3-state buffer for WEn.
	process(doingWrite1, doingWrite2, CLK)
	begin
		if	(doingWrite1 = '1' and CLK = '0') or
			(doingWrite2 = '1' and CLK = '1') then
			WEn <= '0';
		else
			WEn <= '1';
		end if;
	end process;
	

	
	-- ========================================
	-- Process for reset and clock-edge events
	-- ========================================
	process(CLK, Resetn)
	begin
		if Resetn = '0' then
			-- Default values of signals that are NOT
			-- controlled by the FSM controller:
			presState <= stIdle;
	
			CEn <= '1';
			OEn <= '0';

			doingWrite1 <= '0';
			doingWrite2 <= '0';

			addrReg <= (others => '0');
			writeDataReg <= (others => '0');
					
		elsif CLK'EVENT and CLK = '1' then
			CEn <= '0';
			
			-- Handle the clock-enabling of each register:
			if regReadAddr = '1' then
				addrReg <= readAddr;
			elsif regWriteAddr = '1' then
				addrReg <= writeAddr;
			end if;

			if regWriteData = '1' then
				writeDataReg <= writeData;
			end if;

			-- Update latched-mealy outputs:
			OEn <= nextOEn;
			doingWrite1 <= nextDoingWrite1;
			doingWrite2 <= nextDoingWrite2;
					
			-- Update current state for controller FSM:
			presState <= nextState;
		end if;
	end process;

	
	-- ========================================
	-- Process for FSM of controller
	-- ========================================
	process(presState, doRead, doWrite)
	begin
		-- Set the defaults for all the signals this FSM
		-- controls:
		nextOEn <= '0';
		nextDoingWrite1 <= '0';
		nextDoingWrite2 <= '0';

		regWriteAddr <= '0';
		regWriteData <= '0';
		regReadAddr <= '0';
		
		canRead <= '1';
		canWrite <= '1';

		case presState is
			when stIdle =>
				nextState <= stIdle;
				 
				if doWrite = '1' then
					nextState <= stWrite1;
		
					regWriteAddr <= '1';
					regWriteData <= '1';					

					nextOEn <= '1';
					nextDoingWrite1 <= '1';
					nextDoingWrite2 <= '0';
				elsif doRead = '1' then
					nextState <= stRead1;
					
					regReadAddr <= '1';
				end if;

			when stWrite1 =>
				nextState <= stWrite2;
				
				nextOEn <= '1';
				nextDoingWrite1 <= '0';
				nextDoingWrite2 <= '1';
				
				canRead <= '0';
				canWrite <= '0';
			when stWrite2 =>
				nextState <= stIdle;

				nextOEn <= '0';
				nextDoingWrite1 <= '0';
				nextDoingWrite2 <= '0';
				
				canRead <= '1';
				canWrite <= '1';	

				if doWrite = '1' then
					nextState <= stWrite1;
		
					regWriteAddr <= '1';
					regWriteData <= '1';					

					nextOEn <= '1';
					nextDoingWrite1 <= '1';
					nextDoingWrite2 <= '0';
				elsif doRead = '1' then
					nextState <= stRead1;
					
					regReadAddr <= '1';
				end if;

			when stRead1 =>
				nextState <= stRead2;
				
				canWrite <= '0';
				canRead <= '0';

			when stRead2 =>
				nextState <= stIdle;				

				canWrite <= '1';
				canRead <= '1';

				if doWrite = '1' then
					nextState <= stWrite1;
		
					regWriteAddr <= '1';
					regWriteData <= '1';					

					nextOEn <= '1';
					nextDoingWrite1 <= '1';
					nextDoingWrite2 <= '0';
				elsif doRead = '1' then
					nextState <= stRead1;
					
					regReadAddr <= '1';
				end if;
			
				-- readAddrReg already contains the read address and
				-- is the default connection for the SRAM address bus.
				-- Therefore all the user needs to do is register the SRAM
				-- data bus at the end of this clock cycle.
				
		end case;
	end process;

end sraminterface_arch;

-- ---------------------------------
-- Major features/changes:
-- ---------------------------------
-- (15/02/2001) sram512kleft16bit50mhzreadreq-sv05 created
-- from sv04. This version works successfully again.
-- It uses a 2 clock cycle write and a 2 clock cycle read.
-- Note we also have tried to improve the logic that
-- handles generating the value for WEn. We have created
-- two signals (doingWrite1 and doingWrite2) as part of
-- this effort to improve timing. They are basically
-- duplicates of some of the bits of presState. The path
-- from presState to the WEn pad was very long, so this
-- duplication of logic is aimed to shorten that path.
-- The .ucf file we are using is:
-- "Y pport, Y debug, Y timing, Y IOB outputs, N input delay, Y fast slew.ucf"
-- (09/02/2001) sram512kleft16bit50mhzreadreq-sv04 created
-- from sv03. An experimental version with *many* cycles
-- for reads and writes.
-- (06/02/2001) We removed the multiplexor on the readData
-- output port as well.
-- (06/02/1001) Address multiplexer placed before
-- address register, instead of having two address registers
-- and a multiplexor placed between them and the SRAM ports.
-- (05/02/2001) sram512kleft16bit50mhzreadreq-sv02 created
-- from sv02. An experimental version.
-- 3 cycle read introduced. Still using a 2 cycle write.
-- (29/01/2001) sram512kleft16bit50mhzreadreq-sv02 created
-- from sv01b. A read now takes two clock cycles.
-- Also, we have reverted to NOT registering the read data
-- internally. Therefore the read data must be registered
-- externally at the end of the 2nd clock cycle of the read
-- process.
-- (24/01/2001) sram512kleft16bit50mhzreadreq-sv01b created
-- from sram512kleft16bit50mhz-sv01b.
-- To perform a read, a read "request" must now be given using
-- the doRead signal, just as a write request is made using the
-- doWrite signal. In this version of the SRAM interface, the
-- read data is also registered internally. Thus the read data
-- no longer needs to be registered externally.
-- (17/01/2001) File created by copying
-- "sram512kleft16bit50mhz-sv01.vhd" and modifying it.
-- The write process was changed to take 2 clock cycles
-- instead of 1, while the read process still takes
-- only 1 clock cycle.
