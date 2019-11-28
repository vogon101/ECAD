
module clarvi_soc (
	clk_clk,
	hex_converter_0_conduit_in_conduit,
	hex_converter_0_conduit_out_1_readdata,
	hex_converter_0_conduit_out_2_readdata,
	hex_converter_0_conduit_out_3_readdata,
	hex_converter_0_conduit_out_4_readdata,
	hex_converter_0_conduit_out_5_readdata,
	hex_converter_0_conduit_out_6_readdata,
	hex_pio_external_connection_export,
	led_pio_external_connection_export,
	pixelstream_0_conduit_end_0_lcd_red,
	pixelstream_0_conduit_end_0_lcd_green,
	pixelstream_0_conduit_end_0_lcd_blue,
	pixelstream_0_conduit_end_0_lcd_hsync,
	pixelstream_0_conduit_end_0_lcd_vsync,
	pixelstream_0_conduit_end_0_lcd_de,
	pixelstream_0_conduit_end_0_lcd_dclk,
	pixelstream_0_conduit_end_0_lcd_dclk_en,
	reset_reset_n,
	shiftregctl_0_shiftreg_ext_shiftreg_clk,
	shiftregctl_0_shiftreg_ext_shiftreg_loadn,
	shiftregctl_0_shiftreg_ext_shiftreg_out,
	rotary_left_rotary_in_rotary_in,
	rotary_left_rotary_event_rotary_cw,
	rotary_left_rotary_event_rotary_ccw,
	rotary_right_rotary_in_rotary_in,
	rotary_right_rotary_event_rotary_cw,
	rotary_right_rotary_event_rotary_ccw);	

	input		clk_clk;
	input	[23:0]	hex_converter_0_conduit_in_conduit;
	output	[6:0]	hex_converter_0_conduit_out_1_readdata;
	output	[6:0]	hex_converter_0_conduit_out_2_readdata;
	output	[6:0]	hex_converter_0_conduit_out_3_readdata;
	output	[6:0]	hex_converter_0_conduit_out_4_readdata;
	output	[6:0]	hex_converter_0_conduit_out_5_readdata;
	output	[6:0]	hex_converter_0_conduit_out_6_readdata;
	output	[23:0]	hex_pio_external_connection_export;
	output	[9:0]	led_pio_external_connection_export;
	output	[7:0]	pixelstream_0_conduit_end_0_lcd_red;
	output	[7:0]	pixelstream_0_conduit_end_0_lcd_green;
	output	[7:0]	pixelstream_0_conduit_end_0_lcd_blue;
	output		pixelstream_0_conduit_end_0_lcd_hsync;
	output		pixelstream_0_conduit_end_0_lcd_vsync;
	output		pixelstream_0_conduit_end_0_lcd_de;
	output		pixelstream_0_conduit_end_0_lcd_dclk;
	output		pixelstream_0_conduit_end_0_lcd_dclk_en;
	input		reset_reset_n;
	output		shiftregctl_0_shiftreg_ext_shiftreg_clk;
	output		shiftregctl_0_shiftreg_ext_shiftreg_loadn;
	input		shiftregctl_0_shiftreg_ext_shiftreg_out;
	input	[1:0]	rotary_left_rotary_in_rotary_in;
	output		rotary_left_rotary_event_rotary_cw;
	output		rotary_left_rotary_event_rotary_ccw;
	input	[1:0]	rotary_right_rotary_in_rotary_in;
	output		rotary_right_rotary_event_rotary_cw;
	output		rotary_right_rotary_event_rotary_ccw;
endmodule
