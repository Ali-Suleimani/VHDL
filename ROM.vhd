library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.CPU_Package.all;
entity rom is
  port (adr : IN address_bus_type;
        data : OUT instruction_bus_type;
        ce_n : IN std_logic
      );
end entity rom;

architecture RTL of rom is
  begin
    process(ce_n, adr)
		begin
		if ce_n = '0' then
			case adr is
				when "0000" => data <= "1010110011"; -- LDI R3,  3
				when "0001" => data <= "1001011110"; -- STR R3, 14
				when "0010" => data <= "1010010001"; -- LDI R1,  1
				when "0011" => data <= "1000001110"; -- LDR R0, 14
				when "0100" => data <= "0110000010"; -- MOV r0, R2
				when "0101" => data <= "0000100110"; -- ADD R2, R1, R2
				when "0110" => data <= "0001000100"; -- SUB R0, R1, R0
				when "0111" => data <= "1100001100"; -- BRZ 12
				when "1001" => data <= "1111000101"; -- BRA 5
				when "1100" => data <= "1001101111"; -- STR R2, 15
				when "1101" => data <= "1111001101"; -- BRA 13
				when others => data <= "1011000000"; -- NOP
			end case;
		else
			data <= "ZZZZZZZZZZ";
		end if;
	end process;
    
    
    
    -- process(ce_n, data, adr)
     -- if (ce_n = '1')then
     -- data <= "zzz";
   -- else (ce_n = '0')
    --  data <= adr;
   -- end if;
end RTL;
    

  
