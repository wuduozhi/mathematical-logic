library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux3_1 is
port(d0, d1, d2: in STD_LOGIC_VECTOR(7 downto 0);
			sel: in integer range 2 downto 0;
		   dout: out STD_LOGIC_VECTOR(7 downto 0));
end mux3_1;

architecture mux3_1_arch of mux3_1 is
begin
	dout <= d0 when sel = 0 else
			d1 when sel = 1 else
			d2;
end mux3_1_arch;