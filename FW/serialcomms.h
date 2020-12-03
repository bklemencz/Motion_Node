#ifndef __SECOM_H
#define __SECOM_H

#include "inc\stm8s.h"

void Serial_Send_PWM_Onoff(uint8_t ID, bool Onoff);
void Serial_Send_PWM_MotionDet(uint8_t ID);
void Serial_Send_PWM_MotionEN(uint8_t ID, bool MotionEN);
void Serial_Send_PWM_NightEN(uint8_t ID, bool NightEN);
void Serial_Send_PWM_Bright(uint8_t ID, uint8_t Ch1, uint8_t Ch2);
void Serial_Send_PWM_ChBright(uint8_t ID, uint8_t Ch, uint8_t Val);

#endif
