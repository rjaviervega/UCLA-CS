library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity detect_OF is
    Port ( A : in std_logic_vector(15 downto 0);
           B : in std_logic_vector(15 downto 0);
           control : in std_logic_vector(3 downto 0);
           overflow : out std_logic_vector(0 downto 0));
end detect_OF;

architecture Behavioral of detect_OF is

begin


end Behavioral;
