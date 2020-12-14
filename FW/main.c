/**
  ******************************************************************************
  * @file    Project/main.c
  * @author  MCD Application Team
  * @version V2.2.0
  * @date    30-September-2014
  * @brief   Main program body
   ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

#ifndef __CSMC__
#define __CSMC__
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "lt8900.h"
#include "eeprom.h"
#include "delay.h"
#include "config.h"
#include "ws2811.h"
#include "adc.h"
#include "rfcomms.h"
#include "serialcomms.h"
#include "main.h"

/* Private defines -----------------------------------------------------------*/
uint8_t Main_State; //0-idle
uint16_t Main_Config;

uint8_t Conf_LED_Fade_Delay;
uint16_t Conf_LED_TurnOff_Delay_S;
uint8_t Conf_LED_Max_Brightness;
uint8_t Conf_LED_NightMode_Brightness;



extern volatile uint32_t 	Uptime;
extern volatile uint16_t 	LED_Fade_Timer;
extern volatile uint16_t 	AD_Trigger_Timer;

volatile bool PIR_Motion, RADAR_Motion;
volatile uint16_t PIR_Conf_Timer, RADAR_Conf_Timer;
uint32_t	LastMotion_Uptime;

uint8_t TxData[8];

extern bool RF_RX_MI_NewRemote;
extern uint16_t RF_RX_MI_ValidAddress;
extern uint16_t RF_PeriodicTime;
extern volatile uint16_t  RF_TX_Timer;
// Enabled Status for groups
extern bool RF_RX_LED_GroupEnabled[4];
extern bool RF_RX_LED_NightMode[4];
extern bool RF_RX_LED_MotionAct[4];
extern bool RF_RX_Motion;
bool LED_MotionReq[4];

// Bitfield definition of Lamp position to group
uint32_t LEDGroup_Def_CW[4];
uint32_t LEDGroup_Def_WW[4];


bool LED_Was_Updated;
bool RF_TX_MotionIR, RF_TX_MotionRadar;
volatile bool Status_Disp_EN;

// Target Brightness levels for groups percentage
uint8_t LED_Target_CW[4];
uint8_t LED_Target_WW[4];

//Last Saved Brightness, goes to EEPROM and the level after turn on.
uint8_t LED_LastSaved_CW[4];
uint8_t LED_LastSaved_WW[4];

// Actual Brightness levels for groups percentage
uint8_t LED_Act_CW[4];
uint8_t LED_Act_WW[4];

//shutter control definitions
uint8_t Shutter_Config;
bool Shutter_Enabled[4];

// converted brightness level to send
uint8_t WS2811_1_Stream[WS2811_MAX_CHANNELS];
uint8_t WS2811_2_Stream[WS2811_MAX_CHANNELS];
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

void Init_GPIOS(void)
{

	//CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
	CLK->CKDIVR |= (uint8_t)0x00;
	// GPIO Init
	// Set External interrupts on PORTC to rise and EXTI_SENSITIVITY_RISE_FALL
	//EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
	//EXTI->CR1 |= (uint8_t)((uint8_t)0x03 << 4);
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_RISE_FALL);

	//if (USE_485_COM) GPIO_Init(RS485_TXEN_PORT, (GPIO_Pin_TypeDef) RS485_TXEN_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	if (HAS_RADAR) GPIO_Init(RADAR_GPIO_PORT, (GPIO_Pin_TypeDef) RADAR_PIN, GPIO_MODE_IN_PU_IT);
	if (HAS_PIR) GPIO_Init(PIR_GPIO_PORT, (GPIO_Pin_TypeDef) PIR_PIN, GPIO_MODE_IN_PU_IT);
	GPIO_Init(STATUS_1_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(STATUS_2_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(STATUS_3_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_3_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(RS485_TXEN_PORT,(GPIO_Pin_TypeDef) RS485_TXEN_PIN,GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_WriteHigh(RS485_TXEN_PORT,(GPIO_Pin_TypeDef) RS485_TXEN_PIN);								//Enable 485 Tx
	UART2_DeInit();
	UART2_Init(RS485_BAUD,UART2_WORDLENGTH_8D,UART2_STOPBITS_1,UART2_PARITY_NO,UART2_SYNCMODE_CLOCK_DISABLE,UART2_MODE_TXRX_ENABLE);
	UART2_Cmd(ENABLE);

	WS2811_Init();
	LT8900_Init();
	ADC_Init();
	Timer_Init();
}

/// TODO Save LED Targets to EEPROM
void Save_Targets(void)
{
	EEPROM_ProgramByte(39, LED_LastSaved_CW[0]);
	EEPROM_ProgramByte(40, LED_LastSaved_CW[1]);
	EEPROM_ProgramByte(41, LED_LastSaved_CW[2]);
	EEPROM_ProgramByte(42, LED_LastSaved_CW[3]);

	EEPROM_ProgramByte(43, LED_LastSaved_WW[0]);
	EEPROM_ProgramByte(44, LED_LastSaved_WW[1]);
	EEPROM_ProgramByte(45, LED_LastSaved_WW[2]);
	EEPROM_ProgramByte(46, LED_LastSaved_WW[3]);
}


/// Setting Defult values before EEPROM read
void SetDefaults(void)
{
	LEDGroup_Def_WW[0]=0b10101010000000000000000000000000;
	LEDGroup_Def_CW[0]=0b01010101000000000000000000000000;
	LEDGroup_Def_WW[1]=0b00000000101010100000000000000000;
	LEDGroup_Def_CW[1]=0b00000000010101010000000000000000;
	LEDGroup_Def_WW[2]=0b00000000000000001010101000000000;
	LEDGroup_Def_CW[2]=0b00000000000000000101010100000000;
	LEDGroup_Def_WW[3]=0b00000000000000000000000010101010;
	LEDGroup_Def_CW[3]=0b00000000000000000000000001010101;
	RF_SetNodeID(RF_NODEID_DEF);
	if (LED_FADE_ENABLED) SetBit(Main_Config, MAINCONFIG_FADEE);
	if (RF_COM_USE)	SetBit(Main_Config,MAINCONFIG_USERF);
	if (RF_MILIGHT_REMOTE) SetBit(Main_Config, MAINCONFIG_MIREM);
	if (RF_MILIGHT_GATEW) SetBit(Main_Config, MAINCONFIG_MIGAT);
	if (START_LEDON) SetBit(Main_Config, MAINCONFIG_STRTON);
	if (LED_RX_FADE_DELAY_EN) SetBit(Main_Config, MAINCONFIG_FADEDELEN);
	if (RF_TX_PERIODIC_SEND)	SetBit(Main_Config, MAINCONFIG_RFPERTXEN);

	Conf_LED_Fade_Delay = LED_FADE_DELAY_MS;
	Conf_LED_TurnOff_Delay_S = LIGHTS_OFF_DELAY_S;
	Conf_LED_Max_Brightness = LIGHT_MAX_PERCENT;
	Conf_LED_NightMode_Brightness = LIGHT_NIGHT_PERCENT;
	RF_RX_MI_NewRemote = FALSE;
}

void EE_Store_Config (void)
{
	//debug
	SetBit(Main_Config, MAINCONFIG_FADEDELEN);
	//
	EEPROM_Program2Byte(0, Main_Config);
	EEPROM_ProgramByte(2, Conf_LED_Fade_Delay);
	EEPROM_ProgramByte(3, Conf_LED_Max_Brightness);
	EEPROM_ProgramByte(4, Conf_LED_NightMode_Brightness);
	EEPROM_Program2Byte(5, Conf_LED_TurnOff_Delay_S);
	EEPROM_Program4Byte(7, LEDGroup_Def_CW[0]);
	EEPROM_Program4Byte(11, LEDGroup_Def_CW[1]);
	EEPROM_Program4Byte(15, LEDGroup_Def_CW[2]);
	EEPROM_Program4Byte(19, LEDGroup_Def_CW[3]);
	EEPROM_Program4Byte(23, LEDGroup_Def_WW[0]);
	EEPROM_Program4Byte(27, LEDGroup_Def_WW[1]);
	EEPROM_Program4Byte(31, LEDGroup_Def_WW[2]);
	EEPROM_Program4Byte(35, LEDGroup_Def_WW[3]);
	Save_Targets();				// 36 - 43 LED TARGETS
	if ( RF_RX_MI_ValidAddress !=0 ) EEPROM_Program2Byte(47, RF_RX_MI_ValidAddress);
	EEPROM_ProgramByte(49, RF_GetNodeID());
	EEPROM_ProgramByte(50,Shutter_Config);
	EEPROM_ProgramByte(51,(RF_PeriodicTime/1000));


}

void EE_Read_Config(void)
{
  if (EEPROM_Read2Byte(0)==0) EE_Store_Config();
	Main_Config = EEPROM_Read2Byte(0);
	Conf_LED_Fade_Delay = EEPROM_ReadByte(2);
	Conf_LED_Max_Brightness = EEPROM_ReadByte(3);
	Conf_LED_NightMode_Brightness = EEPROM_ReadByte(4);
	Conf_LED_TurnOff_Delay_S = EEPROM_Read2Byte(5);
	

	LEDGroup_Def_CW[0] = EEPROM_Read4Byte(7);
  	LEDGroup_Def_CW[1] = EEPROM_Read4Byte(11);
  	LEDGroup_Def_CW[2] = EEPROM_Read4Byte(15);
	LEDGroup_Def_CW[3] = EEPROM_Read4Byte(19);

	LEDGroup_Def_WW[0] = EEPROM_Read4Byte(23);
  	LEDGroup_Def_WW[1] = EEPROM_Read4Byte(27);
	LEDGroup_Def_WW[2] = EEPROM_Read4Byte(31);
	LEDGroup_Def_WW[3] = EEPROM_Read4Byte(35);

	LED_LastSaved_CW[0] = EEPROM_ReadByte(39);
	LED_LastSaved_CW[1] = EEPROM_ReadByte(40);
	LED_LastSaved_CW[2] = EEPROM_ReadByte(41);
	LED_LastSaved_CW[3] = EEPROM_ReadByte(42);

	LED_LastSaved_WW[0] = EEPROM_ReadByte(43);
	LED_LastSaved_WW[1] = EEPROM_ReadByte(44);
	LED_LastSaved_WW[2] = EEPROM_ReadByte(45);
	LED_LastSaved_WW[3] = EEPROM_ReadByte(46);

	RF_RX_MI_ValidAddress = EEPROM_Read2Byte(47);
	RF_SetNodeID(EEPROM_ReadByte(49));

	Shutter_Config = EEPROM_ReadByte(50);
	if (bitRead(Shutter_Config,0) != 0)	Shutter_Enabled[0] = TRUE;
	if (bitRead(Shutter_Config,1) != 0)	Shutter_Enabled[1] = TRUE;
	if (bitRead(Shutter_Config,2) != 0)	Shutter_Enabled[2] = TRUE;
	if (bitRead(Shutter_Config,3) != 0)	Shutter_Enabled[3] = TRUE;
	
	RF_PeriodicTime = EEPROM_ReadByte(51) * 1000;

	if (RF_PeriodicTime == 0) RF_PeriodicTime = RF_TX_PERIODIC_TIME;
	//For Remote Control Command, when holding remote key it sends command without hold first.
	SetBit(Main_Config, MAINCONFIG_FADEDELEN);
	SetBit(Main_Config, MAINCONFIG_RFPERTXEN);

}

void StartUp(void)
{
	uint8_t i;
	Init_GPIOS();
	SetDefaults();
	EEPROM_Config();
	EE_Read_Config();

	enableInterrupts();
	// If using with a standard light switch, when turn on we want the lights
	// to go to the last saved brightness. Based on config bit.
	if (bitRead(Main_Config, MAINCONFIG_STRTON))
	{
		for (i=0;i<4;i++)
		{
			RF_RX_LED_GroupEnabled[i] = TRUE;
			LED_Target_CW[i] = LED_LastSaved_CW[i];
			LED_Target_WW[i] = LED_LastSaved_WW[i];
		}
	}
	_delay_ms(100);
	LT8900_softReset();
	LT8900_InitRegisters();                          // Init LT8900 registers
	LT8900_InitRegisters(); 
	LT8900_setChannel(DEFAULT_CHANNEL);                            // Set recieve channel
  	LT8900_startListening();												 // RX Mode
	RF_TX_Timer = RF_PeriodicTime;

}

void GR_CW_Set (uint8_t Group, uint32_t Value)
{
	LEDGroup_Def_CW[Group] = Value;
}

void GR_WW_Set (uint8_t Group, uint32_t Value)
{
	LEDGroup_Def_WW[Group] = Value;
}


/// Loading Gamma corrected PWM values to WS2811 Stream based on the Group definitions
/// Sending stream to WS2811 devices
/// TODO Separate group definitions for each WS2811 driver.
void WS2811_Load_Stream (void)
{
	uint8_t i,j;
	uint32_t GroupTemp_CW[4];
	uint32_t GroupTemp_WW[4];
	for (i=0;i<4;i++)
	{
		GroupTemp_CW[i] = LEDGroup_Def_CW[i];
		GroupTemp_WW[i] = LEDGroup_Def_WW[i];
	}
	for (i=0;i<WS2811_MAX_CHANNELS;i++)
	{
		for (j=0;j<4;j++)
		{
			if ( GroupTemp_CW[j] & 0x01 ) WS2811_1_Stream[i] = WS2811_Gamma_Corr(LED_Act_CW[j]);
			if ( GroupTemp_WW[j] & 0x01 ) WS2811_1_Stream[i] = WS2811_Gamma_Corr(LED_Act_WW[j]);
		}
		for (j=0;j<4;j++) { GroupTemp_CW[j] >>= 1; GroupTemp_WW[j] >>= 1; }
	}
	disableInterrupts();
	WS2811_1_Update_800K(WS2811_1_Stream, WS2811_MAX_CHANNELS);
	WS2811_2_Update_800K(WS2811_1_Stream, WS2811_MAX_CHANNELS);
	enableInterrupts();
}

// Flashing lights for a specific number of times with specific on an off times
// Used for user feedback for commands
void Light_Flash(uint8_t Nr, uint16_t OnTime, uint16_t OffTime, uint8_t Level)
{
	uint8_t i,j;
	for (i=0;i<Nr;i++)
	{
		for (j=0;j<4;j++) {LED_Act_CW[j]=Level; LED_Act_WW[j]=Level;}
		WS2811_Load_Stream();
		_delay_ms(OnTime);
		for (j=0;j<4;j++) {LED_Act_CW[j]=0; LED_Act_WW[j]=0;}
		WS2811_Load_Stream();
		_delay_ms(OffTime);
	}

}

// DEBUG ONLY
//LT 8900 TX test routine for debug
void LT8900_Test(void)
{
	TxData[0] = 5;
	TxData[1] = 166;
	TxData[2] = 70;
	TxData[3] = 4;
	TxData[4] = 2;
  TxData[5] = 1;
	if (TxData[4] == 2) TxData[4] = 6;
	 else TxData[4] = 2;
	 TxData[5]++;
	 LT8900_sendPacket(TxData, 6);
}

/// AD conversion timing and averaging
void AD_Schedule(void)
{
	if (AD_Trigger_Timer < 500)
	{
		Status_Disp_EN = FALSE;
		GPIO_WriteLow(STATUS_2_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_2_PIN);
		GPIO_WriteLow(STATUS_3_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_3_PIN);
	}
	if (AD_Trigger_Timer == 0)
	{
		ADC_Start();
	}

	if (ADC_CheckState())
		{
			/// TODO Send out analog results
			ClrBit(Main_State,MAINSTATE_AD);
			AD_Trigger_Timer = AD_CAPT_DELAY_MS;
		}
}

// checks if there is a new remote control learned
// if there is saves config to EEPROM and flashes light to confirm
void LED_CheckNewRemote(void)
{
	uint8_t i;
	if (RF_RX_MI_NewRemote)
	{

		EE_Store_Config();
		for (i=0;i<4;i++)
		{
			RF_RX_LED_GroupEnabled[i] = FALSE;
		}
		Light_Flash(5, 200, 200, LED_FLASH_BRIGHTNESS);
		RF_RX_MI_NewRemote = FALSE;
	}
}

uint8_t Motion_Parse(void)
{
	uint8_t Out=0;
	// If a Motion is detected set the Timer and Turn On the Motion Enabled Groups.
	// Timer acts against false triggers, the sensor must be on for longer than the minimum output trigger time.
	// Minimum times defined by PIR_DELAY_MS and RADAR_DELAY_MS in config.h
	if(PIR_Motion && (PIR_Conf_Timer==0)) { Out = 1; RF_TX_MotionIR=TRUE; }
	if(RADAR_Motion && (RADAR_Conf_Timer==0)) { Out = Out+2; RF_TX_MotionRadar = TRUE;}
	if(RF_RX_Motion)	Out = Out+4;
	return Out;
}

/// Check motion enabled status and handle LED on/off delay times.
/// TODO Optimize call
void LED_ChekMotion(void)
{
	uint8_t i;
	uint32_t TimeFromLastMotion;
	for (i=0;i<4;i++)													// If Motion Activation is off for the group, Reset Motion Request Flags.
	{
		if (!RF_RX_LED_MotionAct[i]) LED_MotionReq[i] = FALSE;
	}

	if (Motion_Parse()!=0)
	{
		LastMotion_Uptime = Uptime;
		for (i=0;i<4;i++)
		{
			if (RF_RX_LED_MotionAct[i]){ RF_RX_LED_GroupEnabled[i] = TRUE;																// turn on groups with motion control activated
			LED_MotionReq[i] = TRUE;		}																																// set flag that group is on by motion detect
		}
		
	}
	if (Uptime >= LastMotion_Uptime) TimeFromLastMotion = Uptime - LastMotion_Uptime;								// Normal Time Calculation
	else if (Uptime < LastMotion_Uptime) TimeFromLastMotion = U32_MAX - LastMotion_Uptime + Uptime;	// If Uptime Overflowed
	if (TimeFromLastMotion > (Conf_LED_TurnOff_Delay_S*1000))																				// Turn off LEDS after delay time
	{
		for (i=0;i<4;i++)
		{
			if (RF_RX_LED_MotionAct[i] && LED_MotionReq[i])
			{
				RF_RX_LED_GroupEnabled[i] = FALSE;
				LED_MotionReq[i] = FALSE;
			}
		}
	}
}

 /// Updating LED brightness targets for groups and FADE timing
	void LED_Schedule(void)
	{
		uint8_t i;
		uint8_t AtTarget;
		bool LED_Update = FALSE;
		if (LED_Fade_Timer == 0)
		{
			LED_ChekMotion();
			LED_CheckNewRemote();
			for (i=0;i<4;i++)
			{
				if (RF_RX_LED_GroupEnabled[i])
				{
					if (RF_RX_LED_NightMode[i])
					{
						if (LED_Act_CW[i] != Conf_LED_NightMode_Brightness)	{ LED_Act_CW[i] = Conf_LED_NightMode_Brightness; LED_Update = TRUE;}
						if (LED_Act_WW[i] != Conf_LED_NightMode_Brightness) { LED_Act_WW[i] = Conf_LED_NightMode_Brightness; LED_Update = TRUE;}
					}
					else
					{
						if(!bitRead(Main_Config, MAINCONFIG_FADEE))
						{
							if(LED_Act_CW[i] != LED_Target_CW[i]) {LED_Act_CW[i] = LED_Target_CW[i]; LED_Update = TRUE;}
							if(LED_Act_WW[i] != LED_Target_WW[i]) {LED_Act_WW[i] = LED_Target_WW[i]; LED_Update = TRUE;}
							LED_LastSaved_CW[i] = LED_Target_CW[i];
							LED_LastSaved_WW[i] = LED_Target_WW[i];
							AtTarget = 255;
						}
						else
						{
							if (LED_Act_CW[i] < LED_Target_CW[i]) { LED_Act_CW[i]++; LED_Update = TRUE; ClrBit(AtTarget, i);}
							if (LED_Act_CW[i] > LED_Target_CW[i]) { LED_Act_CW[i]--; LED_Update = TRUE; ClrBit(AtTarget, i);}
							if (LED_Act_CW[i] == LED_Target_CW[i]) { LED_LastSaved_CW[i] = LED_Target_CW[i]; SetBit(AtTarget, i);}
							if (LED_Act_WW[i] < LED_Target_WW[i]) { LED_Act_WW[i]++; LED_Update = TRUE; ClrBit(AtTarget, i+4);}
							if (LED_Act_WW[i] > LED_Target_WW[i]) { LED_Act_WW[i]--; LED_Update = TRUE; ClrBit(AtTarget, i+4);}
							if (LED_Act_WW[i] == LED_Target_WW[i]) { LED_LastSaved_WW[i] = LED_Target_WW[i]; SetBit(AtTarget, i+4);}
						}
					}
				} else if (!RF_RX_LED_GroupEnabled[i])			// If group is turned off, do not save targets and go to OFF
				{
					if(!bitRead(Main_Config, MAINCONFIG_FADEE))
					{
						if (LED_Act_CW[i] != 0) {LED_Act_CW[i] = 0; LED_Update = TRUE; ClrBit(AtTarget, i);}
						if (LED_Act_WW[i] != 0) {LED_Act_WW[i] = 0; LED_Update = TRUE; ClrBit(AtTarget, i+4);}
					} else
					{
						if (LED_Act_CW[i] != 0) {LED_Act_CW[i]--; LED_Update = TRUE; ClrBit(AtTarget, i);}
						if (LED_Act_WW[i] != 0) {LED_Act_WW[i]--; LED_Update = TRUE; ClrBit(AtTarget, i+4);}
					}
				}
			}
		}
		if (LED_Update)										//send stream only if there was an update
		{
			WS2811_Load_Stream();
			//reload Fade timer
			LED_Fade_Timer = Conf_LED_Fade_Delay;
			LED_Was_Updated = TRUE;
			LED_Update = FALSE;
		}
		if ((AtTarget==255) && LED_Was_Updated)
		{
			// RF_RX_Check_LT8900();
			Save_Targets();
			LED_Was_Updated = FALSE;
		}
	}

void RF_Schedule(void)
{
	int8_t RX_Size;
	RX_Size = RF_RX_Handle();
	RF_TX_Handle();
}

void main(void)
{
  uint8_t i;
	StartUp();
	/* Infinite loop */
	/// debug LED request

  while (1)
  {
		 AD_Schedule();
		 LED_Schedule();
		 RF_Schedule();

  }

}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
