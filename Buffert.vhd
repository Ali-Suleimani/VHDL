library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.CPU_Package.all;

entity Buffert is
  port ( 
         OUT_EN : IN std_logic;
         DATA_OUT : OUT data_bus_type;
         DATA_IN : IN data_word_type);
end entity;
architecture RTL of Buffert is
   begin
       process(OUT_EN, DATA_IN)
          begin
            if OUT_EN = '1' then DATA_OUT <=DATA_IN;
  
            else DATA_OUT <= (others =>'Z');
            end if;
      end process;
end RTL;
    
