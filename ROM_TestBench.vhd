library IEEE;
use IEEE.std_logic_1164.all;
-- use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
use work.CPU_Package.all;

entity ROM_TestBench is
end entity;
architecture behave of ROM_TestBench is
  
  
  component ROM is
    port (
        adr : IN address_bus_type;
        data : OUT instruction_bus_type;
        ce_n : IN std_logic
      );
      
end component;
      
      -- signal maping
      signal adr :  address_bus_type := (others => '0');
      signal data :  instruction_bus_type;
      signal ce_n : std_logic := '0'; 
      
      begin 
        -- port maping
          DUT3: ROM port map (adr, data, ce_n);
            ce_n <= not ce_n after 5 ns;
	          adr <= address_bus_type(to_unsigned(to_integer(unsigned(adr)) + 1, adr'length)) after 5 ns; 
	          
 end behave;
            
      
      

