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
	if(RW='1') then
		
		case spi_address is --read case
			when "0100000" => spi_data_out<=accumulator(7 downto 0);
			when "0100001" => spi_data_out<=accumulator(15 downto 8);
			when "0100010" => spi_data_out<=accumulator(23 downto 16);
			when "0100011" => spi_data_out<=accumulator(31 downto 24);
			when "0100100" => spi_data_out<=accumulator(39 downto 32);
			when "0100101" => spi_data_out<=accumulator(47 downto 40);
			
			when "1000001" => spi_data_out<=slp_comp1(7 downto 0);
			when "1000010" => spi_data_out<=slp_comp1(15 downto 8);
			when "1000011" => spi_data_out<=slp_comp1(23 downto 16);
			when "1000100" => spi_data_out<=sln_comp2(7 downto 0);
			when "1000101" => spi_data_out<=sln_comp2(15 downto 8);
			when "1000110" => spi_data_out<=sln_comp2(23 downto 16);
			when "1000111" => spi_data_out<=slp_comp3(7 downto 0);
			when "1001000" => spi_data_out<=slp_comp3(15 downto 8);
			when "1001001" => spi_data_out<=sln_comp4(7 downto 0);
			when "1001010" => spi_data_out<=sln_comp4(15 downto 8);
			when "1001011" => spi_data_out<=slp_comp5(7 downto 0);
			when "1001100" => spi_data_out<=slp_comp5(15 downto 8);
			
			when others => spi_data_out<=(others=>'Z');
		end case;
				
	else 
		case spi_address is --write case
			
			when "1000001" => slp_comp1(7 downto 0)<=spi_data_in;
			when "1000010" => slp_comp1(15 downto 8)<=spi_data_in;
			when "1000011" => slp_comp1(23 downto 16)<=spi_data_in;
			when "1000100" => sln_comp2(7 downto 0)<=spi_data_in;
			when "1000101" => sln_comp2(15 downto 8)<=spi_data_in;
			when "1000110" => sln_comp2(23 downto 16)<=spi_data_in;
			when "1000111" => slp_comp3(7 downto 0)<=spi_data_in;
			when "1001000" => slp_comp3(15 downto 8)<=spi_data_in;
			when "1001001" => sln_comp4(7 downto 0)<=spi_data_in;
			when "1001010" => sln_comp4(15 downto 8)<=spi_data_in;
			when "1001011" => slp_comp5(7 downto 0)<=spi_data_in;
			when "1001100" => slp_comp5(15 downto 8)<=spi_data_in;
			when others => spi_data_out<=(others=>'Z');
		end case;
	end if;
end process;


end behavioral;