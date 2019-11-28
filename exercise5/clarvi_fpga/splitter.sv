module split(	
	input clock,
	input reset,
	input [23:0] data,
	output [6:0] o1, output [6:0] o2, output [6:0] o3, output [6:0] o4, output [6:0] o5, output [6:0] o6
);  

	logic [7:0] h1,h2,h3; //FIXED
	assign h1 = data[7:0];
	assign h2 = data[15:8];
	assign h3 = data[23:16];

	EightBitsToSevenSeg c1(clock, reset, h1, o1, o2);
	EightBitsToSevenSeg c2(clock, reset, h2, o3, o4);
	EightBitsToSevenSeg c3(clock, reset, h3, o5, o6);


	
endmodule
