// === UTILITY FUNCTIONS === //
#include "avalon_addr.h"
#include "div.h"
// our pixel format in memory is 5 bits of red, 6 bits of green, 5 bits of blue
#define PIXEL16(r,g,b) (((r & 0x1F)<<11) | ((g & 0x3F)<<5) | ((b & 0x1F)<<0))
// ... but for ease of programming we refer to colours in 8/8/8 format and discard the lower bits
#define PIXEL24(r,g,b) PIXEL16((r>>3), (g>>2), (b>>3))

#define PIXEL_WHITE PIXEL24(0xFF, 0xFF, 0xFF)
#define PIXEL_BLACK PIXEL24(0x00, 0x00, 0x00)
#define PIXEL_RED   PIXEL24(0xFF, 0x00, 0x00)
#define PIXEL_GREEN PIXEL24(0x00, 0xFF, 0x00)
#define PIXEL_BLUE  PIXEL24(0x00, 0x00, 0xFF)

#define DISPLAY_WIDTH	480
#define DISPLAY_HEIGHT	272

//#define FABRICATE 
# define SIMULATE

void debug_print(int value)
{
	asm ("csrw	0x7B2, %0" : : "r" (value) );
}

int avalon_read(unsigned int address)
{
	volatile int *pointer = (volatile int *) address;
	return pointer[0];
}

void avalon_write(unsigned int address, int data)
{
	volatile int *pointer = (volatile int *) address;
	pointer[0] = data;
}



void vid_set_pixel(int x, int y, int colour)
{
	// derive a pointer to the framebuffer described as 16 bit integers
	volatile short *framebuffer = (volatile short *) (FRAMEBUFFER_BASE);

	// make sure we don't go past the edge of the screen
	if ((x<0) || (x>DISPLAY_WIDTH-1))
		return;
	if ((y<0) || (y>DISPLAY_HEIGHT-1))
		return;

	framebuffer[x+y*DISPLAY_WIDTH] = colour;
}

void vid_clear(int colour) {
	for (int i = 0; i < DISPLAY_WIDTH; i ++) {
		for (int j = 0; j < DISPLAY_HEIGHT; j ++) {
			vid_set_pixel(i, j, colour);
		}
	}
}


// === MAIN CODE === //

int getChange(unsigned int new_value, unsigned int last_value) {
	if (last_value > 250 && new_value < 6) {
		return new_value - last_value + 256;
	} else if (last_value < 6 && new_value > 250) {
		return new_value - last_value - 256;
	} else {
		return new_value - last_value;
	}
}

int clamp (int value, int bound) {

	if (value < 0) return 0;
	if (value >= bound) return bound - 1;
	return value;

}


int main(void)
{
	debug_print (1);

#ifdef FABRICATE
	vid_clear(0);
#endif

	// Left = horrizontal 

	int x_position = 0;
	int y_position = 0;

	int left = avalon_read(PIO_ROTARY_L);
	int right = avalon_read(PIO_ROTARY_R);

	int last_left = 0;
	int last_right = 0;

	x_position = clamp(x_position + getChange(left, last_left), DISPLAY_WIDTH);
	y_position = clamp(y_position + getChange(right, last_right), DISPLAY_HEIGHT);

	while (1) {

		int clear = rem(avalon_read(PIO_BUTTONS) >> 1, 4);
		if (clear) vid_clear(0);
		
		//debug_print(x_position);
		//debug_print(y_position);

		left = avalon_read(PIO_ROTARY_L);
		right = avalon_read(PIO_ROTARY_R);

		int new_x_position = clamp(x_position + getChange(left, last_left), DISPLAY_WIDTH);
		int new_y_position = clamp(y_position + getChange(right, last_right), DISPLAY_HEIGHT);

		last_left = left;
		last_right = right;

		//TODO: This may not work in FPGA
		for (
			int x = x_position; 
			(x_position < new_x_position ? x < new_x_position : x > new_x_position); 
			(x_position < new_x_position ? x++ : x--)
		) {
			vid_set_pixel(x, y_position, PIXEL_WHITE);
		}

		x_position = new_x_position;

		for (
			int y = y_position; 
			(y_position < new_y_position ? y < new_y_position : y > new_y_position); 
			(y_position < new_y_position ? y++ : y--)
		) {
			vid_set_pixel(x_position, y, PIXEL_WHITE);
		}

		y_position = new_y_position;

		vid_set_pixel(x_position, y_position, PIXEL_WHITE);
		
	}
	
	

	
}
