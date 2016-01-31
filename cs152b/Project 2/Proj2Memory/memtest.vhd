
-- VHDL Test Bench Created from source file memorymodule.vhd -- 10:01:55 07/16/2004
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT memorymodule
	PORT(
		RdAddr : IN std_logic_vector(17 downto 0);
		WrAddr : IN std_logic_vector(17 downto 0);
		Din : IN std_logic_vector(15 downto 0);
		MemRd : IN std_logic;
		MemWr : IN std_logic;
		ResetL : IN std_logic;
		clk : IN std_logic;
		ppdata : IN std_logic_vector(7 downto 0);    
		ldata : INOUT std_logic_vector(15 downto 0);      
		Dout : OUT std_logic_vector(15 downto 0);
		RdDone : OUT std_logic;
		WrDone : OUT std_logic;
		ppstatus : OUT std_logic_vector(6 downto 3);
		lcen : OUT std_logic;
		loen : OUT std_logic;
		lwen : OUT std_logic;
		laddr : OUT std_logic_vector(18 downto 0)
		);
	END COMPONENT;

	SIGNAL RdAddr :  std_logic_vector(17 downto 0);
	SIGNAL WrAddr :  std_logic_vector(17 downto 0);
	SIGNAL Din :  std_logic_vector(15 downto 0);
	SIGNAL MemRd :  std_logic;
	SIGNAL MemWr :  std_logic;
	SIGNAL ResetL :  std_logic;
	SIGNAL Dout :  std_logic_vector(15 downto 0);
	SIGNAL RdDone :  std_logic;
	SIGNAL WrDone :  std_logic;
	SIGNAL clk :  std_logic;
	SIGNAL ppdata :  std_logic_vector(7 downto 0);
	SIGNAL ppstatus :  std_logic_vector(6 downto 3);
	SIGNAL lcen :  std_logic;
	SIGNAL loen :  std_logic;
	SIGNAL lwen :  std_logic;
	SIGNAL ldata :  std_logic_vector(15 downto 0);
	SIGNAL laddr :  std_logic_vector(18 downto 0);
	CONSTANT ClockPeriod: Time:=20 ns;

BEGIN

	uut: memorymodule PORT MAP(
		RdAddr => RdAddr,
		WrAddr => WrAddr,
		Din => Din,
		MemRd => MemRd,
		MemWr => MemWr,
		ResetL => ResetL,
		Dout => Dout,
		RdDone => RdDone,
		WrDone => WrDone,
		clk => clk,
		ppdata => ppdata,
		ppstatus => ppstatus,
		lcen => lcen,
		loen => loen,
		lwen => lwen,
		ldata => ldata,
		laddr => laddr
	);


-- *** Test Bench - User Defined Section ***

generateclock: process
	begin
		clk<='1';
	loop
		wait for (ClockPeriod/2);
		clk<=not clk;
	end loop;
end process;

stimulus: process
begin
	ResetL<='0';
	MemRd<='0';
	MemWr<='0';
	RdAddr<="000000000000000010";
	WrAddr<="000000000000000010";
	Din<="0000000000010101";
	ppdata<=(others=>'0');
	wait for 20 ns;
	ResetL<='1';
	wait for 100 ns;
	MemWr<='1';
	wait for 20 ns;
	MemWr<='0';
	wait for 100 ns;
	MemRd<='1';
	wait for 20 ns;
	MemRd<='0';
	wait for 1000 ns;
end process;

end behavior;


-- *** End Test Bench - User Defined Section ***

END;
