library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memoryread is
    Port ( 
	 		  CLK : in std_logic; 
           Reset : in std_logic;
			  IssueRead: in std_logic;
			  DoRead : out std_logic;
           CanRead : in std_logic;
			  ReadDone	:	out std_logic 
			);
end memoryread;

architecture Behavioral of memoryread is

		type	 typeStateType is (stIdle, stDoRead1, stDoRead2);
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

	statemachine: process (CLK, Reset, IssueRead, CanRead, preState)
		
		begin

		--Default signal
		DoRead <= '0';
		ReadDone <= '0';

		case preState is
				when stIdle =>
					nextState <= stIdle;
						if IssueRead = '1' then
							nextState <= stDoRead1;
						else
							nextState <= stIdle;
						end if;

				when stDoRead1 =>
					if CanRead = '0' then
						nextState <= stDoRead1;
					else
						DoRead <= '1';
						nextState <= stDoRead2;
					end if;

				when stDoRead2 =>
					if CanRead = '0' then
						nextState <= stDoRead2;
					else
						nextState <= stIdle;
						ReadDone <= '1';
					end if;

				when others =>
					nextState <= stIdle;

			end case;
	end process statemachine;

end Behavioral;
