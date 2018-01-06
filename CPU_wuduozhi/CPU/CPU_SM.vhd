library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CPU_SM is
port(
	clk:in std_logic;
	SM :out std_logic
);
end CPU_SM;

architecture arch of CPU_SM is

signal tmp:std_logic:='0';
signal count:std_logic:='1';

begin

	process(clk)
	begin
		case count is
		when '0'=>	
			if(clk 'event and clk='1' ) then
				count<= not count;
			end if;
		when '1'=>
		    if(clk 'event and clk='0' ) then
				tmp<= not tmp;
			end if;
		end case;
	end process;
	
	SM<=tmp;

end arch;