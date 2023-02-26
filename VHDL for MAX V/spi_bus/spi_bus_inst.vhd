	component spi_bus is
		port (
			si  : in  std_logic := 'X'; -- si
			sck : in  std_logic := 'X'; -- sck
			ncs : in  std_logic := 'X'; -- ncs
			so  : out std_logic;        -- so
			osc : out std_logic         -- osc
		);
	end component spi_bus;

	u0 : component spi_bus
		port map (
			si  => CONNECTED_TO_si,  --  si.si
			sck => CONNECTED_TO_sck, -- sck.sck
			ncs => CONNECTED_TO_ncs, -- ncs.ncs
			so  => CONNECTED_TO_so,  --  so.so
			osc => CONNECTED_TO_osc  -- osc.osc
		);

