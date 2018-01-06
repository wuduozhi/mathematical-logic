-- console
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity console is
port(
	MOV, ADD, SUB, AND0, NOT0, SHR, SHL, JMP, JZ, JC, IN0, OUT0, NOP, HALT: in std_logic;
	R1, R2: in std_logic_vector(1 downto 0);
	clk: in std_logic;
	LOD_PC, IN_PC, LOD_SA, LOD_SB: out std_logic;
	LOD_IN, WE: out std_logic;
	counts: out std_logic_vector(0 downto 0);
	F_BUS, DL, XL, CS: out std_logic;
	MADD: out integer range 2 downto 0);
end console;

architecture console_arch of console is 
	signal cnt : std_logic_vector(0 downto 0);
begin
	process(clk, cnt, HALT)
	begin
		if HALT = '1' then
			cnt <= "1";
		else
			if(clk'event and clk = '0') then
				if cnt = "1" then
					cnt <= "0";
					if(JMP = '1' or JZ = '1' or JC = '1' or NOP = '1') then
						LOD_PC <= '1';
					else
						LOD_PC <= '0';
					end if;
				else
					cnt <= cnt + "1";
					LOD_PC <= '1';
				end if;
			end if;	
		end if;
	end process;

	process(cnt, MOV, ADD, SUB, AND0, NOT0, SHR, SHL, JMP, JZ, JC, IN0, OUT0, NOP, HALT, R1, R2)
	begin
		if cnt = "0" then
			IN_PC <= '1';
			CS <= '0';
			DL <= '0';
			XL <= '0';
			MADD <= 0;
			WE <= '1';
			LOD_IN <= '0';
			LOD_SA <= '0';
			LOD_SB <= '0';
			F_BUS <= '0';
		else
			if MOV = '1' then
				IN_PC <= '1';
				LOD_IN <= '0';
				CS <= '0';
				if R1 = "11" then
					XL <= '1';
					DL <= '0';
					MADD <= 2;
					WE <= '1';
					F_BUS <= '1';
				elsif R2 = "11" then
					XL <= '0';
					DL <= '1';
					MADD <= 1;
					WE <= '0';
					F_BUS <= '0';
				else
					XL <= '0';
					DL <= '0';
					MADD <= 0;
					WE <= '0';
					F_BUS <= '1';
				end if;
				LOD_SA <= '0';
				LOD_SB <= '1';
			elsif(ADD = '1' or SUB = '1' or AND0 = '1') then
				IN_PC <= '1';
				LOD_IN <= '0';
				CS <= '0';
				DL <= '0';
				XL <= '0';
				MADD <= 0;
				WE <= '0';
				LOD_SA <= '1';
				LOD_SB <= '1';
				F_BUS <= '1';
			elsif(NOT0 = '1' or SHR = '1' or SHL = '1') then
				IN_PC <= '1';
				LOD_IN <= '0';
				CS <= '0';
				DL <= '0';
				XL <= '0';
				MADD <= 0;
				WE <= '0';
				LOD_SA <= '1';
				LOD_SB <= '0';
				F_BUS <= '1';
			elsif(JMP = '1' or JZ = '1' or JC = '1') then
				IN_PC <= '0';
				LOD_IN <= '1';
				CS <= '0';
				DL <= '0';
				XL <= '0';
				MADD <= 0;
				WE <= '1';
				LOD_SA <= '1';
				LOD_SB <= '0';
				F_BUS <= '1';		
			elsif IN0 = '1' then
				IN_PC <= '1';
				LOD_IN <= '1';
				CS <= '0';
				DL <= '0';
				XL <= '0';
				MADD <= 0;
				WE <= '0';
				LOD_SA <= '1';
				LOD_SB <= '0';
				F_BUS <= '1';
			elsif OUT0 = '1' then
				IN_PC <= '1';
				LOD_IN <= '0';
				CS <= '0';
				DL <= '0';
				XL <= '0';
				MADD <= 0;
				WE <= '1';
				LOD_SA <= '0';
				LOD_SB <= '1';
				F_BUS <= '0';
			elsif NOP = '1' then
				IN_PC <= '1';
				LOD_IN <= '0';
				CS <= '0';
				DL <= '0';
				XL <= '0';
				MADD <= 0;
				WE <= '1';
				LOD_SA <= '1';
				LOD_SB <= '1';
				F_BUS <= '0';
			elsif HALT = '1' then
				IN_PC <= '1';
				LOD_IN <= '0';
				CS <= '1';
				DL <= '0';
				XL <= '0';
				MADD <= 0;
				WE <= '1';
				LOD_SA <= '1';
				LOD_SB <= '1';
				F_BUS <= '0';
			else
				IN_PC <= '1';
				LOD_IN <= '0';
				CS <= '0';
				DL <= '0';
				XL <= '0';
				MADD <= 0;
				WE <= '1';
				LOD_SA <= '1';
				LOD_SB <= '1';
				F_BUS <= '0';
			end if;
		end if;
	end process;
	counts <= cnt;
end console_arch;