library ieee;
use ieee.std_logic_1164.all;
entity cpu_regs is
	port(clk,we,raa0,raa1,rwba0,rwba1: in std_logic;
		 bus2:in std_logic_vector(7 downto 0);
		 a,b:out std_logic_vector(7 downto 0));
end cpu_regs;
architecture ab of cpu_regs is
signal ra:std_logic_vector(7 downto 0):="00000001";
signal rb:std_Logic_vector(7 downto 0):="00000011";
signal rc:std_logic_vector(7 downto 0):="00000111";
begin 
	process(clk,we,raa0,raa1,rwba0,rwba1)        
	begin                                        
			if(raa1='0' and raa0='0')then
				a<=rb;
			elsif(raa1='0' and raa0='1') then
				a<=rc;
			elsif(raa1='1' and raa0='0') then 
				a<=rb;
			else
				a<="00000000";
			end if;
			if(rwba1='0' and rwba0='0')then
				b<=rc;
			elsif(rwba1='0' and rwba0='1') then
				b<=ra;
			else
				b<="00000000";
			end if;
			if(clk'event and clk='1') then
				if(we='1' and rwba1='0' and rwba0='0') then
					ra<=bus2;
				elsif(we='1' and rwba1='0' and rwba0='1') then
					rb<=bus2;
				elsif(we='1' and rwba1='1' and rwba0='0') then
					rc<=bus2;
				elsif(we='1' and rwba1='1' and rwba0='1') then
					ra<=bus2;
				end if;
			end if;
	end process;
end ab;