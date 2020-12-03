#include "config.h"


void Serial_Send_PWM_Onoff(uint8_t ID, bool Onoff)
{
    UART2_SendData8('P');
    UART2_SendData8(ID);
    UART2_SendData8('C');
    if (Onoff) UART2_SendData8('O');
    else UART2_SendData8('F');
    UART2_SendData8('0');
    UART2_SendData8('0');
    UART2_SendData8('\r');
}

void Serial_Send_PWM_MotionDet(uint8_t ID)
{
    UART2_SendData8('P');
    UART2_SendData8(ID);
    UART2_SendData8('C');
    UART2_SendData8('M');
    UART2_SendData8('0');
    UART2_SendData8('0');
    UART2_SendData8('\r');
}

void Serial_Send_PWM_MotionEN(uint8_t ID, bool MotionEN)
{
    UART2_SendData8('P');
    UART2_SendData8(ID);
    UART2_SendData8('S');
    UART2_SendData8('E');
    if (MotionEN) UART2_SendData8('1');
    else UART2_SendData8('0');
    UART2_SendData8('0');
    UART2_SendData8('\r');
}

void Serial_Send_PWM_NightEN(uint8_t ID, bool NightEN)
{
    UART2_SendData8('P');
    UART2_SendData8(ID);
    UART2_SendData8('C');
    UART2_SendData8('N');
    if (NightEN) UART2_SendData8('1');
    else UART2_SendData8('0');
    UART2_SendData8('0');
    UART2_SendData8('\r');
}

void Serial_Send_PWM_Bright(uint8_t ID, uint8_t Ch1, uint8_t Ch2)
{
    UART2_SendData8('P');
    UART2_SendData8(ID);
    UART2_SendData8('C');
    UART2_SendData8('3');
    UART2_SendData8(Ch1);
    UART2_SendData8(Ch2);
    UART2_SendData8('\r');
}

void Serial_Send_PWM_ChBright(uint8_t ID, uint8_t Ch, uint8_t Val)
{
    UART2_SendData8('P');
    UART2_SendData8(ID);
    UART2_SendData8('C');
    if (Ch==1) UART2_SendData8('1');
    if (Ch==2) UART2_SendData8('2');
    if (Ch==3) UART2_SendData8('4');
    UART2_SendData8(Val);
    UART2_SendData8('0');
    UART2_SendData8('\r');
}