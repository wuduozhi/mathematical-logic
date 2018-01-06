library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CPU_PC is
port(
	LD_PC,IN_PC,clk:in std_logic;
	Data_in :in std_logic_vector(7 downto 0);
	Data_out :out std_logic_vector(7 downto 0)
);
end CPU_PC;

architecture arch of CPU_PC is

signal R_PC:std_logic_vector(7 downto 0):="00000000";

begin

	process(LD_PC,IN_PC,clk,Data_in)
	begin
		if(clk 'event and clk='1' and IN_PC='1') then
			R_PC<=Data_in;
		end if;
		if(LD_PC = '1' and (clk 'event and clk='1')) then
			R_PC<= R_PC+1;
		end if;
	end process;
	
	Data_out<=R_PC;

end arch;