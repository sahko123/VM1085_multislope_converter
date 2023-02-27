library ieee;
use ieee.std_logic_1164.all;

entity bit8_register is
port(
data_bus:inout std_logic_vector(7 downto 0);
RW,CE:in std_logic
);
end entity;

architecture behavioral of bit8_register is
signal data:std_logic_vector(7 downto 0):=(others=>'0');
begin

process(CE) begin
	if CE='1' then
	if RW='1' then
		data_bus<=data;
	else
		data_bus<=(others=>'Z');
		data<=data_bus;
	end if;
	end if;
	
end process;

end behavioral;