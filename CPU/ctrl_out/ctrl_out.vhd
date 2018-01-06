-- ctrl_out
library ieee;
use ieee.std_logic_1164.all;

entity ctrl_out is
port(
	ctrl : in std_logic;
	TO_OUT : in std_logic_vector(7 downto 0);
	REAL_OUT : out std_logic_vector(7 downto 0)
);
end ctrl_out;

architecture ctrl_out_arch of ctrl_out is
begin
	process(ctrl, TO_OUT)
	begin
		case ctrl is
			when '1' => REAL_OUT <= TO_OUT;
			when others => REAL_OUT <= "ZZZZZZZZ";
		end case;
	end process;
end ctrl_out_arch;