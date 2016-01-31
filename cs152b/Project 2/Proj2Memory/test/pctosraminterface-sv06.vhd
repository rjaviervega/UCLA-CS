-------------------------------------------------------------------------------
-- pctosraminterface-sv06.vhd
--
-- Author(s):     James Brennan
-- Created:       15 Feb 2001
-- Last Modified: 15 Feb 2001
-- 
-- Provides an interface to the SRAM controller that allows the PC to read
-- and write to the SRAM via the parallel port.
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity pctosraminterface is
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

		-- Ports used when embedding this interface in
		-- a user design:
		active : out STD_LOGIC;

		-- Ports we expose for debugging purposes:
		-- It was originally intended that these ports would be
		-- removed, but it has been more convenient to leave them in:
    	portInSliceNum : out STD_LOGIC_VECTOR(1 downto 0);
    	portOutSliceNum : out STD_LOGIC_VECTOR(1 downto 0);
    	stateOutput : out STD_LOGIC_VECTOR(3 downto 0)
    );
end pctosraminterface;

architecture pctosraminterface_arch of pctosraminterface is
	-- ========================================
	-- Architecture declarations:
	-- ========================================	
	 
	-- Synchronous versions of the control inputs.
	-- We pass each control signal and the value on DataIn
	-- through a series of flip-flops. To simply the VHDL
	-- we concatenate the control signals and DataIn into
	-- a single STD_LOGIC_VECTOR. Only we the each level
	-- of flip-flops has the same value do we use the
	-- value of the control signals and/or DataIn.
	signal asyncInputs : STD_LOGIC_VECTOR(7 downto 0);
	signal syncInputs1, syncInputs2,
		syncInputs3 : STD_LOGIC_VECTOR(7 downto 0)	;
		

	-- MALENAs code
	
	signal mysyncInputs1, mysyncInputs2,
		mysyncInputs3 : STD_LOGIC_VECTOR(7 downto 0)	;
	signal mysyncdata : STD_LOGIC_VECTOR(7 downto 0);
	signal softreset : STD_LOGIC;


	-- MALENAs code ends

	-- Synchronous versions of the control inputs that
	-- we actually use. For each control signal, when
	-- each flip-flop in the corresponding chain holds the
	-- same value, we copy that value into one of the
	-- following signals:
	signal syncWrite : STD_LOGIC;
	signal syncRead : STD_LOGIC;
	signal syncNextSlice : STD_LOGIC;
	
	-- Register declarations:
	signal dataInReg : STD_LOGIC_VECTOR(4 downto 0);
	signal curAddrReg : STD_LOGIC_VECTOR(18 downto 0);
	signal writeDataReg : STD_LOGIC_VECTOR(15 downto 0);
	signal readDataReg : STD_LOGIC_VECTOR(15 downto 0);

	-- Clock-enable signals for the registers:
	signal regDataIn : STD_LOGIC;
	signal regCurAddr : STD_LOGIC;
	signal regWriteData : STD_LOGIC;
	signal regReadData : STD_LOGIC;
		
	-- Signal to indicate which "slice" we are now waiting
	-- to receive (when we are receiving an address or a 
	-- data value from the PC):
	-- An address is transmitted in three slices of 5 bits
	-- and one slice of 4 bits.
	-- Data values are transmitted in four slices of 4 bits.
	-- The least significant slice (the slice containing the
	-- the least significant bit) is always transmitted
	-- first.
	signal inSliceNum : STD_LOGIC_VECTOR(1 downto 0);
	-- Signal to indicate the current "slice" when
	-- we are sending data to the PC.
	signal outSliceNum : STD_LOGIC_VECTOR(1 downto 0);
	
	-- Other control signals:
	signal incCurAddr : STD_LOGIC;
	signal incInSliceNum : STD_LOGIC;
	signal incOutSliceNum : STD_LOGIC;
	signal clearInSliceNum : STD_LOGIC;
	signal clearOutSliceNum : STD_LOGIC;

	-- Signal declarations for settings:
	-- Settings are simple 1-bit signals that can be thought of
	-- as "preferences" or "configuration data" in hardware.
	-- The PC can set the state of each of these bits. The idea
	-- is that by setting or clearing these bits, the PC can
	-- control the behaviour of this PC-to-SRAM interface.
	-- When getSettings = '1', on the next rising clock edge,
	-- the value in dataInReg
	-- (i.e. effectively the value on DataIn) is copied into
	-- the current settings. This means we can currently
	-- have a maximum of 5 bits worth of settings.
	signal getSettings : STD_LOGIC;
	-- When pcControlEnabled is '1', this PC-to-SRAM interface
	-- requests exclusive access to SRAM. When pcControlEnable = '0',
	-- this PC-to-SRAM interface gives up its access to SRAM.
	-- This setting is visible on the output port "active".
	-- This signal is designed to be used (with supporting entities
	-- and a supporting top-level) to allow this interface
	-- and a different arbitrary design to share access to the
	-- SRAM. A user design simply accesses SRAM through a special
	-- top-level entity. Most of the time this entity allows
	-- full SRAM access to the user design. When pcControlEnabled
	-- = '1', it is expected that the user design will be
	-- "disconnected" from SRAM and this interface "connected" in its
	-- place. This is to allow to contents of SRAM to be accessed
	-- on the PC without having to download a new bit file.
	-- pcControlEnabled is to be loaded with bit 0 of dataInReg.
	signal pcControlEnabled : STD_LOGIC;
	

	-- Signals for FSM controller:
	type typeStateType is (stIdle, stGetAddr1, stDoWrite1, stDoWrite2,
			stDoRead1, stDoRead2, stDoRead3, 
			stGetSettings1, stGetSettings2, stGetSettings3);
	signal presState, nextState: typeStateType;

begin

	-- ========================================
	-- Architecture body:
	-- ========================================

	-- ========================================
	-- Combinational signals
	-- ========================================

	-- Debug connections:
	portInSliceNum <= inSliceNum;
	portOutSliceNum <= outSliceNum;

	writeAddr <= curAddrReg;
	readAddr <= curAddrReg;
	
	writeData <= writeDataReg;	

	-- We concatenate the control signals and DataIn into one
	-- vector for the purposes of passing it through several
	-- levels of flip-flops for synchronization purposes:
	asyncInputs <= NextSlice & Read & Write & DataIn;
	
	-- Multiplex the data presented on DataOut:
	with outSliceNum select
		DataOut <=	readDataReg(3 downto 0) when "00",
					readDataReg(7 downto 4) when "01",
					readDataReg(11 downto 8) when "10",
					readDataReg(15 downto 12) when others;

	active <= pcControlEnabled;
	
	-- MALENA's code to create a software reset via ppt

	with mysyncdata select
		softreset <= '1' when "11111111",
					'0' when others;


	
	  process(CLK) 
		begin
			
			mysyncInputs1 <= asyncInputs;
			mysyncInputs2 <= syncInputs1;
			mysyncInputs3 <= syncInputs2;
		
			if 	(mysyncInputs1 = mysyncInputs2) and
				(mysyncInputs2 = mysyncInputs3) then
				mysyncdata <= mysyncInputs3;
			end if;
		end process;

	-- END of MALENAs code

	-- ========================================
	-- Process for reset and clock-edge events
	-- ========================================
	process(CLK, Resetn)
	begin
		if (softreset = '1' or Resetn = '0') then
			-- Set defaults for all signals not controlled
			-- by the FSM controller.	
			presState <= stIdle;

			syncInputs1 <= (others => '0');
			syncInputs2 <= (others => '0');
			syncInputs3 <= (others => '0');
			
			syncWrite <= '0';			
			syncRead <= '0';
			syncNextSlice <= '0';

			dataInReg <= (others => '0');			
			curAddrReg <= (others => '0');
			writeDataReg <= (others => '0');
			readDataReg <= (others => '0');
			
			inSliceNum <= (others => '0');
			outSliceNum <= (others => '0');

			pcControlEnabled <= '0';
			
		elsif CLK'EVENT and CLK = '1' then

			-- Update synchronous values of the control
			-- signals:
			syncInputs1 <= asyncInputs;
			syncInputs2 <= syncInputs1;
			syncInputs3 <= syncInputs2;

			-- For the chain of flip-flops associated with
			-- each of the eight incoming asynchronous inputs,
			-- we update the "offical" synchronised value of the
			-- input signal (which we actually use in the
			-- state machine below) only if every flip-flop
			-- in the chain holds the same value:
			if 	(syncInputs1 = syncInputs2) and
				(syncInputs2 = syncInputs3) then
				
				syncNextSlice <= syncInputs3(7);
				syncRead <= syncInputs3(6);
				syncWrite <= syncInputs3(5);
				dataInReg <= syncInputs3(4 downto 0);
			end if;

			-- Handle the clock-enabling of each register:
			if incCurAddr = '1' then
				curAddrReg <= curAddrReg + 1;
			elsif regCurAddr = '1' then
				case inSliceNum is
					when "00" =>
						curAddrReg(4 downto 0) <= dataInReg(4 downto 0);
					when "01" =>
						curAddrReg(9 downto 5) <= dataInReg(4 downto 0);
					when "10" =>
						curAddrReg(14 downto 10) <= dataInReg(4 downto 0);
					when others =>
						curAddrReg(18 downto 15) <= dataInReg(3 downto 0);
				end case;
			end if;
			if regWriteData = '1' then
				case inSliceNum is
					when "00" =>
						writeDataReg(3 downto 0) <= dataInReg(3 downto 0);
					when "01" =>
						writeDataReg(7 downto 4) <= dataInReg(3 downto 0);
					when "10" =>
						writeDataReg(11 downto 8) <= dataInReg(3 downto 0);
					when others =>
						writeDataReg(15 downto 12) <= dataInReg(3 downto 0);
				end case;
			end if;
			if regReadData = '1' then
--				For debug purposes we load the readDataReg directly with the
--				writeDataReg.
--				readDataReg <= writeDataReg;
--				readDataReg(15) <= '0';
--				readDataReg(14 downto 0) <= curAddrReg(18 downto 4);		

				readDataReg <= readData;
			end if;

			if clearInSliceNum = '1' then
				inSliceNum <= (others => '0');
			elsif incInSliceNum = '1' then
				inSliceNum <= inSliceNum + 1;
			end if;

			if clearOutSliceNum = '1' then
				outSliceNum <= (others => '0');
			elsif incOutSliceNum = '1' then
				outSliceNum <= outSliceNum + 1;
			end if;
			
			-- Handle the updating of settings:
			if getSettings = '1' then
				pcControlEnabled <= dataInReg(0);
			end if;
			
			-- Update current state for the controller FSM.
			presState <= nextState;			
		end if;
	end process;

	-- ========================================
	-- Process for FSM of controller
	-- ========================================
	process(presState, syncWrite, syncRead, syncNextSlice,
			inSliceNum, outSliceNum, canWrite, canRead)
	begin
		-- Set the defaults for all the signals this FSM
		-- controls:
		regDataIn <= '0';
		regCurAddr <= '0';
		regWriteData <= '0';
		regReadData <= '0';
		
		incCurAddr <= '0';
		
		incInSliceNum <= '0';
		incOutSliceNum <= '0';
		clearInSliceNum <= '0';
		clearOutSliceNum <= '0';

		doSRAMWrite <= '0';
		doSRAMRead <= '0';

		getSettings <= '0';

		-- Set default value of stateOutput:
		stateOutput <= "1111";

		case presState is
			when stIdle =>
				nextState <= stIdle;
				
				if syncNextSlice = '1' then
					if syncWrite = '1' and syncRead = '1' then
						nextState <= stGetAddr1;
						-- Register slice 0:
						regCurAddr <= '1';
						-- Increment slice number so that we're ready
						-- for the next slice:
						incInSliceNum <= '1';
					elsif syncWrite = '1' then
						nextState <= stDoWrite1;
						-- Register slice 0:
						regWriteData <= '1';
						-- Increment slice number so that we're ready
						-- for the next slice:
						incInSliceNum <= '1';
					elsif syncRead = '1' then
						nextState <= stDoRead1;
						clearOutSliceNum <= '1';
					elsif syncWrite = '0' and syncRead = '0' then
						nextState <= stGetSettings1;
					end if;
				end if;
				
				stateOutput <= "0001";

			when stGetAddr1 =>
				nextState <= stGetAddr1;

				case inSliceNum is
					when "00" =>
					when "01" =>
						-- syncNextSlice should be high.
						-- We wait for syncNextSlice to go low:
						if syncNextSlice = '0' then
							-- Read the next address slice and
							-- increment the input slice number:
							regCurAddr <= '1';
							incInSliceNum <= '1';
						end if;
					when "10" =>
						-- syncNextSlice should be low.
						-- We wait for syncNextSlice to go high:
						if syncNextSlice = '1' then
							regCurAddr <= '1';
							incInSliceNum <= '1';
						end if;						
					when others =>
						-- inSliceNum should be "11" here.
						-- syncNextSlice should be high.
						-- We wait for syncNextSlice to go low:

						-- We are waiting for the final slice:
						if (syncNextSlice = '0' and syncWrite = '0' and
							syncRead = '0') then
							-- After this we are done setting
							-- the address.
							nextState <= stIdle;

							regCurAddr <= '1';
							clearInSliceNum <= '1';
						end if;						
				end case;
				
				-- The only exception to the above is that if
				-- syncWrite or syncRead have been prematurely changed
				-- then we abort the current operation.
				if inSliceNum /= "11" and
				   (syncWrite = '0'or syncRead = '0') then
				    nextState <= stIdle;
				    clearInSliceNum <= '1';
				end if;

			when stDoWrite1 =>
				nextState <= stDoWrite1;
				
				case inSliceNum is
					when "00" =>
					when "01" =>
						-- syncNextSlice should be high.
						-- We wait for syncNextSlice to go low:
						if syncNextSlice = '0' then
							-- Read the next write data slice and
							-- increment the input slice number:
							regWriteData <= '1';
							incInSliceNum <= '1';
						end if;
					when "10" =>
						-- syncNextSlice should be low.
						-- We wait for syncNextSlice to go high:
						if syncNextSlice = '1' then
							regWriteData <= '1';
							incInSliceNum <= '1';
						end if;						
					when others =>
						-- inSliceNum should be "11" here.
						-- syncNextSlice should be high.
						-- We wait for syncNextSlice to go low:

						-- We are waiting for the final slice:
						if (syncNextSlice = '0' and syncWrite = '0') then
							-- We are reading the final slice,
							-- so after this we actually perform
							-- the write to SRAM:
							nextState <= stDoWrite2;

							regWriteData <= '1';
							clearInSliceNum <= '1';
						end if;						
				end case;
				
				-- The only exception to the above is that if
				-- syncWrite has been prematurely changed
				-- then we abort the current operation.
				if (inSliceNum /= "11" and syncWrite = '0') then
				    nextState <= stIdle;
				    clearInSliceNum <= '1';
				end if;

			when stDoWrite2 =>
				nextState <= stDoWrite2;
				
				-- Wait to request the actual write to SRAM:
				if canWrite = '1' then
					-- The write will take place in subsequent
					-- clock cycle(s). We don't need to wait for
					-- the write to finish, since this FSM runs
					-- much faster than the rate at which the PC
					-- can control the parallel port.
					nextState <= stIdle;
					doSRAMWrite <= '1';					

					-- Auto-increment the current address:
					incCurAddr <= '1';
				end if;

			when stDoRead1 =>
				nextState <= stDoRead1;

				-- Wait to request the actual read from SRAM:
				if canRead = '1' then
					nextState <= stDoRead2;
					doSRAMRead <= '1';
				end if;

			when stDoRead2 =>
				nextState <= stDoRead2;
				
				-- Wait for the read to complete:
				if canRead = '1' then
					nextState <= stDoRead3;
					
					-- readData will be valid at the end of this
					-- clock cycle, so we register it at that point:	
					regReadData <= '1';
					
					-- Clear outSliceNum so that the first slice
					-- we output for the PC will be slice 0.
					clearOutSliceNum <= '1';
				end if;								
				
			when stDoRead3 =>
				nextState <= stDoRead3;

				case outSliceNum is
					when "00" =>
						-- syncNextSlice should be high.
						-- We wait for syncNextSlice to go low:
						if syncNextSlice = '0' then
							-- Increment the output slice number
							-- to output the next read data slice
							-- to the PC:
							incOutSliceNum <= '1';
						end if;
					when "01" =>
						-- syncNextSlice should be low.
						-- We wait for syncNextSlice to go high:
						if syncNextSlice = '1' then
							incOutSliceNum <= '1';
						end if;						
					when "10" =>
						-- syncNextSlice should be high.
						-- We wait for syncNextSlice to go low:

						-- We are waiting to output the final slice:
						if (syncNextSlice = '0' and syncRead = '0') then
							-- After this we have finished
							-- performing the read:
							nextState <= stIdle;

							-- Auto-increment the current address:
							incCurAddr <= '1';

							-- Increment the output slice number
							-- to output the final read data slice
							-- to the PC:
							incOutSliceNum <= '1';
						end if;
					when others =>				
				end case;
				
				-- The only exception to the above is that if
				-- syncRead has been prematurely changed
				-- then we abort the current operation.
				-- Note that for reads, outSliceNum is compared
				-- with the value "10" in the line below, rather
				-- than "11" that we compare inSliceNum with
				-- when doing address setting and writes.
				if (outSliceNum /= "10" and syncRead = '0') then
				    nextState <= stIdle;
				end if;
							
			when stGetSettings1 =>
				nextState <= stGetSettings1;
				
				if (syncNextSlice = '0' and syncWrite = '0'
					and syncRead = '0') then
					nextState <= stGetSettings2;
				elsif not (syncNextSlice = '1' and syncWrite = '0'
					   and syncRead = '0') then
					nextState <= stIdle;
				end if;

-- Debug:
				stateOutput <= "1000";	
						
			when stGetSettings2 =>
				nextState <= stGetSettings2;
				
				if (syncNextSlice = '0' and syncWrite = '1'
					and syncRead = '0') then
					nextState <= stGetSettings3;
				elsif not (syncNextSlice = '0' and syncWrite = '0'
						and syncRead = '0') then
					nextState <= stIdle;
				end if;

				stateOutput <= "1001";	

			when stGetSettings3 =>
				nextState <= stGetSettings3;
				
				if (syncNextSlice = '0' and syncWrite = '0'
					and syncRead = '0') then
					nextState <= stIdle;
					
					getSettings <= '1';
				Elsif not (syncNextSlice = '0' and syncWrite = '1'
						and syncRead = '0') then
					nextState <= stIdle;
				End if;

				stateOutput <= "1010";	

				
			when others =>
				nextState <= stIdle;
				clearInSliceNum <= '1';
		end case;		
	end process;

end pctosraminterface_arch;



-------------------------------------------------------------------------------
-- History of major changes
-------------------------------------------------------------------------------
-- (15/02/2001) The VHDL for buffering the control signals has been
-- simplified. Additionally, we also buffer the value of DataIn. We only
-- change the value we are using for DataIn or the control signals when
-- EVERY level of flip-flops is holding the same set of values. This is just
-- a minor change to help ensure that any skew that the incoming signals
-- have relative to other incoming signals is removed. This change does
-- NOT affect the protocol between the PC and the board.
-- There are now only 4 levels of flip-flops instead of 5, to reduce the
-- amount of comparison logic needed.
-- (15/02/2001) pctosraminterface-sv06.vhd created from sv05.
-- (14/02/2001) The protocol for setting the address, writing a data value and
-- updating settings has now been changed. Instead of sending slice 0 of the
-- address or write data *before* we assert the control signals for the first
-- time, slice 0 of the address or write data must now be sent at the 
-- *same time* as the control signals are first asserted. Overall this means
-- that we have shifted the timing of when each slice is sent to later in
-- time. Similarly, the protocol for updating settings has changed. You must
-- now do the following: set NextSlice to 1, set NextSlice to 0, set Write
-- to 1, set Write to 0 *and at the same time* place the new settings on
-- DataIn.
-- All this has been done so that we no longer have to remember the "old"
-- value of DataIn like we used to previously. The fact that we now buffer the
-- control signals through several levels of flip-flops meant that it was
-- becoming more awkward to remember the "old" value of DataIn. We now have no
-- need to remember the "old" value of DataIn.
-- (14/02/2001) pctosraminterface-sv05.vhd created from sv04.
-- (13/02/2001) We now buffer the control signals through 5 levels of
-- flip-flops.
-- (06/02/2001) The bug that caused the interface to incorrectly update its
-- settings has now been fixed. The protocol to update settings was made
-- to be more different from the protocols for reading and writing. This fixed
-- the problem.
-- (03/02/2001) pctosraminterface-sv04.vhd created from sv03.
-- (03/02/2001) Known bug: Occasionally the interface will incorrectly try
-- to update its settings. This probably means that the interface is not
-- robust enough when it comes to handling unexpected glitches in the
-- incoming control signals.
-- (29/01/2001) The sraminterface version
-- sram512kleft16bit50mhzreadreq-sv02.vhd has reverted to NOT registering
-- the read data internally. Therefore we must once again register the read
-- data ourselves. We know that when canRead goes high at the end of a read
-- then the read data will be valid at the end of the same clock cycle. It is
-- at that point (at the end of the cycle in which canRead returns to high)
-- that we register the read data.
-- (24/01/2001) Updated to use the sraminterfaces that need read requests.
-- Previously the sraminterface was always reading when it wasn't writing.
-- But versions of the file including the letters "readreq", such as
-- "sram512kleft16bit50mhzreadreq-sv01b.vhd" require a read request to
-- be made for a read to occur. The request is made by setting doRead high.
-- We also now use the canRead and canWrite signals to determine when a read
-- or write has completed. canRead and canWrite go high when new read and write
-- requests respectively can be made (and thus indicating that the current
-- read or write will be finished by the end of the clock cycle in which
-- canRead or canWrite goes high).
-- Also, although we no longer need to register readData (as the new
-- sraminterface registers it itself internally), we register it ourselves
-- anyway. See the comments in code.
-- (24/01/2001) pctosraminterface-sv03.vhd created from sv02.
-- The concept of "settings" has been introduced. See the comments in the
-- code.
-- (22/01/2001) DataIn now passes through 5 registers before its value is
-- used, rather than 6 as before. This is just to try and save a couple
-- of flip flops. It's probably an unnecessary  and insignificant change.
-- (22/01/2001) Current address now increments by one after a write or a read.
-- This is designed to make bulk writes or reads to SRAM faster, since when
-- consecutive memory locations need to be accessed, the current address only
-- has to set once, at the start. It will then automatically increment after a
-- read or a write. If the PC programme does not want to access the next
-- consecutive location, it has to specifically set the current address.
-- (19/01/2001) Asynchronous control signals (Write, Read, NextSlice) are
-- now synchronised (i.e. put through flip-flops) before being read or used
-- in any way. Before this, the state-machine would often enter an unknown
-- state.
-- (18/01/2001) pctosraminterface-sv02.vhd created from
-- pctosraminterface-sv01.vhd. We stop looking for transitions of NextSlice 
-- and look for the specific correct value. This is being done because in
-- testing it seemed that we sometimes missed transitions in NextSlice, which
-- really messes up the protocol. Now, if we don't see a change in NextSlice
-- during one clock cycle, we will see it in the next, or maybe even the one
-- after that. As long as we see it before the PC changes NextSlice again we
-- will be fine.

