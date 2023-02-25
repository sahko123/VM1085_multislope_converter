library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity converter is
port(
spi_CLK,RW:in std_logic;
spi_data_out:out std_logic_vector(7 downto 0);
spi_data_in:in std_logic_vector(7 downto 0);
spi_address:in std_logic_vector(6 downto 0)
);
end entity;

architecture behavioral of converter is

signal slp_comp1:std_logic_vector(23 downto 0):=(others=>'0');--10k pos cal
signal sln_comp2:std_logic_vector(23 downto 0):=(others=>'0');--10k neg cal
signal slp_comp3:std_logic_vector(15 downto 0):=(others=>'0');--80k pos cal
signal sln_comp4:std_logic_vector(15 downto 0):=(others=>'0');--640k neg cal
signal slp_comp5:std_logic_vector(15 downto 0):=(others=>'0');--5.12M pos cal

signal accumulator:std_logic_vector(47 downto 0);--count accumulator

begin

--slp_comp1_1:entity work.bit8_register port map();


--spi control registers
process(spi_address) begin
	
end process;


end behavioral;