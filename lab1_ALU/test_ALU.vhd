library work;
use work.CPU_package.all;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity test_ALU is
 PORT(  
      op : IN std_logic_vector(2 downto 0); 
       a : IN data_word_type;  
       b : IN data_word_type; 
       en : IN std_logic; 
       clk : IN std_logic; 
       Y : OUT data_word_type; -- bytte från Y till sum
      --diff  : OUT data_word_type;  -- bytte från Y till diff
       n_flag: OUT std_logic; 
       z_flag: OUT std_logic;  
       o_flag: OUT std_logic  
      );  
    end entity;
    
 --architecture   
Architecture RTL of test_ALU is   
constant ZERO: std_logic_vector(data_size-1 downto 0):= (others => '0'); --

begin
  process(op, a, b, clk)
    variable temp: std_logic_vector(data_size downto 0); --
    --signal temp: std_logic_vector(data_size downto 0);
    begin
      if en = '1' and rising_edge(clk) then
  case op is 
  when "000" =>
    temp := add_overflow(a, b);
    Y <= temp(temp'left-1 downto 0);
    
  when "001" =>
    temp := sub_overflow(a, b);
    Y <= temp(temp'left-1 downto 0);
 
  when "010" => Y <= a and b;
  when "011" => Y <= a or b;
  when "100" => Y <= a xor b;
  when "101" => Y <= not a;
 
  when others => Y <= a;
end case;
n_flag <=temp(temp'left-1);
if temp = ZERO then z_flag <= '1'; else z_flag <= '0'; end if;
  o_flag <= temp(temp'left) xor temp(temp'left-1) xor a(a'left) xor b(b'left);
end if;
end process;
 
end RTL; 
  
  