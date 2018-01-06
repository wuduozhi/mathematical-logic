Library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

ENTITY  CPU_RAM  is
     port(DL,XL,CS_n,clk: in std_logic;
          Data_out: out std_logic_vector (7 downto 0);
          Data_in,PC_in:in std_logic_vector(7 downto 0));
end CPU_RAM;

architecture  arch1 of CPU_RAM is 
	type mem_type is array (0 to 15)  of std_logic_vector (7 downto 0);
	signal mem : mem_type :=(X"f4",		--0-- 1111 0100 mov b a
							X"94", 		--1-- 1001 0100 add b a
							X"64", 		--2-- 0110 0100 sub b a
							X"f3", 		--3-- 1111 0011 move a M
							X"fd",		--4-- 1111 1101 mov m b
							X"54", 		--5-- 0101 0100 not b
							X"e1", 		--6-- 1110 0001 and a b
							X"a4", 		--7-- 1010 0100 shr b
							X"a3", 		--8-- 1010 0011 shl a
							X"40", 		--9-- 0100 0000 out a
							X"44", 		--10-- 0100 0100 out b
							X"20", 		--11-- 0010 0000 in a
							X"40", 		--12-- 0100 0000 out a
							X"70", 		--13-- 0111 0000 nop
							X"24", 		--14-- 0010 0100 in b
							X"44" 		--15-- 0100 0100 out b 
					); 
begin
                         
	process (DL,XL,CS_n,clk)
	begin
		if (CS_n ='0') then
			if(DL = '1') then 
				Data_out<= mem(conv_integer(PC_in));
			end if;
			
			if(XL='1' and (clk 'event and clk='1')) then
				mem(conv_integer(PC_in))<=Data_in;
			end if;
		else
			Data_out<="ZZZZZZZZ";
		end if;
	end process;
end arch1;






		

