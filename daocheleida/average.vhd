LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_unsigned.ALL;
ENTITY average IS
    PORT(
        numin: in integer range 0 to 1200;
        clk0: in std_logic;
        numout: out integer range 0 to 1200
        );
END ENTITY average ;
ARCHITECTURE average_arch OF average  IS 
signal n:integer range 0 to 10;
signal count:integer range 0 to 12000;
begin 
process(clk0)
begin
if(clk0'event and clk0='1') then
  if(n=10) then 
     n<=0;numout<=count/9;
  elsif(n=0) then n<=n+1;count<=0;--numout<=0;
  else n<=n+1;count<=numin+count;--numout<=1;
  end if;
end if;
end process;
end average_arch;