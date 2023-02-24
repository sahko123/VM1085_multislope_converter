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

signal slp_comp1:std_logic_vector(7 downto 0):=(others=>'0');
signal sln_comp2:std_logic_vector(7 downto 0):=(others=>'0');
signal slp_comp3:std_logic_vector(7 downto 0):=(others=>'0');
signal sln_comp4:std_logic_vector(7 downto 0):=(others=>'0');
signal slp_comp5:std_logic_vector(7 downto 0):=(others=>'0');
signal sln_comp6:std_logic_vector(7 downto 0):=(others=>'0');
signal slp_comp7:std_logic_vector(7 downto 0):=(others=>'0');
signal sln_comp8:std_logic_vector(7 downto 0):=(others=>'0');

signal accumulator:std_logic_vector(48 downto 0);

begin


--spi control
process(spi_CLK) begin
if(rising_edge(spi_CLK)) then
	if(RW='1') then
		case spi_address is --read case
			when "1000001" => spi_data_out<=slp_comp1;
			when "1000010" => spi_data_out<=sln_comp2;
			when "1000011" => spi_data_out<=slp_comp3;
			when "1000100" => spi_data_out<=sln_comp4;
			when others => spi_data_out<=(others=>'Z');
		end case;
	end if;
	
	if(RW='1') then
		
	end if;
	
end if;
end process;


end behavioral;