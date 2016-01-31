library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity simtest is
    Port (
			  WrDone : in std_logic;
		  	  MemRd : out std_logic;
           MemWr : out std_logic;
           ResetL : out std_logic;
           RdAddr : out std_logic_vector(17 downto 0);
           WrAddr : out std_logic_vector(17 downto 0);
           Din : out std_logic_vector(15 downto 0);
			  finish : out std_logic;
           CLK : in std_logic;
			  Reset : in std_logic;
			  state1: out std_logic;
			  state2: out std_logic;
			  state3: out std_logic;
			  state4: out std_logic;
			  Dout:	in std_logic_vector (15 downto 0);
			  RdDone: in std_logic
);
end simtest;

architecture Behavioral of simtest is

		type	 typeStateType is (  st1, 
											st2,
											st3,
											st4,
											st5,
											st6,
											st7,
											st8,
											st9,
											st10
											);

		signal preState, nextState	:	typeStateType;

begin

	resetorset: process (CLK, Reset)
		begin
			if Reset = '0' then
				preState <= st1;	
				ResetL <= '0';
			elsif CLK' event and CLK = '1' then
				preState <= nextState;
				ResetL <= '1';
			end if;
	end process resetorset;


	SimInstance: process (CLK, Reset, preState, WrDone)
		
		begin

		--Default signal
           MemRd <= '0';
           MemWr <= '0';
           RdAddr <= (others => '0');
           WrAddr <= (others => '0');
           Din <= (others => '0');
			  nextState <= st1;
			  finish <= '0';
			  state1 <= '0';
			  state2 <= '0';
			  state3 <= '0';
			  state4 <= '0';

		case preState is
				when st1 => 
					NextState <= st2;
					state1 <= '1';

				when st2 =>
					MemWr <= '1';
					Din <= "0000000000000010";
					WrAddr <= "000000000000000000";
					nextState <= st3;
					state2 <= '1';

				when st3 =>
					state3 <= '1';
					if WrDone = '1' then
						nextState <= st5;
					else
						nextState <= st3;
						Din <= "0000000000000010";
						WrAddr <= "000000000000000000";
					end if;

				when st5 =>
					MemWr <= '1';
					Din <= "0000000000000111";
					WrAddr <= "000000000000000010";
					nextState <= st6;
					state2 <= '1';
				when st6 => 
					state3 <= '1';
					if WrDone = '1' then
						nextState <= st7;
					else
						nextState <= st6;
						Din <= "0000000000000111";
						WrAddr <= "000000000000000010";
					end if;
				when st7 =>
					MemWr <= '1';
					Din <= "0000000000000011";
					WrAddr <= "000000000000010000";
					nextState <= st8;
					state2 <= '1';
				when st8 =>
					state3 <= '1';
					if WrDone = '1' then
						nextState <= st9;
					else
						nextState <= st8;
						Din <= "0000000000000011";
						WrAddr <= "000000000000010000";
					end if;
				
				when st9 =>
					MemRd <= '1';
					RdAddr <= "000000000000000010";
					nextState <= st10;

				when st10 =>
					if RdDone = '1' and Dout = "0000000000000111" then
						nextState <= st4;
					else
						RdAddr <= "000000000000000010";
						nextState <= st10;
					end if;

				when st4 =>
					finish <= '1';
					state4 <= '1';
					nextState <= st4;
					

				when others =>
					nextState <= st1;

				end case;
	
	end process SimInstance;

end Behavioral;
