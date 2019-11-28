	clarvi_soc u0 (
		.clk_clk                                   (<connected-to-clk_clk>),                                   //                           clk.clk
		.hex_converter_0_conduit_in_conduit        (<connected-to-hex_converter_0_conduit_in_conduit>),        //    hex_converter_0_conduit_in.conduit
		.hex_converter_0_conduit_out_1_readdata    (<connected-to-hex_converter_0_conduit_out_1_readdata>),    // hex_converter_0_conduit_out_1.readdata
		.hex_converter_0_conduit_out_2_readdata    (<connected-to-hex_converter_0_conduit_out_2_readdata>),    // hex_converter_0_conduit_out_2.readdata
		.hex_converter_0_conduit_out_3_readdata    (<connected-to-hex_converter_0_conduit_out_3_readdata>),    // hex_converter_0_conduit_out_3.readdata
		.hex_converter_0_conduit_out_4_readdata    (<connected-to-hex_converter_0_conduit_out_4_readdata>),    // hex_converter_0_conduit_out_4.readdata
		.hex_converter_0_conduit_out_5_readdata    (<connected-to-hex_converter_0_conduit_out_5_readdata>),    // hex_converter_0_conduit_out_5.readdata
		.hex_converter_0_conduit_out_6_readdata    (<connected-to-hex_converter_0_conduit_out_6_readdata>),    // hex_converter_0_conduit_out_6.readdata
		.hex_pio_external_connection_export        (<connected-to-hex_pio_external_connection_export>),        //   hex_pio_external_connection.export
		.led_pio_external_connection_export        (<connected-to-led_pio_external_connection_export>),        //   led_pio_external_connection.export
		.pixelstream_0_conduit_end_0_lcd_red       (<connected-to-pixelstream_0_conduit_end_0_lcd_red>),       //   pixelstream_0_conduit_end_0.lcd_red
		.pixelstream_0_conduit_end_0_lcd_green     (<connected-to-pixelstream_0_conduit_end_0_lcd_green>),     //                              .lcd_green
		.pixelstream_0_conduit_end_0_lcd_blue      (<connected-to-pixelstream_0_conduit_end_0_lcd_blue>),      //                              .lcd_blue
		.pixelstream_0_conduit_end_0_lcd_hsync     (<connected-to-pixelstream_0_conduit_end_0_lcd_hsync>),     //                              .lcd_hsync
		.pixelstream_0_conduit_end_0_lcd_vsync     (<connected-to-pixelstream_0_conduit_end_0_lcd_vsync>),     //                              .lcd_vsync
		.pixelstream_0_conduit_end_0_lcd_de        (<connected-to-pixelstream_0_conduit_end_0_lcd_de>),        //                              .lcd_de
		.pixelstream_0_conduit_end_0_lcd_dclk      (<connected-to-pixelstream_0_conduit_end_0_lcd_dclk>),      //                              .lcd_dclk
		.pixelstream_0_conduit_end_0_lcd_dclk_en   (<connected-to-pixelstream_0_conduit_end_0_lcd_dclk_en>),   //                              .lcd_dclk_en
		.reset_reset_n                             (<connected-to-reset_reset_n>),                             //                         reset.reset_n
		.shiftregctl_0_shiftreg_ext_shiftreg_clk   (<connected-to-shiftregctl_0_shiftreg_ext_shiftreg_clk>),   //    shiftregctl_0_shiftreg_ext.shiftreg_clk
		.shiftregctl_0_shiftreg_ext_shiftreg_loadn (<connected-to-shiftregctl_0_shiftreg_ext_shiftreg_loadn>), //                              .shiftreg_loadn
		.shiftregctl_0_shiftreg_ext_shiftreg_out   (<connected-to-shiftregctl_0_shiftreg_ext_shiftreg_out>),   //                              .shiftreg_out
		.rotary_left_rotary_in_rotary_in           (<connected-to-rotary_left_rotary_in_rotary_in>),           //         rotary_left_rotary_in.rotary_in
		.rotary_left_rotary_event_rotary_cw        (<connected-to-rotary_left_rotary_event_rotary_cw>),        //      rotary_left_rotary_event.rotary_cw
		.rotary_left_rotary_event_rotary_ccw       (<connected-to-rotary_left_rotary_event_rotary_ccw>),       //                              .rotary_ccw
		.rotary_right_rotary_in_rotary_in          (<connected-to-rotary_right_rotary_in_rotary_in>),          //        rotary_right_rotary_in.rotary_in
		.rotary_right_rotary_event_rotary_cw       (<connected-to-rotary_right_rotary_event_rotary_cw>),       //     rotary_right_rotary_event.rotary_cw
		.rotary_right_rotary_event_rotary_ccw      (<connected-to-rotary_right_rotary_event_rotary_ccw>)       //                              .rotary_ccw
	);

