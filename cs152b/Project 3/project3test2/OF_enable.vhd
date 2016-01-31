library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity OF_enable is
    Port ( control : in std_logic_vector(3 downto 0);
           enable : out std_logic);
end OF_enable;

architecture Behavioral of OF_enable is

begin

	process (control) begin

	enable <= '1';

	if (control="0010" or control="0011" or control="0110" or control="1001") then
		enable <= '0';
	end if;

	end process;
	
end Behavioral;
