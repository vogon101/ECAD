// rotary decoder template

module rotary
  (
	input  wire clk,
	input  wire rst,
	input  wire [1:0] rotary_in,
	output logic [7:0] rotary_pos,
        output logic rot_cw,
        output logic rot_ccw
   );

	reg [1:0] data_0;
	reg [1:0] data_1;
	debounce MSB_debouncer (clk, rst, rotary_in[0], data_1[0]); 
	debounce LSB_debouncer (clk, rst, rotary_in[1], data_0[0]);


	always_ff @(posedge clk) begin
		if (rst) rotary_pos <= 0;
		else begin
			
			if (data_0[0] == 1 && data_0[1] == 0 && data_1[0] == 0) begin
				rotary_pos <= rotary_pos - 1;
				rot_cw = 0;
				rot_ccw = 1;
			end else if (data_1[0] == 1 && data_1[1] == 0 && data_0[0] == 0) begin
				rotary_pos <= rotary_pos + 1;
				rot_cw = 1;
				rot_ccw = 0;
			end else begin
				rot_cw = 0;
				rot_ccw = 0;
			end;


			data_0[1] <= data_0[0];
			data_1[1] <= data_1[0]; 
		end;
	end	

endmodule // rotarydecoder
