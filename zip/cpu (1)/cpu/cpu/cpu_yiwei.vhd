library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_1164.all;
entity cpu_yiwei is
port(
fbus,flbus,frbus:in std_logic;
alu_out:in std_logic_vector(7 downto 0);
c:out std_logic;
ywljsc:out std_logic_vector(7 downto 0)
);
end cpu_yiwei;
architecture a of cpu_yiwei is
signal m:std_logic;
begin
process(fbus,flbus,frbus)
begin
if(fbus='1') then
ywljsc<=alu_out;
m<=alu_out(7);
elsif (flbus='1') then
ywljsc<=alu_out(6 downto 0)&'0';
m<=alu_out(6);
elsif (frbus='1') then
ywljsc<='0'&alu_out(7 downto 1);
m<='0';
end if;
c<=m;
end process;
end a;
 