library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned;
entity cpu_XUANZEQI is
	port(madd:in std_logic_vector(1 downto 0);
		 in0,in1,in2:in std_logic_vector(7 downto 0);
		 x_out:out std_logic_vector( 7 downto 0));
end cpu_XUANZEQI;
architecture a of cpu_XUANZEQI is
begin
	process(madd)
	begin
		if (madd= "00") then
			x_out<=in0;
		elsif(madd= "01") then
			x_out<=in1;
		elsif(madd= "10") then
		    x_out<=in2;
		end if;
	end process;
	end a ;