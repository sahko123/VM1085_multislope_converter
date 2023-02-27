library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity VM1085_VHDL is
port(
comp:in std_logic;
MOSI,SCLK,CE:in std_logic;
MISO,OSC:out std_logic
);
end entity;

architecture behavioral of VM1085_VHDL is
signal data_out:std_logic_vector(7 downto 0);
signal data_in:std_logic_vector(7 downto 0);
signal RW,CLK:std_logic;
	component spi_bus is
		port (
			si  : in  std_logic := 'X'; -- si
			sck : in  std_logic := 'X'; -- sck
			ncs : in  std_logic := 'X'; -- ncs
			so  : out std_logic;        -- so
			osc : out std_logic         -- osc
		);
	end component spi_bus;


begin
spitest : component spi_bus
		port map (
			si  => MOSI,  --  si.si
			sck => SCLK, -- sck.sck
			ncs => CE, -- ncs.ncs
			so  => MISO,  --  so.so
			osc => OSC  -- osc.osc
		);

end behavioral;