#include "div.h"
#include "cycles.h"

void debug_print(int value)
{
	asm ("csrw	0x7B2, %0" : : "r" (value) );
}

void hex_output(int value)
{
	int *hex_leds = (int *) 0x04000080;  // define a pointer to the register
	*hex_leds = value;                   // write the value to that address
}


int getCentiSeconds(int cycles) {
	return rem(div(cycles, 10),100);
}

int getSeconds(int cycles) {
	return rem(div(cycles,1000), 60);
}

int getMins(int cycles) {
	return div(cycles, 60000);
}

int bcd(int value) {
	return rem(value, 10) + (div(value, 10) << 4);
}

int getClock() {
	
	//hex_output(0xaaaaaa);
	//hex_output(10 << 8); // a
	int cycles = get_time();
	//hex_output(cycles);
	//hex_output(11 << 8); // b
	int css = getCentiSeconds(cycles);
	//hex_output(css);
	//hex_output(12 << 8); // c
	int ss = getSeconds(cycles);
	//hex_output(ss);
	//hex_output(13 << 8);
	int ms = getMins(cycles);
	//hex_output(ms);
	//hex_output(14 << 8);
	//ouhex_output(0xfffff);

	//hex_output(bcd(ms));
	//hex_output(bcd(ss));
	//hex_output(bcd(css));

	return (bcd(ms) << 16) + (bcd(ss) << 8) + bcd(css);

}


int main(void)
{
	

	while(1) {
		hex_output(getClock());
	
	}
}
