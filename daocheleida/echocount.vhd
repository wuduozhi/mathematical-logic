LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_unsigned.ALL;
ENTITY echocount IS
    PORT(
        clk,clr,echo: IN STD_LOGIC;
        count: out std_logic_vector(15 downto 0)
        );
END ENTITY echocount;
ARCHITECTURE echocount_arch OF echocount  IS 
signal js: std_logic_vector(15 downto 0):="0000000000000000";
begin 
   process (clr,echo,clk)
   begin 
   if(clr='1') then js<="0000000000000000";
   elsif(js="1111111111111111") then js<="0000000000000000";
   elsif(clk'event and clk='1') then 
         if(echo='1') then js<=js+1;
         else count<=js;
         end if;
   end if;

   end process;
end echocount_arch;