library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity VM1085_VHDL is
port(
comp:in std_logic

);
end entity;

architecture behavioral of VM1085_VHDL is
signal data_out:std_logic_vector(7 downto 0);
signal data_in:std_logic_vector(7 downto 0);
signal RW,CLK:std_logic;


begin

testreg:entity work.bit8_register port map(
	data_out=>data_out,
	data_in=>data_in,
	RW=>RW,
	CLK=>CLK
);

end behavioral;