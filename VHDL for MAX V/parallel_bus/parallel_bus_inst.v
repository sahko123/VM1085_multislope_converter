	parallel_bus u0 (
		.addr       (<connected-to-addr>),       //       addr.addr
		.nread      (<connected-to-nread>),      //      nread.nread
		.dataout    (<connected-to-dataout>),    //    dataout.dataout
		.nbusy      (<connected-to-nbusy>),      //      nbusy.nbusy
		.data_valid (<connected-to-data_valid>), // data_valid.data_valid
		.datain     (<connected-to-datain>),     //     datain.datain
		.nwrite     (<connected-to-nwrite>),     //     nwrite.nwrite
		.nerase     (<connected-to-nerase>),     //     nerase.nerase
		.osc        (<connected-to-osc>)         //        osc.osc
	);

