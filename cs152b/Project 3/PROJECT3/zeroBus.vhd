library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zeroBus is
    Port ( zero : out std_logic_vector(15 downto 0));
end zeroBus;

architecture Behavioral of zeroBus is

begin

	zero <= "0000000000000000";
	
end Behavioral;
