library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity maptoseg is
    Port ( Q : in std_logic_vector(3 downto 0);
           Lhex : out std_logic_vector(6 downto 0));
end maptoseg;

architecture Behavioral of maptoseg is

begin

with q select lhex <= "1110111" when x"0",
							 "0010010" when x"1",
							 "1011101" when x"2",
							 "1011011" when x"3",
							 "0111010" when x"4",
							 "1101011" when x"5",
							 "1101111" when x"6",
							 "1010010" when x"7",
							 "1111111" when x"8",
							 "1111010" when x"9",
							 "0000000" when others;

end Behavioral;
