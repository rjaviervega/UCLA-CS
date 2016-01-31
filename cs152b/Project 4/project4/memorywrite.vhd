library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memorywrite is
    Port (
	 			CLK : in std_logic;
			 	Reset : in std_logic;
			 	IssueWrite : in std_logic;
			 	CanWrite : in std_logic;
			 	DoWrite : out std_logic;
			 	WriteDone : out std_logic
			 );
end memorywrite;

architecture Behavioral of memorywrite is

		type   typeStateType is (stIdle, stDoWrite1, stDoWrite2);
		signal preState, nextState	:	typeStateType;

begin
	
	resetorset: process (CLK, Reset)
		begin
			if Reset = '0' then
				preState <= stIdle;			
			elsif CLK' event and CLK = '1' then
				preState <= nextState;
			end if;
	end process resetorset;

	statemachine: process (CLK, Reset, IssueWrite, CanWrite, preState)
		
		begin

		--Default signals
		DoWrite <= '0';
		WriteDone <= '0';

		case preState is
				when stIdle =>
					nextState <= stIdle;
						if IssueWrite = '1' then
							nextState <= stDoWrite1;
						else
							nextState <= stIdle;
						end if;

				when stDoWrite1 =>
					if CanWrite = '0' then
						nextState <= stDoWrite1;
					else
						nextState <= stDoWrite2;
						DoWrite <= '1';
					end if;

				when stDoWrite2 =>
					if CanWrite = '0' then
						nextState <= stDoWrite2;
					else
						nextState <= stIdle;
						WriteDone <= '1';
					end if;

				when others =>
					nextState <= stIdle;
			end case;
	end process statemachine;

end Behavioral;
