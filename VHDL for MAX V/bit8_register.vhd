library ieee;
use ieee.std_logic_1164.all;

entity bit8_register is
port(
data_out,data_out_bus:out std_logic_vector(7 downto 0);
data_in:in std_logic_vector(7 downto 0);
RW,CLK,CE:in std_logic
);
end entity;

architecture behavioral of bit8_register is
signal data:std_logic_vector(7 downto 0):=(others=>'0');
begin
data_out<=data;
process(CLK) begin
	if(falling_edge(CLK) and CE='1') then
		if RW='1' then
			data<=data_in;
		end if;
		
	end if;
end process;

end behavioral;