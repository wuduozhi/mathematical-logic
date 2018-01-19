-- temp
library ieee;
use ieee.std_logic_1164.all;

entity temp is
port(
	reset: in std_logic;
	din: in std_logic_vector(7 downto 0);
	WE: in std_logic;
	dreset: in std_logic_vector(7 downto 0);
	dout: out std_logic_vector(7 downto 0));
end temp;

architecture temp_arch of temp is
signal s : std_logic_vector(7 downto 0);
begin
	process(s, reset, WE)
	begin
		if RESET = '1' then 
			s <= dreset;
		elsif WE = '0' then
			s <= din;
		else
			s <= s;
		end if;
	end process;
	dout <= s;
end temp_arch;