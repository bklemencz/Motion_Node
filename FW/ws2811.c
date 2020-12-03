#include "ws2811.h"
#include "config.h"
#include "delay.h"

static const uint8_t Gamma[] = {
		 1,  1,  1,  2,  2,  2,  2,  3,  3,  3,
     3,  4,  4,  4,  5,  5,  5,  6,  6,  6,
     7,  7,  8,  8,  9,  9, 10, 10, 11, 12,
    12, 13, 14, 15, 15, 16, 17, 18, 19, 20,
    21, 22, 23, 24, 25, 27, 28, 29, 31, 32,
    34, 36, 37, 39, 41, 43, 45, 47, 49, 51,
    53, 56, 58, 61, 63, 66, 69, 72, 75, 78,
    82, 85, 89, 92, 96,100,105,109,113,118,
   123,128,133,138,144,150,155,162,168,175,
   181,189,196,203,211,219,228,236,245,255
 };

extern uint8_t Main_State;

void WS2811_Init(void)
{
	GPIO_DeInit(GPIOA);
	GPIO_Init(WS2811_GPIO_PORT, (GPIO_Pin_TypeDef)WS2811_1_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(WS2811_GPIO_PORT, (GPIO_Pin_TypeDef)WS2811_2_PIN,GPIO_MODE_OUT_PP_LOW_FAST);
}

uint8_t WS2811_Gamma_Corr(uint8_t Percentage)
{
	if (Percentage == 0)
		return 0;
	else
		return Gamma[Percentage-1];
}

void WS2811_Update(void)
{
	if(bitRead(Main_State, MAINSTATE_WS))
	{
		//GO to target PWM with Fade delay
	}
}

void WS2811_1_Update_800K(uint8_t *ToSend, uint8_t Nr)
{
	uint8_t i,j,ActByte;
	for (j=0;j<Nr;j++)
	{
		ActByte=ToSend[j];
	for (i=0; i<8; i++)
	{
		if (ActByte&0x80)
		{
			_asm("bset 0x5000,#1"); // A1 high
			_asm("nop");
			_asm("nop");
			_asm("nop");
			_asm("nop");
			_asm("nop");
			_asm("nop");
			_asm("nop");
			_asm("nop");
			_asm("nop");
			//640ns
			_asm("bres 0x5000,#1"); // A2 low
			//860ns
		}
		else
		{
			_asm("bset 0x5000,#1"); // A1 high
			_asm("nop");
			_asm("nop");
			_asm("nop");
			_asm("nop");
			//320ns
			_asm("bres 0x5000,#1"); // A1 low
			_asm("nop");
			_asm("nop");
			_asm("nop");
			//940ns
		}
		ActByte <<= 1;
	}
}
}

void WS2811_2_Update_800K(uint8_t *ToSend, uint8_t Nr)
{
	uint8_t i,j,ActByte;
	for (j=0;j<Nr;j++)
	{
		ActByte = ToSend[j];
	for (i=0; i<8; i++)
	{
		if (ActByte&0x80)
		{
			_asm("bset 0x5000,#2"); // A2 high
			_asm("nop");
			_asm("nop");
			_asm("nop");
			_asm("nop");
			_asm("nop");
			_asm("nop");
			_asm("nop");
			_asm("nop");
			_asm("nop");
			//640ns
			_asm("bres 0x5000,#2"); // A2 low
			//860ns
		}
		else
		{
			_asm("bset 0x5000,#2"); // A2 high
			_asm("nop");
			_asm("nop");
			_asm("nop");
			_asm("nop");
			//320ns
			_asm("bres 0x5000,#2"); // A2 low
			_asm("nop");
			_asm("nop");
			_asm("nop");
			//940ns
		}
		ActByte <<= 1;
	}
}
}
