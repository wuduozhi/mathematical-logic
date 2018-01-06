library ieee;
use ieee.std_logic_1164.all;
entity CPU_REGISTER is
port(
	clk:in std_logic;
	in_put: in std_logic_vector(7 downto 0);
	RE:in std_logic;
	WE:in std_logic;
	out_put: out std_logic_vector(7 downto 0)
);
end CPU_REGISTER;

architecture arch of CPU_REGISTER is
signal sign:std_logic_vector(7 downto 0):="00000001";
begin
	
	process(clk,sign,RE,WE)
	begin
		if (clk'event and clk='1') and WE = '1' then
			sign <= in_put;     --Ð´
		else
			sign <= sign;
		end if;
		
		if RE='1' then 
			out_put<=sign;--¶Á
		else 
			out_put<="ZZZZZZZZ";       --¸ß×è
		end if;
		
	end process;	
	
	
end arch;