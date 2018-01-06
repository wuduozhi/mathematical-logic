library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity cpu_order is
port(
	SM,C,S0: in std_logic;
	Data_in:in std_logic_vector(7 downto 0);
	F_BUS,FL_BUS,FR_BUS : out std_logic;
	M          : out std_logic;
	S          :out std_logic_vector(3 downto 0);
	R_Add,W_Add:out std_logic_vector(1 downto 0);
	W_n        : out std_logic;
	DL,XL,CS_n : out std_logic;
	LD_PC,IN_PC: out std_logic;
	MADD        :out std_logic_vector(1 downto 0)
);
end cpu_order;

architecture ip of cpu_order is

signal tmp:std_logic_vector(3 downto 0);
signal R,W:std_logic_vector(1 downto 0);

begin	
	process(SM,Data_in)
	begin 	
		tmp<=Data_in(7 downto 4);
		R<=Data_in(1 downto 0);
		W<=Data_in(3 downto 2);
		if (SM = '1') then
			LD_PC<='0'; --PC
			IN_PC<='0';
			case tmp is
			when "1111" => --move
				S<=tmp;
				M<='1';
				F_BUS<='0'; --SHIFT
				if(R="11") then
					W_n<='0';
					R_Add<=R;
					W_Add<=W;
					MADD<="01";
					CS_n<='0';
					DL<='1';
					XL<='0';
					M<='0'; -- WHY
				elsif(W="11") then
					W_n<='1';
					R_Add<=R;
					W_Add<=W;
					MADD<="10";
					CS_n<='0';
					DL<='0';
					XL<='1';
				else
					W_n<='0';
					R_Add<=R;
					W_Add<=W;
					MADD<="10";
					CS_n<='1';
					DL<='0';
					XL<='1';
				end if;
			when "1001"=> --add
				F_BUS<='0'; --SHIFT
				S<=tmp;
				M<='1';
				W_n<='0';
				R_Add<=R;
				W_Add<=W;
				MADD<="10";
				CS_n<='1';
				DL<='0';
				XL<='1';
			when "0110" =>  --sub
				F_BUS<='0'; --SHIFT
				S<=tmp;
				M<='1';
				W_n<='0';   
				R_Add<=R;
				W_Add<=W;
				MADD<="10";
				CS_n<='1'; --RAM
				DL<='0';
				XL<='1';
			when "1110" => --AND
				F_BUS<='0'; --SHIFT
				S<=tmp;
				M<='1';
				W_n<='0';   
				R_Add<=R;
				W_Add<=W;
				MADD<="10";
				CS_n<='1'; --RAM
				DL<='0';
				XL<='1';
			when "0101" =>   --NOT
				F_BUS<='0'; --SHIFT
				S<=tmp;
				M<='1';
				W_n<='0';   
				R_Add<=R;
				W_Add<=R;
				MADD<="10";
				CS_n<='1'; --RAM
				DL<='0';
				XL<='1';
			when "1010"=> --SHIFT
				F_BUS<='1'; --SHIFT
				S<=tmp;
				M<='1';
				if(W="00")  then --R
				  F_BUS<='1'; --SHIFT
				  FR_BUS<='1';
				  FL_BUS<='0';
				  W_n<='0';   
				  R_Add<=R;
				  W_Add<=R;
				  MADD<="10";
				  CS_n<='1'; --RAM
				  DL<='0';
				  XL<='1';
				else             --L
				  F_BUS<='1'; --SHIFT
				  FR_BUS<='0';
				  FL_BUS<='1';
				  W_n<='0';   
				  R_Add<=R;
				  W_Add<=R;
				  MADD<="10";
				  CS_n<='1'; --RAM
				  DL<='0';
				  XL<='1';
				end if;
			 when others=>
			 end case;
		 else 
			LD_PC<='1'; --PC
			IN_PC<='0';
		end if;

	end process;
	

end ip;