
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
use work.CPU_Package.all;

entity RW_MEMORY_TestBench is
end entity;

architecture behave of RW_MEMORY_TestBench is
  
  component RW_MEMORY is
    port( adr : IN address_bus_type;
        data : INOUT data_bus_type;
        clk : IN std_logic;
        ce_n : IN std_logic; -- active low
        rw : IN std_logic); --r = 1, w = 0
        
end component;
-- signal maping
       signal adr   :  address_bus_type;
       signal  data : data_bus_type := (others => 'Z');
       signal clk   : std_logic := '0';
       signal ce_n  :  std_logic; -- active low
       signal rw    : std_logic; --r = 1, w = 0
       
      begin 
        -- port maping
          DUT4: RW_MEMORY port map (adr, data, clk, ce_n, rw);
            clk <= not clk after 5 ns;
	
	process 
		begin
		
		wait for 10 ns;
		
		-- write 
		ce_n <= '0';
		rw <= '0';
		adr <= "1100";
		data <= "1100";
		wait for 10 ns;
		
		-- clear 
		ce_n <= '1';
		--data <= "ZZZZ";
		
		wait for 10 ns;
		
		-- write 
		ce_n <= '0';
		rw <= '0';
		adr <= "0110";
		data <= "0110";
		wait for 10 ns;
		
		-- clear 
		ce_n <= '1';
		--data <= "ZZZZ";
		wait for 10 ns;
		
		-- read 
		ce_n <= '0';
		rw <= '1';
		adr <= "1100";
		wait for 10 ns;
		
		-- clear 
		ce_n <= '1';
		--data <= "ZZZZ";
		wait for 10 ns;
		
		-- read 
		ce_n <= '0';
		rw <= '1';
		adr <= "0110";
		wait for 10 ns;
		
		-- to end 
		wait for 100 ns;

	   end process;
	end behave;

  
