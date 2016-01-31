library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity OF_detect is
    Port ( A : in std_logic_vector(15 downto 0);
           B : in std_logic_vector(15 downto 0);
           result : in std_logic_vector(15 downto 0);
			  control: in std_logic_vector(3 downto 0);
           overflow : out std_logic);
end OF_detect;

architecture Behavioral of OF_detect is

begin

	process(A, B, result) begin

		overflow <= '0';

		if (control = "0000" and A(15)='0'  and B(15)='0' and result(15) = '1') then
			overflow <= '1';
		end if;

		if (control = "0000" and A(15)='1'  and B(15)='1' and result(15) = '0') then
			overflow <= '1';
		end if;

		if (control = "0001" and A(15)='0'  and B(15)='1' and result(15) = '1') then
			overflow <= '1';
		end if;

		if (control = "0001" and A(15)='1'  and B(15)='0' and result(15) = '0') then
			overflow <= '1';
		end if;

		if (control = "0100" and A="0111111111111111") then
			overflow <= '1';
		end if;

		if (control = "0101" and A="1000000000000000") then
			overflow <= '1';
		end if;

	end process;

end Behavioral;
