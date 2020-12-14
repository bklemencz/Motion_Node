/*
Dec 10 2020 V2.1 
CHANGE
 - Sequence check on RF commands to filter multiples
 - Lt8900 reset if corrupted
 - Shutter working
 - Broadcast ID at commands
 - Rx Mode immedeiately after send
 - Command 10 to set periodic message timer
 

 TODO
 - Turn off when hold
 - Motion enabled on single press
 x- check shutter function
 - Create command spreadsheet
 - Add Temp calib 
 - Add light level calib

*/
#ifndef __CONFIG_H
#define __CONFIG_H

#include "inc\stm8s.h"
#include "inc\stm8s_adc1.h"
#include "inc\stm8s_exti.h"
#include "inc\stm8s_gpio.h"
#include "inc\stm8s_i2c.h"
#include "inc\stm8s_spi.h"
#include "inc\stm8s_tim1.h"
#include "inc\stm8s_tim2.h"
#include "inc\stm8s_tim3.h"
#include "inc\stm8s_tim4.h"
#include "inc\stm8s_uart2.h"
#include "inc\stm8s_clk.h"
#include "delay.h"
#include "math.h"



#define RF_COM_USE              1
#define RF_NODEID_DEF           0x12
#define RF_MILIGHT_REMOTE       1
#define RF_MILIGHT_GATEW        1
#define RF_MILIGHT_HOLD_STEP    5
#define RF_TX_PERIODIC_SEND     1
#define RF_TX_PERIODIC_TIME     30000

#define LIGHTS_BY_MOTION        1
#define START_LEDON             1
#define LIGHTS_OFF_DELAY_S      10
#define LIGHT_MAX_PERCENT       99
#define LIGHT_NIGHT_PERCENT     10
#define RF_MI_LEARN_WINDOW_MS   60000
#define LED_FADE_ENABLED        1
#define LED_FADE_DELAY_MS       10
#define LED_RX_FADE_DELAY_EN    1
#define LED_DELAY_AFTER_RX      350
#define LED_FLASH_BRIGHTNESS    30

#define AD_HAS_NTC              1
#define AD_HAS_LDR              1
#define AD_HAS_GAS_SENSOR       1
#define AD_CAPT_DELAY_MS        5000
#define AD_AVG_COUNT            10
#define AD_MAX_LOOKUP_SIZE      21

#define HAS_PIR                 1
#define HAS_RADAR               1
#define PIR_DELAY_MS            380
#define RADAR_DELAY_MS          380

#define USE_485_COM             1
#define RS485_BAUD              57600
#define RS485_CHAR_DELAY        1
#define RS485_MESSAGE_DELAY     60

#define MAINSTATE_IDLE          0
#define MAINSTATE_AD            1
#define MAINSTATE_WS            2
#define MAINSTATE_RFRX          4
#define MAINSTATE_RFTX          8

#define MAINCONFIG_USERF        0       //USE RF FUCTIONS
#define MAINCONFIG_MIREM        1       //MI REMOTE RECEIVE FUNCTIONS
#define MAINCONFIG_MIGAT        2       //MI REMOTE GATEWAY FUNCTIONS
#define MAINCONFIG_MOVL         3
#define MAINCONFIG_FADEE        4       //LIGHT FADING ENABLED
#define MAINCONFIG_STRTON       5       //START ON WHEN STARTUP
#define MAINCONFIG_FADEDELEN    6       //FADE DELAY for remote hold
#define MAINCONFIG_RFPERTXEN    7       //PERIODIC MESSAGES ENABLED

#define RF_TX_MSG_REQ           0
#define RF_TX_MSG_RES           1
#define RF_TX_MSG_PER           2
#define RF_TX_MSG_ALM           3

#define RF_TX_ARQ               5
#define RF_TX_ARS               4

#define RF_RX_MOT_ALM           16
#define RF_TX_ALM_ITEM          64
#define RF_TX_PER_ITEM          65



#define LT8900_PKT_GPIO_PORT    (GPIOC)
#define LT8900_PKT_PIN          (GPIO_PIN_4)
#define LT8900_NCS_GPIO_PORT		(GPIOE)
#define LT8900_NCS_PIN          (GPIO_PIN_5)
#define SPI_PRESC               SPI_BAUDRATEPRESCALER_16

#define RS485_TXEN_PORT         (GPIOD)
#define RS485_TXEN_PIN          (GPIO_PIN_7)

#define RADAR_GPIO_PORT					(GPIOC)
#define RADAR_PIN								(GPIO_PIN_3)

#define PIR_GPIO_PORT						(GPIOC)
#define PIR_PIN									(GPIO_PIN_2)

#define AD_GPIO_PORT						(GPIOB)

#define NTC_AD_PIN							(GPIO_PIN_0)
#define NTC_AD_CHANNEL					(ADC1_CHANNEL_0)
#define NTC_USE_STEINHART       1
#define NTC_SER_RES             10000
#define NTC_R_NOM               10000
#define NTC_COEFF               3950
#define NTC_T_NOM               25

#define LDR_AD_PIN							(GPIO_PIN_1)
#define LDR_AD_CHANNEL					(ADC1_CHANNEL_1)

#define GAS_AD_PIN							(GPIO_PIN_2)
#define GAS_AD_CHANNEL					(ADC1_CHANNEL_2)

#define ADC_SPARE_AD_PIN				(GPIO_PIN_3)
#define ADC_SPARE_AD_CHANNEL		(ADC1_CHANNEL_3)

#define WS2811_GPIO_PORT				(GPIOA)
#define WS2811_1_PIN						(GPIO_PIN_1)
#define WS2811_2_PIN						(GPIO_PIN_2)
#define WS2811_MAX_CHANNELS			20

#define STATUS_1_GPIO_PORT			(GPIOF)                //Blue Status LED
#define STATUS_1_PIN						(GPIO_PIN_4)        //Blue Status LED
#define STATUS_2_GPIO_PORT			(GPIOD)					
#define STATUS_2_PIN						(GPIO_PIN_0)
#define STATUS_3_GPIO_PORT			(GPIOD)
#define STATUS_3_PIN						(GPIO_PIN_2)



#define TIM4_PERIOD             124
#define TIM4_PRESC              TIM4_PRESCALER_128




#define _BV(bit) (1 << (bit))
#define bitRead(value, bit) (((value) >> (bit)) & 0x01)

#endif
