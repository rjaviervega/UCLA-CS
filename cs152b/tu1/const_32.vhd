library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity const_32 is
    Port ( const_out : out std_logic_vector(31 downto 0));
end const_32;

architecture Behavioral of const_32 is

begin

const_out <= x"02faf07e";

end Behavioral;
