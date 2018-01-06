-- ALU
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU is
port(
	A, B: in std_logic_vector(7 downto 0);
	MOV, ADD, SUB, AND0, NOT0, SHR, SHL, JMP, JZ, JC, IN0, OUT0, NOP, HALT, F_BUS: in std_logic;
	C, Z: out std_logic;
    to_bus : out std_logic_vector(7 downto 0));
end ALU;

architecture ALU_arch of ALU is
signal data_A, data_B, data_bus: std_logic_vector(8 downto 0);
signal data_Z: std_logic;
begin
	data_A <= '0' & A;
	data_B <= '0' & B;
	process(F_BUS, MOV, ADD, SUB, AND0, NOT0, SHR, SHL, JMP, JZ, JC, IN0, OUT0, NOP, HALT, data_A, data_B, data_Z, data_bus)
	begin
		if F_BUS = '0' then
			data_bus <= "0ZZZZZZZZ";
		else
			if MOV = '1' then
				data_bus <= data_A;
			elsif ADD = '1' then
				data_bus <= data_A + data_B;
			elsif SUB = '1' then
				data_bus <= data_B - data_A;
			elsif AND0 = '1' then
				data_bus <= data_A and data_B;
			elsif NOT0 = '1' then
				data_bus <= not data_B;
			elsif SHR = '1' then
				data_bus <= "00" & data_B(7 downto 1);
			elsif SHL = '1' then
				data_bus <= '0' & data_B(6 downto 0) & '0';
			elsif JMP = '1' then
				data_bus <= data_B;
			elsif JZ = '1' then
				data_bus <= data_B;
			elsif JC = '1' then
				data_bus <= data_B;
			elsif IN0 = '1' then
				data_bus <= data_B;
			end if;
		end if;
		if data_bus = "00000000" then
			data_Z <= '1';
		else
			data_Z <= '0';
		end if;
	end process;
	to_bus <= data_bus(7 downto 0);
	C <= data_bus(8);
	Z <= data_Z;
end ALU_arch;