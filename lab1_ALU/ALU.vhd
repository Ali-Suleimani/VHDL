library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
package CPU_package is
  CONSTANT address_size: integer:=4; 
  CONSTANT data_size: integer:= 4;
  CONSTANT operation_size: integer:=4;
  CONSTANT instruction_size: integer:=10;
    
  subtype address_bus_type is std_logic_vector(address_size-1 downto 0);
  subtype data_word_type is std_logic_vector(data_size-1 downto 0);
  subtype data_bus_type is std_logic_vector(data_size-1 downto 0);
  subtype instruction_bus_type is std_logic_vector(instruction_size-1 downto 0);
  subtype program_world_type is std_logic_vector (instruction_size-1 downto 0);
  subtype command_word_type is std_logic_vector(operation_size-1 downto 0);
  
  Function add_overflow(a, b: IN std_logic_vector) return std_logic_vector;
  Function sub_overflow(a, b : IN std_logic_vector) return std_logic_vector;
  
end package CPU_package;

package body CPU_package is
  function add_overflow(a, b: IN std_logic_vector) return std_logic_vector is
  variable ret: std_logic_vector(a'length downto 0);
  variable sum: std_logic_vector(a'range);
  Constant N:integer:=a'length;
  begin
    
    sum := a+b; --a = 0100  b = 0101
    ret (N):= (a(N-1) and b(N-1) and not sum(N-1)) or (not a(N-1) and (not b(N-1)) and sum (N-1));
    ret ((N-1) downto 0) := sum;
    return ret;
  end add_overflow;
  
  function sub_overflow (a, b:IN std_logic_vector) return std_logic_vector is
  variable ret: std_logic_vector(a'length downto 0);
  variable diff: std_logic_vector(a'range);
  Constant N:integer:=b'length;
  begin
    diff := a-b;
    ret (N):= ((a(N-1)) and not b(N-1) and not diff(N-1)) or (not a(N-1) and b(N-1) and diff(N-1));
    ret ((N-1) downto 0) :=diff;
    return ret;
  end sub_overflow;
      
end package body;

