library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity voice2 is
  
port(
  dis: in integer range 0 to 1200;
  clk:in std_logic;
  voice:out std_logic
  );
  end voice2;
 architecture voice2_arch of voice2 is
 signal n:integer range 0 to 1000;
 signal p:integer range 0 to 1000;
 signal i:std_logic;
 begin
	process(clk,dis)
	begin
	    if(dis<50) then p<=10;
		  elsif(dis<100) then p<=50;
		  elsif(dis<150) then p<=100;
		  else p<=150;
		end if;
		if(clk'event and clk='1' ) then
		   n<=n+1;
		   if(n<p/2) then i<='1';
		      elsif(n=p) then n<=0;
		      else i<='0';
		   end if;
		end if;
	end process;
	voice<=clk and i;
end voice2_arch;