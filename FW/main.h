#include "stm8s.h"

#ifndef _MAIN_H_
#define _MAIN_H_ 1

void GR_CW_Set (uint8_t Group, uint32_t Value);
void GR_WW_Set (uint8_t Group, uint32_t Value);
void EE_Store_Config (void);

#endif
