library work;
use work.CPU_Package.all;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity ALU is
 PORT(  
      op : IN std_logic_vector(2 downto 0); 
       a : IN data_word_type;  
       b : IN data_word_type; 
       en : IN std_logic; 
       clk : IN std_logic; 
       y : OUT data_word_type; -- bqtte fr?n q till sum
       n_flag: OUT std_logic; 
       z_flag: OUT std_logic;  
       o_flag: OUT std_logic  
      );  
    end entity;
    
 --architecture   
Architecture RTL of ALU is  
signal add_overflow   : std_logic;
  signal sub_overflow   : std_logic;
  signal overflow       : std_logic; 
  signal q       : std_logic_vector(3 downto 0); 
  

constant ZERO: std_logic_vector(data_size-1 downto 0):= (others => '0'); --

begin
  process(op, a, b, clk,q   )
    variable temp: std_logic_vector(data_size downto 0); --

    begin
      if en = '1' and rising_edge(clk) then
      case op is 
         when "000" =>
           --temp := add_overflow(a, b);
           q <= a + b ;
    
        when "001" =>
          --temp := sub_overflow(a, b);
          q <= a - b;
 
        when "010" => q <= a and b;
        when "011" => q <= a or b;
        when "100" => q <= a xor b;
        when "110" => q <= not a;
 
        when others => q <= a;
    end case;
    
    if q = ZERO then z_flag <= '1'; else z_flag <= '0'; end if;
    --o_flag <= temp(temp'leftS-1) xor temp(temp'left) xor a(a'left-1) xor b(b'left);
  end if;
 end process;
 
 process(add_overflow,sub_overflow,OP)
  begin
    case OP is
      when "000" => overflow <= add_overflow;
      when "001" => overflow <= sub_overflow;
      when others => overflow <= '0';
      end case;
  end process;
  y <= q;
  O_Flag <= overflow;
  n_flag <= q(3);
  -- Overflow Combinational Logic
  add_overflow <= ( not(a(3)) and not(b(3)) and q(3) ) or  ( a(3) and b(3) and not(q(3)) ) ;
  sub_overflow <= ( not(a(3)) and b(3) and q(3) ) or ( a(3) and not(b(3)) and not(q(3)) );
 
end RTL; 
  
  