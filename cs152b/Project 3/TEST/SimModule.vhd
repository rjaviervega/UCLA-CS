library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SimModule is
    Port ( S : in std_logic_vector(15 downto 0);
           A : in std_logic_vector(15 downto 0);
           B : in std_logic_vector(15 downto 0);
           Dout : in std_logic_vector(15 downto 0);
           RegWrEn : out std_logic;
           RegBusW : out std_logic_vector(15 downto 0);
           RegA : out std_logic_vector(2 downto 0);
           RegB : out std_logic_vector(2 downto 0);
           RegW : out std_logic_vector(2 downto 0);
           AluA : out std_logic_vector(15 downto 0);
           AluB : out std_logic_vector(15 downto 0);
           control : out std_logic_vector(3 downto 0);
           MemRd : out std_logic;
           MemWr : out std_logic;
           ResetL : out std_logic;
           RdAddr : out std_logic_vector(17 downto 0);
           WrAddr : out std_logic_vector(17 downto 0);
           Din : out std_logic_vector(15 downto 0);
			  finish : out std_logic;
           CLK : in std_logic;
			  Reset : in std_logic;
			  WrDone : in std_logic;
			  RdDone	: in std_logic);
end SimModule;

architecture Behavioral of SimModule is

		type	 typeStateType is (  stStart, 
											);

		signal preState, nextState	:	typeStateType;

begin

	resetORset: process (CLK, Reset)
		begin
			if Reset = '0' then
				preState <= stStart;	
				ResetL <= '0';

			elsif CLK' event and CLK = '1' then
				preState <= nextState;
				ResetL <= '1';
			end if;
	end process resetorset;


	SimInstance: process (preState, S)
		
		begin

		--Default signal
           RegWrEn <= '0';
           RegBusW <= (others => '0');
           RegA <= (others => '0');
           RegB <= (others => '0');
           RegW <= (others => '0');
           AluA <= (others => '0');
           AluB <= (others => '0');
           control  <= (others => '0');
           MemRd <= '0';
           MemWr <= '0';
           RdAddr <= (others => '0');
           WrAddr <= (others => '0');
           Din <= (others => '0');
			  nextState <= stStart;
			  finish <= '0';

		case preState is
				when stStart => 
					NextState <= stFillRegisterFile1;


				when stFillRegisterFile1 =>
					RegWrEn <= '1';
					RegBusW <= "0000000000000001";
					RegW <= "001";
					nextState <= stFillRegisterFile2;
					

				when stFillRegisterFile2 =>
					RegWrEn <= '1';
					RegBusW <= "0000000000000010";
					RegW <= "010";
					nextState <= stFillRegisterFile3;

				when stFillRegisterFile3 =>
					RegWrEn <= '1';
					RegBusW <= "0000000000000011";
					RegW <= "011";
					nextState <= stFillRegisterFile4;

				when stFillRegisterFile4 =>
					RegWrEn <= '1';
					RegBusW <= "0000000000000100";
					RegW <= "100";
					nextState <= stFillRegisterFile5;

				when stFillRegisterFile5 =>
					RegWrEn <= '1';
					RegBusW <= "0000000000000101";
					RegW <= "101";
					nextState <= stFillRegisterFile6;

				when stFillRegisterFile6 =>
					RegWrEn <= '1';
					RegBusW <= "0000000000000110";
					RegW <= "110";
					nextState <= stFillRegisterFile7;

				when stFillRegisterFile7 =>
					RegWrEn <= '1';
					RegBusW <= "0000000000000111";
					RegW <= "111";
					nextState <= stAluRegOperation1;

				when stAluRegOperation1 =>
					RegA <= "011";
					RegB <= "101";
					ALUA <= A;
					ALUB <= B;
					control <= "0000";
					RegWrEn <= '1';
					RegW <= "110";
					RegBusW <= S;
					MemWr <= '1';
					Din <= S;
					WrAddr <= "000000000000000000";
					nextState <= stRegMemWrite1;

				when stRegMemWrite1 =>
					if WrDone = '1' then
						nextState <= stRegMemWrite2;
					else
						nextState <= stRegMemWrite1;
						Din <= S;
						WrAddr <= "000000000000000000";
						RegA <= "011";
						RegB <= "101";
						ALUA <= A;
						ALUB <= B;
						control <= "0000";
					end if;
					
				when stRegMemWrite2 =>
					RegA <= "111";
					MemWr <= '1';
					Din <= A;
					WrAddr <= "000000000000000010";
					nextState <= stRegMemWrite3;

				when stRegMemWrite3 =>
					if WrDone = '0' then
						RegA <= "111";
						Din <= A;
						WrAddr <= "000000000000000010";
						nextState <= stRegMemWrite3;
					else
						nextState <= stMemRead1;
					end if;

				when stMemRead1 =>
					MemRd <= '1';
					Rdaddr <= "000000000000000000";
					nextState <= stMemRead2;

				when stMemRead2 => 
					if RdDone <= '1' then
						nextState <= stmemtoreg;
					else
						nextState <= stMemRead2;
						Rdaddr <= "000000000000000000";
					end if;

				when stmemtoreg =>
					RegWrEn <= '1';
					RegBusW <= Dout;
					RegW <= "011";
					nextState <= stwrregtomem1;

				when stwrregtomem1 =>
					RegA <= "011";
					MemWr <= '1';
					Din <= A;
					WrAddr <= "000000000000001000";
					nextState <= stwrregtomem2;

				when stwrregtomem2 =>
					if WrDone = '0' then
						RegA <= "011";
						Din <= A;
						WrAddr <= "000000000000001000";
						nextState <= stwrregtomem2;
					else
						nextState <= secondaluop;
					end if;


				when secondaluop =>
					regA <= "011";
					regB <= "010";
					AluA <= A;
					AluB <= B;
					control <= "0001";
					MemWr <= '1';
					Din <= S;
					WrAddr <= "000000000000001010";
					nextState <= secondStoMem;

				when secondStoMem =>
					if WrDone = '1' then
						nextState <= done;
					else
						regA <= "011";
						regB <= "010";
						AluA <= A;
						AluB <= B;
						control <= "0001";
						Din <= S;
						WrAddr <= "000000000000001010";
						nextState <= secondStoMem;
					end if;

				when done =>
					finish <= '1';
					nextState <= done;

				when others =>
					nextState <= stStart;

			end case;
	end process SimInstance;


end Behavioral;
