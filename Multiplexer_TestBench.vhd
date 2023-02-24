library ieee;
use ieee.std_logic_1164.all;
use work.CPU_Package.all;

entity Multiplexer_TestBench is

end entity;

architecture behave of Multiplexer_TestBench is
  
  component Multiplexer is
    port(
		sel       : in std_logic_vector(1 downto 0);	
	  data_in_3 : in data_word_type;
		data_in_2 : in data_word_type;
		data_in_1 : in data_word_type; -- potiential type problem...
		data_in_0 : in data_word_type;
		data_out  : out data_word_type
	);
	
	end component;
	  signal sel       :  std_logic_vector(1 downto 0):= (others => '0');
	  		signal data_in_3 : data_word_type;
		signal data_in_2 :  data_word_type;
		signal data_in_1 :  data_word_type; -- potiential type problem...
		signal data_in_0 :  data_word_type;
		signal data_out  :  data_word_type;
		
		begin
		  --port maping
		    DUT2: Multiplexer port map(sel, data_in_3, data_in_2, data_in_1, data_in_0, data_out);
		      process
		        begin
		          data_in_2 <= "0100";
		          data_in_1 <= "0010";
		          data_in_0 <= "0001"; 
		          data_in_3 <= "0011";
		          
		          sel <= "00";
		          wait for 5 ns;
		          sel <= "10";
		          wait for 5 ns;
		          sel <= "01";
		          wait for 5 ns;
		          sel <= "11";
		          wait for 5 ns;
		        end process;
		     -- process
		       -- begin
		         -- data_out <= data_in_0 <= when "00";
		         -- wait for 5 ns;
		         -- data_out <= data_in_1 <= when "01";
		         -- wait for 5 ns;
		         -- data_out <= data_in_2 <= when "10";
		         -- wait for 5 ns;
		   -- end process;
		end behave;
		          
		
		
	

