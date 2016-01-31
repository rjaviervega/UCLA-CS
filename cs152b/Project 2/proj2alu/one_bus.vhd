library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity one_bus is
    Port ( one : out std_logic_vector(15 downto 0));
end one_bus;

architecture Behavioral of one_bus is

begin

	one <= "0000000000000001";

end Behavioral;
