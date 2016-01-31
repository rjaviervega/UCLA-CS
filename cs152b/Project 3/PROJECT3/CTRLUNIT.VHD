library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ctrlunit is
    Port (	
	 			zfin			:	OUT	STD_LOGIC;
	 			CLK			:	IN 	STD_LOGIC;
				Reset			:	IN 	STD_LOGIC;
				PCwr			:	OUT 	STD_LOGIC_VECTOR (15 DOWNTO 0);
				PCwrEN		:	OUT	STD_LOGIC;
				MemRd			:	OUT	STD_LOGIC;
				RdAddr		:	OUT	STD_LOGIC_VECTOR (17 DOWNTO 0);
				RdDone		:	IN		STD_LOGIC;
				PC				:	IN		STD_LOGIC_VECTOR (15 DOWNTO 0);
				Dout			:	IN		STD_LOGIC_VECTOR (15 DOWNTO 0);
				AluA			:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0);
				AluB			:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0);
				ctrl			:	OUT	STD_LOGIC_VECTOR (3  DOWNTO 0);
				RegA			:	OUT	STD_LOGIC_VECTOR (2  DOWNTO 0);
				RegB			:	OUT	STD_LOGIC_VECTOR (2  DOWNTO 0);
				RegW			:	OUT	STD_LOGIC_VECTOR (2  DOWNTO 0);
				RegBusW		:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0);
				RegWrEn		:	OUT	STD_LOGIC;
				A				:	IN		STD_LOGIC_VECTOR (15 DOWNTO 0);
				B				:	IN		STD_LOGIC_VECTOR (15 DOWNTO 0);
				Din			:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0);
				MemWr			:	OUT	STD_LOGIC;
				WrAddr		:	OUT	STD_LOGIC_VECTOR (17 DOWNTO 0);
				WrDone		:	IN		STD_LOGIC;
				Start			:	IN		STD_LOGIC;
				S				:	IN		STD_LOGIC_VECTOR (15 DOWNTO 0);
				ResetL		:	OUT	STD_LOGIC
			);
end ctrlunit;

architecture Behavioral of ctrlunit is

type	 typeStateType is (	stIdle,
									stPCtoSRAM,
									stInstrRdy,
									stInstrImplmnt,
									stPush,
									stPop,
									stLw,
									stSw,
									stJal,
									stJr,
									done);

signal	preSt, nextSt		:	typeStateType;
signal	regInt				:	STD_LOGIC_VECTOR (15 DOWNTO 0);
signal	temp16				:	STD_LOGIC_VECTOR (15 DOWNTO 0);
signal	updateregInt		:	STD_LOGIC;

begin

	process (CLK, Reset)
	begin

	
		if Reset = '0' then
			preSt		<= stIdle;	
			ResetL 	<= '0';
			regInt	<=	"0000000000000000";
		elsif CLK' event and CLK = '1' then
			preSt		<= nextSt;
			ResetL 	<= '1';

			if (updateregInt = '1') then
				regInt <= Dout;
			else
				regInt <= regInt;
			end if;

		end if;

	end process;

	process (preSt, S, Start, Dout, PC, RdDone, regInt, A, B, WrDone)
	begin

		PCwr 		<= (others => '0');
		PCwrEn	<= '0';
		MemRd		<= '0';
		RdAddr	<=	(others => '0');
		RegW		<= (others => '0');
		RegA		<=	(others => '0');
		RegB		<= (others => '0');
		AluA		<=	(others => '0');
		AluB		<=	(others => '0');
		RegWrEn	<=	'0';
		RegBusW	<=	(others => '0');
		ctrl		<= (others => '0');
		Din		<= (others => '0');
		MemWr		<= '0';
		WrAddr	<= (others => '0');
		temp16	<= (others => '0');
		zfin		<=	'0';
		updateregInt		<=	'0';

		case	preSt is
		when	stIdle =>
			
			PCwr		<=	"0000000000000000";
			PCwrEn	<=	'1';
			RegBusW	<= "1111111111111110"; -- max 524286
			RegWrEn	<= '1';
			RegW		<="111";
			zfin	<= '0';

			if Start = '1' then
				nextSt	<=	stPCtoSRAM;
			else
				nextSt	<=	stIdle;
			end if;

		when	stPCtoSRAM =>

			MemRd							<= '1';
			RdAddr (17 downto 16)	<= (others => '0');
			RdAddr (15 downto  0)	<= PC;
			nextSt						<=	stInstrRdy;

		when	stInstrRdy =>

			if RdDone = '1' then
				updateregInt		<=	'1';
				nextSt				<= stInstrImplmnt;
			else
				RdAddr (17 downto 16)	<= (others => '0');
				RdAddr (15 downto  0)	<= PC;
				nextSt						<=	stInstrRdy;
				zfin <= '1';
			end if;

		when	stInstrImplmnt =>
			
			if		regInt (15 downto 13) = "000" and regInt (3 downto 0) = "0000" then
				RegW		<= regInt (6  downto  4);
				RegA		<=	regInt (12 downto 10);
				RegB		<=	regInt (9  downto  7);
				ALuA		<=	A;
				AluB		<=	B;
				RegWrEn	<=	'1';
				RegBusW	<=	S;
				ctrl		<=	"0000";
				PCwr		<= PC + 2;
				PCwrEn	<=	'1';
				nextSt	<= stPCtoSRAM;

			elsif	regInt (15 downto 13) = "000" and regInt (3 downto 0) = "0001" then
				RegW		<= regInt (6  downto  4);
				RegA		<=	regInt (12 downto 10);
				RegB		<=	regInt (9  downto  7);
				ALuA		<=	A;
				AluB		<=	B;
				RegWrEn	<=	'1';
				RegBusW	<=	S;
				ctrl		<=	"0001";
				PCwr		<= PC + 2;
				PCwrEn	<=	'1';
				nextSt	<= stPCtoSRAM;

			elsif	regInt (15 downto 13) = "000" and regInt (3 downto 0) = "0100" then
				RegW		<= regInt (6  downto  4);
				RegA		<=	regInt (12 downto 10);
				ALuA		<=	A;
				RegWrEn	<=	'1';
				RegBusW	<=	S;
				ctrl		<=	"0100";
				PCwr		<= PC + 2;
				PCwrEn	<=	'1';
				nextSt	<= stPCtoSRAM;

			elsif	regInt (15 downto 13) = "000" and regInt (3 downto 0) = "0101" then
				RegW		<= regInt (6  downto  4);
				RegA		<=	regInt (12 downto 10);
				ALuA		<=	A;
				RegWrEn	<=	'1';
				RegBusW	<=	S;
				ctrl		<=	"0101";
				PCwr		<= PC + 2;
				PCwrEn	<=	'1';
				nextSt	<= stPCtoSRAM;

			elsif	regInt (15 downto 13) = "000" and regInt (3 downto 0) = "1000" then
				RegW		<= regInt (6  downto  4);
				RegA		<=	regInt (12 downto 10);
				RegB		<=	regInt (9  downto  7);
				ALuA		<=	A;
				AluB		<=	B;
				RegWrEn	<=	'1';
				RegBusW	<=	S;
				ctrl		<=	"1000";
				PCwr		<= PC + 2;
				PCwrEn	<=	'1';
				nextSt	<= stPCtoSRAM;

			elsif	regInt (15 downto 13) = "000" and regInt (3 downto 0) = "1010" then
				RegW		<= regInt (6  downto  4);
				RegA		<=	regInt (12 downto 10);
				RegB		<=	regInt (9  downto  7);
				ALuA		<=	A;
				AluB		<=	B;
				RegWrEn	<=	'1';
				RegBusW	<=	S;
				ctrl		<=	"1010";
				PCwr		<= PC + 2;
				PCwrEn	<=	'1';
				nextSt	<= stPCtoSRAM;

			elsif	regInt (15 downto 13) = "000" and regInt (3 downto 0) = "0010" then
				RegW		<= regInt (6  downto  4);
				RegA		<=	regInt (12 downto 10);
				RegB		<=	regInt (9  downto  7);
				ALuA		<=	A;
				AluB		<=	B;
				RegWrEn	<=	'1';
				RegBusW	<=	S;
				ctrl		<=	"0010";
				PCwr		<= PC + 2;
				PCwrEn	<=	'1';
				nextSt	<= stPCtoSRAM;

			elsif	regInt (15 downto 13) = "000" and regInt (3 downto 0) = "0011" then
				RegW		<= regInt (6  downto  4);
				RegA		<=	regInt (12 downto 10);
				RegB		<=	regInt (9  downto  7);
				ALuA		<=	A;
				AluB		<=	B;
				RegWrEn	<=	'1';
				RegBusW	<=	S;
				ctrl		<=	"0011";
				PCwr		<= PC + 2;
				PCwrEn	<=	'1';
				nextSt	<= stPCtoSRAM;

			elsif	regInt (15 downto 13) = "000" and regInt (3 downto 0) = "0110" then
				RegW		<= regInt (6  downto  4);
				RegA		<=	regInt (12 downto 10);
				ALuA		<=	A;
				RegWrEn	<=	'1';
				RegBusW	<=	S;
				ctrl		<=	"0110";
				PCwr		<= PC + 2;
				PCwrEn	<=	'1';
				nextSt	<= stPCtoSRAM;

			elsif	regInt (15 downto 13) = "000" and regInt (3 downto 0) = "1100" then
				RegW		<= regInt (6  downto  4);
				RegA		<=	regInt (12 downto 10);
				RegB		<=	regInt (9  downto  7);
				ALuA		<=	A;
				AluB		<=	B;
				RegWrEn	<=	'1';
				RegBusW	<=	S;
				ctrl		<=	"1100";
				PCwr		<= PC + 2;
				PCwrEn	<=	'1';
				nextSt	<= stPCtoSRAM;

			elsif	regInt (15 downto 13) = "000" and regInt (3 downto 0) = "1110" then
				RegW		<= regInt (6  downto  4);
				RegA		<=	regInt (12 downto 10);
				RegB		<=	regInt (9  downto  7);
				ALuA		<=	A;
				AluB		<=	B;
				RegWrEn	<=	'1';
				RegBusW	<=	S;
				ctrl		<=	"1110";
				PCwr		<= PC + 2;
				PCwrEn	<=	'1';
				nextSt	<= stPCtoSRAM;

			elsif	regInt (15 downto 13) = "000" and regInt (3 downto 0) = "1101" then
				RegA							<=	regInt (12 downto 10);
				MemWr							<= '1';
				WrAddr (17 downto 16)	<= (others => '0');
				RegB							<= "111";
				WrAddr (15 downto  0)	<= B;
				Din							<=	A;
				nextSt						<=	stPush;

			elsif	regInt (15 downto 13) = "000" and regInt (3 downto 0) = "1111" then
				MemRd							<= '1';
				RegA							<= "111";
				RdAddr (17 downto 16)	<= "00";
				RdAddr (15 downto  0)	<= A + 2;
				RegBusW						<= A + 2;
				RegWrEn						<= '1';
				RegW							<= "111";
				nextSt						<=	stPop;

			elsif	regInt (15 downto 13) = "000" and regInt (3 downto 0) = "1001" then
				RegW		<= regInt (6  downto  4);
				RegA		<=	regInt (12 downto 10);
				RegB		<=	regInt (9  downto  7);
				ALuA		<=	A;
				AluB		<=	B;
				RegWrEn	<=	'1';
				RegBusW	<=	S;
				ctrl		<=	"1001";
				PCwr		<= PC + 2;
				PCwrEn	<=	'1';
				nextSt	<= stPCtoSRAM;

			elsif	regInt (15 downto 13) = "001" then
				RegA							<= regInt (12 downto 10);
				AluA							<= A;
				ctrl							<=	"0000";
				ALuB (15 downto  7)		<= (others => regInt (6));
				AluB (6  downto  0)		<=	regInt (6  downto  0);
				MemRd							<=	'1';
				RdAddr (17 downto 16)	<= (others => '0');
				RdAddr (15 downto  0)	<= S;
				nextSt						<=	stLw;

			elsif	regInt (15 downto 13) = "010" then
				RegA							<= regInt (12 downto 10);
				AluA							<= A;
				ctrl							<=	"0000";
				ALuB (15 downto  7)		<= (others => regInt (6));
				AluB (6  downto  0)		<=	regInt (6  downto  0);
				MemWr							<=	'1';
				WrAddr (17 downto 16)	<= (others => '0');
				WrAddr (15 downto  0)	<= S;
				RegB							<=	regInt (9  downto 7);
				Din							<=	B;
				nextSt						<=	stSw;

			elsif	regInt (15 downto 13) = "011" then
				RegA						<=	regInt (12 downto 10);
				AluA						<=	A;
				ALuB (15 downto  7)	<= (others => regInt (6));
				AluB (6  downto  0)	<=	regInt (6  downto  0);
				ctrl						<= "0000";
				RegBusW					<= S;
				RegWrEn					<= '1';
				RegW						<= regInt (9  downto 7);
				PCwr						<= PC + 2;
				PCwrEn					<=	'1';
				nextSt					<= stPCtoSRAM;

			elsif	regInt (15 downto 13) = "100" then
				RegA		<= regInt (12 downto 10);
				RegB		<= regInt (9 downto 7);
				AluA		<=	A;
				AluB		<=	B;
				ctrl		<= "0001";
				if S = "0000000000000000" then
					temp16 (15 downto 7)	<= (others => regInt (6));
					temp16 (6 downto 0)	<= regInt (6 downto 0);
					PCwr						<=	PC + 2 + temp16;
					PCwrEn					<=	'1';
					nextSt					<= stPCtoSRAM;
				else
					PCwr					<=	PC + 2;
					PCwrEn				<=	'1';
					nextSt				<= stPCtoSRAM;
				end if;

			elsif	regInt (15 downto 13) = "101" then
				PCwr (15 downto 13)	<=	PC 		(15 downto 13);
				PCwr (12 downto  0)	<=	regInt 	(12 downto 0);
				PCwrEn					<= '1';
				nextSt					<= stPCtoSRAM;

			elsif	regInt (15 downto 13) = "110" then
				Din							<= PC + 2;
				MemWr							<= '1';
				WrAddr (17 downto 16)	<= "00";
				WrAddr (15 downto  0)	<= A;
				RegA							<= "111";
				nextSt						<= stJal;

			elsif	regInt = "1110000000000001" then
				MemRd							<= '1';
				RdAddr (17 downto 16)	<= "00";
				RdAddr (15 downto  0)	<= A + 2;
				RegA							<= "111";
				RegBusW						<= A + 2;
				RegWrEn						<= '1';
				RegW							<= "111";
				nextSt						<= stJr;

			elsif	regInt = "1110000000000000" then
				nextSt	<= done;

			end if;
			
		when stPush =>
			if WrDone = '1' then
				RegA		<= "111";
				RegBusW	<=	A - 2;
				RegWrEn	<= '1';
				RegW		<= "111";
				PCwr		<= PC + 2;
				PCwrEn	<= '1';
				nextSt	<= stPCtoSRAM;
			else
				RegA							<= regInt (12 downto 10);
				WrAddr (17 downto 16)	<= (others => '0');
				RegB							<= "111";
				WrAddr (15 downto  0)	<= B;
				Din							<= A;
				nextSt						<= stPush;
			end if;

		when stPop =>
			if RdDone = '1' then
				RegBusW	<=	Dout;
				RegWrEn	<= '1';
				RegW		<= regInt (6 downto 4);
				PCwr		<= PC + 2;
				PCwrEn	<= '1';
				nextSt	<= stPCtoSRAM;
			else
				RdAddr (17 downto 16)	<= (others => '0');
				RegA							<= "111";
				RdAddr (15 downto  0)	<=	A;
				nextSt						<= stPop;
			end if; 

		when stLw =>
			if RdDone = '1' then
				RegBusW	<=	Dout;
				RegWrEn	<= '1';
				RegW		<= regInt (9 downto 7);
				PCwr		<= PC + 2;
				PCwrEn	<= '1';
				nextSt	<= stPCtoSRAM;
			else
				RegA							<= regInt (12 downto 10);
				AluA							<= A;
				ctrl							<=	"0000";
				AluB	 (15 downto  7)	<= (others => regInt (6));
				AluB	 (6  downto  0)	<=	regInt (6  downto  0);
				RdAddr (17 downto 16)	<= (others => '0');
				RdAddr (15 downto  0)	<= S;
				nextSt						<= stLw;
			end if;

		when stSw =>
			if WrDone = '1' then
				PCwr		<= PC + 2;
				PCwrEn	<= '1';
				nextSt	<= stPCtoSRAM;
			else
				RegA							<= regInt (12 downto 10);
				AluA							<= A;
				ctrl							<=	"0000";
				ALuB   (15 downto  7)	<= (others => regInt (6));
				AluB   (6  downto  0)	<=	regInt (6  downto  0);
				WrAddr (17 downto 16)	<= (others => '0');
				WrAddr (15 downto  0)	<= S;
				RegB							<=	regInt (9  downto 7);
				Din							<=	B;
				nextSt						<=	stSw;
			end if;

		when stJal =>
			if WrDone = '1' then
				RegA						<= "111";
				RegBusW					<=	A - 2;
				RegWrEn					<= '1';
				RegW						<= "111";
				PCwr (15 downto 13)	<=	PC 		(15 downto 13);
				PCwr (12 downto  0)	<=	regInt 	(12 downto 0);
				PCwrEn					<= '1';
				nextSt					<= stPCtoSRAM;
			else
				Din							<= PC + 2;
				WrAddr (17 downto 16)	<= "00";
				WrAddr (15 downto  0)	<= A;
				RegA							<= "111";
				nextSt						<= stJal;
			end if;

		when stJr =>
			if RdDone = '1' then
				PCwr		<= Dout;
				PCwrEn	<= '1';
				nextSt	<= stPCtoSRAM;
			else
				RdAddr (17 downto 16)	<= "00";
				RdAddr (15 downto  0)	<= A;
				RegA							<= "111";
				nextSt						<= stJr;
			end if;

		when done =>
				zfin <= '1';
				nextSt <= done;

		end case;

	end process;

end Behavioral;
