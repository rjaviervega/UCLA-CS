library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CtrlUnit is
    Port ( A : in std_logic_vector(15 downto 0);
           Dout : in std_logic_vector(15 downto 0);
           CLK : in std_logic;
           Reset : in std_logic;
           WrDone : in std_logic;
           RdDone : in std_logic;
           RdAddr : out std_logic_vector(17 downto 0);
           WrAddr : out std_logic_vector(17 downto 0);
           RegBusW : out std_logic_vector(15 downto 0);
           Din : out std_logic_vector(15 downto 0);
           RegA : out std_logic_vector(2 downto 0);
           RegW : out std_logic_vector(2 downto 0);
           RegWrEn : out std_logic;
           MemRd : out std_logic;
           MemWr : out std_logic;
           ResetL : out std_logic;
           finish : out std_logic);
end CtrlUnit;

architecture Behavioral of CtrlUnit is

		type	 typeStateType is (  
											stStart, st1, st2, st3, st4, done
											);

		signal preState, nextState	:	typeStateType;

begin

	resetORset: process (CLK, Reset)
	begin

		if Reset = '0' then
			preState <= stStart;	
			ResetL 	<= '0';

		elsif CLK' event and CLK = '1' then
			preState <= nextState;
			ResetL 	<= '1';
		
		end if;

	end process resetorset;

	ControlUnit:	process (preState, WrDone,RdDone, Dout)
	begin

		RegWrEn		<= '0';
      RegBusW		<= (others => '0');
      RegA			<= (others => '0');
      RegW			<= (others => '0');
      MemRd			<= '0';
      MemWr			<= '0';
      RdAddr		<= (others => '0');
      WrAddr		<= (others => '0');
      Din			<= "0000000000000001";
		nextState 	<= stStart;
		finish 		<= '0';

		case preState is
			when stStart =>
				nextState <= st4;

			when st4 =>
				MemRd <= '1';
				RdAddr <= "000000000000000000";
				nextState <= st1;
			
			when st1 =>
				if RdDone = '1' then
					RegWrEn <= '1';
					RegW <= "001";
					RegBusW <= Dout;
					nextState <= st2;
				else
					RdAddr <= "000000000000000000";
					nextState <= st1;
--					finish <= '1';
				end if;

			when st2 =>
				RegA <= "001";
				Din <= A + "0000000000000100";
				MemWr <= '1';
				WrAddr <= "000000000000000010";
				nextState <= st3;

			when st3 =>

				if WrDone = '0' then
					RegA <= "001";
					Din <= A + "0000000000000100";
					WrAddr <= "000000000000000010";
					nextState <= st3;
--					finish <= '1';
				else
					nextState <= done;
				end if;

			when done =>
				finish <= '1';
				nextState <= done;

		end case;

	end process;
					
end Behavioral;
