
module clarvi_soc (
	clk_clk,
	pixelstream_0_conduit_end_0_lcd_red,
	pixelstream_0_conduit_end_0_lcd_green,
	pixelstream_0_conduit_end_0_lcd_blue,
	pixelstream_0_conduit_end_0_lcd_hsync,
	pixelstream_0_conduit_end_0_lcd_vsync,
	pixelstream_0_conduit_end_0_lcd_de,
	pixelstream_0_conduit_end_0_lcd_dclk,
	pixelstream_0_conduit_end_0_lcd_dclk_en,
	reset_reset_n,
	splitter_right_cond_in_export,
	splitter_left_cond_in_export,
	out_leds_external_connection_export,
	out_hex_external_connection_export,
	in_left_dial_external_connection_export,
	in_right_dial_external_connection_export,
	in_buttons_external_connection_export,
	eightbitstosevenseg_left_1_led_pins_led0,
	eightbitstosevenseg_left_1_led_pins_led1,
	eightbitstosevenseg_left_2_led_pins_led0,
	eightbitstosevenseg_left_2_led_pins_led1,
	eightbitstosevenseg_left_3_led_pins_led0,
	eightbitstosevenseg_left_3_led_pins_led1,
	eightbitstosevenseg_right_1_led_pins_led0,
	eightbitstosevenseg_right_1_led_pins_led1,
	eightbitstosevenseg_right_2_led_pins_led0,
	eightbitstosevenseg_right_2_led_pins_led1,
	eightbitstosevenseg_right_3_led_pins_led0,
	eightbitstosevenseg_right_3_led_pins_led1);	

	input		clk_clk;
	output	[7:0]	pixelstream_0_conduit_end_0_lcd_red;
	output	[7:0]	pixelstream_0_conduit_end_0_lcd_green;
	output	[7:0]	pixelstream_0_conduit_end_0_lcd_blue;
	output		pixelstream_0_conduit_end_0_lcd_hsync;
	output		pixelstream_0_conduit_end_0_lcd_vsync;
	output		pixelstream_0_conduit_end_0_lcd_de;
	output		pixelstream_0_conduit_end_0_lcd_dclk;
	output		pixelstream_0_conduit_end_0_lcd_dclk_en;
	input		reset_reset_n;
	input	[23:0]	splitter_right_cond_in_export;
	input	[23:0]	splitter_left_cond_in_export;
	output	[9:0]	out_leds_external_connection_export;
	output	[23:0]	out_hex_external_connection_export;
	input	[7:0]	in_left_dial_external_connection_export;
	input	[7:0]	in_right_dial_external_connection_export;
	input	[15:0]	in_buttons_external_connection_export;
	output	[6:0]	eightbitstosevenseg_left_1_led_pins_led0;
	output	[6:0]	eightbitstosevenseg_left_1_led_pins_led1;
	output	[6:0]	eightbitstosevenseg_left_2_led_pins_led0;
	output	[6:0]	eightbitstosevenseg_left_2_led_pins_led1;
	output	[6:0]	eightbitstosevenseg_left_3_led_pins_led0;
	output	[6:0]	eightbitstosevenseg_left_3_led_pins_led1;
	output	[6:0]	eightbitstosevenseg_right_1_led_pins_led0;
	output	[6:0]	eightbitstosevenseg_right_1_led_pins_led1;
	output	[6:0]	eightbitstosevenseg_right_2_led_pins_led0;
	output	[6:0]	eightbitstosevenseg_right_2_led_pins_led1;
	output	[6:0]	eightbitstosevenseg_right_3_led_pins_led0;
	output	[6:0]	eightbitstosevenseg_right_3_led_pins_led1;
endmodule
