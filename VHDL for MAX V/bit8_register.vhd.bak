library ieee;
use ieee.std_logic_1164.all;

entity bit8_register is
port(
data_out:out std_logic_vector(7 downto 0);
data_in:in std_logic_vector(7 downto 0);
RW,CLK:in std_logic
);
end entity;

architecture behavioral of bit8_register is
signal data:std_logic_vector(7 downto 0):=(others=>'0');
begin
data_out<=data;
process(CLK) begin
	if(falling_edge(CLK)) then
		if RW='0' then
			data<=data_in;
		end if;
		
	end if;
end process;

end behavioral;
--synchronisation test 2