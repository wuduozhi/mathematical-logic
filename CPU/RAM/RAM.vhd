-- RAM
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RAM  is
port (addr, din: in std_logic_vector(7 downto 0);
	  clk, DL, XL, CS: in std_logic;
	  data, to_bus, dout: out std_logic_vector (7 downto 0));
end RAM;

architecture RAM_arch of RAM is 
	type mem_type is array(0 to 255) of std_logic_vector(7 downto 0);
	signal mem: mem_type;
	signal s: std_logic_vector(7 downto 0);
begin
	process (clk, mem, addr, DL, XL, CS)
	begin
		if CS = '0' then
			if clk'event and clk = '1' then
				mem(0 to 50) <= ( X"3c", X"3d", X"33", X"37", X"34", X"31", X"32", X"38", X"36", X"39", --0
								  X"94", X"91", X"92", X"98", X"96", X"99", X"90", X"95", X"9a", X"64", --1
								  X"61", X"62", X"68", X"66", X"69", X"60", X"65", X"6a", X"50", X"54", --2
								  X"58", X"a0", X"a4", X"a8", X"a3", X"a7", X"ab", X"40", X"44", X"48", --3
								  X"20", X"24", X"28", X"10", X"11", X"12", X"70", X"20", X"24", X"28", --4
								  X"80");																--5
								--  0	   1	  2		 3	    4	   5	  6		 7		8	   9    --
				if XL = '1' then
					mem(conv_integer(addr)) <= din;
				end if;
			end if;
			if DL = '1' then
				to_bus <= mem(conv_integer(addr));
				s <= s;
			elsif XL = '0' then
				s <= mem(conv_integer(addr));
				to_bus <= "ZZZZZZZZ";
			else
				s <= s;
				to_bus <= "ZZZZZZZZ";
			end if;
		else
			s <= "ZZZZZZZZ";
			to_bus <= "ZZZZZZZZ";
		end if;
	end process;
	dout <= s;
	data <= mem(conv_integer(addr));
end RAM_arch;

--mem[] 	addr	  order
 --0--	 0011 1100	 mov M a
 --1--	 0011 1101	 mov M b
 --2--	 0011 0011	 mov a M
 --3--	 0011 0111	 mov b M
 
 --4--	 0011 0100	 mov b a
 --5--	 0011 0001	 mov a b
 --6--	 0011 0010	 mov a c
 --7--	 0011 1000	 mov c a
 --8--	 0011 0110	 mov b c
 --9--	 0011 1001	 mov c b
 
 --10--	 1001 0100	 add b a
 --11--	 1001 0001	 add a b
 --12--	 1001 0010	 add a c
 --13--	 1001 1000	 add c a
 --14--	 1001 0110	 add b c
 --15--	 1001 1001	 add c b
 --16--	 1001 0000	 add a a
 --17--	 1001 1001	 add b b
 --18--	 1001 1010	 add c c

 --19--	 0110 0100	 sub b a
 --20--	 0110 0001	 sub a b
 --21--	 0110 0010	 sub a c
 --22--	 0110 1000	 sub c a
 --23--	 0110 0110	 sub b c
 --24--	 0110 1001	 sub c b
 --25--	 0110 0000	 sub a a
 --26--	 0110 0101	 sub b b
 --27--	 0110 1010	 sub c c
 
 --28--	 0101 0000	 not a
 --29--	 0101 0100	 not b
 --30--	 0101 1000	 not c
 
 --31--	 1010 0000	 shr a
 --32--	 1010 0100	 shr b
 --33--	 1010 1000	 shr c

 --34--	 1010 0011	 shl a
 --35--	 1010 0111	 shl b
 --36--	 1010 1011	 shl c
 
 --47--	 0100 0000	 out a
 --48--	 0100 0100	 out b
 --49--	 0100 1000	 out c
 
 --40--	 0010 0000	 in a
 --41--	 0010 0100	 in b
 --42--	 0010 1000	 in c 
 
 --43--	 0001 0000	 jmp
 --44--	 0001 0001	 jz
 --45--	 0001 0010	 jc 
 
 --46--	 0111 0000	 nop

 --47--	 0010 0000	 in a
 --48--	 0010 0100	 in b
 --49--	 0010 1000	 in c 
 
 --50--	 1000 0000	 halt

