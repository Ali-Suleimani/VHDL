library IEEE;
use IEEE.std_logic_arith.all;
use IEEE std_logic_signed.all;

begin
  add_overflow_check=a(N-1) & b(N-1)& sum(N-1);
  assert b'high=a'high report "a is not equal to b" severity failure;
  sub_overflow_check= a(N-1) & b(N-1) & sum(N-1);
  assert b'high=a'high report "a is not equal to b" severity failure;
  