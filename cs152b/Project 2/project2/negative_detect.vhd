library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity negative_detect is
    Port ( answer : in std_logic_vector(15 downto 0);
           control : in std_logic_vector(3 downto 0);
			  A_msb: in std_logic;
			  B_msb: in std_logic;
           S : out std_logic_vector(15 downto 0));
end negative_detect;

architecture Behavioral of negative_detect is

begin
	
	process (control, answer) begin

		S <= answer;

		if (control = "1001") then
	 		if ( answer(15) = '1' ) then
				S <= "0000000000000001";
			end if;
			
			if ( answer (15) = '0' ) then
 				S <= "0000000000000000";
			end if;
	
			if (A_msb = '1' and B_msb = '0') then
				S <= "0000000000000001";
			end if;
	
			if (A_msb = '0' and B_msb = '1') then
				S <= "0000000000000000";
			end if;

		end if;

	end process;

end Behavioral;
