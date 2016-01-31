library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity wralutosram is
    Port ( CLK : in std_logic;
           RESETN : in std_logic;
           WRITE : in std_logic;
           READ : in std_logic;
           DATAIN : in std_logic_vector(15 downto 0);
           DOREAD : out std_logic;
           DOWRITE : out std_logic;
           READADDR : out std_logic_vector(18 downto 0);
           WRITEADDR : out std_logic_vector(18 downto 0);
           READDATA : in std_logic_vector(15 downto 0);
           WRITEDATA : out std_logic_vector(15 downto 0);
           CANREAD : in std_logic;
           CANWRITE : in std_logic;
           STATEOUTPUT : out std_logic_vector(3 downto 0));
end wralutosram;

architecture Behavioral of wralutosram is

	signal asyncInputs : STD_LOGIC_VECTOR(6 downto 0);
	signal syncInputs1, syncInputs2,	syncInputs3 : STD_LOGIC_VECTOR(6 downto 0);
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


end Behavioral;
