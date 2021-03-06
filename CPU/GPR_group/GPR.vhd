-- GPR
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity GPR is
port(
	clk, reset, en_w: in std_logic;
	R1, R2: in std_logic_vector(1 downto 0);
	busin: in std_logic_vector(7 downto 0);
	busout: out std_logic_vector(7 downto 0);
	read_A, read_B, read_C, write_A, write_B, write_C: out std_logic;
	A, B, C: out std_logic_vector(7 downto 0)
);
end GPR;

architecture GPR_arch of GPR is
signal Sel_R, Sel_W: std_logic_vector(3 downto 0);
begin
	process(R1)
	begin
		case R1 is
			when "00" =>
				Sel_W <= "0001";
			when "01" =>
				Sel_W <= "0010";
			when "10" =>
				Sel_W <= "0100";
			when "11" =>
				Sel_W <= "1000";
		end case;
	end process;
	
	process(R2)
	begin
		case R2 is
			when "00" =>
				Sel_R <= "0001";
			when "01" =>
				Sel_R <= "0010";
			when "10" =>
				Sel_R <= "0100";
			when "11" =>
				Sel_R <= "1000";
		end case;
	end process;	
	
	busout <= busin;
	read_A <= not (Sel_R(0) or Sel_W(0));
	read_B <= not (Sel_R(1) or Sel_W(1));
	read_C <= not (Sel_R(2) or Sel_R(3) or Sel_W(2) or Sel_W(3));
	write_A <= (not Sel_W(0)) or en_w;
	write_B <= (not Sel_W(1)) or en_w;
	write_C <= (not Sel_W(2)) or en_w;
	A <= "00000001";
	B <= "00000101";
	C <= "00110011";
end GPR_arch;