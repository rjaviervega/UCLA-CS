library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_unit is
    Port ( control : in std_logic_vector(3 downto 0);
           sel : out std_logic_vector(1 downto 0));
end control_unit;

architecture Behavioral of control_unit is

begin
	
	process (control) begin

		if (control = "0000" or control = "0001" or control = "0100" or control = "0101"
			or control = "0110" or control = "1001") then

			sel <= "11";

		end if;

		if (control = "0010" or control = "0011") then
				
			sel <= "10";

		end if;

		if (control = "1100" or control = "1110" or control = "1000" or control="1010") then
				
			sel <= "01";

		end if;


	end process;

end Behavioral;
