
-- VHDL Test Bench Created from source file userpctosramtoplevel.vhd -- 11:00:45 05/14/2002
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

	COMPONENT userpctosramtoplevel
	PORT(
		clk : IN std_logic;
		rstn : IN std_logic;
		ppdata : IN std_logic_vector(7 downto 0);
		dip : IN std_logic_vector(7 downto 1);    
		ldata : INOUT std_logic_vector(15 downto 0);      
		ppstatus : OUT std_logic_vector(6 downto 3);
		lcen : OUT std_logic;
		loen : OUT std_logic;
		lwen : OUT std_logic;
		laddr : OUT std_logic_vector(18 downto 0);
		bar : OUT std_logic_vector(9 downto 2)
		);
	END COMPONENT;

	SIGNAL clk :  std_logic;
	SIGNAL rstn :  std_logic;
	SIGNAL ppdata :  std_logic_vector(7 downto 0);
	SIGNAL ppstatus :  std_logic_vector(6 downto 3);
	SIGNAL lcen :  std_logic;
	SIGNAL loen :  std_logic;
	SIGNAL lwen :  std_logic;
	SIGNAL ldata :  std_logic_vector(15 downto 0);
	SIGNAL laddr :  std_logic_vector(18 downto 0);
	SIGNAL bar :  std_logic_vector(9 downto 2);
	SIGNAL dip :  std_logic_vector(7 downto 1);
	constant ClockPeriod : Time := 20 ns;

BEGIN

	uut: userpctosramtoplevel PORT MAP(
		clk => clk,
		rstn => rstn,
		ppdata => ppdata,
		ppstatus => ppstatus,
		lcen => lcen,
		loen => loen,
		lwen => lwen,
		ldata => ldata,
		laddr => laddr,
		bar => bar,
		dip => dip
	);


	generateclock: process
	begin
		clk <= '1';
	loop
		wait for (ClockPeriod / 2);
		clk <= not clk;
	end loop;  
end process;

stimulus: process
	begin
		rstn <= '0';
		ppdata <= x"00";
		ppstatus <= x"0";
		dip <= "1101010";
		wait for 20 ns;
		rstn <= '1';
 		wait for 100 ns;
		-- do a WRITE
		dip <= "1001010";
 		wait for 200 ns;
		dip <= "1100000";
  		wait for 5000 ns;

end process stimulus;

end behavior;



END;
