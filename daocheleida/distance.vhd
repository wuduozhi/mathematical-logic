LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_unsigned.ALL;
ENTITY distance IS
    PORT(
        count: in std_logic_vector(15 downto 0);
        dis: out integer range 0 to 1200
        );
END ENTITY distance;
ARCHITECTURE distance_arch OF distance IS 
signal Dcount: integer range 0 to 65536;
begin 
Dcount<=CONV_INTEGER(count);
dis<=(Dcount*17)/1000;
end distance_arch;