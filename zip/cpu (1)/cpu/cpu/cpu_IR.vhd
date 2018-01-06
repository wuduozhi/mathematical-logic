library ieee;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned ;
entity cpu_IR is
port(
bus3:in std_logic_vector(7 downto 0);
ldir:in std_logic;
outir:out std_logic_vector(7 downto 0)
);
end cpu_IR;
architecture a of cpu_IR is
begin
process(bus3,ldir)
   begin
   if (ldir='1') then
   outir<=bus3;
   end if;
end process;
end a;