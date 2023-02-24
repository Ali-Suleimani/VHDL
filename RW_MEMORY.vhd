library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;
use work.CPU_Package.all;
entity ram is
  port( adr : IN address_bus_type;
        data : INOUT data_bus_type;
        clk : IN std_logic;
        ce_n : IN std_logic; -- active low
        rw : IN std_logic); --r = 1, w = 0
end entity ram;
architecture RTL of ram is
 type data_buses_type is array (15 downto 0) of std_logic_vector(3 downto 0);
	signal mem : data_buses_type;
	
	begin
	
	process(clk)
	begin
		if rising_edge(clk) then
			if (ce_n = '0' and rw = '0') then
				-- write to memory
				mem(to_integer(unsigned(adr))) <= data;
			end if;
		end if;
	end process;
	-- set data to high impedance or read from memory 
	data <= (others =>'Z') when (ce_n = '0' or rw = '1') else mem(to_integer(unsigned(adr)));
	
end architecture;