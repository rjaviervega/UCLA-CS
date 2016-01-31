
-- VHDL Test Bench Created from source file memoryread.vhd -- 10:17:42 07/16/2004
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

	COMPONENT memoryread
	PORT(
		CLK : IN std_logic;
		Reset : IN std_logic;
		IssueRead : IN std_logic;
		CanRead : IN std_logic;          
		DoRead : OUT std_logic;
		ReadDone : OUT std_logic
		);
	END COMPONENT;

	SIGNAL CLK :  std_logic;
	SIGNAL Reset :  std_logic;
	SIGNAL IssueRead :  std_logic;
	SIGNAL DoRead :  std_logic;
	SIGNAL CanRead :  std_logic;
	SIGNAL ReadDone :  std_logic;
	CONSTANT ClockPeriod: Time:=20 ns;

BEGIN

	uut: memoryread PORT MAP(
		CLK => CLK,
		Reset => Reset,
		IssueRead => IssueRead,
		DoRead => DoRead,
		CanRead => CanRead,
		ReadDone => ReadDone
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
	Reset<='0';
	IssueRead<='0';
	DoRead<='0';
	ReadDone<='0';
	CanRead<='1';
	wait for 20 ns;
	Reset<='1';
	wait for 100 ns;
	IssueRead<='1';
	wait for 20 ns;
	IssueRead<='0';
	wait for 20 ns;
	CanRead <= '0';
	wait for 60 ns;
	CanRead<='1';
	wait for 1000 ns;
end process;

end behavior;


-- *** End Test Bench - User Defined Section ***

END;
