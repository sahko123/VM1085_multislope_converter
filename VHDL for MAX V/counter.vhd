library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity counter is
port(
count_out:out std_logic_vector(3 downto 0):="0000";
RST,CLK:in std_logic:='0'
);
end entity;

architecture behavioral of counter is
signal count:unsigned(3 downto 0):="0000";
begin
count_out<=std_logic_vector(count);

process(CLK,RST) begin
if rising_edge(clk) then
count<=count+1; 
if RST='1' then
count<="0000";
end if;
end if;
end process;


end behavioral;