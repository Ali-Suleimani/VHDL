library ieee;
use ieee.std_logic_1164.all;
use work.CPU_Package.all;


entity multiplexer is 
	port(
		sel       : in std_logic_vector(1 downto 0);	
		data_in_3 : in data_word_type;
		data_in_2 : in data_word_type;
		data_in_1 : in data_word_type; -- potiential type problem...
		data_in_0 : in data_word_type;
		data_out  : out data_word_type
		
	);
end entity;


architecture rtl of multiplexer is
	begin
	process(sel, data_in_2, data_in_1, data_in_0, data_in_3)
		begin
		case sel is
			when "00" => data_out <= data_in_0;
			when "01" => data_out <= data_in_1;
			when "10" => data_out <= data_in_2;
			when others => data_out <= data_in_3;
		end case;
	end process;
end architecture;