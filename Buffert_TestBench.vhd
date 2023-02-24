library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.CPU_Package.all;

entity Buffert_TestBench is

end entity;

architecture buffert of Buffert_TestBench is

component Buffert is 
port (
         OUT_EN : IN std_logic;
         DATA_OUT : OUT data_bus_type;
         DATA_IN : IN data_word_type
  );
end component;
  
  -- signsl declaration:
  signal OUT_EN   : std_logic := '0';
  signal DATA_OUT : data_bus_type;
  signal DATA_IN  : data_word_type :=(others => '0');
  
  begin
  -- port maping
  DUT1: Buffert port map(OUT_EN, DATA_OUT, DATA_IN);
    
  OUT_EN <= not OUT_EN after 5 ns;
end buffert; 
      
  
