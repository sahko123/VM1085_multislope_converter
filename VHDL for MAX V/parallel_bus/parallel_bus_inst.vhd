	component parallel_bus is
		port (
			addr       : in  std_logic_vector(7 downto 0) := (others => 'X'); -- addr
			nread      : in  std_logic                    := 'X';             -- nread
			dataout    : out std_logic_vector(7 downto 0);                    -- dataout
			nbusy      : out std_logic;                                       -- nbusy
			data_valid : out std_logic;                                       -- data_valid
			datain     : in  std_logic_vector(7 downto 0) := (others => 'X'); -- datain
			nwrite     : in  std_logic                    := 'X';             -- nwrite
			nerase     : in  std_logic                    := 'X';             -- nerase
			osc        : out std_logic                                        -- osc
		);
	end component parallel_bus;

	u0 : component parallel_bus
		port map (
			addr       => CONNECTED_TO_addr,       --       addr.addr
			nread      => CONNECTED_TO_nread,      --      nread.nread
			dataout    => CONNECTED_TO_dataout,    --    dataout.dataout
			nbusy      => CONNECTED_TO_nbusy,      --      nbusy.nbusy
			data_valid => CONNECTED_TO_data_valid, -- data_valid.data_valid
			datain     => CONNECTED_TO_datain,     --     datain.datain
			nwrite     => CONNECTED_TO_nwrite,     --     nwrite.nwrite
			nerase     => CONNECTED_TO_nerase,     --     nerase.nerase
			osc        => CONNECTED_TO_osc         --        osc.osc
		);

