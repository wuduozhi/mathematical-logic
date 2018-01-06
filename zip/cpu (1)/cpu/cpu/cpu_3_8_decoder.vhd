library ieee;
use ieee.std_logic_1164.all;
entity cpu_3_8_decoder is
	port (a:in std_logic_vector(2 downto 0) ;
		  d:out std_logic_vector(7 downto 0));
end cpu_3_8_decoder ;

architecture description of cpu_3_8_decoder  is
signal b0,b1,b2,c0,c1,c2,c3 :std_logic ;
begin
	b0<=not a(0);
	b1<=not a(1);
	b2<=not a(2);
	c0<=b0 and b1;
	c1<=a(0) and b1;
	c2<=b0 and a(1);
	c3<=a(0) and a(1);
	d(0)<=c0 and b2;
	d(1)<=c1 and b2;
	d(2)<=c2 and b2;
	d(3)<=c3 and b2;
	d(4)<=c0 and a(2);
	d(5)<=c1 and a(2);
	d(6)<=c2 and a(2);
	d(7)<=c3 and a(2);
end description;