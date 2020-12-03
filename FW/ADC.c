#include "adc.h"
#include "config.h"
#include <math.h>
#include <float.h>

static const uint16_t LookUpAllX[] = { 0 , 50 , 100, 150, 200, 250, 300, 350, 400, 450,
																			500, 550, 600, 650, 700, 750, 800, 850, 900, 950, 1024};

//static const uint8_t LookUpTempX5[] = { 0, 	 10,  20,  30,  40,  50,  60,  70,  120,  90,
//																 				100, 110, 120, 130, 140, 150, 160, 170, 180, 200, 255};

static const uint8_t LookUpLUXD50[] = { 0,   40,  80,  120,  140,  150,  160,  170,  175,  180,
																 		    185, 190, 195, 200, 205, 210, 215, 220, 225, 230, 255};

//static const uint8_t LookUpAirQ[] = { 0,   10,  20,  30,  40,  50,  60,  70,  80,  90,
//																 	    100, 110, 120, 130, 140, 150, 160, 170, 180, 200, 255};



extern uint8_t Main_State;

extern volatile uint16_t AD_Trigger_Timer;
extern volatile bool Status_Disp_EN;

volatile uint16_t AD_NTC_Results_Sum,		AD_LDR_Results_Sum,		AD_GAS_Results_Sum;
uint16_t 					AD_NTC_Result_Avg,		AD_LDR_Results_Avg,		AD_GAS_Results_Avg;
uint8_t 					AD_NTC_TempX5,				AD_LDR_LUXD50,				AD_AirQuality;

volatile uint8_t AD_NrOfValues;

void ADC_Init(void)
{
	GPIO_Init(AD_GPIO_PORT,(GPIO_Pin_TypeDef)NTC_AD_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(AD_GPIO_PORT,(GPIO_Pin_TypeDef)LDR_AD_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(AD_GPIO_PORT,(GPIO_Pin_TypeDef)GAS_AD_PIN, GPIO_MODE_IN_FL_NO_IT);
	//GPIO_INIT(AD_GPIO_PORT,(GPIO_Pin_TypeDef)ADC_SPARE_AD_PIN, GPIO_MODE_IN_FL_NO_IT);
	//ADC1_DeInit();
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D4, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_ALL, DISABLE );
	ADC1_ScanModeCmd(ENABLE);
	ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
}

uint8_t NTC_SteinHart(uint16_t reading)
{
	float avg_res;
	double steinhart;
	uint8_t output;
	avg_res = NTC_SER_RES*((1023.0 / reading) - 1);
	steinhart = avg_res / NTC_R_NOM;     // (R/Ro)
  steinhart = log(steinhart);                  // ln(R/Ro)
  steinhart /= NTC_COEFF;                   // 1/B * ln(R/Ro)
  steinhart += 1.0 / (NTC_T_NOM + 273.15); // + (1/To)
  steinhart = 1.0 / steinhart;                 // Invert
  steinhart -= 273.15;
	output = (steinhart + 4) * 5.0 ;
	return output;
}
uint8_t ADC_InterPolate (uint16_t ADValue, uint16_t *LookUpX, uint8_t *LookUpY)
{
	uint8_t i;
	float mu;
	for (i=0;i<AD_MAX_LOOKUP_SIZE;i++)
	{
		if ((LookUpX[i]<=ADValue)&&(LookUpX[i+1]>=ADValue))
		{
			mu = (float)(ADValue - LookUpX[i]) / (float)(LookUpX[i+1] - LookUpX[i]);
			return (uint8_t) (LookUpY[i]*(1-mu) + LookUpY[i+1] * mu);
		}
	}
	return 0;
}

void ADC_Start(void)
{
	SetBit(Main_State, MAINSTATE_AD);
	Status_Disp_EN = FALSE;
	GPIO_WriteLow(STATUS_2_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_2_PIN);
	GPIO_WriteLow(STATUS_3_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_3_PIN);
	ADC1_StartConversion();
}

bool ADC_CheckState(void)
{
		if (AD_NrOfValues < (AD_AVG_COUNT-1)) return FALSE;
	else
	{
		Status_Disp_EN = TRUE; ClrBit(Main_State, MAINSTATE_AD);
		AD_NTC_Result_Avg = AD_NTC_Results_Sum / AD_AVG_COUNT;
		AD_LDR_Results_Avg = AD_LDR_Results_Sum / AD_AVG_COUNT;
		AD_GAS_Results_Avg = AD_GAS_Results_Sum / AD_AVG_COUNT;
		//AD_NTC_TempX5 = ADC_InterPolate(AD_NTC_Result_Avg, LookUpAllX, LookUpTempX5);
		AD_NTC_TempX5 = NTC_SteinHart(AD_NTC_Result_Avg);
		AD_LDR_LUXD50 = ADC_InterPolate(AD_LDR_Results_Avg, LookUpAllX, LookUpLUXD50);
		//AD_AirQuality = ADC_InterPolate(AD_GAS_Results_Avg, LookUpAllX, LookUpAirQ);
		AD_AirQuality = AD_GAS_Results_Avg%256;
		AD_NrOfValues = 0; AD_NTC_Results_Sum = 0; AD_LDR_Results_Sum = 0; AD_GAS_Results_Sum = 0;
		return TRUE;
	}
}

void ADC_INTHANDLE(void)
{
	AD_NTC_Results_Sum += ADC1_GetBufferValue(0);
	AD_LDR_Results_Sum += ADC1_GetBufferValue(1);
	AD_GAS_Results_Sum += ADC1_GetBufferValue(2);
	AD_NrOfValues++;
	ADC1_ClearITPendingBit(ADC1_IT_EOC);
	if (AD_NrOfValues < (AD_AVG_COUNT-1)) {ADC1_StartConversion();}
}
