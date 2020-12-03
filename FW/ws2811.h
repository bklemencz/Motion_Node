#ifndef __ws2811_H
#define __ws2811_H

#include "stm8s.h"

void WS2811_Init(void);
void WS2811_1_Update_800K(uint8_t *ToSend, uint8_t Nr);
void WS2811_2_Update_800K(uint8_t *ToSend, uint8_t Nr);
uint8_t WS2811_Gamma_Corr(uint8_t Percentage);
void WS2811_Update(void);


#endif
