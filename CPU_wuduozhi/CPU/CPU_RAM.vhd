Library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

ENTITY  CPU_RAM  is
     port(DL,XL,CS_n,clk: in std_logic;
          Data_out: out std_logic_vector (7 downto 0);
          Data_in,PC_in:in std_logic_vector(7 downto 0));
end CPU_RAM;

architecture  arch1 of CPU_RAM is 
	type mem_type is array (0 to 56)  of std_logic_vector (7 downto 0);
	signal mem : mem_type :=( X"fc", X"fd", X"f3", X"f7", X"f4", X"f1", X"f2", X"f8", X"f6", X"f9", --0
								  X"94", X"91", X"92", X"98", X"96", X"99", X"90", X"95", X"9a", X"64", --1
								  X"61", X"62", X"68", X"66", X"69", X"60", X"65", X"6a", X"50", X"54", --2
								  X"58", X"a0", X"a4", X"a8", X"a3", X"a7", X"ab", X"40", X"44", X"48", --3
								  X"20", X"24", X"28", X"10", X"11", X"12", X"70", X"20", X"24", X"28", --4
								  X"e4", X"e1", X"e2", X"e8", X"e6", X"e9", X"80");
begin
                         
	process (DL,XL,CS_n,clk)
	begin
		if (CS_n ='0') then
			if(DL = '1') then 
				Data_out<= mem(conv_integer(PC_in));
			else
				Data_out<="ZZZZZZZZ";
			end if;
			
			if(XL='1' and (clk 'event and clk='1')) then
				mem(conv_integer(PC_in))<=Data_in;
			end if;
		else
			Data_out<="ZZZZZZZZ";
		end if;
	end process;
end arch1;






		

