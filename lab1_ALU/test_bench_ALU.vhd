library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
library work;
use work.CPU_package.all;

entity test_bench_ALU is
end entity;

Architecture test of test_bench_ALU is 

-- component decalartion
component TEST_ALU is
 PORT(  
      op : IN std_logic_vector(2 downto 0); 
       a : IN data_word_type;  
       b : IN data_word_type; 
       en : IN std_logic; 
       clk : IN std_logic; 
       Y:  OUT data_word_type;
       --sum  : OUT data_word_type; 
      --diff  : OUT data_word_type; 
       n_flag: OUT std_logic; 
       z_flag: OUT std_logic;  
       o_flag: OUT std_logic  
      );  
    END component;
    -- signal decalaration
    constant N:integer:=4;
   -- signal sum:std_logic_vector(N-1 downto 0);     -- den var fr�n b�rjan
    --signal diff:std_logic_vector(N-1 downto 0);   __ den var fr�n b�rjan
    signal op :  std_logic_vector(2 downto 0):= (others => '0');
    signal a :  data_word_type := (others => '0');
    signal b :  data_word_type :=(others => '0');
    signal en: std_logic := '1';
    signal clk: std_logic :='0';
    --signal sum: data_word_type;   --gjorde fr�n Y till sum
    --signal diff: data_word_type;  -- gjorde fr�n Y till diff
    signal Y: data_word_type;
    signal n_flag: std_logic;
    signal z_flag: std_logic;
    signal o_flag: std_logic;
    signal add_overflow_check:std_logic_vector(2 downto 0);
    signal sub_overflow_check: std_logic_vector(2 downto 0);
    
begin
  -- port maping
 DUT : test_ALU port map (op, a, b, en, clk, Y, n_flag, z_flag, o_flag); --skrev diff och sum ist�llet f�r Y
     op(0) <= not op(0) after 160 ns;
     clk <= not clk after 5 ns;

  --  a(0) <= not a(0) after 10 ns;
   -- a(1) <= not a(1) after 20 ns;
   -- a(2) <= not a(2) after 40 ns;
   -- a(3) <= not a(3) after 80 ns;

   -- b(0) <= not b(0) after 80 ns;
   -- b(1) <= not b(1) after 10 ns;
   -- b(2) <= not b(2) after 20 ns;
   -- b(3) <= not b(3) after 40 ns; 
 
 process  --the automatic test bench
  begin
    for i in -8 to 7 loop
      for j in -8 to 7 loop
        a<=conv_std_logic_vector(integer(i),N);
        b<=conv_std_logic_vector(integer(j),N);
        wait for 1 ns;
        assert(Y=a+b) report "sum is not A+B" severity warning;    -- bytte fr�n Y till sum
        assert (Y=a-b) report"diff is not A-B" severity warning;  -- byte fr�n Y till diff
        assert not((add_overflow_check = "001") or (add_overflow_check = "110")) report "addition has overflow" severity note;
        assert not((sub_overflow_check = "011") or (sub_overflow_check = "100")) report "subtraction has an overflow" severity note;
        wait for 9 ns;
    end loop;
  end loop;
 -- wait;
end process;
        
 add_overflow_check<=a(N-1) & b(N-1) & Y(N-1);
 sub_overflow_check<=a(N-1) & b(N-1) & Y(N-1);
 --assert not((add_overflow_check = "110") or (add_overflow_check = "001")) report "addition has overflow" severity note;
 --assert not((sub_overflow_check = "011") or (sub_overflow_check = "100")) report "subtraction has an overflow" severity note;
  
end test;


  
