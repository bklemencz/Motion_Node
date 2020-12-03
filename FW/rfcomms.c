#include "rfcomms.h"
#include "lt8900.h"
#include "serialcomms.h"
#include "main.h"

///																			RF DATA STRUCTURE
///// 														7			6			5			4			3			2			1			0
////										byte0		|									NodeID												|
////                    byte1   |                Sequence                       |
////										byte2 	|  MsgType  |ARQ | ARS |         Length         |
////										byte3   |				          ItemID							          |
///											byte4.. |								DATA x													|

///											sequence: counter - increased every message
///											ARQ: 			Sender wants an ACK message
///											ARS:			Flags ACK message (3bytes, NODEID, Sequence of the original message, ARQ-clear, ARS-set, Msgtype - reply)
///											msgtype: 	00 - request,
///																01 - reply,
///																10 - periodical mess,
///																11-  Alarm mess
///											ItemID: 	Node Function ID
///											Length:   Data bytes count + 1




uint8_t RF_NODEID;
uint8_t RF_RX_Buffer[17];
uint8_t RF_TX_Buffer[17];
uint8_t RF_TX_Counter;
uint8_t RF_RX_MI_LastCounter;
uint16_t RF_RX_MI_ValidAddress;
uint8_t RF_RX_MI_LearnCounter;
bool RF_RX_MI_FirstPress;
uint8_t RF_RX_MI_PrevCommand;
bool RF_RX_MI_NewRemote;
bool RF_RX_LED_NightMode[4];
bool RF_RX_LED_MotionAct[4];
bool RF_RX_LED_GroupEnabled[4];
int8_t RF_RX_Lenght;
int8_t RF_TX_Lenght;
RF_Datagram_t RF_RX_DataRX,RF_TX_DataTX;
bool RF_RX_Motion,RF_TX_MotionAlarm_Sent;

extern volatile uint16_t 	LED_Fade_Timer;
extern volatile uint16_t  RF_TX_Timer;

extern uint8_t Main_State;
extern uint16_t Main_Config;
extern uint8_t Conf_LED_Max_Brightness;
// Target Brightness levels for groups percentage
extern uint8_t LED_Target_CW[4];
extern uint8_t LED_Target_WW[4];
//Last Saved Brightness, goes to EEPROM and the level after turn on.
extern uint8_t LED_LastSaved_CW[4];
extern uint8_t LED_LastSaved_WW[4];
extern uint8_t 					AD_NTC_TempX5,				AD_LDR_LUXD50,				AD_AirQuality;
extern bool RF_TX_MotionIR, RF_TX_MotionRadar;


extern volatile uint32_t 	Uptime;

void RF_SetNodeID(uint8_t Node)
{
  RF_NODEID = Node;
}

uint8_t RF_GetNodeID(void)
{
  return RF_NODEID;
}


int8_t RF_RX_Handle()
{
  bool ValidMI = FALSE;


  if (LT8900_available())
    {
      int8_t packetSize;
      GPIO_WriteHigh(STATUS_1_GPIO_PORT,(GPIO_Pin_TypeDef)STATUS_1_PIN);
      packetSize = LT8900_read(RF_RX_Buffer, 16);
      if (packetSize > 0)
      {
        SetBit(Main_State, MAINSTATE_RFRX);
				
        if (bitRead(Main_Config, MAINCONFIG_MIREM)) ValidMI = RF_RX_MIRemote(RF_RX_Buffer,packetSize);
        if (!ValidMI) RF_RX_Command(RF_RX_Buffer,packetSize);
      }
      /*
      if (packetSize == -1) 
      {
        LT8900_softReset();
        LT8900_InitRegisters();        
      }
      */
      LT8900_startListening();      // LT8900 Clear FIFOS, Rx Enable
      // When pressing and holding key on remote first data comes without hold flag, this is a small delay to eliminate this.
      if (bitRead(Main_Config, MAINCONFIG_FADEDELEN) && RF_RX_MI_FirstPress)
			{
        GPIO_WriteHigh(WS2811_GPIO_PORT, (GPIO_Pin_TypeDef) WS2811_1_PIN);
        LED_Fade_Timer = LED_DELAY_AFTER_RX;
        GPIO_WriteLow(WS2811_GPIO_PORT, (GPIO_Pin_TypeDef) WS2811_1_PIN);
			}
      GPIO_WriteLow(STATUS_1_GPIO_PORT,(GPIO_Pin_TypeDef)STATUS_1_PIN);
      return packetSize;
    }


}
void RF_TX_Handle(void)
{
  uint8_t PacketS;
  if (bitRead(Main_Config, MAINCONFIG_RFPERTXEN) && (RF_TX_Timer == 0))       // if periodic messages enabled and timer is up
  {
    RF_TX_BuildPeriodic(&RF_TX_DataTX);
    PacketS = RF_TX_BuildBuffer(RF_TX_Buffer,&RF_TX_DataTX);
    GPIO_WriteHigh(STATUS_1_GPIO_PORT,(GPIO_Pin_TypeDef)STATUS_1_PIN);
    LT8900_sendPacket(RF_TX_Buffer, PacketS);
    RF_TX_Timer = RF_TX_PERIODIC_TIME;
    GPIO_WriteLow(STATUS_1_GPIO_PORT,(GPIO_Pin_TypeDef)STATUS_1_PIN);
  }
  if((RF_TX_MotionIR || RF_TX_MotionRadar) && !RF_TX_MotionAlarm_Sent)
  {
    RF_TX_BuildMotionAlarm(&RF_TX_DataTX);
    PacketS = RF_TX_BuildBuffer(RF_TX_Buffer,&RF_TX_DataTX);
    GPIO_WriteHigh(STATUS_1_GPIO_PORT,(GPIO_Pin_TypeDef)STATUS_1_PIN);
    LT8900_sendPacket(RF_TX_Buffer, PacketS);
    GPIO_WriteLow(STATUS_1_GPIO_PORT,(GPIO_Pin_TypeDef)STATUS_1_PIN);
    RF_TX_MotionAlarm_Sent = TRUE;
  }
}

void RF_TX_BuildPeriodic(RF_Datagram_t *DataToSend)
{
  DataToSend->NodeID = RF_NODEID;
  RF_TX_Counter++;
  DataToSend->Sequence = RF_TX_Counter;
  DataToSend->Control = RF_TX_MSG_PER*64;
  SetBit(DataToSend->Control, RF_TX_ARQ);
  ClrBit(DataToSend->Control, RF_TX_ARS);
  DataToSend->Control = DataToSend->Control + 5;    // Data Length Status + 3xADC + ItemID
  DataToSend->ItemID = RF_TX_PER_ITEM;
  DataToSend->Data[0] = AD_NTC_TempX5;
  DataToSend->Data[1] = AD_LDR_LUXD50;
  DataToSend->Data[2] = AD_AirQuality;
	DataToSend->Data[3] = 0;
  if (RF_TX_MotionIR) {SetBit(DataToSend->Data[3], 0);}
  if (RF_TX_MotionRadar) {SetBit(DataToSend->Data[3], 1);}
  if (!RF_TX_MotionIR && !RF_TX_MotionRadar) RF_TX_MotionAlarm_Sent = FALSE;
	RF_TX_MotionIR=FALSE;	RF_TX_MotionRadar=FALSE;
}

void RF_TX_BuildMotionAlarm(RF_Datagram_t *DataToSend)
{
  DataToSend->NodeID = RF_NODEID;
  RF_TX_Counter++;
  DataToSend->Sequence = RF_TX_Counter;
  DataToSend->Control = RF_TX_MSG_ALM*64;
  SetBit(DataToSend->Control, RF_TX_ARQ);
  ClrBit(DataToSend->Control, RF_TX_ARS);
  DataToSend->Control = DataToSend->Control + 2;    // Data Length Status + 3xADC + ItemID
  DataToSend->ItemID = RF_TX_ALM_ITEM;
	DataToSend->Data[0] = 0;
  if (RF_TX_MotionIR) {SetBit(DataToSend->Data[0], 0);}
  if (RF_TX_MotionRadar) {SetBit(DataToSend->Data[0], 1);}

}

uint8_t RF_TX_BuildBuffer(uint8_t *BufferSend, RF_Datagram_t *DataToSend)
{
  uint8_t i;
  BufferSend[0] = DataToSend->NodeID;
  BufferSend[1] = DataToSend->Sequence;
  BufferSend[2] = DataToSend->Control;
  BufferSend[3] = DataToSend->ItemID;
  for (i=0; i<(DataToSend->Control%16);i++)
  {
    BufferSend[4+i] = DataToSend->Data[i];
  }
  return DataToSend->Control%16 + 3;
}

void RF_RX_Check_LT8900(void)
{
	if ((LT8900_readRegister(R_CHANNEL)%32) != DEFAULT_CHANNEL)
	{
		LT8900_InitRegisters();
		LT8900_setChannel(DEFAULT_CHANNEL);                                                         // Set recieve channel
		LT8900_startListening();
	}
}

bool RF_RX_MIRemote(uint8_t *RX_Buffer, int8_t Lenght)
{

  uint8_t i;
  bool Valid;
  uint16_t Rem_Address;
  uint8_t Counter;
  uint8_t Group;
  bool  KeyHold;
  uint8_t Command;

  // Valid MI Command
  if ((Lenght == 7) && (RX_Buffer[0]==0x5A))
  {

    Valid = TRUE;
    if (RF_RX_MI_LastCounter != RX_Buffer[5])
    {
      Rem_Address = RX_Buffer[1] * 256 + RX_Buffer[2];
      Counter = RX_Buffer[5];
      RF_RX_MI_LastCounter = Counter;
      Group = RX_Buffer[3];
      if (RX_Buffer[4]/16) KeyHold = TRUE;
                      else KeyHold = FALSE;
      Command = RX_Buffer[4] % 16;                //AllON-0x05, AllOFF-0x09,
                                                  //UP-0x0C, DOWN-0x04,
                                                  //LEFT-0x0E, RIGHT-0x0F,
                                                  //GR1ON-0x08, GR1OFF-0x0B,
                                                  //GR2ON-0x0D, GR2OFF-0x03,
                                                  //GR3ON-0x07, GR3OFF-0x0A,
                                                  //GR4ON-0x02, GR4OFF-0x06,
      if (RF_RX_MI_ChkAddress(Rem_Address,RX_Buffer[4]))
      {
        // MAIN ON KEY, PRESSING IT TURNS ON ALL LIGHT TO THE LAST BRIGHTNESS, HOLDING IT TURNS ON ALL IN NIGHT MODE

        if (Command == 0x05)
        {
          if (!KeyHold) {
            if (RF_RX_MI_PrevCommand!=Command)
            {
              RF_RX_MI_PrevCommand = Command;
              RF_RX_MI_FirstPress = TRUE;
            } else RF_RX_MI_FirstPress = FALSE;
            for (i=0;i<4;i++)                     //All on to last PWM
            {

							RF_RX_LED_GroupEnabled[i] = TRUE;
              RF_RX_LED_MotionAct[i] = FALSE;
              RF_RX_LED_NightMode[i] = FALSE;
              LED_Target_CW[i] = LED_LastSaved_CW[i];
              LED_Target_WW[i] = LED_LastSaved_WW[i];
            }
            Serial_Send_PWM_NightEN(255,0);       // All night off
            Serial_Send_PWM_MotionEN(255,0);      // All motion off
            Serial_Send_PWM_Onoff(255,1);         // All On

          } else                                  // ALL at night mode
          {
            for (i=0;i<4;i++)                     //All on to last PWM
            {
              RF_RX_LED_NightMode[i] = TRUE;
              RF_RX_LED_GroupEnabled[i] = TRUE;
              RF_RX_MI_FirstPress = FALSE;
            }
            Serial_Send_PWM_NightEN(255,1);
          } //nightmode all
        } // All on command

        // MAIN OFF KEY, PRESSING IT TURNS OFF ALL LIGHTS, HOLDING SETS MOTION ACTIVATED MODE FOR ALL.
        else if (Command == 0x09)
        {
          if (!KeyHold) {
            if (RF_RX_MI_PrevCommand!=Command)
            {
              RF_RX_MI_PrevCommand = Command;
              RF_RX_MI_FirstPress = TRUE;
            } else RF_RX_MI_FirstPress = FALSE;
            for (i=0;i<4;i++)                     //All Off mm
            {

              RF_RX_LED_GroupEnabled[i] = FALSE;
              //RF_RX_LED_NightMode[i] = FALSE;
              RF_RX_LED_MotionAct[i] = FALSE;
            }
            Serial_Send_PWM_MotionEN(255,0);
            Serial_Send_PWM_Onoff(255,0);
          } else                                  // ALL at motion mode
          {
            for (i=0;i<4;i++)
            {
              RF_RX_LED_MotionAct[i] = TRUE;
              RF_RX_MI_FirstPress = FALSE;
            }
            Serial_Send_PWM_MotionEN(255,1);
          } //all motion
        } // All off command

        ////////////////////////////////////////
        ///// GROUP 1 ///////////////////////
        ///////////////////////////////////////

        // GROUP1 ON KEY, PRESSING IT TURNS ON GROUP1 TO THE LAST BRIGHTNESS, HOLDING IT TURNS ON GROUP1 IN NIGHT MODE
        else if (Command == 0x08)
        {
          if (!KeyHold) {
              //GR1 on to last PWM
              if (RF_RX_MI_PrevCommand!=Command)
              {
                RF_RX_MI_PrevCommand = Command;
                RF_RX_MI_FirstPress = TRUE;
              } else RF_RX_MI_FirstPress = FALSE;
              RF_RX_LED_GroupEnabled[0] = TRUE;
              RF_RX_LED_MotionAct[0] = FALSE;
              RF_RX_LED_NightMode[0] = FALSE;
              LED_Target_CW[0] = LED_LastSaved_CW[0];
              LED_Target_WW[0] = LED_LastSaved_WW[0];
              Serial_Send_PWM_Onoff(101,TRUE);
          } else                                  // GR1 at night mode
          {
              RF_RX_LED_NightMode[0] = TRUE;
              RF_RX_LED_GroupEnabled[0] = TRUE;
              RF_RX_MI_FirstPress = FALSE;
              Serial_Send_PWM_NightEN(101,TRUE);
          } //nightmode GR1
        } // GR1 on command

        // GR1 OFF KEY, PRESSING IT TURNS OFF GR1 LIGHTS, HOLDING SETS MOTION ACTIVATED MODE FOR GR1.
        else if (Command == 0x0B)
        {
          if (!KeyHold) {
            if (RF_RX_MI_PrevCommand!=Command)
            {
              RF_RX_MI_PrevCommand = Command;
              RF_RX_MI_FirstPress = TRUE;
            } else RF_RX_MI_FirstPress = FALSE;
              RF_RX_LED_GroupEnabled[0] = FALSE;
              //RF_RX_LED_NightMode[0] = FALSE;
              RF_RX_LED_MotionAct[0] = FALSE;
              Serial_Send_PWM_Onoff(101,FALSE);
          } else                                  // GR1 at motion mode
          {
              RF_RX_LED_MotionAct[0] = TRUE;
              RF_RX_MI_FirstPress = FALSE;
              Serial_Send_PWM_MotionEN(101,TRUE);
          } //GR1 motion
        } // GR1 off command


        ////////////////////////////////////////
        ///// GROUP 2 ///////////////////////
        ///////////////////////////////////////

        // GROUP2 ON KEY, PRESSING IT TURNS ON GROUP2 TO THE LAST BRIGHTNESS, HOLDING IT TURNS ON GROUP2 IN NIGHT MODE
        else if (Command == 0x0D)
        {
          if (!KeyHold) {
            if (RF_RX_MI_PrevCommand!=Command)
            {
              RF_RX_MI_PrevCommand = Command;
              RF_RX_MI_FirstPress = TRUE;
            } else RF_RX_MI_FirstPress = FALSE;
              //GR1 on to last PWM
              RF_RX_LED_GroupEnabled[1] = TRUE;
              RF_RX_LED_MotionAct[1] = FALSE;
              RF_RX_LED_NightMode[1] = FALSE;
              LED_Target_CW[1] = LED_LastSaved_CW[1];
              LED_Target_WW[1] = LED_LastSaved_WW[1];
              Serial_Send_PWM_Onoff(102,TRUE);
          } else                                  // GR at night mode
          {
              RF_RX_LED_NightMode[1] = TRUE;
              RF_RX_LED_GroupEnabled[1] = TRUE;
              RF_RX_MI_FirstPress = FALSE;
              Serial_Send_PWM_NightEN(102,TRUE);
          } //nightmode GR
        } // GR on command

        // GR OFF KEY, PRESSING IT TURNS OFF GR LIGHTS, HOLDING SETS MOTION ACTIVATED MODE FOR GR.
        else if (Command == 0x03)
        {
          if (!KeyHold) {
            if (RF_RX_MI_PrevCommand!=Command)
            {
              RF_RX_MI_PrevCommand = Command;
              RF_RX_MI_FirstPress = TRUE;
            } else RF_RX_MI_FirstPress = FALSE;
              RF_RX_LED_GroupEnabled[1] = FALSE;
              //RF_RX_LED_NightMode[1] = FALSE;
              RF_RX_LED_MotionAct[1] = FALSE;
              Serial_Send_PWM_Onoff(102,FALSE);
          } else                                  // GR at motion mode
          {
              RF_RX_LED_MotionAct[1] = TRUE;
              RF_RX_MI_FirstPress = FALSE;
              Serial_Send_PWM_MotionEN(102,TRUE);
          } //GR motion
        } // GR off command


        ////////////////////////////////////////
        ///// GROUP 3 ///////////////////////
        ///////////////////////////////////////

        // GROUP ON KEY, PRESSING IT TURNS ON GROUP TO THE LAST BRIGHTNESS, HOLDING IT TURNS ON GROUP IN NIGHT MODE
        else if (Command == 0x07)
        {
          if (!KeyHold) {
            if (RF_RX_MI_PrevCommand!=Command)
            {
              RF_RX_MI_PrevCommand = Command;
              RF_RX_MI_FirstPress = TRUE;
            } else RF_RX_MI_FirstPress = FALSE;
              //GR on to last PWM
              RF_RX_LED_GroupEnabled[2] = TRUE;
              RF_RX_LED_MotionAct[2] = FALSE;
              RF_RX_LED_NightMode[2] = FALSE;
              LED_Target_CW[2] = LED_LastSaved_CW[2];
              LED_Target_WW[2] = LED_LastSaved_WW[2];
              Serial_Send_PWM_Onoff(103,TRUE);
          } else                                  // GR at night mode
          {
              RF_RX_LED_NightMode[2] = TRUE;
              RF_RX_LED_GroupEnabled[2] = TRUE;
              RF_RX_MI_FirstPress = FALSE;
              Serial_Send_PWM_NightEN(103,TRUE);
          } //nightmode GR
        } // GR on command

        // GR OFF KEY, PRESSING IT TURNS OFF GR LIGHTS, HOLDING SETS MOTION ACTIVATED MODE FOR GR.
        else if (Command == 0x0A)
        {
          if (!KeyHold) {
            if (RF_RX_MI_PrevCommand!=Command)
            {
              RF_RX_MI_PrevCommand = Command;
              RF_RX_MI_FirstPress = TRUE;
            } else RF_RX_MI_FirstPress = FALSE;
              RF_RX_LED_GroupEnabled[2] = FALSE;
              //RF_RX_LED_NightMode[2] = FALSE;
              RF_RX_LED_MotionAct[2] = FALSE;
              Serial_Send_PWM_Onoff(103,FALSE);
          } else                                  // GR at motion mode
          {
              RF_RX_LED_MotionAct[2] = TRUE;
              RF_RX_MI_FirstPress = FALSE;
              Serial_Send_PWM_MotionEN(103,TRUE);
          } //GR motion
        } // GR off command

        ////////////////////////////////////////
        ///// GROUP 4 ///////////////////////
        ///////////////////////////////////////

        // GROUP ON KEY, PRESSING IT TURNS ON GROUP TO THE LAST BRIGHTNESS, HOLDING IT TURNS ON GROUP IN NIGHT MODE
        else if (Command == 0x02)
        {
          if (!KeyHold) {
            if (RF_RX_MI_PrevCommand!=Command)
            {
              RF_RX_MI_PrevCommand = Command;
              RF_RX_MI_FirstPress = TRUE;
            } else RF_RX_MI_FirstPress = FALSE;
              //GR on to last PWM
              RF_RX_LED_GroupEnabled[3] = TRUE;
              RF_RX_LED_MotionAct[3] = FALSE;
              RF_RX_LED_NightMode[3] = FALSE;
              LED_Target_CW[3] = LED_LastSaved_CW[3];
              LED_Target_WW[3] = LED_LastSaved_WW[3];
              Serial_Send_PWM_Onoff(104,TRUE);
          } else                                  // GR at night mode
          {
              RF_RX_LED_NightMode[3] = TRUE;
              RF_RX_LED_GroupEnabled[3] = TRUE;
              RF_RX_MI_FirstPress = FALSE;
              Serial_Send_PWM_NightEN(104,TRUE);
          } //nightmode GR
        } // GR on command

        // GR OFF KEY, PRESSING IT TURNS OFF GR LIGHTS, HOLDING SETS MOTION ACTIVATED MODE FOR GR.
        else if (Command == 0x06)
        {
          if (!KeyHold) {
            if (RF_RX_MI_PrevCommand!=Command)
            {
              RF_RX_MI_PrevCommand = Command;
              RF_RX_MI_FirstPress = TRUE;
            } else RF_RX_MI_FirstPress = FALSE;
              RF_RX_LED_GroupEnabled[3] = FALSE;
              Serial_Send_PWM_Onoff(104,FALSE);
            //  RF_RX_LED_NightMode[3] = FALSE;
              RF_RX_LED_MotionAct[3] = FALSE;
          } else                                  // GR at motion mode
          {
              RF_RX_LED_MotionAct[3] = TRUE;
              RF_RX_MI_FirstPress = FALSE;
              Serial_Send_PWM_MotionEN(104,TRUE);
          } //GR motion
        } // GR off command

        ////////////////////////////////////////
        ///// UP KEY ///////////////////////
        ///////////////////////////////////////

        else if (Command == 0x0C)
        {
          RF_RX_MI_FirstPress = FALSE;
          if (!KeyHold)                     // single press
          {
            if (Group == 0)                 //global command
            {
              for (i=0;i<4;i++)
              {
                if (RF_RX_LED_GroupEnabled[i])
                {
                  LED_Target_CW[i]++;
                  LED_Target_WW[i]++;
                  if (LED_Target_CW[i] > Conf_LED_Max_Brightness) LED_Target_CW[i] = Conf_LED_Max_Brightness;
                  if (LED_Target_WW[i] > Conf_LED_Max_Brightness) LED_Target_WW[i] = Conf_LED_Max_Brightness;
                  Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
                }
              }
            } else                          //group command
            {
              if (RF_RX_LED_GroupEnabled[Group-1])
              {
                LED_Target_CW[Group-1]++;
                LED_Target_WW[Group-1]++;
                if (LED_Target_CW[Group-1] > Conf_LED_Max_Brightness) LED_Target_CW[Group-1] = Conf_LED_Max_Brightness;
                if (LED_Target_WW[Group-1] > Conf_LED_Max_Brightness) LED_Target_WW[Group-1] = Conf_LED_Max_Brightness;
                Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
              }
            }
          }
          else                              //key hold
          {
            if (Group == 0)                   //global command
            {
              for (i=0;i<4;i++)
              {
                if (RF_RX_LED_GroupEnabled[i])
                {
                  LED_Target_CW[i] += RF_MILIGHT_HOLD_STEP;
                  LED_Target_WW[i] += RF_MILIGHT_HOLD_STEP;
                  if (LED_Target_CW[i] > Conf_LED_Max_Brightness) LED_Target_CW[i] = Conf_LED_Max_Brightness;
                  if (LED_Target_WW[i] > Conf_LED_Max_Brightness) LED_Target_WW[i] = Conf_LED_Max_Brightness;
                  Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
                }
              }
            } else                        // group command
            {
              if (RF_RX_LED_GroupEnabled[Group-1])
              {
                LED_Target_CW[Group-1] += RF_MILIGHT_HOLD_STEP;
                LED_Target_WW[Group-1] += RF_MILIGHT_HOLD_STEP;
                if (LED_Target_CW[Group-1] > Conf_LED_Max_Brightness) LED_Target_CW[Group-1] = Conf_LED_Max_Brightness;
                if (LED_Target_WW[Group-1] > Conf_LED_Max_Brightness) LED_Target_WW[Group-1] = Conf_LED_Max_Brightness;
                Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
              }
            }       //End of single group
          }         // End of Keyhold
          for (i=0;i<4;i++)                 //limit maximum
          {
            if (LED_Target_CW[i] > Conf_LED_Max_Brightness) LED_Target_CW[i] = Conf_LED_Max_Brightness;
            if (LED_Target_WW[i] > Conf_LED_Max_Brightness) LED_Target_WW[i] = Conf_LED_Max_Brightness;
          }
        }           //end of command

        ////////////////////////////////////////
        ///// DOWN KEY ///////////////////////
        ///////////////////////////////////////

        else if (Command == 0x04)
        {
          RF_RX_MI_FirstPress = FALSE;
          if (!KeyHold)                     // single press
          {
            if (Group == 0)                 //global command
            {
              for (i=0;i<4;i++)
              {
                if (RF_RX_LED_GroupEnabled[i])
                {
                  if (LED_Target_CW[i] > 2)   LED_Target_CW[i]--;
                  if (LED_Target_WW[i] > 2)   LED_Target_WW[i]--;
                  Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
                }
              }
            } else                          //group command
            {
              if (RF_RX_LED_GroupEnabled[Group-1])
              {
                if (LED_Target_CW[Group-1] > 2)   LED_Target_CW[Group-1]--;
                if (LED_Target_CW[Group-1] > 2)   LED_Target_WW[Group-1]--;
                Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
              }
            }
          }
          else                              //key hold
          {
            if (Group == 0)                   //global command
            {
              for (i=0;i<4;i++)
              {
                if (RF_RX_LED_GroupEnabled[i])
                {
                  if (LED_Target_CW[i] > (2+RF_MILIGHT_HOLD_STEP))   LED_Target_CW[i] -= RF_MILIGHT_HOLD_STEP;
                  if (LED_Target_WW[i] > (2+RF_MILIGHT_HOLD_STEP))   LED_Target_WW[i] -= RF_MILIGHT_HOLD_STEP;                  
                  Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
                }
              }
            } else                        // group command
            {
              if (RF_RX_LED_GroupEnabled[Group-1])
              {
                if (LED_Target_CW[Group-1] > (2+RF_MILIGHT_HOLD_STEP))  LED_Target_CW[Group-1] -= RF_MILIGHT_HOLD_STEP;
                if (LED_Target_WW[Group-1] > (2+RF_MILIGHT_HOLD_STEP))  LED_Target_WW[Group-1] -= RF_MILIGHT_HOLD_STEP;
                Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);

              }
            }       //End of single group
          }         // End of Keyhold
        }           //end of command

        ////////////////////////////////////////
        ///// RIGHT KEY ///////////////////////
        ///////////////////////////////////////

        else if (Command == 0x0E)
        {
          RF_RX_MI_FirstPress = FALSE;
          if (!KeyHold)                     // single press
          {
            if (Group == 0)                 //global command
            {
              for (i=0;i<4;i++)
              {
                if (RF_RX_LED_GroupEnabled[i])
                {
                  if (LED_Target_CW[i] > 2) LED_Target_CW[i]--;
                  if (LED_Target_WW[i] < Conf_LED_Max_Brightness) LED_Target_WW[i]++;
                  Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
                }
              }
            } else                          //group command
            {
              if (RF_RX_LED_GroupEnabled[Group-1])
              {
                if (LED_Target_CW[Group-1] > 2) LED_Target_CW[Group-1]--;
                if (LED_Target_WW[Group-1] < Conf_LED_Max_Brightness) LED_Target_WW[Group-1]++;
                Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
              }
            }
          }
          else                              //key hold
          {
            if (Group == 0)                   //global command
            {
              for (i=0;i<4;i++)
              {
                if (RF_RX_LED_GroupEnabled[i])
                {
                  if (LED_Target_CW[i] > (2+RF_MILIGHT_HOLD_STEP)) LED_Target_CW[i] -= RF_MILIGHT_HOLD_STEP;
                  LED_Target_WW[i] += RF_MILIGHT_HOLD_STEP;
                  if (LED_Target_WW[i] > Conf_LED_Max_Brightness) LED_Target_WW[i] = Conf_LED_Max_Brightness;
                  Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);

                }
              }
            } else                        // group command
            {
              if (RF_RX_LED_GroupEnabled[Group-1])
              {
                if (LED_Target_CW[Group-1] > (2+RF_MILIGHT_HOLD_STEP))  LED_Target_CW[Group-1] -= RF_MILIGHT_HOLD_STEP;
                LED_Target_WW[Group-1] += RF_MILIGHT_HOLD_STEP;
                if (LED_Target_WW[Group-1] > Conf_LED_Max_Brightness) LED_Target_WW[Group-1] = Conf_LED_Max_Brightness;
                Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
              }
            }       //End of single group
          }         // End of Keyhold
          for (i=0;i<4;i++)                 //limit maximum
          {
            if (LED_Target_CW[i] > Conf_LED_Max_Brightness) LED_Target_CW[i] = Conf_LED_Max_Brightness;
            if (LED_Target_WW[i] > Conf_LED_Max_Brightness) LED_Target_WW[i] = Conf_LED_Max_Brightness;

          }
        }           //end of command

        ////////////////////////////////////////
        ///// LEFT KEY ///////////////////////
        ///////////////////////////////////////

        else if (Command == 0x0F)
        {
          RF_RX_MI_FirstPress = FALSE;
          if (!KeyHold)                     // single press
          {
            if (Group == 0)                 //global command
            {
              for (i=0;i<4;i++)
              {
                if (RF_RX_LED_GroupEnabled[i])
                {
                  LED_Target_CW[i]++;
                  if (LED_Target_CW[i] > Conf_LED_Max_Brightness) LED_Target_CW[i] = Conf_LED_Max_Brightness;
                  if (LED_Target_WW[i] > 2) LED_Target_WW[i]--;
                  Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
                }
              }
            } else                          //group command
            {
              if (RF_RX_LED_GroupEnabled[Group-1])
              {
                LED_Target_CW[Group-1]++;
                if (LED_Target_CW[Group-1] > Conf_LED_Max_Brightness) LED_Target_CW[Group-1] = Conf_LED_Max_Brightness;
                if (LED_Target_CW[Group-1] > 2) LED_Target_WW[Group-1]--;
                Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
              }
            }
          }
          else                              //key hold
          {
            if (Group == 0)                   //global command
            {
              for (i=0;i<4;i++)
              {
                if (RF_RX_LED_GroupEnabled[i])
                {
                  LED_Target_CW[i] += RF_MILIGHT_HOLD_STEP;
                  if (LED_Target_CW[i] > Conf_LED_Max_Brightness) LED_Target_CW[i] = Conf_LED_Max_Brightness;
                  if (LED_Target_WW[i] > (2+RF_MILIGHT_HOLD_STEP))  LED_Target_WW[i] -= RF_MILIGHT_HOLD_STEP;
                  Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
                }
              }
            } else                        // group command
            {
              if (RF_RX_LED_GroupEnabled[Group-1])
              {
                LED_Target_CW[Group-1] += RF_MILIGHT_HOLD_STEP;
                if (LED_Target_CW[Group-1] > Conf_LED_Max_Brightness) LED_Target_CW[Group-1] = Conf_LED_Max_Brightness;
                if (LED_Target_WW[Group-1] > (2+RF_MILIGHT_HOLD_STEP))  LED_Target_WW[Group-1] -= RF_MILIGHT_HOLD_STEP;
                Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
              }
            }       //End of single group
          }         // End of Keyhold
          for (i=0;i<4;i++)                 //limit maximum
          {
            if (LED_Target_CW[i] > Conf_LED_Max_Brightness) LED_Target_CW[i] = Conf_LED_Max_Brightness;
            if (LED_Target_WW[i] > Conf_LED_Max_Brightness) LED_Target_WW[i] = Conf_LED_Max_Brightness;
          }
        }           //end of command
      } // End of valid address
    }   // End of new MI command
  }     //End of valid MI command
  else Valid = FALSE;
  ClrBit(Main_State, MAINSTATE_RFRX);
  return Valid;
}

/// Checks for Valid Stored remote address, or learns a New one
bool RF_RX_MI_ChkAddress(uint16_t MI_Address, uint8_t MI_Command)
{

  if (MI_Address == RF_RX_MI_ValidAddress) return TRUE;
  else if ((Uptime < RF_MI_LEARN_WINDOW_MS) && (MI_Command == 0x15))
  {
    RF_RX_MI_LearnCounter++;
    if (RF_RX_MI_LearnCounter >= 20)          //HOLD all on for 5s
    {
      RF_RX_MI_ValidAddress = MI_Address;
      RF_RX_MI_NewRemote = TRUE;
      return TRUE;
    } else return FALSE;
  }

  return FALSE;
}

/// Parse RF Commands from Local System
void RF_RX_Command(uint8_t *RX_Buffer, int8_t Length)
{
  uint8_t Item;
  uint8_t Size;

    if (RX_Buffer[0] == RF_NODEID)
    {
        Item =  RX_Buffer[3];
        Size =  RX_Buffer[2]%16;
        //Config Request
        if ( Item == 1)
        {
          Main_Config = RX_Buffer[4]*256 + RX_Buffer[5];
          //RFChannel = RX_Buffer[6];
          RF_SetNodeID(RX_Buffer[7]);
          EE_Store_Config();
        }
        if ( Item == 2)
        {
          GR_CW_Set(0, RX_Buffer[4]<<24 + RX_Buffer[5]<<16 + RX_Buffer[6]<<8 + RX_Buffer[7]);
        }
    }
}
