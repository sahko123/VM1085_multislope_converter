
module parallel_bus (
	addr,
	nread,
	dataout,
	nbusy,
	data_valid,
	datain,
	nwrite,
	nerase,
	osc);	

	input	[7:0]	addr;
	input		nread;
	output	[7:0]	dataout;
	output		nbusy;
	output		data_valid;
	input	[7:0]	datain;
	input		nwrite;
	input		nerase;
	output		osc;
endmodule
