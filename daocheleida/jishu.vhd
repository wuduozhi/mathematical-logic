LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_unsigned.ALL;
ENTITY jishu IS
    PORT(
        clk: IN STD_LOGIC;
        trig,clr: OUT STD_LOGIC
        );
END ENTITY jishu ;
ARCHITECTURE jishu_arch OF jishu  IS 
signal js: std_logic_vector(15 downto 0):="1111111111111111";
begin 
   process (clk)
   begin 
   if(js="1111111111111111") then trig<='1';clr<='1'; js<="0000000000000000";
   elsif(clk'event and clk='1') then js<=js+1; clr<='0'; if(js="0000000000011111") then trig<='0'; end if;
   end if;


end process;
end jishu_arch;