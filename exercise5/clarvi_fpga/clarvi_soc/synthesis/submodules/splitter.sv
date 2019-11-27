module split(input [23:0] data, output [7:0] o1, output [7:0] o2, output [7:0] o3);  
	assign o1 = data[7:0];
	assign o2 = data[15:8];
	assign o3 = data[23:16];
endmodule
