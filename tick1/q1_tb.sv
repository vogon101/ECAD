module tb_q1(
  output logic [7:0] out_a,
  output logic [7:0] out_b);

	logic clk;      // clock signal we are going to generate
	logic reset;
	logic latch;


		  // instantiate design under test (dut)
	alternating_counters dut(.clock(clk), .reset(reset), .latch(latch), .out_a(out_a), .out_b(out_b));

	initial         // sequence of events to simulate
	begin
		clk = 0;   // at time=0 set clock to zero
		reset = 0;
		latch = 1;	
	end

	always #5       // every five simulation units...
	clk <= !clk;  // ...invert the clock

		  // produce debug output on the negative edge of the clock
	always @(negedge clk)
	$display("time=%05d: (a,b) = (%7d,%7d)",
	$time,      // simulator time
	out_a, out_b);   // outputs to display: red, amber, green

endmodule // tb_tlight
