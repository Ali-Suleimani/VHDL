library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_arith.all;
--use IEEE.std_logic_signed.all;
use work.CPU_Package.all;
--library work;

entity RegisterFile_TestBench is
end entity;

architecture registerfile of RegisterFile_TestBench is
  
  component RegisterFile is
    port ( clk  : IN std_logic; 
    data_in     : IN data_word_type; 
    data_out_1  : OUT data_word_type; 
    data_out_0  : OUT data_word_type; 
    sel_in      : IN std_logic_vector (1 downto 0);   
    sel_out_1   : IN std_logic_vector (1 downto 0);   
    sel_out_0   : IN std_logic_vector (1 downto 0);  
    rw_reg      : IN std_logic
    ); 
     
end component;
-- signal declaration
signal clk        : std_logic:='1';
signal  data_in   : data_word_type;
signal data_out_1 : data_word_type;
signal data_out_0 : data_word_type;
signal sel_in     : std_logic_vector (1 downto 0) := ( others => '0');
signal sel_out_1  : std_logic_vector (1 downto 0) := ( others => '0');
signal sel_out_0  : std_logic_vector (1 downto 0) := ( others => '0');
signal rw_reg     : std_logic;

begin
  -- port maping
  DUT: RegisterFile port map (clk, data_in, data_out_1, data_out_0, sel_in, sel_out_1, sel_out_0, rw_reg);
     clk <= not clk after 5 ns;
     process
     begin
       -- write
       sel_in <= "00";
       data_in <= "0000";
       rw_reg <= '0';
       wait for 5 ns;
       
       sel_in <= "01";
       data_in <= "0001";
       rw_reg <= '0';
       wait for 5 ns;
       
       sel_in <= "10";
       data_in <= "0010";
       rw_reg <= '0';
       wait for 5 ns;
       
       sel_in <= "11";
       data_in <= "0011";
       rw_reg <= '0';
       wait for 5 ns;
       
       -- read
       rw_reg <= '1';
       sel_out_1 <= "00";
       sel_out_0 <= "00";
       wait for 5 ns;
       
       rw_reg <= '1';
       sel_out_1 <= "01";
       sel_out_0 <= "01";
       wait for 5 ns;
       
       rw_reg <= '1';
       sel_out_1 <= "10";
       sel_out_0 <= "10";
       wait for 5 ns;
       
       rw_reg <= '1';
       sel_out_1 <= "11";
       sel_out_0 <= "11";
       wait for 5 ns;
   end process;

 end registerfile; 
     
     
     
     
      
