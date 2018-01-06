library ieee;
use ieee.std_logic_1164.all;
entity cpu_jcq is
	port(clk:in std_logic;
		mar_in:in std_logic_vector(7 downto 0);
		mar_out:out std_logic_vector(7 downto 0));
end cpu_jcq;
architecture description of cpu_jcq is
begin 
	process(clk)
	begin
		if(clk'event and clk='1') then
			mar_out<=mar_in;
		end if;
	end process;
end description;