library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity cpu_alu is
	port(m:in std_logic;
		 s:in std_logic_vector(3 downto 0);
		 alu_a,alu_b:in std_logic_vector(7 downto 0);
		 c,z:out std_logic;
		 alu_out:out std_logic_vector(7 downto 0));
end cpu_alu;
architecture description of cpu_alu is
  signal k1: std_logic_vector(8 downto 0);
  signal k2: std_logic_vector(8 downto 0);
  signal k3: std_logic_vector(8 downto 0);
begin
	process(m,alu_a,alu_b)
	begin
	if(alu_a=alu_b) then
     z<='1';
     else
     z<='0';
     end if;
		if(m='1' and s="1111" )then
			alu_out<=alu_b;
			 c<='0';
		elsif(m='1' and s="1001") then
			 k1<='0' & alu_a;
             k2<='0' & alu_b;
             k3<=k1+k2;
             c<=k3(8);
			alu_out<=alu_a+alu_b;
		elsif(m='1' and s="0110" ) then
            c<='0';
			if(alu_a>alu_b) then
			alu_out<=alu_a-alu_b;
			c<='0';
			else
            alu_out<=alu_b-alu_a;
            c<='0';
            end if;
		elsif(m='1' and s="1110" )then
			alu_out<=alu_a and alu_b;
			c<='0';
		elsif(m='1' and s="0101") then
			alu_out<=not alu_a;
			c<='0';
		else
			alu_out<=alu_a;
			c<='0';
	    end if;
	end process;
	end;