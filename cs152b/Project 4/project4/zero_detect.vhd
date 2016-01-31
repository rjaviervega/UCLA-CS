library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zero_detect is
    Port ( bit_string : in std_logic_vector(15 downto 0);
	        opCode: in std_logic_vector(3 downto 0);
           isZero : out std_logic);
end zero_detect;

architecture Behavioral of zero_detect is

begin

	process ( bit_string ) begin

		isZero <= '0';

		if (opCode = "1011" or opCode = "0111") then

			if (bit_