-------------------------------------------------------------------------------
-- memorymultiplexor-sv01.vhd
--
-- Author(s):     James Brennan
-- Created:       24 Jan 2001
-- Last Modified: 24 Jan 2001
-- 
-- Multiplexes the connections between a standard SRAM interface. Either the
-- PC-to-SRAM interface or another on-chip circuit are allowed to connect to
-- the standard SRAM interface. Usually the arbitrary on-chip circuit is
-- connected, but the PC-to-SRAM interface can request access to the SRAM
-- instead.
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity memorymultiplexor is
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
end memorymultiplexor;

architecture memorymultiplexor_arch of memorymultiplexor is
	-- ========================================
	-- Architecture declarations:
	-- ========================================
	
	-- Constants for connectionSelect signal:
	constant CONST_CONNECT_OUTSIDE_CIRCUIT : STD_LOGIC := '0';	
	constant CONST_CONNECT_PC_INTERFACE : STD_LOGIC := '1';
	
	-- Signal that control the main multiplexor
	signal connectionSelect : STD_LOGIC;

	-- Signals for FSM controller:
	type typeStateType is (stConnectOutsideCircuit,
						   stConnectPCInterface);
	signal presState, nextState: typeStateType;
begin
	-- ========================================
	-- Architecture body:
	-- ========================================

	-- ========================================
	-- Combinational signals
	-- ========================================

	-- Main set of multiplexors to multiplex between all
	-- the memory connections:
	with connectionSelect select
		memWriteAddr <=	pcWriteAddr when CONST_CONNECT_PC_INTERFACE,
						visibleWriteAddr when others;
	with connectionSelect select
		memWriteData <=	pcWriteData when CONST_CONNECT_PC_INTERFACE,
						visibleWriteData when others;
	with connectionSelect select
		memReadAddr <=	pcReadAddr when CONST_CONNECT_PC_INTERFACE,
						visibleReadAddr when others;
	with connectionSelect select
		memDoWrite <=	pcDoWrite when CONST_CONNECT_PC_INTERFACE,
						visibleDoWrite when others;
	with connectionSelect select
		memDoRead <=	pcDoRead when CONST_CONNECT_PC_INTERFACE,
						visibleDoRead when others;

	-- Other connections:
	pcCanWrite <= memCanWrite;
	visibleCanWrite <= memCanWrite;
	
	pcCanRead <= memCanRead;
	visibleCanRead <= memCanRead;
	
	pcReadData <= memReadData;
	visibleReadData <= memReadData;


	-- ========================================
	-- Process for reset and clock-edge events
	-- ========================================
	process(CLK, Resetn)
	begin
		if Resetn = '0' then
			-- Set defaults for all signals not controlled
			-- by the FSM controller.
	
			presState <= stConnectOutsideCircuit;
			
			
		elsif CLK'EVENT and CLK = '1' then

			-- Update current state for the controller FSM.
			presState <= nextState;			
		end if;
	end process;

	-- ========================================
	-- Process for FSM of controller
	-- ========================================
	process(presState, pcInterfaceActive, memCanWrite, memCanRead)
	begin
		-- Set the defaults for all the signals this FSM
		-- controls:

		case presState is
			when stConnectOutsideCircuit =>
				nextState <= stConnectOutsideCircuit;
				
				if (pcInterfaceActive = '1' and memCanWrite = '1' and
				   memCanRead = '1') then
				   nextState <= stConnectPCInterface;
				end if;
				
				connectionSelect <= CONST_CONNECT_OUTSIDE_CIRCUIT;				

			when stConnectPCInterface =>
				nextState <= stConnectPCInterface;
				
				if pcInterfaceActive = '0' then
					nextState <= stConnectOutsideCircuit;
				end if;
				
				connectionSelect <= CONST_CONNECT_PC_INTERFACE;
		end case;		
	end process;

end memorymultiplexor_arch;
