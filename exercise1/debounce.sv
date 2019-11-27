// debounce template

module debounce
  (
	input wire       clk,       // 50MHz clock input
	input wire       rst,       // reset input (positive)
	input wire       bouncy_in, // bouncy asynchronous input
	output reg 		 clean_out  // clean debounced output
   );


	reg [15:0] counter;
	reg hold;

   
	always_ff @(posedge clk) begin
		if (rst) begin
			counter <= 0;
			hold <= 0;
			clean_out <= 0;
		end else if (bouncy_in == hold) begin
			if (counter > 20000) begin
				clean_out <= hold;
				//$display(counter);
			end else counter <= counter + 1;
		end else begin
			hold <= bouncy_in;
			counter <= 3'b000;
		end;
	end;


endmodule // debounce
