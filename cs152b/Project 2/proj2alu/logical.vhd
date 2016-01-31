library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logical is
    Port ( A : in std_logic_vector(15 downto 0);
           B : in std_logic_vector(15 downto 0);
           control : in std_logic_vector(3 downto 0);
           logicalout : out std_logic_vector(15 downto 0));
end logical;

architecture Behavioral of logical is

begin

	process (A, B, control)
	begin
		IF control="0010" THEN
			logicalout <= A AND B;
		END IF;
		
		IF control="0011" THEN
			logicalout <= A OR B;
		END IF;
	end process;

end Behavioral;
