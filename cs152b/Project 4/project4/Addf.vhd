library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Addfloat is
    Port ( 
	 		  A : in std_logic_vector(15 downto 0);
           B : in std_logic_vector(15 downto 0);
           S : out std_logic_vector(15 downto 0);
			  func	:	in	std_logic_vector ( 3 downto 0)
			);
end Addfloat;

architecture Behavioral of Addfloat is

signal	exponent			:	STD_LOGIC_VECTOR (3 DOWNTO 0);
signal	exponent1		:	STD_LOGIC_VECTOR (3 DOWNTO 0);
signal	exponent2		:	STD_LOGIC_VECTOR (3 DOWNTO 0);
signal	exponentA		:	STD_LOGIC_VECTOR (3 DOWNTO 0);
signal	exponentA2		:	STD_LOGIC_VECTOR (3 DOWNTO 0);
signal	exponentA3		:	STD_LOGIC_VECTOR (3 DOWNTO 0);
signal	exponentB		:	STD_LOGIC_VECTOR (3 DOWNTO 0);
signal	exponentB2		:	STD_LOGIC_VECTOR (3 DOWNTO 0);
signal	exponentB3		:	STD_LOGIC_VECTOR (3 DOWNTO 0);
signal	mantisaA0		:	STD_LOGIC_VECTOR (12 DOWNTO 0);
signal	mantisaA			:	STD_LOGIC_VECTOR (12 DOWNTO 0);
signal	mantisaA2		:	STD_LOGIC_VECTOR (12 DOWNTO 0);
signal	mantisaA3		:	STD_LOGIC_VECTOR (12 DOWNTO 0);
signal	mantisaB0		:	STD_LOGIC_VECTOR (12 DOWNTO 0);
signal	mantisaB			:	STD_LOGIC_VECTOR (12 DOWNTO 0);
signal	mantisaB2		:	STD_LOGIC_VECTOR (12 DOWNTO 0);
signal	mantisaB3		:	STD_LOGIC_VECTOR (12 DOWNTO 0);
signal	sum				:	STD_LOGIC_VECTOR (12 DOWNTO 0);
signal	sum1				:	STD_LOGIC_VECTOR (12 DOWNTO 0);
signal	sum2				:	STD_LOGIC_VECTOR (12 DOWNTO 0);
signal	sum3				:	STD_LOGIC_VECTOR (12 DOWNTO 0);
signal	signA				:	STD_LOGIC;
signal	signB3			:	STD_LOGIC;
signal	signB				:	STD_LOGIC;
signal	sign				:	STD_LOGIC;
signal	sign0				:	STD_LOGIC;
signal	signexpA			:	STD_LOGIC;
signal	signexpB			:	STD_LOGIC;
signal	shiftAB			:	STD_LOGIC; -- 0 shift A, else shift B


begin

	process (A, B, exponent, mantisaA0, mantisaB0, mantisaA, mantisaB, mantisaA2, mantisaB2, mantisaA3, mantisaB3, 
				sum, sum1, sum2, sum3, sign0, signB3, func)
	begin

		signA <= A (15);
		signB <= B (15); 

		exponentA <= 	A ( 14 DOWNTO 11 );
		exponentB <= 	B ( 14 DOWNTO 11 );

	
		-- Check for negative or possitive exponents
		if ( exponentA > "0111" ) then
			exponentA2 <= not exponentA;
			exponentA3 <= exponentA2 + 1;
			signexpA <= '1';
		else
			signexpA	<= '0';
		end if;
		if ( exponentB > "0111" ) then
			exponentB2 <= not exponentB;
			exponentB3 <= exponentB2 + 1;
			signexpB <= '1';
		else
			signexpB	<= '0';
		end if;
		--

		if ( signexpA = '0' and signexpB = '0' ) then
			if ( exponentA > exponentB ) then
				exponent <= exponentA - exponentB;
				shiftAB <= '1';
				exponent1 <= exponentA;
			elsif ( exponentA < exponentB) then
				exponent <= exponentB - exponentA;
				shiftAB <= '0';
				exponent1 <= exponentB;
			else
				shiftAB	<=	'0';
				exponent	<=	"0000";
				exponent1 <= exponentB;
			end if;

		elsif ( signexpA = '1' and signexpB = '0' ) then
				shiftAB <= '0';
				exponent <= exponentA3 + exponentB;
				exponent1 <= exponentB;

		elsif ( signexpA = '0' and signexpB = '1' ) then
				shiftAB <= '1';
				exponent <= exponentA + exponentB3;
				exponent1 <= exponentA;

		else	--( signexpA = '1' and signexpB = '1' )--
			if ( exponentA3 > exponentB3 ) then
				shiftAB <= '0';
				exponent <= exponentA3 - exponentB3;
				exponent1 <= exponentB;
			elsif ( exponentA3 < exponentB3) then
				shiftAB <= '1';
				exponent <= exponentB3 - exponentA3;
				exponent1 <= exponentA;
			else
				shiftAB	<=	'0';
				exponent	<=	"0000";
				exponent1 <= exponentB;
			end if;

		end if;

		mantisaA0(12)	<= '0';
		mantisaA0(11)	<= '1';
		mantisaA0(10 downto 0) <= 	A ( 10 DOWNTO 0 );
		mantisaB0(12)	<= '0';
		mantisaB0(11)	<= '1';
		mantisaB0(10 downto 0) <= 	B ( 10 DOWNTO 0 );

		if ( shiftAB = '1' ) then

			mantisaA	<=	mantisaA0;

			if (exponent = "0001") then
				mantisaB(12)	<=	'0';
				mantisaB(11)	<=	mantisaB0(12);
				mantisaB(10)	<=	mantisaB0(11);
				mantisaB(9)		<=	mantisaB0(10);
				mantisaB(8)		<=	mantisaB0(9);
				mantisaB(7)		<=	mantisaB0(8);
				mantisaB(6)		<=	mantisaB0(7);
				mantisaB(5)		<=	mantisaB0(6);
				mantisaB(4)		<=	mantisaB0(5);
				mantisaB(3)		<=	mantisaB0(4);
				mantisaB(2)		<=	mantisaB0(3);
				mantisaB(1)		<=	mantisaB0(2);
				mantisaB(0)		<=	mantisaB0(1);
			elsif (exponent = "0010") then
				mantisaB(12)	<=	'0';
				mantisaB(11)	<=	'0';
				mantisaB(10)	<=	mantisaB0(12);
				mantisaB(9)		<=	mantisaB0(11);
				mantisaB(8)		<=	mantisaB0(10);
				mantisaB(7)		<=	mantisaB0(9);
				mantisaB(6)		<=	mantisaB0(8);
				mantisaB(5)		<=	mantisaB0(7);
				mantisaB(4)		<=	mantisaB0(6);
				mantisaB(3)		<=	mantisaB0(5);
				mantisaB(2)		<=	mantisaB0(4);
				mantisaB(1)		<=	mantisaB0(3);
				mantisaB(0)		<=	mantisaB0(2);
			elsif (exponent = "0011") then
				mantisaB(12)	<=	'0';
				mantisaB(11)	<=	'0';
				mantisaB(10)	<=	'0';
				mantisaB(9)		<=	mantisaB0(12);
				mantisaB(8)		<=	mantisaB0(11);
				mantisaB(7)		<=	mantisaB0(10);
				mantisaB(6)		<=	mantisaB0(9);
				mantisaB(5)		<=	mantisaB0(8);
				mantisaB(4)		<=	mantisaB0(7);
				mantisaB(3)		<=	mantisaB0(6);
				mantisaB(2)		<=	mantisaB0(5);
				mantisaB(1)		<=	mantisaB0(4);
				mantisaB(0)		<=	mantisaB0(3);
			elsif (exponent = "0100") then
				mantisaB(12)	<=	'0';
				mantisaB(11)	<=	'0';
				mantisaB(10)	<=	'0';
				mantisaB(9)		<=	'0';
				mantisaB(8)		<=	mantisaB0(12);
				mantisaB(7)		<=	mantisaB0(11);
				mantisaB(6)		<=	mantisaB0(10);
				mantisaB(5)		<=	mantisaB0(9);
				mantisaB(4)		<=	mantisaB0(8);
				mantisaB(3)		<=	mantisaB0(7);
				mantisaB(2)		<=	mantisaB0(6);
				mantisaB(1)		<=	mantisaB0(5);
				mantisaB(0)		<=	mantisaB0(4);
			elsif (exponent = "0101") then
				mantisaB(12)	<=	'0';
				mantisaB(11)	<=	'0';
				mantisaB(10)	<=	'0';
				mantisaB(9)		<=	'0';
				mantisaB(8)		<=	'0';
				mantisaB(7)		<=	mantisaB0(12);
				mantisaB(6)		<=	mantisaB0(11);
				mantisaB(5)		<=	mantisaB0(10);
				mantisaB(4)		<=	mantisaB0(9);
				mantisaB(3)		<=	mantisaB0(8);
				mantisaB(2)		<=	mantisaB0(7);
				mantisaB(1)		<=	mantisaB0(6);
				mantisaB(0)		<=	mantisaB0(5);
			elsif (exponent = "0110") then
				mantisaB(12)	<=	'0';
				mantisaB(11)	<=	'0';
				mantisaB(10)	<=	'0';
				mantisaB(9)		<=	'0';
				mantisaB(8)		<=	'0';
				mantisaB(7)		<=	'0';
				mantisaB(6)		<=	mantisaB0(12);
				mantisaB(5)		<=	mantisaB0(11);
				mantisaB(4)		<=	mantisaB0(10);
				mantisaB(3)		<=	mantisaB0(9);
				mantisaB(2)		<=	mantisaB0(8);
				mantisaB(1)		<=	mantisaB0(7);
				mantisaB(0)		<=	mantisaB0(6);
			elsif (exponent = "0111") then
				mantisaB(12)	<=	'0';
				mantisaB(11)	<=	'0';
				mantisaB(10)	<=	'0';
				mantisaB(9)		<=	'0';
				mantisaB(8)		<=	'0';
				mantisaB(7)		<=	'0';
				mantisaB(6)		<=	'0';
				mantisaB(5)		<=	mantisaB0(12);
				mantisaB(4)		<=	mantisaB0(11);
				mantisaB(3)		<=	mantisaB0(10);
				mantisaB(2)		<=	mantisaB0(9);
				mantisaB(1)		<=	mantisaB0(8);
				mantisaB(0)		<=	mantisaB0(7);
			elsif (exponent = "1000") then
				mantisaB(12)	<=	'0';
				mantisaB(11)	<=	'0';
				mantisaB(10)	<=	'0';
				mantisaB(9)		<=	'0';
				mantisaB(8)		<=	'0';
				mantisaB(7)		<=	'0';
				mantisaB(6)		<=	'0';
				mantisaB(5)		<=	'0';
				mantisaB(4)		<=	mantisaB0(12);
				mantisaB(3)		<=	mantisaB0(11);
				mantisaB(2)		<=	mantisaB0(10);
				mantisaB(1)		<=	mantisaB0(9);
				mantisaB(0)		<=	mantisaB0(8);
			elsif (exponent = "1001") then
				mantisaB(12)	<=	'0';
				mantisaB(11)	<=	'0';
				mantisaB(10)	<=	'0';
				mantisaB(9)		<=	'0';
				mantisaB(8)		<=	'0';
				mantisaB(7)		<=	'0';
				mantisaB(6)		<=	'0';
				mantisaB(5)		<=	'0';
				mantisaB(4)		<=	'0';
				mantisaB(3)		<=	mantisaB0(12);
				mantisaB(2)		<=	mantisaB0(11);
				mantisaB(1)		<=	mantisaB0(10);
				mantisaB(0)		<=	mantisaB0(9);
			elsif (exponent = "1010") then
				mantisaB(12)	<=	'0';
				mantisaB(11)	<=	'0';
				mantisaB(10)	<=	'0';
				mantisaB(9)		<=	'0';
				mantisaB(8)		<=	'0';
				mantisaB(7)		<=	'0';
				mantisaB(6)		<=	'0';
				mantisaB(5)		<=	'0';
				mantisaB(4)		<=	'0';
				mantisaB(3)		<=	'0';
				mantisaB(2)		<=	mantisaB0(12);
				mantisaB(1)		<=	mantisaB0(11);
				mantisaB(0)		<=	mantisaB0(10);
			elsif (exponent = "1011") then
				mantisaB(12)	<=	'0';
				mantisaB(11)	<=	'0';
				mantisaB(10)	<=	'0';
				mantisaB(9)		<=	'0';
				mantisaB(8)		<=	'0';
				mantisaB(7)		<=	'0';
				mantisaB(6)		<=	'0';
				mantisaB(5)		<=	'0';
				mantisaB(4)		<=	'0';
				mantisaB(3)		<=	'0';
				mantisaB(2)		<=	'0';
				mantisaB(1)		<=	mantisaB0(12);
				mantisaB(0)		<=	mantisaB0(11);
			elsif (exponent = "1100") then
				mantisaB(12)	<=	'0';
				mantisaB(11)	<=	'0';
				mantisaB(10)	<=	'0';
				mantisaB(9)		<=	'0';
				mantisaB(8)		<=	'0';
				mantisaB(7)		<=	'0';
				mantisaB(6)		<=	'0';
				mantisaB(5)		<=	'0';
				mantisaB(4)		<=	'0';
				mantisaB(3)		<=	'0';
				mantisaB(2)		<=	'0';
				mantisaB(1)		<=	'0';
				mantisaB(0)		<=	mantisaB0(12);
			else
				mantisaB(12)	<=	'0';
				mantisaB(11)	<=	'0';
				mantisaB(10)	<=	'0';
				mantisaB(9)		<=	'0';
				mantisaB(8)		<=	'0';
				mantisaB(7)		<=	'0';
				mantisaB(6)		<=	'0';
				mantisaB(5)		<=	'0';
				mantisaB(4)		<=	'0';
				mantisaB(3)		<=	'0';
				mantisaB(2)		<=	'0';
				mantisaB(1)		<=	'0';
				mantisaB(0)		<=	'0';
			end if;

		else
			mantisaB	<=	mantisaB0;
	
			if (exponent = "0000") then
				mantisaA			<=	mantisaA0;
			elsif (exponent = "0001") then
				mantisaA(12)	<=	'0';
				mantisaA(11)	<=	mantisaA0(12);
				mantisaA(10)	<=	mantisaA0(11);
				mantisaA(9)		<=	mantisaA0(10);
				mantisaA(8)		<=	mantisaA0(9);
				mantisaA(7)		<=	mantisaA0(8);
				mantisaA(6)		<=	mantisaA0(7);
				mantisaA(5)		<=	mantisaA0(6);
				mantisaA(4)		<=	mantisaA0(5);
				mantisaA(3)		<=	mantisaA0(4);
				mantisaA(2)		<=	mantisaA0(3);
				mantisaA(1)		<=	mantisaA0(2);
				mantisaA(0)		<=	mantisaA0(1);
			elsif (exponent = "0010") then
				mantisaA(12)	<=	'0';
				mantisaA(11)	<=	'0';
				mantisaA(10)	<=	mantisaA0(12);
				mantisaA(9)		<=	mantisaA0(11);
				mantisaA(8)		<=	mantisaA0(10);
				mantisaA(7)		<=	mantisaA0(9);
				mantisaA(6)		<=	mantisaA0(8);
				mantisaA(5)		<=	mantisaA0(7);
				mantisaA(4)		<=	mantisaA0(6);
				mantisaA(3)		<=	mantisaA0(5);
				mantisaA(2)		<=	mantisaA0(4);
				mantisaA(1)		<=	mantisaA0(3);
				mantisaA(0)		<=	mantisaA0(2);
			elsif (exponent = "0011") then
				mantisaA(12)	<=	'0';
				mantisaA(11)	<=	'0';
				mantisaA(10)	<=	'0';
				mantisaA(9)		<=	mantisaA0(12);
				mantisaA(8)		<=	mantisaA0(11);
				mantisaA(7)		<=	mantisaA0(10);
				mantisaA(6)		<=	mantisaA0(9);
				mantisaA(5)		<=	mantisaA0(8);
				mantisaA(4)		<=	mantisaA0(7);
				mantisaA(3)		<=	mantisaA0(6);
				mantisaA(2)		<=	mantisaA0(5);
				mantisaA(1)		<=	mantisaA0(4);
				mantisaA(0)		<=	mantisaA0(3);
			elsif (exponent = "0100") then
				mantisaA(12)	<=	'0';
				mantisaA(11)	<=	'0';
				mantisaA(10)	<=	'0';
				mantisaA(9)		<=	'0';
				mantisaA(8)		<=	mantisaA0(12);
				mantisaA(7)		<=	mantisaA0(11);
				mantisaA(6)		<=	mantisaA0(10);
				mantisaA(5)		<=	mantisaA0(9);
				mantisaA(4)		<=	mantisaA0(8);
				mantisaA(3)		<=	mantisaA0(7);
				mantisaA(2)		<=	mantisaA0(6);
				mantisaA(1)		<=	mantisaA0(5);
				mantisaA(0)		<=	mantisaA0(4);
			elsif (exponent = "0101") then
				mantisaA(12)	<=	'0';
				mantisaA(11)	<=	'0';
				mantisaA(10)	<=	'0';
				mantisaA(9)		<=	'0';
				mantisaA(8)		<=	'0';
				mantisaA(7)		<=	mantisaA0(12);
				mantisaA(6)		<=	mantisaA0(11);
				mantisaA(5)		<=	mantisaA0(10);
				mantisaA(4)		<=	mantisaA0(9);
				mantisaA(3)		<=	mantisaA0(8);
				mantisaA(2)		<=	mantisaA0(7);
				mantisaA(1)		<=	mantisaA0(6);
				mantisaA(0)		<=	mantisaA0(5);
			elsif (exponent = "0110") then
				mantisaA(12)	<=	'0';
				mantisaA(11)	<=	'0';
				mantisaA(10)	<=	'0';
				mantisaA(9)		<=	'0';
				mantisaA(8)		<=	'0';
				mantisaA(7)		<=	'0';
				mantisaA(6)		<=	mantisaA0(12);
				mantisaA(5)		<=	mantisaA0(11);
				mantisaA(4)		<=	mantisaA0(10);
				mantisaA(3)		<=	mantisaA0(9);
				mantisaA(2)		<=	mantisaA0(8);
				mantisaA(1)		<=	mantisaA0(7);
				mantisaA(0)		<=	mantisaA0(6);
			elsif (exponent = "0111") then
				mantisaA(12)	<=	'0';
				mantisaA(11)	<=	'0';
				mantisaA(10)	<=	'0';
				mantisaA(9)		<=	'0';
				mantisaA(8)		<=	'0';
				mantisaA(7)		<=	'0';
				mantisaA(6)		<=	'0';
				mantisaA(5)		<=	mantisaA0(12);
				mantisaA(4)		<=	mantisaA0(11);
				mantisaA(3)		<=	mantisaA0(10);
				mantisaA(2)		<=	mantisaA0(9);
				mantisaA(1)		<=	mantisaA0(8);
				mantisaA(0)		<=	mantisaA0(7);
			elsif (exponent = "1000") then
				mantisaA(12)	<=	'0';
				mantisaA(11)	<=	'0';
				mantisaA(10)	<=	'0';
				mantisaA(9)		<=	'0';
				mantisaA(8)		<=	'0';
				mantisaA(7)		<=	'0';
				mantisaA(6)		<=	'0';
				mantisaA(5)		<=	'0';
				mantisaA(4)		<=	mantisaA0(12);
				mantisaA(3)		<=	mantisaA0(11);
				mantisaA(2)		<=	mantisaA0(10);
				mantisaA(1)		<=	mantisaA0(9);
				mantisaA(0)		<=	mantisaA0(8);
			elsif (exponent = "1001") then
				mantisaA(12)	<=	'0';
				mantisaA(11)	<=	'0';
				mantisaA(10)	<=	'0';
				mantisaA(9)		<=	'0';
				mantisaA(8)		<=	'0';
				mantisaA(7)		<=	'0';
				mantisaA(6)		<=	'0';
				mantisaA(5)		<=	'0';
				mantisaA(4)		<=	'0';
				mantisaA(3)		<=	mantisaA0(12);
				mantisaA(2)		<=	mantisaA0(11);
				mantisaA(1)		<=	mantisaA0(10);
				mantisaA(0)		<=	mantisaA0(9);
			elsif (exponent = "1010") then
				mantisaA(12)	<=	'0';
				mantisaA(11)	<=	'0';
				mantisaA(10)	<=	'0';
				mantisaA(9)		<=	'0';
				mantisaA(8)		<=	'0';
				mantisaA(7)		<=	'0';
				mantisaA(6)		<=	'0';
				mantisaA(5)		<=	'0';
				mantisaA(4)		<=	'0';
				mantisaA(3)		<=	'0';
				mantisaA(2)		<=	mantisaA0(12);
				mantisaA(1)		<=	mantisaA0(11);
				mantisaA(0)		<=	mantisaA0(10);
			elsif (exponent = "1011") then
				mantisaA(12)	<=	'0';
				mantisaA(11)	<=	'0';
				mantisaA(10)	<=	'0';
				mantisaA(9)		<=	'0';
				mantisaA(8)		<=	'0';
				mantisaA(7)		<=	'0';
				mantisaA(6)		<=	'0';
				mantisaA(5)		<=	'0';
				mantisaA(4)		<=	'0';
				mantisaA(3)		<=	'0';
				mantisaA(2)		<=	'0';
				mantisaA(1)		<=	mantisaA0(12);
				mantisaA(0)		<=	mantisaA0(11);
			elsif (exponent = "1100") then
				mantisaA(12)	<=	'0';
				mantisaA(11)	<=	'0';
				mantisaA(10)	<=	'0';
				mantisaA(9)		<=	'0';
				mantisaA(8)		<=	'0';
				mantisaA(7)		<=	'0';
				mantisaA(6)		<=	'0';
				mantisaA(5)		<=	'0';
				mantisaA(4)		<=	'0';
				mantisaA(3)		<=	'0';
				mantisaA(2)		<=	'0';
				mantisaA(1)		<=	'0';
				mantisaA(0)		<=	mantisaA0(12);
			else
				mantisaA(12)	<=	'0';
				mantisaA(11)	<=	'0';
				mantisaA(10)	<=	'0';
				mantisaA(9)		<=	'0';
				mantisaA(8)		<=	'0';
				mantisaA(7)		<=	'0';
				mantisaA(6)		<=	'0';
				mantisaA(5)		<=	'0';
				mantisaA(4)		<=	'0';
				mantisaA(3)		<=	'0';
				mantisaA(2)		<=	'0';
				mantisaA(1)		<=	'0';
				mantisaA(0)		<=	'0';
			end if;
		end if;


		if (signA = '1') then
			mantisaA2	<= not mantisaA;
			mantisaA3(11 downto 0)	<= mantisaA2(11 downto 0)	+ 1;
			mantisaA3(12)				<= '0';
		else
			mantisaA3	<=	mantisaA;
		end if;


		-- determine adding a positive number or a negative number in the cases of add and subtract
		if (signB = '1' and func = "1011") then
			signB3		<= '0';
			mantisaB3	<= mantisaB;
		elsif	(signB = '1' and func = "0111") then
			signB3		<= '1';
			mantisaB2	<= not mantisaB;
			mantisaB3(11 downto 0)	<= mantisaB2(11 downto 0) + 1;
			mantisaB3(12)				<= '0';
		elsif	(signB = '0' and func = "0111") then
			signB3		<= '0';
			mantisaB3	<= mantisaB;
		elsif (signB = '0' and func = "1011") then
			signB3		<= '1';
			mantisaB2	<= not mantisaB;
			mantisaB3(11 downto 0)	<= mantisaB2(11 downto 0)	+ 1;
			mantisaB3(12)				<= '0';
		end if;

		--	add number no matter add or subtract
		sum2	<= mantisaA3 + mantisaB3;


		--	determine the sign and mantisa for the result
		sign0 <=  signA XOR signB3;

		if (sum2(12) = '1' and sign0 = '1') then
			sign 					<= '0';
			sum(12)	 			<= '0';
			sum(11 downto 0)  <= sum2(11 downto 0);
		elsif (sum2(12) = '1' and sign0 = '0') then
			if (signA = '1') then 
				sign 					<= '1';
				sum3 					<= not sum2;
				sum(11 downto 0)	<= sum3(11 downto 0) + 1;
				sum(12)				<= '0';
			else
				sign					<=	'0';
				sum					<= sum2;
			end if;

		elsif (sum2(12) = '0' and sign0 = '0') then
			if (signA = '0') then
				sign 					<= signA;
				sum					<=	sum2;
			else
				sign 					<= '1';
				sum3 					<= not sum2;
				sum(11 downto 0)	<= sum3(11 downto 0) + 1;
				sum(12)				<= '0';
			end if;

		elsif (sum2(12) = '0' and sign0 = '1') then
			sign					<=	'1';
			sum3					<= not sum2;
			sum(11 downto 0)	<= sum3(11 downto 0) + 1;
			sum(12)				<= '0';
		end if;


		if (sum(12) = '1') then
			sum1(12)	<= '0';
			sum1(11)	<=	sum(12);
			sum1(10)	<=	sum(11);
			sum1(9)	<=	sum(10);
			sum1(8)	<=	sum(9);
			sum1(7)	<=	sum(8);
			sum1(6)	<=	sum(7);
			sum1(5)	<=	sum(6);
			sum1(4)	<=	sum(5);
			sum1(3)	<=	sum(4);
			sum1(2)	<=	sum(3);
			sum1(1)	<=	sum(2);
			sum1(0)	<=	sum(1);
			exponent2		<= exponent1 + 1;

		elsif	(sum(12 downto 11) = "01") then
			sum1	<=	sum;
			exponent2		<= exponent1;

		elsif	(sum(12 downto 10) = "001") then
			sum1(12)	<= sum(11);
			sum1(11)	<=	sum(10);
			sum1(10)	<=	sum(9);
			sum1(9)	<=	sum(8);
			sum1(8)	<=	sum(7);
			sum1(7)	<=	sum(6);
			sum1(6)	<=	sum(5);
			sum1(5)	<=	sum(4);
			sum1(4)	<=	sum(3);
			sum1(3)	<=	sum(2);
			sum1(2)	<=	sum(1);
			sum1(1)	<=	sum(0);
			sum1(0)	<=	'0';
			exponent2		<= exponent1 - 1;
	
		elsif	(sum(12 downto 9) = "0001") then
			sum1(12)	<= sum(10);
			sum1(11)	<=	sum(9);
			sum1(10)	<=	sum(8);
			sum1(9)	<=	sum(7);
			sum1(8)	<=	sum(6);
			sum1(7)	<=	sum(5);
			sum1(6)	<=	sum(4);
			sum1(5)	<=	sum(3);
			sum1(4)	<=	sum(2);
			sum1(3)	<=	sum(1);
			sum1(2)	<=	sum(0);
			sum1(1)	<=	'0';
			sum1(0)	<=	'0';
			exponent2		<= exponent1 - 2;

		elsif	(sum(12 downto 8) = "00001") then
			sum1(12)	<= sum(9);
			sum1(11)	<=	sum(8);
			sum1(10)	<=	sum(7);
			sum1(9)	<=	sum(6);
			sum1(8)	<=	sum(5);
			sum1(7)	<=	sum(4);
			sum1(6)	<=	sum(3);
			sum1(5)	<=	sum(2);
			sum1(4)	<=	sum(1);
			sum1(3)	<=	sum(0);
			sum1(2)	<=	'0';
			sum1(1)	<=	'0';
			sum1(0)	<=	'0';
			exponent2		<= exponent1 - 3;

		elsif	(sum(12 downto 7) = "000001") then
			sum1(12)	<= sum(8);
			sum1(11)	<=	sum(7);
			sum1(10)	<=	sum(6);
			sum1(9)	<=	sum(5);
			sum1(8)	<=	sum(4);
			sum1(7)	<=	sum(3);
			sum1(6)	<=	sum(2);
			sum1(5)	<=	sum(1);
			sum1(4)	<=	sum(0);
			sum1(3)	<=	'0';
			sum1(2)	<=	'0';
			sum1(1)	<=	'0';
			sum1(0)	<=	'0';
			exponent2		<= exponent1 - 4;

		elsif	(sum(12 downto 6) = "0000001") then
			sum1(12)	<= sum(7);
			sum1(11)	<=	sum(6);
			sum1(10)	<=	sum(5);
			sum1(9)	<=	sum(4);
			sum1(8)	<=	sum(3);
			sum1(7)	<=	sum(2);
			sum1(6)	<=	sum(1);
			sum1(5)	<=	sum(0);
			sum1(4)	<=	'0';
			sum1(3)	<=	'0';
			sum1(2)	<=	'0';
			sum1(1)	<=	'0';
			sum1(0)	<=	'0';
			exponent2		<= exponent1 - 5;

		elsif	(sum(12 downto 5) = "00000001") then
			sum1(12)	<= sum(6);
			sum1(11)	<=	sum(5);
			sum1(10)	<=	sum(4);
			sum1(9)	<=	sum(3);
			sum1(8)	<=	sum(2);
			sum1(7)	<=	sum(1);
			sum1(6)	<=	sum(0);
			sum1(5)	<=	'0';
			sum1(4)	<=	'0';
			sum1(3)	<=	'0';
			sum1(2)	<=	'0';
			sum1(1)	<=	'0';
			sum1(0)	<=	'0';
			exponent2		<= exponent1 - 6;

		elsif	(sum(12 downto 4) = "000000001") then
			sum1(12)	<= sum(5);
			sum1(11)	<=	sum(4);
			sum1(10)	<=	sum(3);
			sum1(9)	<=	sum(2);
			sum1(8)	<=	sum(1);
			sum1(7)	<=	sum(0);
			sum1(6)	<=	'0';
			sum1(5)	<=	'0';
			sum1(4)	<=	'0';
			sum1(3)	<=	'0';
			sum1(2)	<=	'0';
			sum1(1)	<=	'0';
			sum1(0)	<=	'0';
			exponent2		<= exponent1 - 7;

		elsif	(sum(12 downto 3) = "0000000001") then
			sum1(12)	<= sum(4);
			sum1(11)	<=	sum(3);
			sum1(10)	<=	sum(2);
			sum1(9)	<=	sum(1);
			sum1(8)	<=	sum(0);
			sum1(7)	<=	'0';
			sum1(6)	<=	'0';
			sum1(5)	<=	'0';
			sum1(4)	<=	'0';
			sum1(3)	<=	'0';
			sum1(2)	<=	'0';
			sum1(1)	<=	'0';
			sum1(0)	<=	'0';
			exponent2		<= exponent1 - 8;

		elsif	(sum(12 downto 2) = "00000000001") then
			sum1(12)	<= sum(3);
			sum1(11)	<=	sum(2);
			sum1(10)	<=	sum(1);
			sum1(9)	<=	sum(0);
			sum1(8)	<=	'0';
			sum1(7)	<=	'0';
			sum1(6)	<=	'0';
			sum1(5)	<=	'0';
			sum1(4)	<=	'0';
			sum1(3)	<=	'0';
			sum1(2)	<=	'0';
			sum1(1)	<=	'0';
			sum1(0)	<=	'0';
			exponent2		<= exponent1 - 9;

		elsif	(sum(12 downto 1) = "000000000001") then
			sum1(12)	<= sum(2);
			sum1(11)	<=	sum(1);
			sum1(10)	<=	sum(0);
			sum1(9)	<=	'0';
			sum1(8)	<=	'0';
			sum1(7)	<=	'0';
			sum1(6)	<=	'0';
			sum1(5)	<=	'0';
			sum1(4)	<=	'0';
			sum1(3)	<=	'0';
			sum1(2)	<=	'0';
			sum1(1)	<=	'0';
			sum1(0)	<=	'0';
			exponent2		<= exponent1 - 10;

		elsif	(sum(12 downto 0) = "0000000000001") then
			sum1(12)	<= sum(1);
			sum1(11)	<=	sum(0);
			sum1(10)	<=	'0';
			sum1(9)	<=	'0';
			sum1(8)	<=	'0';
			sum1(7)	<=	'0';
			sum1(6)	<=	'0';
			sum1(5)	<=	'0';
			sum1(4)	<=	'0';
			sum1(3)	<=	'0';
			sum1(2)	<=	'0';
			sum1(1)	<=	'0';
			sum1(0)	<=	'0';
			exponent2		<= exponent1 - 11;

		else	-- it is a zero
			sum1		<=	(others => '0');
			exponent2	<=	"1000";
			
		end if;

		-- handle zero +/- floating point numbers
		if (A = "0100000000000000" and func = "0111") then
			S	<= B;
		elsif (A = "01000000