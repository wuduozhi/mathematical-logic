library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity cpu_PC is
port(
clk,in_pc:in std_logic;
bus1:in std_logic_vector(7 downto 0);
pc_out:out std_logic_vector(7 downto 0)
);
end cpu_PC;
architecture a of cpu_PC is
signal pc:std_logic_vector(7 downto 0);
begin
process(clk,in_pc,bus1)
begin
if(clk'event and clk='1' and in_pc='1') then
pc<=pc+1;
end if;
end process;
pc_out<=pc;
end a;