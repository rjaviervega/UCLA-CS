-- Vhdl instantiation template created from schematic test.sch - Wed Jul 21 17:03:41 2004
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module.
-- 2) To use this template to instantiate this component, cut-and-paste and then edit.
--

   COMPONENT test
   PORT( clk	:	IN	STD_LOGIC; 
          reset	:	IN	STD_LOGIC; 
          finish	:	OUT	STD_LOGIC; 
          laddr	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          laddr16	:	OUT	STD_LOGIC; 
          laddr17	:	OUT	STD_LOGIC; 
          laddr18	:	OUT	STD_LOGIC; 
          lcen	:	OUT	STD_LOGIC; 
          ldata	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          loen	:	OUT	STD_LOGIC; 
          lwen	:	OUT	STD_LOGIC; 
          ppdata	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          ppstatus3	:	OUT	STD_LOGIC; 
          ppstatus4	:	OUT	STD_LOGIC; 
          ppstatus5	:	OUT	STD_LOGIC; 
          ppstatus6	:	OUT	STD_LOGIC; 
          state1	:	OUT	STD_LOGIC; 
          state2	:	OUT	STD_LOGIC; 
          state3	:	OUT	STD_LOGIC; 
          state4	:	OUT	STD_LOGIC);
   END COMPONENT;

   UUT: test PORT MAP(
		clk => , 
		reset => , 
		finish => , 
		laddr => , 
		laddr16 => , 
		laddr17 => , 
		laddr18 => , 
		lcen => , 
		ldata => , 
		loen => , 
		lwen => , 
		ppdata => , 
		ppstatus3 => , 
		ppstatus4 => , 
		ppstatus5 => , 
		ppstatus6 => , 
		state1 => , 
		state2 => , 
		state3 => , 
		state4 => 
   );
