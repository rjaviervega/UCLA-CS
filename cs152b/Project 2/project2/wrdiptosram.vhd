library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity wrdiptosram is
    Port ( CLK : in std_logic;
           RESETN : in std_logic;
			  WRITE : in std_logic;
			  READ : in std_logic;
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
end wrdiptosram;

architecture Behavioral of wrdiptosram is

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
	signal asyncInputs : STD_LOGIC_VECTOR(6 downto 0);
	signal syncInputs1, syncInputs2,
		syncInputs3 : STD_LOGIC_VECTOR(6 downto 0)	;
		
	-- Synchronous versions of the control inputs that
	-- we actually use. For each control signal, when
	-- each flip-flop in the corresponding chain holds the
	-- same value, we copy that value into one of the
	-- following signals:
	signal syncWrite : STD_LOGIC;
	signal syncRead : STD_LOGIC;
	signal syncData : STD_LOGIC_VECTOR(4 downto 0);

	-- latch signals
	signal incWriteAddr : STD_LOGIC;
	signal incReadAddr : STD_LOGIC;
	signal regWriteData : STD_LOGIC;
	signal regReadData : STD_LOGIC;

	-- internal registers
	signal WriteAddrReg : STD_LOGIC_VECTOR( 18 downto 0);
	signal ReadAddrReg: STD_LOGIC_VECTOR(18 downto 0);
	signal WriteDataReg: STD_LOGIC_VECTOR(15 downto 0 );
	signal ReadDataReg : STD_LOGIC_VECTOR(15 downto 0);
	

	-- Signals for FSM controller:
	type typeStateType is (stIdle, stDoWrite1, stDoWrite2, stDoWrite3, stDoRead1, stDoRead2, stDoRead3);
	signal presState, nextState: typeStateType;

begin
	
	
	
	


	
	-- We group the DIP inputs for the purposes of passing 
	-- it through several levels of flip-flops for synchronization purposes:

	asyncInputs <= not (READ) & not (WRITE) & DATAIN(4 downto 0); 

	-- ========================================
	-- Process for reset and clock-edge events
	-- ========================================
	process(CLK, RESETN)

	begin

		if RESETN = '0' then 
			
			presState <= stIdle;
			
			syncWrite <= '0';			
			syncRead <= '0';
		   syncData <= (others => '0');

			WriteAddrReg <= (others => '0');
			ReadAddrReg <= (others => '0');
			WriteDataReg <= (others => '0');
			ReadDataReg <= (others => '0');


		elsif clk'event and clk = '1' then
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
				
			
				syncRead <= syncInputs3(6);
				syncWrite <= syncInputs3(5);
			
				syncData <= syncInputs3(4 downto 0);

			end if;

			if (incWriteAddr = '1') then 
				WriteAddrReg <= WriteAddrReg + 1;
			else 
				WriteAddrReg <= WriteAddrReg;
			end if;

			if (incReadAddr = '1') then 
				ReadAddrReg <= ReadAddrReg + 1;
		   else
				ReadAddrReg <= ReadAddrReg;
			end if;


			if (regWriteData = '1') then 
				WriteDataReg(4 downto 0) <= syncData(4 downto 0);
				WriteDataReg(15 downto 5) <= (others => '0');
			else 
				WriteDataReg <= WriteDataReg;
			end if;

			if (regReadData = '1') then 
				ReadDataReg <= READDATA;
			else
				ReadDataReg <= ReadDataReg;
			end if;

		

		-- UPdate current state
		presState <= nextState;

		end if;
	end process;


	process(presState, syncWrite, syncRead, CANWRITE, CANREAD)
	

	begin

	-- default signals
		incWriteAddr <= '0';
		incReadAddr <= '0';
		regReadData <= '0';
		regWriteData <= '0';
		DOWRITE <= '0';
		DOREAD <= '0';
	   stateOutput <= "1111";
		case presState is 
			when stIdle => 
				nextState <= stIdle;

					if syncWrite = '1' then 
						nextState <= stDoWrite1;
						incWriteAddr <= '1';
						regWriteData <= '1';
					
			   	elsif syncRead = '1' then 
						nextState <= stDoRead1;
						incReadAddr <= '1';
					else 
						nextState <= stIdle;
				
						end if;

				stateOutput <= "0001";

			when stDoWrite1 =>
				if CANWRITE = '0' then 
					nextState <= stDoWrite1;
				else
					DOWRITE <= '1';
					nextState <= stDoWrite2;
				end if;

			   stateOutput <= "0010";
		   		
			when stDoWrite2  =>
				-- Wait for write to be over
				if CANWRITE = '0' then
					nextState <= stDoWrite2;

				else 
					nextState <= stDoWrite3;
				end if;
			stateOutput <= "0011";

			when stDoWrite3 =>
				if (syncWrite = '1') then 
					nextState <= stDoWrite3;
				else 
					nextState <= stIdle;
				end if;
			
			stateOutput <= "0100";					

			when stDoRead1 =>
			   if CANREAD = '0' then 
					nextState <= stDoread1;
           
				else 
					nextState <= stDoRead2;
					DOREAD <= '1';
				end if;
				stateOutput <= "0101";

			when stDoRead2 =>
				if CANREAD = '0' then 
					nextState <= stDoRead2;
				else 
					regReadData <= '1';
					nextState <= stDoRead3;
				end if;
				stateOutput <= "0110";
			when stDoRead3 =>
			   if (syncRead = '1') then 
					nextState <= stDoRead3;
				else 
					nextState <= stIdle;
				end if;
				stateOutput <= "0111";

			when others =>

				nextState <= stIdle;

		end case;

	end process;

   WRITEADDR <= WriteAddrReg;
   READADDR <=	ReadAddrReg;
	WRITEDATA <= WriteDataReg; 
	BARDATA <= ReadDataReg(3 downto 0);

end Behavioral;






