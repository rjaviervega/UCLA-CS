en
			preSt		<= nextSt;
			ResetL 	<= '1';

			if (updateregInt = '1') then
				regInt <= Dout;
			else
				regInt <= regInt;
			end if;

			if (updateReg = '1') then
				tempReg <= regInt(12 downto 10);
			else
				tempReg	<= tempReg;
			end if;

		end if;

	end process;

	process (preSt, S, Start, Dout, PC, RdDone, regInt, A, B, WrDone, tempReg)
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
		updateReg			<= '0';

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


			-- addf "000...0111"
			elsif (regInt(15 downto 13) = "000" and regInt(3 downto 0) = "0111") then
				ctrl <= "0111";
				regA <= regInt(9 downto 7);
				regB <= regInt(6 downto 4);
				AluA <= A;
				AluB <= B;
				RegW <= regInt(12 downto 10);
				RegBusW <= S;
				RegWrEn <= '1';
				PCwr	<= PC + 2;
				PCwrEn	<= '1';
				nextSt	<= stPCtoSRAM;

			-- subf "000...1011"
			elsif (regInt(15 downto 13) = "000" and regInt(3 downto 0) = "1011") then
				ctrl <= "1011";
				regA <= regInt(9 downto 7);
				regB <= regInt(6 downto 4);
				AluA <= A;
				AluB <= B;
				RegW <= regInt(12 downto 10);
				RegBusW <= S;
				RegWrEn <= '1';
				PCwr	<= PC + 2;
				PCwrEn	<= '1';
				nextSt	<= stPCtoSRAM;

			-- sltf "111...1101"
			elsif (regInt(15 downto 13) = "111" and regInt(3 downto 0) = "1101") then
				ctrl <= "1011";
				regA <= regInt(9 downto 7);
				regB <= regInt(6 downto 4);
				AluA <= A;
				AluB <= B;
				
				-- treat resulting 1 and 0 as non floating point #
				if S(15) = '1' then
					RegW <= regInt(12 downto 10);
					RegBusW <= "0000000000000001";
					RegWrEn <= '1';
				else
					RegW <= regInt(12 downto 10);
					RegBusW <= "0000000000000000";
					RegWrEn <= '1';
				end if;
				PCwr	<= PC + 2;
				PCwrEn	<= '1';
				nextSt	<= stPCtoSRAM;

			-- regf "111...1100"
			elsif (regInt(15 downto 13) = "111" and regInt(3 downto 0) = "1100") then
				updateReg	<= '1';
				MemRd 	<= '1';
				RdAddr (17 downto 16) <= "00";
				RdAddr (15 downto 0)  <= PC + 2;
				nextSt	<= stRegf;


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

		when stRegf
			if RdDone = '1' then
				RegW <= tempReg;
				RegBusW <= Dout;
				RegWrEn <= '1';
				PCwr	<= PC + 4;
				PCwrEn	<= '1';
				nextSt	<= stPCtoSRAM;
			else
				RdAddr (17 downto 16) <= "00";
				RdAddr (15 downto 0)  <= PC + 2;
				nextSt	<=	stRegf;
			end if;

		when done =>
				zfin <= '