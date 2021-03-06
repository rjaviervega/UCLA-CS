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

		if (control = "1011" or control = "0111") then
				
			sel <= "00";

		end if;


	end process;

end Behavioral;
                                                                                                                                                                          COMPONENT Declaration ------ COMP_TAG
component buxmux16
	port (
	MA: IN std_logic_VECTOR(15 downto 0);
	MB: IN std_logic_VECTOR(15 downto 0);
	MC: IN std_logic_VECTOR(15 downto 0);
	MD: IN std_logic_VECTOR(15 downto 0);
	ME: IN std_logic_VECTOR(15 downto 0);
	MF: IN std_logic_VECTOR(15 downto 0);
	MG: IN std_logic_VECTOR(15 downto 0);
	MH: IN std_logic_VECTOR(15 downto 0);
	S: IN std_logic_VECTOR(2 downto 0);
	O: OUT std_logic_VECTOR(15 downto 0));
end component;

-- XST black box declaration
attribute box_type : string;
attribute box_type of buxmux16: component is "black_box";

-- FPGA Express Black Box declaration
attribute fpga_dont_touch: string;
attribute fpga_dont_touch of buxmux16: component is "true";

-- Synplicity black box declaration
attribute syn_black_box : boolean;
attribute syn_black_box of buxmux16: component is true;

-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net n## Auto generated by Project Navigator for Modelsim
vlib work

vcom -just e -93 -explicit   control_module.vhd
vcom -skip e -93 -explicit   control_module.vhd
## You need to generate your own stimuli
vsim -t 1ns -L xilinxcorelib ""   control_unit
view wave
add wave *
view structure
view signals
                                                                                                                                                                                                             d
-- instructions, please refer to the "Coregen Users Guide".

