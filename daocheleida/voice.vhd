library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity voice is
  
port(
  clk:in std_logic;
  spks2:out std_logic
  );
  end voice;
 architecture voice_arch of voice is
 signal cout1:integer range 0 to 1000;
 begin
 process(clk)
 begin
  if(clk'event and clk='1') then
	  cout1<=cout1+1;
	  if(cout1=1000) then 
		 cout1<=0;spks2<='1' ;	  
	  elsif(cout1=500) then spks2<='0' ;
	  end if;
  end if; 
 end process;
 end voice_arch;