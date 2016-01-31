
-- VHDL Test Bench Created from source file memorywrite.vhd -- 12:04:50 07/16/2004
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

	COMPONENT memorywrite
	PORT(
		CLK : IN std_logic;
		Reset : IN std_logic;
		IssueWrite : IN std_logic;
		CanWrite : IN std_logic;          
		DoWrite : OUT std_logic;
		WriteDone : OUT std_logic
		);
	END COMPONENT;

	SIGNAL CLK :  std_logic;
	SIGNAL Reset :  std_logic;
	SIGNAL IssueWrite :  std_logic;
	SIGNAL CanWrite :  std_logic;
	SIGNAL DoWrite :  std_logic;
	SIGNAL WriteDone :  std_logic;
	CONSTANT ClockPeriod: Time:=20 ns;
BEGIN

	uut: memorywrite PORT MAP(
		CLK => CLK,
		Reset => Reset,
		IssueWrite => IssueWrite,
		CanWrite => CanWrite,
		DoWrite => DoWrite,
		WriteDone => WriteDone
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
	IssueWrite<='0';
	DoWrite<='0';
	WriteDone<='0';
	CanWrite<='1';
	wait for 20 ns;
	Reset<='1';
	wait for 100 ns;
	IssueWrite<='1';
	wait for 20 ns;
	IssueWrite<='0';
	wait for 20 ns;
	CanWrite <= '0';
	wait for 60 ns;
	CanWrite<='1';
	wait for 1000 ns;
end process;

end behavior;
-- *** End Test Bench - User Defined Section ***

END;
