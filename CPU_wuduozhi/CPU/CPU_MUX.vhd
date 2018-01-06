library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity CPU_MUX is
	port(MADD:in std_logic_vector(1 downto 0);
		A,B,PC: in std_logic_vector(7 downto 0);
		data_out: out std_logic_vector(7 downto 0));
end CPU_MUX;

architecture ALU_architecture of CPU_MUX is
begin
	process(MADD)
	begin
		case MADD is
			when "00"=>
				data_out<=PC;
			when "01"=>
				data_out<=A;
			when "10"=>
				data_out<=B;
			when "11"=>
				data_out<="ZZZZZZZZ";
			end case;
	end process;			
end ;		
