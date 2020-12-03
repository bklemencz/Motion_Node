   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  57                     ; 102 void Init_GPIOS(void)
  57                     ; 103 {
  59                     	switch	.text
  60  0000               _Init_GPIOS:
  64                     ; 106 	CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
  66  0000 c650c6        	ld	a,20678
  67  0003 a4e7          	and	a,#231
  68  0005 c750c6        	ld	20678,a
  69                     ; 107 	CLK->CKDIVR |= (uint8_t)0x00;
  71  0008 c650c6        	ld	a,20678
  72                     ; 112 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_RISE_FALL);
  74  000b ae0203        	ldw	x,#515
  75  000e cd0000        	call	_EXTI_SetExtIntSensitivity
  77                     ; 115 	if (HAS_RADAR) GPIO_Init(RADAR_GPIO_PORT, (GPIO_Pin_TypeDef) RADAR_PIN, GPIO_MODE_IN_PU_IT);
  79  0011 4b60          	push	#96
  80  0013 4b08          	push	#8
  81  0015 ae500a        	ldw	x,#20490
  82  0018 cd0000        	call	_GPIO_Init
  84  001b 85            	popw	x
  85                     ; 117 	GPIO_Init(STATUS_1_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  87  001c 4be0          	push	#224
  88  001e 4b10          	push	#16
  89  0020 ae5019        	ldw	x,#20505
  90  0023 cd0000        	call	_GPIO_Init
  92  0026 85            	popw	x
  93                     ; 118 	GPIO_Init(STATUS_2_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  95  0027 4be0          	push	#224
  96  0029 4b01          	push	#1
  97  002b ae500f        	ldw	x,#20495
  98  002e cd0000        	call	_GPIO_Init
 100  0031 85            	popw	x
 101                     ; 119 	GPIO_Init(STATUS_3_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_3_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 103  0032 4be0          	push	#224
 104  0034 4b04          	push	#4
 105  0036 ae500f        	ldw	x,#20495
 106  0039 cd0000        	call	_GPIO_Init
 108  003c 85            	popw	x
 109                     ; 120 	GPIO_Init(RS485_TXEN_PORT,(GPIO_Pin_TypeDef) RS485_TXEN_PIN,GPIO_MODE_OUT_PP_HIGH_FAST);
 111  003d 4bf0          	push	#240
 112  003f 4b80          	push	#128
 113  0041 ae500f        	ldw	x,#20495
 114  0044 cd0000        	call	_GPIO_Init
 116  0047 85            	popw	x
 117                     ; 121 	GPIO_WriteHigh(RS485_TXEN_PORT,(GPIO_Pin_TypeDef) RS485_TXEN_PIN);								//Enable 485 Tx
 119  0048 4b80          	push	#128
 120  004a ae500f        	ldw	x,#20495
 121  004d cd0000        	call	_GPIO_WriteHigh
 123  0050 84            	pop	a
 124                     ; 122 	UART2_DeInit();
 126  0051 cd0000        	call	_UART2_DeInit
 128                     ; 123 	UART2_Init(RS485_BAUD,UART2_WORDLENGTH_8D,UART2_STOPBITS_1,UART2_PARITY_NO,UART2_SYNCMODE_CLOCK_DISABLE,UART2_MODE_TXRX_ENABLE);
 130  0054 4b0c          	push	#12
 131  0056 4b80          	push	#128
 132  0058 4b00          	push	#0
 133  005a 4b00          	push	#0
 134  005c 4b00          	push	#0
 135  005e aee100        	ldw	x,#57600
 136  0061 89            	pushw	x
 137  0062 5f            	clrw	x
 138  0063 89            	pushw	x
 139  0064 cd0000        	call	_UART2_Init
 141  0067 5b09          	addw	sp,#9
 142                     ; 124 	UART2_Cmd(ENABLE);
 144  0069 a601          	ld	a,#1
 145  006b cd0000        	call	_UART2_Cmd
 147                     ; 126 	WS2811_Init();
 149  006e cd0000        	call	_WS2811_Init
 151                     ; 127 	LT8900_Init();
 153  0071 cd0000        	call	_LT8900_Init
 155                     ; 128 	ADC_Init();
 157  0074 cd0000        	call	_ADC_Init
 159                     ; 129 	Timer_Init();
 162                     ; 130 }
 165  0077 cc0000        	jp	_Timer_Init
 191                     ; 133 void Save_Targets(void)
 191                     ; 134 {
 192                     	switch	.text
 193  007a               _Save_Targets:
 197                     ; 135 	EEPROM_ProgramByte(39, LED_LastSaved_CW[0]);
 199  007a 3b0034        	push	_LED_LastSaved_CW
 200  007d ae0027        	ldw	x,#39
 201  0080 cd0000        	call	_EEPROM_ProgramByte
 203  0083 84            	pop	a
 204                     ; 136 	EEPROM_ProgramByte(40, LED_LastSaved_CW[1]);
 206  0084 3b0035        	push	_LED_LastSaved_CW+1
 207  0087 ae0028        	ldw	x,#40
 208  008a cd0000        	call	_EEPROM_ProgramByte
 210  008d 84            	pop	a
 211                     ; 137 	EEPROM_ProgramByte(41, LED_LastSaved_CW[2]);
 213  008e 3b0036        	push	_LED_LastSaved_CW+2
 214  0091 ae0029        	ldw	x,#41
 215  0094 cd0000        	call	_EEPROM_ProgramByte
 217  0097 84            	pop	a
 218                     ; 138 	EEPROM_ProgramByte(42, LED_LastSaved_CW[3]);
 220  0098 3b0037        	push	_LED_LastSaved_CW+3
 221  009b ae002a        	ldw	x,#42
 222  009e cd0000        	call	_EEPROM_ProgramByte
 224  00a1 84            	pop	a
 225                     ; 140 	EEPROM_ProgramByte(43, LED_LastSaved_WW[0]);
 227  00a2 3b0030        	push	_LED_LastSaved_WW
 228  00a5 ae002b        	ldw	x,#43
 229  00a8 cd0000        	call	_EEPROM_ProgramByte
 231  00ab 84            	pop	a
 232                     ; 141 	EEPROM_ProgramByte(44, LED_LastSaved_WW[1]);
 234  00ac 3b0031        	push	_LED_LastSaved_WW+1
 235  00af ae002c        	ldw	x,#44
 236  00b2 cd0000        	call	_EEPROM_ProgramByte
 238  00b5 84            	pop	a
 239                     ; 142 	EEPROM_ProgramByte(45, LED_LastSaved_WW[2]);
 241  00b6 3b0032        	push	_LED_LastSaved_WW+2
 242  00b9 ae002d        	ldw	x,#45
 243  00bc cd0000        	call	_EEPROM_ProgramByte
 245  00bf 84            	pop	a
 246                     ; 143 	EEPROM_ProgramByte(46, LED_LastSaved_WW[3]);
 248  00c0 3b0033        	push	_LED_LastSaved_WW+3
 249  00c3 ae002e        	ldw	x,#46
 250  00c6 cd0000        	call	_EEPROM_ProgramByte
 252  00c9 84            	pop	a
 253                     ; 144 }
 256  00ca 81            	ret	
 288                     ; 148 void SetDefaults(void)
 288                     ; 149 {
 289                     	switch	.text
 290  00cb               _SetDefaults:
 294                     ; 150 	LEDGroup_Def_WW[0]=0b10101010000000000000000000000000;
 296  00cb 5f            	clrw	x
 297  00cc cf0046        	ldw	_LEDGroup_Def_WW+2,x
 298  00cf aeaa00        	ldw	x,#-22016
 299  00d2 cf0044        	ldw	_LEDGroup_Def_WW,x
 300                     ; 151 	LEDGroup_Def_CW[0]=0b01010101000000000000000000000000;
 302  00d5 5f            	clrw	x
 303  00d6 cf0056        	ldw	_LEDGroup_Def_CW+2,x
 304  00d9 ae5500        	ldw	x,#21760
 305  00dc cf0054        	ldw	_LEDGroup_Def_CW,x
 306                     ; 152 	LEDGroup_Def_WW[1]=0b00000000101010100000000000000000;
 308  00df 5f            	clrw	x
 309  00e0 cf004a        	ldw	_LEDGroup_Def_WW+6,x
 310  00e3 ae00aa        	ldw	x,#170
 311  00e6 cf0048        	ldw	_LEDGroup_Def_WW+4,x
 312                     ; 153 	LEDGroup_Def_CW[1]=0b00000000010101010000000000000000;
 314  00e9 5f            	clrw	x
 315  00ea cf005a        	ldw	_LEDGroup_Def_CW+6,x
 316  00ed ae0055        	ldw	x,#85
 317  00f0 cf0058        	ldw	_LEDGroup_Def_CW+4,x
 318                     ; 154 	LEDGroup_Def_WW[2]=0b00000000000000001010101000000000;
 320  00f3 aeaa00        	ldw	x,#43520
 321  00f6 cf004e        	ldw	_LEDGroup_Def_WW+10,x
 322  00f9 5f            	clrw	x
 323  00fa cf004c        	ldw	_LEDGroup_Def_WW+8,x
 324                     ; 155 	LEDGroup_Def_CW[2]=0b00000000000000000101010100000000;
 326  00fd ae5500        	ldw	x,#21760
 327  0100 cf005e        	ldw	_LEDGroup_Def_CW+10,x
 328  0103 5f            	clrw	x
 329  0104 cf005c        	ldw	_LEDGroup_Def_CW+8,x
 330                     ; 156 	LEDGroup_Def_WW[3]=0b00000000000000000000000010101010;
 332  0107 ae00aa        	ldw	x,#170
 333  010a cf0052        	ldw	_LEDGroup_Def_WW+14,x
 334  010d 5f            	clrw	x
 335  010e cf0050        	ldw	_LEDGroup_Def_WW+12,x
 336                     ; 157 	LEDGroup_Def_CW[3]=0b00000000000000000000000001010101;
 338  0111 ae0055        	ldw	x,#85
 339  0114 cf0062        	ldw	_LEDGroup_Def_CW+14,x
 340  0117 5f            	clrw	x
 341  0118 cf0060        	ldw	_LEDGroup_Def_CW+12,x
 342                     ; 158 	RF_SetNodeID(RF_NODEID_DEF);
 344  011b a612          	ld	a,#18
 345  011d cd0000        	call	_RF_SetNodeID
 347                     ; 159 	if (LED_FADE_ENABLED) SetBit(Main_Config, MAINCONFIG_FADEE);
 349                     ; 160 	if (RF_COM_USE)	SetBit(Main_Config,MAINCONFIG_USERF);
 351                     ; 161 	if (RF_MILIGHT_REMOTE) SetBit(Main_Config, MAINCONFIG_MIREM);
 353                     ; 162 	if (RF_MILIGHT_GATEW) SetBit(Main_Config, MAINCONFIG_MIGAT);
 355                     ; 163 	if (START_LEDON) SetBit(Main_Config, MAINCONFIG_STRTON);
 357                     ; 164 	if (LED_RX_FADE_DELAY_EN) SetBit(Main_Config, MAINCONFIG_FADEDELEN);
 359                     ; 165 	if (RF_TX_PERIODIC_SEND)	SetBit(Main_Config, MAINCONFIG_RFPERTXEN);
 361                     ; 167 	Conf_LED_Fade_Delay = LED_FADE_DELAY_MS;
 363  0120 c60080        	ld	a,_Main_Config+1
 364  0123 aaf7          	or	a,#247
 365  0125 c70080        	ld	_Main_Config+1,a
 366  0128 350a007e      	mov	_Conf_LED_Fade_Delay,#10
 367                     ; 168 	Conf_LED_TurnOff_Delay_S = LIGHTS_OFF_DELAY_S;
 369  012c ae000a        	ldw	x,#10
 370  012f cf007c        	ldw	_Conf_LED_TurnOff_Delay_S,x
 371                     ; 169 	Conf_LED_Max_Brightness = LIGHT_MAX_PERCENT;
 373  0132 3564007b      	mov	_Conf_LED_Max_Brightness,#100
 374                     ; 170 	Conf_LED_NightMode_Brightness = LIGHT_NIGHT_PERCENT;
 376  0136 350a007a      	mov	_Conf_LED_NightMode_Brightness,#10
 377                     ; 171 	RF_RX_MI_NewRemote = FALSE;
 379  013a 725f0000      	clr	_RF_RX_MI_NewRemote
 380                     ; 172 }
 383  013e 81            	ret	
 419                     ; 174 void EE_Store_Config (void)
 419                     ; 175 {
 420                     	switch	.text
 421  013f               _EE_Store_Config:
 425                     ; 177 	SetBit(Main_Config, MAINCONFIG_FADEDELEN);
 427  013f 721c0080      	bset	_Main_Config+1,#6
 428                     ; 179 	EEPROM_Program2Byte(0, Main_Config);
 430  0143 ce007f        	ldw	x,_Main_Config
 431  0146 89            	pushw	x
 432  0147 5f            	clrw	x
 433  0148 cd0000        	call	_EEPROM_Program2Byte
 435  014b 85            	popw	x
 436                     ; 180 	EEPROM_ProgramByte(2, Conf_LED_Fade_Delay);
 438  014c 3b007e        	push	_Conf_LED_Fade_Delay
 439  014f ae0002        	ldw	x,#2
 440  0152 cd0000        	call	_EEPROM_ProgramByte
 442  0155 84            	pop	a
 443                     ; 181 	EEPROM_ProgramByte(3, Conf_LED_Max_Brightness);
 445  0156 3b007b        	push	_Conf_LED_Max_Brightness
 446  0159 ae0003        	ldw	x,#3
 447  015c cd0000        	call	_EEPROM_ProgramByte
 449  015f 84            	pop	a
 450                     ; 182 	EEPROM_ProgramByte(4, Conf_LED_NightMode_Brightness);
 452  0160 3b007a        	push	_Conf_LED_NightMode_Brightness
 453  0163 ae0004        	ldw	x,#4
 454  0166 cd0000        	call	_EEPROM_ProgramByte
 456  0169 ce007c        	ldw	x,_Conf_LED_TurnOff_Delay_S
 457  016c 84            	pop	a
 458                     ; 183 	EEPROM_Program2Byte(5, Conf_LED_TurnOff_Delay_S);
 460  016d 89            	pushw	x
 461  016e ae0005        	ldw	x,#5
 462  0171 cd0000        	call	_EEPROM_Program2Byte
 464  0174 85            	popw	x
 465                     ; 184 	EEPROM_Program4Byte(7, LEDGroup_Def_CW[0]);
 467  0175 ce0056        	ldw	x,_LEDGroup_Def_CW+2
 468  0178 89            	pushw	x
 469  0179 ce0054        	ldw	x,_LEDGroup_Def_CW
 470  017c 89            	pushw	x
 471  017d ae0007        	ldw	x,#7
 472  0180 cd0000        	call	_EEPROM_Program4Byte
 474  0183 5b04          	addw	sp,#4
 475                     ; 185 	EEPROM_Program4Byte(11, LEDGroup_Def_CW[1]);
 477  0185 ce005a        	ldw	x,_LEDGroup_Def_CW+6
 478  0188 89            	pushw	x
 479  0189 ce0058        	ldw	x,_LEDGroup_Def_CW+4
 480  018c 89            	pushw	x
 481  018d ae000b        	ldw	x,#11
 482  0190 cd0000        	call	_EEPROM_Program4Byte
 484  0193 5b04          	addw	sp,#4
 485                     ; 186 	EEPROM_Program4Byte(15, LEDGroup_Def_CW[2]);
 487  0195 ce005e        	ldw	x,_LEDGroup_Def_CW+10
 488  0198 89            	pushw	x
 489  0199 ce005c        	ldw	x,_LEDGroup_Def_CW+8
 490  019c 89            	pushw	x
 491  019d ae000f        	ldw	x,#15
 492  01a0 cd0000        	call	_EEPROM_Program4Byte
 494  01a3 5b04          	addw	sp,#4
 495                     ; 187 	EEPROM_Program4Byte(19, LEDGroup_Def_CW[3]);
 497  01a5 ce0062        	ldw	x,_LEDGroup_Def_CW+14
 498  01a8 89            	pushw	x
 499  01a9 ce0060        	ldw	x,_LEDGroup_Def_CW+12
 500  01ac 89            	pushw	x
 501  01ad ae0013        	ldw	x,#19
 502  01b0 cd0000        	call	_EEPROM_Program4Byte
 504  01b3 5b04          	addw	sp,#4
 505                     ; 188 	EEPROM_Program4Byte(23, LEDGroup_Def_WW[0]);
 507  01b5 ce0046        	ldw	x,_LEDGroup_Def_WW+2
 508  01b8 89            	pushw	x
 509  01b9 ce0044        	ldw	x,_LEDGroup_Def_WW
 510  01bc 89            	pushw	x
 511  01bd ae0017        	ldw	x,#23
 512  01c0 cd0000        	call	_EEPROM_Program4Byte
 514  01c3 5b04          	addw	sp,#4
 515                     ; 189 	EEPROM_Program4Byte(27, LEDGroup_Def_WW[1]);
 517  01c5 ce004a        	ldw	x,_LEDGroup_Def_WW+6
 518  01c8 89            	pushw	x
 519  01c9 ce0048        	ldw	x,_LEDGroup_Def_WW+4
 520  01cc 89            	pushw	x
 521  01cd ae001b        	ldw	x,#27
 522  01d0 cd0000        	call	_EEPROM_Program4Byte
 524  01d3 5b04          	addw	sp,#4
 525                     ; 190 	EEPROM_Program4Byte(31, LEDGroup_Def_WW[2]);
 527  01d5 ce004e        	ldw	x,_LEDGroup_Def_WW+10
 528  01d8 89            	pushw	x
 529  01d9 ce004c        	ldw	x,_LEDGroup_Def_WW+8
 530  01dc 89            	pushw	x
 531  01dd ae001f        	ldw	x,#31
 532  01e0 cd0000        	call	_EEPROM_Program4Byte
 534  01e3 5b04          	addw	sp,#4
 535                     ; 191 	EEPROM_Program4Byte(35, LEDGroup_Def_WW[3]);
 537  01e5 ce0052        	ldw	x,_LEDGroup_Def_WW+14
 538  01e8 89            	pushw	x
 539  01e9 ce0050        	ldw	x,_LEDGroup_Def_WW+12
 540  01ec 89            	pushw	x
 541  01ed ae0023        	ldw	x,#35
 542  01f0 cd0000        	call	_EEPROM_Program4Byte
 544  01f3 5b04          	addw	sp,#4
 545                     ; 192 	Save_Targets();				// 36 - 43 LED TARGETS
 547  01f5 cd007a        	call	_Save_Targets
 549                     ; 193 	if ( RF_RX_MI_ValidAddress !=0 ) EEPROM_Program2Byte(47, RF_RX_MI_ValidAddress);
 551  01f8 ce0000        	ldw	x,_RF_RX_MI_ValidAddress
 552  01fb 2708          	jreq	L35
 555  01fd 89            	pushw	x
 556  01fe ae002f        	ldw	x,#47
 557  0201 cd0000        	call	_EEPROM_Program2Byte
 559  0204 85            	popw	x
 560  0205               L35:
 561                     ; 194 	EEPROM_ProgramByte(49, RF_GetNodeID());
 563  0205 cd0000        	call	_RF_GetNodeID
 565  0208 88            	push	a
 566  0209 ae0031        	ldw	x,#49
 567  020c cd0000        	call	_EEPROM_ProgramByte
 569  020f 84            	pop	a
 570                     ; 198 }
 573  0210 81            	ret	
 611                     ; 200 void EE_Read_Config(void)
 611                     ; 201 {
 612                     	switch	.text
 613  0211               _EE_Read_Config:
 617                     ; 202   if (EEPROM_Read2Byte(0)==0) EE_Store_Config();
 619  0211 5f            	clrw	x
 620  0212 cd0000        	call	_EEPROM_Read2Byte
 622  0215 5d            	tnzw	x
 623  0216 2603          	jrne	L56
 626  0218 cd013f        	call	_EE_Store_Config
 628  021b               L56:
 629                     ; 203 	Main_Config = EEPROM_Read2Byte(0);
 631  021b 5f            	clrw	x
 632  021c cd0000        	call	_EEPROM_Read2Byte
 634  021f cf007f        	ldw	_Main_Config,x
 635                     ; 204 	Conf_LED_Fade_Delay = EEPROM_ReadByte(2);
 637  0222 ae0002        	ldw	x,#2
 638  0225 cd0000        	call	_EEPROM_ReadByte
 640  0228 c7007e        	ld	_Conf_LED_Fade_Delay,a
 641                     ; 205 	Conf_LED_Max_Brightness = EEPROM_ReadByte(3);
 643  022b ae0003        	ldw	x,#3
 644  022e cd0000        	call	_EEPROM_ReadByte
 646  0231 c7007b        	ld	_Conf_LED_Max_Brightness,a
 647                     ; 206 	Conf_LED_NightMode_Brightness = EEPROM_ReadByte(4);
 649  0234 ae0004        	ldw	x,#4
 650  0237 cd0000        	call	_EEPROM_ReadByte
 652  023a c7007a        	ld	_Conf_LED_NightMode_Brightness,a
 653                     ; 207 	Conf_LED_TurnOff_Delay_S = EEPROM_Read2Byte(5);
 655  023d ae0005        	ldw	x,#5
 656  0240 cd0000        	call	_EEPROM_Read2Byte
 658  0243 cf007c        	ldw	_Conf_LED_TurnOff_Delay_S,x
 659                     ; 208 	RF_SetNodeID(EEPROM_ReadByte(49));
 661  0246 ae0031        	ldw	x,#49
 662  0249 cd0000        	call	_EEPROM_ReadByte
 664  024c cd0000        	call	_RF_SetNodeID
 666                     ; 210 	LEDGroup_Def_CW[0] = EEPROM_Read4Byte(7);
 668  024f ae0007        	ldw	x,#7
 669  0252 cd0000        	call	_EEPROM_Read4Byte
 671  0255 ae0054        	ldw	x,#_LEDGroup_Def_CW
 672  0258 cd0000        	call	c_rtol
 674                     ; 211   LEDGroup_Def_CW[1] = EEPROM_Read4Byte(11);
 676  025b ae000b        	ldw	x,#11
 677  025e cd0000        	call	_EEPROM_Read4Byte
 679  0261 ae0058        	ldw	x,#_LEDGroup_Def_CW+4
 680  0264 cd0000        	call	c_rtol
 682                     ; 212   LEDGroup_Def_CW[2] = EEPROM_Read4Byte(15);
 684  0267 ae000f        	ldw	x,#15
 685  026a cd0000        	call	_EEPROM_Read4Byte
 687  026d ae005c        	ldw	x,#_LEDGroup_Def_CW+8
 688  0270 cd0000        	call	c_rtol
 690                     ; 213 	LEDGroup_Def_CW[3] = EEPROM_Read4Byte(19);
 692  0273 ae0013        	ldw	x,#19
 693  0276 cd0000        	call	_EEPROM_Read4Byte
 695  0279 ae0060        	ldw	x,#_LEDGroup_Def_CW+12
 696  027c cd0000        	call	c_rtol
 698                     ; 215 	LEDGroup_Def_WW[0] = EEPROM_Read4Byte(23);
 700  027f ae0017        	ldw	x,#23
 701  0282 cd0000        	call	_EEPROM_Read4Byte
 703  0285 ae0044        	ldw	x,#_LEDGroup_Def_WW
 704  0288 cd0000        	call	c_rtol
 706                     ; 216   LEDGroup_Def_WW[1] = EEPROM_Read4Byte(27);
 708  028b ae001b        	ldw	x,#27
 709  028e cd0000        	call	_EEPROM_Read4Byte
 711  0291 ae0048        	ldw	x,#_LEDGroup_Def_WW+4
 712  0294 cd0000        	call	c_rtol
 714                     ; 217 	LEDGroup_Def_WW[2] = EEPROM_Read4Byte(31);
 716  0297 ae001f        	ldw	x,#31
 717  029a cd0000        	call	_EEPROM_Read4Byte
 719  029d ae004c        	ldw	x,#_LEDGroup_Def_WW+8
 720  02a0 cd0000        	call	c_rtol
 722                     ; 218 	LEDGroup_Def_WW[3] = EEPROM_Read4Byte(35);
 724  02a3 ae0023        	ldw	x,#35
 725  02a6 cd0000        	call	_EEPROM_Read4Byte
 727  02a9 ae0050        	ldw	x,#_LEDGroup_Def_WW+12
 728  02ac cd0000        	call	c_rtol
 730                     ; 220 	LED_LastSaved_CW[0] = EEPROM_ReadByte(39);
 732  02af ae0027        	ldw	x,#39
 733  02b2 cd0000        	call	_EEPROM_ReadByte
 735  02b5 c70034        	ld	_LED_LastSaved_CW,a
 736                     ; 221 	LED_LastSaved_CW[1] = EEPROM_ReadByte(40);
 738  02b8 ae0028        	ldw	x,#40
 739  02bb cd0000        	call	_EEPROM_ReadByte
 741  02be c70035        	ld	_LED_LastSaved_CW+1,a
 742                     ; 222 	LED_LastSaved_CW[2] = EEPROM_ReadByte(41);
 744  02c1 ae0029        	ldw	x,#41
 745  02c4 cd0000        	call	_EEPROM_ReadByte
 747  02c7 c70036        	ld	_LED_LastSaved_CW+2,a
 748                     ; 223 	LED_LastSaved_CW[3] = EEPROM_ReadByte(42);
 750  02ca ae002a        	ldw	x,#42
 751  02cd cd0000        	call	_EEPROM_ReadByte
 753  02d0 c70037        	ld	_LED_LastSaved_CW+3,a
 754                     ; 225 	LED_LastSaved_WW[0] = EEPROM_ReadByte(43);
 756  02d3 ae002b        	ldw	x,#43
 757  02d6 cd0000        	call	_EEPROM_ReadByte
 759  02d9 c70030        	ld	_LED_LastSaved_WW,a
 760                     ; 226 	LED_LastSaved_WW[1] = EEPROM_ReadByte(44);
 762  02dc ae002c        	ldw	x,#44
 763  02df cd0000        	call	_EEPROM_ReadByte
 765  02e2 c70031        	ld	_LED_LastSaved_WW+1,a
 766                     ; 227 	LED_LastSaved_WW[2] = EEPROM_ReadByte(45);
 768  02e5 ae002d        	ldw	x,#45
 769  02e8 cd0000        	call	_EEPROM_ReadByte
 771  02eb c70032        	ld	_LED_LastSaved_WW+2,a
 772                     ; 228 	LED_LastSaved_WW[3] = EEPROM_ReadByte(46);
 774  02ee ae002e        	ldw	x,#46
 775  02f1 cd0000        	call	_EEPROM_ReadByte
 777  02f4 c70033        	ld	_LED_LastSaved_WW+3,a
 778                     ; 230 	RF_RX_MI_ValidAddress = EEPROM_Read2Byte(47);
 780  02f7 ae002f        	ldw	x,#47
 781  02fa cd0000        	call	_EEPROM_Read2Byte
 783  02fd cf0000        	ldw	_RF_RX_MI_ValidAddress,x
 784                     ; 232 	SetBit(Main_Config, MAINCONFIG_FADEDELEN);
 786  0300 721c0080      	bset	_Main_Config+1,#6
 787                     ; 233 	SetBit(Main_Config, MAINCONFIG_RFPERTXEN);
 789  0304 721e0080      	bset	_Main_Config+1,#7
 790                     ; 235 }
 793  0308 81            	ret	
 842                     ; 237 void StartUp(void)
 842                     ; 238 {
 843                     	switch	.text
 844  0309               _StartUp:
 846  0309 88            	push	a
 847       00000001      OFST:	set	1
 850                     ; 240 	Init_GPIOS();
 852  030a cd0000        	call	_Init_GPIOS
 854                     ; 241 	SetDefaults();
 856  030d cd00cb        	call	_SetDefaults
 858                     ; 242 	EEPROM_Config();
 860  0310 cd0000        	call	_EEPROM_Config
 862                     ; 243 	EE_Read_Config();
 864  0313 cd0211        	call	_EE_Read_Config
 866                     ; 245 	enableInterrupts();
 869  0316 9a            	rim	
 871                     ; 248 	if (bitRead(Main_Config, MAINCONFIG_STRTON))
 874  0317 ce007f        	ldw	x,_Main_Config
 875  031a 54            	srlw	x
 876  031b 54            	srlw	x
 877  031c 54            	srlw	x
 878  031d 54            	srlw	x
 879  031e 54            	srlw	x
 880  031f 01            	rrwa	x,a
 881  0320 a401          	and	a,#1
 882  0322 5f            	clrw	x
 883  0323 97            	ld	xl,a
 884  0324 5d            	tnzw	x
 885  0325 2726          	jreq	L301
 886                     ; 250 		for (i=0;i<4;i++)
 888  0327 4f            	clr	a
 889  0328 6b01          	ld	(OFST+0,sp),a
 891  032a               L501:
 892                     ; 252 			RF_RX_LED_GroupEnabled[i] = TRUE;
 894  032a 5f            	clrw	x
 895  032b 97            	ld	xl,a
 896  032c a601          	ld	a,#1
 897  032e d70000        	ld	(_RF_RX_LED_GroupEnabled,x),a
 898                     ; 253 			LED_Target_CW[i] = LED_LastSaved_CW[i];
 900  0331 5f            	clrw	x
 901  0332 7b01          	ld	a,(OFST+0,sp)
 902  0334 97            	ld	xl,a
 903  0335 d60034        	ld	a,(_LED_LastSaved_CW,x)
 904  0338 d7003c        	ld	(_LED_Target_CW,x),a
 905                     ; 254 			LED_Target_WW[i] = LED_LastSaved_WW[i];
 907  033b 5f            	clrw	x
 908  033c 7b01          	ld	a,(OFST+0,sp)
 909  033e 97            	ld	xl,a
 910  033f d60030        	ld	a,(_LED_LastSaved_WW,x)
 911  0342 d70038        	ld	(_LED_Target_WW,x),a
 912                     ; 250 		for (i=0;i<4;i++)
 914  0345 0c01          	inc	(OFST+0,sp)
 918  0347 7b01          	ld	a,(OFST+0,sp)
 919  0349 a104          	cp	a,#4
 920  034b 25dd          	jrult	L501
 921  034d               L301:
 922                     ; 257 	_delay_ms(100);
 924  034d ae0064        	ldw	x,#100
 925  0350 cd0000        	call	__delay_ms
 927                     ; 258 	LT8900_softReset();
 929  0353 cd0000        	call	_LT8900_softReset
 931                     ; 259 	LT8900_InitRegisters();                          // Init LT8900 registers
 933  0356 cd0000        	call	_LT8900_InitRegisters
 935                     ; 260 	LT8900_InitRegisters(); 
 937  0359 cd0000        	call	_LT8900_InitRegisters
 939                     ; 261 	LT8900_setChannel(DEFAULT_CHANNEL);                            // Set recieve channel
 941  035c a64a          	ld	a,#74
 942  035e cd0000        	call	_LT8900_setChannel
 944                     ; 262   	LT8900_startListening();												 // RX Mode
 946  0361 cd0000        	call	_LT8900_startListening
 948                     ; 263 	RF_TX_Timer = RF_TX_PERIODIC_TIME;
 950  0364 ae2710        	ldw	x,#10000
 951  0367 cf0000        	ldw	_RF_TX_Timer,x
 952                     ; 265 }
 955  036a 84            	pop	a
 956  036b 81            	ret	
 996                     ; 267 void GR_CW_Set (uint8_t Group, uint32_t Value)
 996                     ; 268 {
 997                     	switch	.text
 998  036c               _GR_CW_Set:
1000       ffffffff      OFST: set -1
1003                     ; 269 	LEDGroup_Def_CW[Group] = Value;
1005  036c 97            	ld	xl,a
1006  036d a604          	ld	a,#4
1007  036f 42            	mul	x,a
1008  0370 7b06          	ld	a,(OFST+7,sp)
1009  0372 d70057        	ld	(_LEDGroup_Def_CW+3,x),a
1010  0375 7b05          	ld	a,(OFST+6,sp)
1011  0377 d70056        	ld	(_LEDGroup_Def_CW+2,x),a
1012  037a 7b04          	ld	a,(OFST+5,sp)
1013  037c d70055        	ld	(_LEDGroup_Def_CW+1,x),a
1014  037f 7b03          	ld	a,(OFST+4,sp)
1015  0381 d70054        	ld	(_LEDGroup_Def_CW,x),a
1016                     ; 270 }
1019  0384 81            	ret	
1059                     ; 272 void GR_WW_Set (uint8_t Group, uint32_t Value)
1059                     ; 273 {
1060                     	switch	.text
1061  0385               _GR_WW_Set:
1063       ffffffff      OFST: set -1
1066                     ; 274 	LEDGroup_Def_WW[Group] = Value;
1068  0385 97            	ld	xl,a
1069  0386 a604          	ld	a,#4
1070  0388 42            	mul	x,a
1071  0389 7b06          	ld	a,(OFST+7,sp)
1072  038b d70047        	ld	(_LEDGroup_Def_WW+3,x),a
1073  038e 7b05          	ld	a,(OFST+6,sp)
1074  0390 d70046        	ld	(_LEDGroup_Def_WW+2,x),a
1075  0393 7b04          	ld	a,(OFST+5,sp)
1076  0395 d70045        	ld	(_LEDGroup_Def_WW+1,x),a
1077  0398 7b03          	ld	a,(OFST+4,sp)
1078  039a d70044        	ld	(_LEDGroup_Def_WW,x),a
1079                     ; 275 }
1082  039d 81            	ret	
1151                     ; 281 void WS2811_Load_Stream (void)
1151                     ; 282 {
1152                     	switch	.text
1153  039e               _WS2811_Load_Stream:
1155  039e 5224          	subw	sp,#36
1156       00000024      OFST:	set	36
1159                     ; 286 	for (i=0;i<4;i++)
1161  03a0 4f            	clr	a
1162  03a1 6b23          	ld	(OFST-1,sp),a
1164  03a3               L571:
1165                     ; 288 		GroupTemp_CW[i] = LEDGroup_Def_CW[i];
1167  03a3 cd04b1        	call	LC001
1168  03a6 9096          	ldw	y,sp
1169  03a8 72a90003      	addw	y,#OFST-33
1170  03ac 1701          	ldw	(OFST-35,sp),y
1172  03ae 905f          	clrw	y
1173  03b0 7b23          	ld	a,(OFST-1,sp)
1174  03b2 9097          	ld	yl,a
1175  03b4 9058          	sllw	y
1176  03b6 9058          	sllw	y
1177  03b8 72f901        	addw	y,(OFST-35,sp)
1178  03bb d60057        	ld	a,(_LEDGroup_Def_CW+3,x)
1179  03be 90e703        	ld	(3,y),a
1180  03c1 d60056        	ld	a,(_LEDGroup_Def_CW+2,x)
1181  03c4 90e702        	ld	(2,y),a
1182  03c7 d60055        	ld	a,(_LEDGroup_Def_CW+1,x)
1183  03ca 90e701        	ld	(1,y),a
1184  03cd d60054        	ld	a,(_LEDGroup_Def_CW,x)
1185  03d0 90f7          	ld	(y),a
1186                     ; 289 		GroupTemp_WW[i] = LEDGroup_Def_WW[i];
1188  03d2 9096          	ldw	y,sp
1189  03d4 72a90013      	addw	y,#OFST-17
1190  03d8 1701          	ldw	(OFST-35,sp),y
1192  03da 905f          	clrw	y
1193  03dc 7b23          	ld	a,(OFST-1,sp)
1194  03de 9097          	ld	yl,a
1195  03e0 9058          	sllw	y
1196  03e2 9058          	sllw	y
1197  03e4 72f901        	addw	y,(OFST-35,sp)
1198  03e7 d60047        	ld	a,(_LEDGroup_Def_WW+3,x)
1199  03ea 90e703        	ld	(3,y),a
1200  03ed d60046        	ld	a,(_LEDGroup_Def_WW+2,x)
1201  03f0 90e702        	ld	(2,y),a
1202  03f3 d60045        	ld	a,(_LEDGroup_Def_WW+1,x)
1203  03f6 90e701        	ld	(1,y),a
1204  03f9 d60044        	ld	a,(_LEDGroup_Def_WW,x)
1205  03fc 90f7          	ld	(y),a
1206                     ; 286 	for (i=0;i<4;i++)
1208  03fe 0c23          	inc	(OFST-1,sp)
1212  0400 7b23          	ld	a,(OFST-1,sp)
1213  0402 a104          	cp	a,#4
1214  0404 259d          	jrult	L571
1215                     ; 291 	for (i=0;i<WS2811_MAX_CHANNELS;i++)
1217  0406 0f23          	clr	(OFST-1,sp)
1219  0408               L302:
1220                     ; 293 		for (j=0;j<4;j++)
1222  0408 0f24          	clr	(OFST+0,sp)
1224  040a               L112:
1225                     ; 295 			if ( GroupTemp_CW[j] & 0x01 ) WS2811_1_Stream[i] = WS2811_Gamma_Corr(LED_Act_CW[j]);
1227  040a 96            	ldw	x,sp
1228  040b 1c0006        	addw	x,#OFST-30
1229  040e 1f01          	ldw	(OFST-35,sp),x
1231  0410 7b24          	ld	a,(OFST+0,sp)
1232  0412 cd04b1        	call	LC001
1233  0415 72fb01        	addw	x,(OFST-35,sp)
1234  0418 f6            	ld	a,(x)
1235  0419 a501          	bcp	a,#1
1236  041b 2713          	jreq	L712
1239  041d 7b23          	ld	a,(OFST-1,sp)
1240  041f 5f            	clrw	x
1241  0420 97            	ld	xl,a
1242  0421 89            	pushw	x
1243  0422 7b26          	ld	a,(OFST+2,sp)
1244  0424 5f            	clrw	x
1245  0425 97            	ld	xl,a
1246  0426 d6002c        	ld	a,(_LED_Act_CW,x)
1247  0429 cd0000        	call	_WS2811_Gamma_Corr
1249  042c 85            	popw	x
1250  042d d70014        	ld	(_WS2811_1_Stream,x),a
1251  0430               L712:
1252                     ; 296 			if ( GroupTemp_WW[j] & 0x01 ) WS2811_1_Stream[i] = WS2811_Gamma_Corr(LED_Act_WW[j]);
1254  0430 96            	ldw	x,sp
1255  0431 1c0016        	addw	x,#OFST-14
1256  0434 1f01          	ldw	(OFST-35,sp),x
1258  0436 7b24          	ld	a,(OFST+0,sp)
1259  0438 ad77          	call	LC001
1260  043a 72fb01        	addw	x,(OFST-35,sp)
1261  043d f6            	ld	a,(x)
1262  043e a501          	bcp	a,#1
1263  0440 2713          	jreq	L122
1266  0442 7b23          	ld	a,(OFST-1,sp)
1267  0444 5f            	clrw	x
1268  0445 97            	ld	xl,a
1269  0446 89            	pushw	x
1270  0447 7b26          	ld	a,(OFST+2,sp)
1271  0449 5f            	clrw	x
1272  044a 97            	ld	xl,a
1273  044b d60028        	ld	a,(_LED_Act_WW,x)
1274  044e cd0000        	call	_WS2811_Gamma_Corr
1276  0451 85            	popw	x
1277  0452 d70014        	ld	(_WS2811_1_Stream,x),a
1278  0455               L122:
1279                     ; 293 		for (j=0;j<4;j++)
1281  0455 0c24          	inc	(OFST+0,sp)
1285  0457 7b24          	ld	a,(OFST+0,sp)
1286  0459 a104          	cp	a,#4
1287  045b 25ad          	jrult	L112
1288                     ; 298 		for (j=0;j<4;j++) { GroupTemp_CW[j] >>= 1; GroupTemp_WW[j] >>= 1; }
1290  045d 0f24          	clr	(OFST+0,sp)
1292  045f               L322:
1295  045f 96            	ldw	x,sp
1296  0460 1c0003        	addw	x,#OFST-33
1297  0463 1f01          	ldw	(OFST-35,sp),x
1299  0465 7b24          	ld	a,(OFST+0,sp)
1300  0467 ad48          	call	LC001
1301  0469 72fb01        	addw	x,(OFST-35,sp)
1302  046c 74            	srl	(x)
1303  046d 6601          	rrc	(1,x)
1304  046f 6602          	rrc	(2,x)
1305  0471 6603          	rrc	(3,x)
1308  0473 96            	ldw	x,sp
1309  0474 1c0013        	addw	x,#OFST-17
1310  0477 1f01          	ldw	(OFST-35,sp),x
1312  0479 7b24          	ld	a,(OFST+0,sp)
1313  047b ad34          	call	LC001
1314  047d 72fb01        	addw	x,(OFST-35,sp)
1315  0480 74            	srl	(x)
1316  0481 6601          	rrc	(1,x)
1317  0483 6602          	rrc	(2,x)
1318  0485 6603          	rrc	(3,x)
1321  0487 0c24          	inc	(OFST+0,sp)
1325  0489 7b24          	ld	a,(OFST+0,sp)
1326  048b a104          	cp	a,#4
1327  048d 25d0          	jrult	L322
1328                     ; 291 	for (i=0;i<WS2811_MAX_CHANNELS;i++)
1330  048f 0c23          	inc	(OFST-1,sp)
1334  0491 7b23          	ld	a,(OFST-1,sp)
1335  0493 a114          	cp	a,#20
1336  0495 2403cc0408    	jrult	L302
1337                     ; 300 	disableInterrupts();
1340  049a 9b            	sim	
1342                     ; 301 	WS2811_1_Update_800K(WS2811_1_Stream, WS2811_MAX_CHANNELS);
1345  049b 4b14          	push	#20
1346  049d ae0014        	ldw	x,#_WS2811_1_Stream
1347  04a0 cd0000        	call	_WS2811_1_Update_800K
1349  04a3 84            	pop	a
1350                     ; 302 	WS2811_2_Update_800K(WS2811_1_Stream, WS2811_MAX_CHANNELS);
1352  04a4 4b14          	push	#20
1353  04a6 ae0014        	ldw	x,#_WS2811_1_Stream
1354  04a9 cd0000        	call	_WS2811_2_Update_800K
1356  04ac 9a            	rim	
1357  04ad 84            	pop	a
1358                     ; 303 	enableInterrupts();
1362                     ; 304 }
1366  04ae 5b24          	addw	sp,#36
1367  04b0 81            	ret	
1368  04b1               LC001:
1369  04b1 97            	ld	xl,a
1370  04b2 a604          	ld	a,#4
1371  04b4 42            	mul	x,a
1372  04b5 81            	ret	
1443                     ; 308 void Light_Flash(uint8_t Nr, uint16_t OnTime, uint16_t OffTime, uint8_t Level)
1443                     ; 309 {
1444                     	switch	.text
1445  04b6               _Light_Flash:
1447  04b6 88            	push	a
1448  04b7 89            	pushw	x
1449       00000002      OFST:	set	2
1452                     ; 311 	for (i=0;i<Nr;i++)
1454  04b8 0f01          	clr	(OFST-1,sp)
1457  04ba 2044          	jra	L362
1458  04bc               L752:
1459                     ; 313 		for (j=0;j<4;j++) {LED_Act_CW[j]=Level; LED_Act_WW[j]=Level;}
1461  04bc 4f            	clr	a
1462  04bd 6b02          	ld	(OFST+0,sp),a
1464  04bf               L762:
1467  04bf 5f            	clrw	x
1468  04c0 97            	ld	xl,a
1469  04c1 7b0a          	ld	a,(OFST+8,sp)
1470  04c3 d7002c        	ld	(_LED_Act_CW,x),a
1473  04c6 5f            	clrw	x
1474  04c7 7b02          	ld	a,(OFST+0,sp)
1475  04c9 97            	ld	xl,a
1476  04ca 7b0a          	ld	a,(OFST+8,sp)
1477  04cc d70028        	ld	(_LED_Act_WW,x),a
1480  04cf 0c02          	inc	(OFST+0,sp)
1484  04d1 7b02          	ld	a,(OFST+0,sp)
1485  04d3 a104          	cp	a,#4
1486  04d5 25e8          	jrult	L762
1487                     ; 314 		WS2811_Load_Stream();
1489  04d7 cd039e        	call	_WS2811_Load_Stream
1491                     ; 315 		_delay_ms(OnTime);
1493  04da 1e06          	ldw	x,(OFST+4,sp)
1494  04dc cd0000        	call	__delay_ms
1496                     ; 316 		for (j=0;j<4;j++) {LED_Act_CW[j]=0; LED_Act_WW[j]=0;}
1498  04df 4f            	clr	a
1499  04e0 6b02          	ld	(OFST+0,sp),a
1501  04e2               L572:
1504  04e2 5f            	clrw	x
1505  04e3 97            	ld	xl,a
1506  04e4 724f002c      	clr	(_LED_Act_CW,x)
1509  04e8 5f            	clrw	x
1510  04e9 97            	ld	xl,a
1511  04ea 724f0028      	clr	(_LED_Act_WW,x)
1514  04ee 0c02          	inc	(OFST+0,sp)
1518  04f0 7b02          	ld	a,(OFST+0,sp)
1519  04f2 a104          	cp	a,#4
1520  04f4 25ec          	jrult	L572
1521                     ; 317 		WS2811_Load_Stream();
1523  04f6 cd039e        	call	_WS2811_Load_Stream
1525                     ; 318 		_delay_ms(OffTime);
1527  04f9 1e08          	ldw	x,(OFST+6,sp)
1528  04fb cd0000        	call	__delay_ms
1530                     ; 311 	for (i=0;i<Nr;i++)
1532  04fe 0c01          	inc	(OFST-1,sp)
1534  0500               L362:
1537  0500 7b01          	ld	a,(OFST-1,sp)
1538  0502 1103          	cp	a,(OFST+1,sp)
1539  0504 25b6          	jrult	L752
1540                     ; 321 }
1543  0506 5b03          	addw	sp,#3
1544  0508 81            	ret	
1569                     ; 325 void LT8900_Test(void)
1569                     ; 326 {
1570                     	switch	.text
1571  0509               _LT8900_Test:
1575                     ; 327 	TxData[0] = 5;
1577  0509 35050068      	mov	_TxData,#5
1578                     ; 328 	TxData[1] = 166;
1580  050d 35a60069      	mov	_TxData+1,#166
1581                     ; 329 	TxData[2] = 70;
1583  0511 3546006a      	mov	_TxData+2,#70
1584                     ; 330 	TxData[3] = 4;
1586  0515 3504006b      	mov	_TxData+3,#4
1587                     ; 331 	TxData[4] = 2;
1589  0519 3502006c      	mov	_TxData+4,#2
1590                     ; 332   TxData[5] = 1;
1592  051d 3501006d      	mov	_TxData+5,#1
1593                     ; 333 	if (TxData[4] == 2) TxData[4] = 6;
1595  0521 3506006c      	mov	_TxData+4,#6
1596                     ; 335 	 TxData[5]++;
1598                     ; 336 	 LT8900_sendPacket(TxData, 6);
1600  0525 4b06          	push	#6
1601  0527 725c006d      	inc	_TxData+5
1602  052b ae0068        	ldw	x,#_TxData
1603  052e cd0000        	call	_LT8900_sendPacket
1605  0531 84            	pop	a
1606                     ; 337 }
1609  0532 81            	ret	
1638                     ; 340 void AD_Schedule(void)
1638                     ; 341 {
1639                     	switch	.text
1640  0533               _AD_Schedule:
1644                     ; 342 	if (AD_Trigger_Timer < 500)
1646  0533 ce0000        	ldw	x,_AD_Trigger_Timer
1647  0536 a301f4        	cpw	x,#500
1648  0539 2416          	jruge	L323
1649                     ; 344 		Status_Disp_EN = FALSE;
1651  053b 725f0040      	clr	_Status_Disp_EN
1652                     ; 345 		GPIO_WriteLow(STATUS_2_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_2_PIN);
1654  053f 4b01          	push	#1
1655  0541 ae500f        	ldw	x,#20495
1656  0544 cd0000        	call	_GPIO_WriteLow
1658  0547 84            	pop	a
1659                     ; 346 		GPIO_WriteLow(STATUS_3_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_3_PIN);
1661  0548 4b04          	push	#4
1662  054a ae500f        	ldw	x,#20495
1663  054d cd0000        	call	_GPIO_WriteLow
1665  0550 84            	pop	a
1666  0551               L323:
1667                     ; 348 	if (AD_Trigger_Timer == 0)
1669  0551 ce0000        	ldw	x,_AD_Trigger_Timer
1670  0554 2603          	jrne	L523
1671                     ; 350 		ADC_Start();
1673  0556 cd0000        	call	_ADC_Start
1675  0559               L523:
1676                     ; 353 	if (ADC_CheckState())
1678  0559 cd0000        	call	_ADC_CheckState
1680  055c 4d            	tnz	a
1681  055d 270a          	jreq	L723
1682                     ; 356 			ClrBit(Main_State,MAINSTATE_AD);
1684  055f 72130081      	bres	_Main_State,#1
1685                     ; 357 			AD_Trigger_Timer = AD_CAPT_DELAY_MS;
1687  0563 ae1388        	ldw	x,#5000
1688  0566 cf0000        	ldw	_AD_Trigger_Timer,x
1689  0569               L723:
1690                     ; 359 }
1693  0569 81            	ret	
1729                     ; 363 void LED_CheckNewRemote(void)
1729                     ; 364 {
1730                     	switch	.text
1731  056a               _LED_CheckNewRemote:
1733  056a 88            	push	a
1734       00000001      OFST:	set	1
1737                     ; 366 	if (RF_RX_MI_NewRemote)
1739  056b c60000        	ld	a,_RF_RX_MI_NewRemote
1740  056e 2726          	jreq	L543
1741                     ; 369 		EE_Store_Config();
1743  0570 cd013f        	call	_EE_Store_Config
1745                     ; 370 		for (i=0;i<4;i++)
1747  0573 4f            	clr	a
1748  0574 6b01          	ld	(OFST+0,sp),a
1750  0576               L743:
1751                     ; 372 			RF_RX_LED_GroupEnabled[i] = FALSE;
1753  0576 5f            	clrw	x
1754  0577 97            	ld	xl,a
1755  0578 724f0000      	clr	(_RF_RX_LED_GroupEnabled,x)
1756                     ; 370 		for (i=0;i<4;i++)
1758  057c 0c01          	inc	(OFST+0,sp)
1762  057e 7b01          	ld	a,(OFST+0,sp)
1763  0580 a104          	cp	a,#4
1764  0582 25f2          	jrult	L743
1765                     ; 374 		Light_Flash(5, 200, 200, LED_FLASH_BRIGHTNESS);
1767  0584 4b1e          	push	#30
1768  0586 ae00c8        	ldw	x,#200
1769  0589 89            	pushw	x
1770  058a 89            	pushw	x
1771  058b a605          	ld	a,#5
1772  058d cd04b6        	call	_Light_Flash
1774  0590 5b05          	addw	sp,#5
1775                     ; 375 		RF_RX_MI_NewRemote = FALSE;
1777  0592 725f0000      	clr	_RF_RX_MI_NewRemote
1778  0596               L543:
1779                     ; 377 }
1782  0596 84            	pop	a
1783  0597 81            	ret	
1822                     ; 379 uint8_t Motion_Parse(void)
1822                     ; 380 {
1823                     	switch	.text
1824  0598               _Motion_Parse:
1826  0598 88            	push	a
1827       00000001      OFST:	set	1
1830                     ; 381 	uint8_t Out=0;
1832  0599 0f01          	clr	(OFST+0,sp)
1834                     ; 385 	if(PIR_Motion && (PIR_Conf_Timer==0)) { Out = 1; RF_TX_MotionIR=TRUE; }
1836  059b 725d0079      	tnz	_PIR_Motion
1837  059f 270d          	jreq	L173
1839  05a1 ce0076        	ldw	x,_PIR_Conf_Timer
1840  05a4 2608          	jrne	L173
1843  05a6 a601          	ld	a,#1
1844  05a8 6b01          	ld	(OFST+0,sp),a
1848  05aa 35010042      	mov	_RF_TX_MotionIR,#1
1849  05ae               L173:
1850                     ; 386 	if(RADAR_Motion && (RADAR_Conf_Timer==0)) { Out = Out+2; RF_TX_MotionRadar = TRUE;}
1852  05ae 725d0078      	tnz	_RADAR_Motion
1853  05b2 270d          	jreq	L373
1855  05b4 ce0074        	ldw	x,_RADAR_Conf_Timer
1856  05b7 2608          	jrne	L373
1859  05b9 0c01          	inc	(OFST+0,sp)
1860  05bb 0c01          	inc	(OFST+0,sp)
1864  05bd 35010041      	mov	_RF_TX_MotionRadar,#1
1865  05c1               L373:
1866                     ; 387 	if(RF_RX_Motion)	Out = Out+4;
1871                     ; 388 }
1874  05c1 84            	pop	a
1875  05c2 81            	ret	
1922                     ; 392 void LED_ChekMotion(void)
1922                     ; 393 {
1923                     	switch	.text
1924  05c3               _LED_ChekMotion:
1926  05c3 5205          	subw	sp,#5
1927       00000005      OFST:	set	5
1930                     ; 396 	for (i=0;i<4;i++)													// If Motion Activation is off for the group, Reset Motion Request Flags.
1932  05c5 4f            	clr	a
1933  05c6 6b05          	ld	(OFST+0,sp),a
1935  05c8               L514:
1936                     ; 398 		if (!RF_RX_LED_MotionAct[i]) LED_MotionReq[i] = FALSE;
1938  05c8 cd067c        	call	LC003
1939  05cb 2606          	jrne	L324
1942  05cd 5f            	clrw	x
1943  05ce 97            	ld	xl,a
1944  05cf 724f0064      	clr	(_LED_MotionReq,x)
1945  05d3               L324:
1946                     ; 396 	for (i=0;i<4;i++)													// If Motion Activation is off for the group, Reset Motion Request Flags.
1948  05d3 0c05          	inc	(OFST+0,sp)
1952  05d5 7b05          	ld	a,(OFST+0,sp)
1953  05d7 a104          	cp	a,#4
1954  05d9 25ed          	jrult	L514
1955                     ; 401 	if (Motion_Parse()!=0)
1957  05db adbb          	call	_Motion_Parse
1959  05dd 4d            	tnz	a
1960  05de 2731          	jreq	L524
1961                     ; 403 		LastMotion_Uptime = Uptime;
1963  05e0 ce0002        	ldw	x,_Uptime+2
1964  05e3 cf0072        	ldw	_LastMotion_Uptime+2,x
1965  05e6 ce0000        	ldw	x,_Uptime
1966  05e9 cf0070        	ldw	_LastMotion_Uptime,x
1967                     ; 404 		for (i=0;i<4;i++)
1969  05ec 4f            	clr	a
1970  05ed 6b05          	ld	(OFST+0,sp),a
1972  05ef               L724:
1973                     ; 406 			if (RF_RX_LED_MotionAct[i]){ RF_RX_LED_GroupEnabled[i] = TRUE;																// turn on groups with motion control activated
1975  05ef cd067c        	call	LC003
1976  05f2 2710          	jreq	L534
1979  05f4 5f            	clrw	x
1980  05f5 97            	ld	xl,a
1981  05f6 a601          	ld	a,#1
1982  05f8 d70000        	ld	(_RF_RX_LED_GroupEnabled,x),a
1983                     ; 407 			LED_MotionReq[i] = TRUE;		}																																// set flag that group is on by motion detect
1985  05fb 5f            	clrw	x
1986  05fc 7b05          	ld	a,(OFST+0,sp)
1987  05fe 97            	ld	xl,a
1988  05ff a601          	ld	a,#1
1989  0601 d70064        	ld	(_LED_MotionReq,x),a
1990  0604               L534:
1991                     ; 404 		for (i=0;i<4;i++)
1993  0604 0c05          	inc	(OFST+0,sp)
1997  0606 7b05          	ld	a,(OFST+0,sp)
1998  0608 a104          	cp	a,#4
1999  060a 25e3          	jrult	L724
2000                     ; 409 		Serial_Send_PWM_MotionDet(255);
2002  060c a6ff          	ld	a,#255
2003  060e cd0000        	call	_Serial_Send_PWM_MotionDet
2005  0611               L524:
2006                     ; 411 	if (Uptime >= LastMotion_Uptime) TimeFromLastMotion = Uptime - LastMotion_Uptime;								// Normal Time Calculation
2008  0611 ae0000        	ldw	x,#_Uptime
2009  0614 ad6d          	call	LC004
2011  0616 ae0000        	ldw	x,#_Uptime
2012  0619 250b          	jrult	L734
2015  061b cd0000        	call	c_ltor
2017  061e ae0070        	ldw	x,#_LastMotion_Uptime
2018  0621 cd0000        	call	c_lsub
2023  0624 2017          	jp	LC002
2024  0626               L734:
2025                     ; 412 	else if (Uptime < LastMotion_Uptime) TimeFromLastMotion = U32_MAX - LastMotion_Uptime + Uptime;	// If Uptime Overflowed
2027  0626 ad5b          	call	LC004
2029  0628 2418          	jruge	L144
2032  062a aeffff        	ldw	x,#65535
2033  062d bf02          	ldw	c_lreg+2,x
2034  062f bf00          	ldw	c_lreg,x
2035  0631 ae0070        	ldw	x,#_LastMotion_Uptime
2036  0634 cd0000        	call	c_lsub
2038  0637 ae0000        	ldw	x,#_Uptime
2039  063a cd0000        	call	c_ladd
2041  063d               LC002:
2042  063d 96            	ldw	x,sp
2043  063e 5c            	incw	x
2044  063f cd0000        	call	c_rtol
2047  0642               L144:
2048                     ; 413 	if (TimeFromLastMotion > (Conf_LED_TurnOff_Delay_S*1000))																				// Turn off LEDS after delay time
2050  0642 ce007c        	ldw	x,_Conf_LED_TurnOff_Delay_S
2051  0645 90ae03e8      	ldw	y,#1000
2052  0649 cd0000        	call	c_imul
2054  064c cd0000        	call	c_uitolx
2056  064f 96            	ldw	x,sp
2057  0650 5c            	incw	x
2058  0651 cd0000        	call	c_lcmp
2060  0654 2423          	jruge	L544
2061                     ; 415 		for (i=0;i<4;i++)
2063  0656 4f            	clr	a
2064  0657 6b05          	ld	(OFST+0,sp),a
2066  0659               L744:
2067                     ; 417 			if (RF_RX_LED_MotionAct[i] && LED_MotionReq[i])
2069  0659 ad21          	call	LC003
2070  065b 2714          	jreq	L554
2072  065d 5f            	clrw	x
2073  065e 97            	ld	xl,a
2074  065f 724d0064      	tnz	(_LED_MotionReq,x)
2075  0663 270c          	jreq	L554
2076                     ; 419 				RF_RX_LED_GroupEnabled[i] = FALSE;
2078  0665 5f            	clrw	x
2079  0666 97            	ld	xl,a
2080  0667 724f0000      	clr	(_RF_RX_LED_GroupEnabled,x)
2081                     ; 420 				LED_MotionReq[i] = FALSE;
2083  066b 5f            	clrw	x
2084  066c 97            	ld	xl,a
2085  066d 724f0064      	clr	(_LED_MotionReq,x)
2086  0671               L554:
2087                     ; 415 		for (i=0;i<4;i++)
2089  0671 0c05          	inc	(OFST+0,sp)
2093  0673 7b05          	ld	a,(OFST+0,sp)
2094  0675 a104          	cp	a,#4
2095  0677 25e0          	jrult	L744
2096  0679               L544:
2097                     ; 424 }
2100  0679 5b05          	addw	sp,#5
2101  067b 81            	ret	
2102  067c               LC003:
2103  067c 5f            	clrw	x
2104  067d 97            	ld	xl,a
2105  067e 724d0000      	tnz	(_RF_RX_LED_MotionAct,x)
2106  0682 81            	ret	
2107  0683               LC004:
2108  0683 cd0000        	call	c_ltor
2110  0686 ae0070        	ldw	x,#_LastMotion_Uptime
2111  0689 cc0000        	jp	c_lcmp
2197                     ; 427 	void LED_Schedule(void)
2197                     ; 428 	{
2198                     	switch	.text
2199  068c               _LED_Schedule:
2201  068c 5203          	subw	sp,#3
2202       00000003      OFST:	set	3
2205                     ; 431 		bool LED_Update = FALSE;
2207  068e 0f02          	clr	(OFST-1,sp)
2209                     ; 432 		if (LED_Fade_Timer == 0)
2211  0690 ce0000        	ldw	x,_LED_Fade_Timer
2212  0693 2703cc08a6    	jrne	L115
2213                     ; 434 			LED_ChekMotion();
2215  0698 cd05c3        	call	_LED_ChekMotion
2217                     ; 435 			LED_CheckNewRemote();
2219  069b cd056a        	call	_LED_CheckNewRemote
2221                     ; 436 			for (i=0;i<4;i++)
2223  069e 4f            	clr	a
2224  069f 6b03          	ld	(OFST+0,sp),a
2226  06a1               L315:
2227                     ; 438 				if (RF_RX_LED_GroupEnabled[i])
2229  06a1 5f            	clrw	x
2230  06a2 97            	ld	xl,a
2231  06a3 724d0000      	tnz	(_RF_RX_LED_GroupEnabled,x)
2232  06a7 2603cc0800    	jreq	L125
2233                     ; 440 					if (RF_RX_LED_NightMode[i])
2235  06ac 5f            	clrw	x
2236  06ad 97            	ld	xl,a
2237  06ae 724d0000      	tnz	(_RF_RX_LED_NightMode,x)
2238  06b2 2738          	jreq	L325
2239                     ; 442 						if (LED_Act_CW[i] != Conf_LED_NightMode_Brightness)	{ LED_Act_CW[i] = Conf_LED_NightMode_Brightness; LED_Update = TRUE;}
2241  06b4 5f            	clrw	x
2242  06b5 97            	ld	xl,a
2243  06b6 d6002c        	ld	a,(_LED_Act_CW,x)
2244  06b9 c1007a        	cp	a,_Conf_LED_NightMode_Brightness
2245  06bc 270e          	jreq	L525
2248  06be 7b03          	ld	a,(OFST+0,sp)
2249  06c0 5f            	clrw	x
2250  06c1 97            	ld	xl,a
2251  06c2 c6007a        	ld	a,_Conf_LED_NightMode_Brightness
2252  06c5 d7002c        	ld	(_LED_Act_CW,x),a
2255  06c8 a601          	ld	a,#1
2256  06ca 6b02          	ld	(OFST-1,sp),a
2258  06cc               L525:
2259                     ; 443 						if (LED_Act_WW[i] != Conf_LED_NightMode_Brightness) { LED_Act_WW[i] = Conf_LED_NightMode_Brightness; LED_Update = TRUE;}
2261  06cc 7b03          	ld	a,(OFST+0,sp)
2262  06ce 5f            	clrw	x
2263  06cf 97            	ld	xl,a
2264  06d0 d60028        	ld	a,(_LED_Act_WW,x)
2265  06d3 c1007a        	cp	a,_Conf_LED_NightMode_Brightness
2266  06d6 2603cc089b    	jreq	L755
2269  06db 7b03          	ld	a,(OFST+0,sp)
2270  06dd 5f            	clrw	x
2271  06de 97            	ld	xl,a
2272  06df c6007a        	ld	a,_Conf_LED_NightMode_Brightness
2273  06e2 d70028        	ld	(_LED_Act_WW,x),a
2276  06e5 a601          	ld	a,#1
2277  06e7 6b02          	ld	(OFST-1,sp),a
2279  06e9 cc089b        	jra	L755
2280  06ec               L325:
2281                     ; 447 						if(!bitRead(Main_Config, MAINCONFIG_FADEE))
2283  06ec cd08ee        	call	LC010
2284  06ef 263d          	jrne	L335
2285                     ; 449 							if(LED_Act_CW[i] != LED_Target_CW[i]) {LED_Act_CW[i] = LED_Target_CW[i]; LED_Update = TRUE;}
2287  06f1 7b03          	ld	a,(OFST+0,sp)
2288  06f3 cd08d2        	call	LC008
2289  06f6 270e          	jreq	L535
2292  06f8 7b03          	ld	a,(OFST+0,sp)
2293  06fa 5f            	clrw	x
2294  06fb 97            	ld	xl,a
2295  06fc d6003c        	ld	a,(_LED_Target_CW,x)
2296  06ff d7002c        	ld	(_LED_Act_CW,x),a
2299  0702 a601          	ld	a,#1
2300  0704 6b02          	ld	(OFST-1,sp),a
2302  0706               L535:
2303                     ; 450 							if(LED_Act_WW[i] != LED_Target_WW[i]) {LED_Act_WW[i] = LED_Target_WW[i]; LED_Update = TRUE;}
2305  0706 7b03          	ld	a,(OFST+0,sp)
2306  0708 cd08e0        	call	LC009
2307  070b 270e          	jreq	L735
2310  070d 7b03          	ld	a,(OFST+0,sp)
2311  070f 5f            	clrw	x
2312  0710 97            	ld	xl,a
2313  0711 d60038        	ld	a,(_LED_Target_WW,x)
2314  0714 d70028        	ld	(_LED_Act_WW,x),a
2317  0717 a601          	ld	a,#1
2318  0719 6b02          	ld	(OFST-1,sp),a
2320  071b               L735:
2321                     ; 451 							LED_LastSaved_CW[i] = LED_Target_CW[i];
2323  071b 7b03          	ld	a,(OFST+0,sp)
2324  071d cd0901        	call	LC012
2325  0720 7b03          	ld	a,(OFST+0,sp)
2326  0722 97            	ld	xl,a
2327  0723 d60038        	ld	a,(_LED_Target_WW,x)
2328  0726 d70030        	ld	(_LED_LastSaved_WW,x),a
2329                     ; 453 							AtTarget = 255;
2331  0729 a6ff          	ld	a,#255
2333  072b cc0899        	jp	LC005
2334  072e               L335:
2335                     ; 457 							if (LED_Act_CW[i] < LED_Target_CW[i]) { LED_Act_CW[i]++; LED_Update = TRUE; ClrBit(AtTarget, i);}
2337  072e 7b03          	ld	a,(OFST+0,sp)
2338  0730 cd08d2        	call	LC008
2339  0733 241c          	jruge	L345
2342  0735 7b03          	ld	a,(OFST+0,sp)
2343  0737 cd08cd        	call	LC007
2344  073a 724c002c      	inc	(_LED_Act_CW,x)
2345  073e 6b02          	ld	(OFST-1,sp),a
2349  0740 5f            	clrw	x
2350  0741 7b03          	ld	a,(OFST+0,sp)
2351  0743 cd08fc        	call	LC011
2352  0746 2704          	jreq	L243
2353  0748               L443:
2354  0748 48            	sll	a
2355  0749 5a            	decw	x
2356  074a 26fc          	jrne	L443
2357  074c               L243:
2358  074c 43            	cpl	a
2359  074d 1401          	and	a,(OFST-2,sp)
2360  074f 6b01          	ld	(OFST-2,sp),a
2362  0751               L345:
2363                     ; 458 							if (LED_Act_CW[i] > LED_Target_CW[i]) { LED_Act_CW[i]--; LED_Update = TRUE; ClrBit(AtTarget, i);}
2365  0751 7b03          	ld	a,(OFST+0,sp)
2366  0753 cd08d2        	call	LC008
2367  0756 231c          	jrule	L545
2370  0758 7b03          	ld	a,(OFST+0,sp)
2371  075a cd08cd        	call	LC007
2372  075d 724a002c      	dec	(_LED_Act_CW,x)
2373  0761 6b02          	ld	(OFST-1,sp),a
2377  0763 5f            	clrw	x
2378  0764 7b03          	ld	a,(OFST+0,sp)
2379  0766 cd08fc        	call	LC011
2380  0769 2704          	jreq	L643
2381  076b               L053:
2382  076b 48            	sll	a
2383  076c 5a            	decw	x
2384  076d 26fc          	jrne	L053
2385  076f               L643:
2386  076f 43            	cpl	a
2387  0770 1401          	and	a,(OFST-2,sp)
2388  0772 6b01          	ld	(OFST-2,sp),a
2390  0774               L545:
2391                     ; 459 							if (LED_Act_CW[i] == LED_Target_CW[i]) { LED_LastSaved_CW[i] = LED_Target_CW[i]; SetBit(AtTarget, i);}
2393  0774 7b03          	ld	a,(OFST+0,sp)
2394  0776 cd08d2        	call	LC008
2395  0779 2614          	jrne	L745
2398  077b 7b03          	ld	a,(OFST+0,sp)
2399  077d cd0901        	call	LC012
2400  0780 7b03          	ld	a,(OFST+0,sp)
2401  0782 cd08fc        	call	LC011
2402  0785 2704          	jreq	L253
2403  0787               L453:
2404  0787 48            	sll	a
2405  0788 5a            	decw	x
2406  0789 26fc          	jrne	L453
2407  078b               L253:
2408  078b 1a01          	or	a,(OFST-2,sp)
2409  078d 6b01          	ld	(OFST-2,sp),a
2411  078f               L745:
2412                     ; 460 							if (LED_Act_WW[i] < LED_Target_WW[i]) { LED_Act_WW[i]++; LED_Update = TRUE; ClrBit(AtTarget, i+4);}
2414  078f 7b03          	ld	a,(OFST+0,sp)
2415  0791 cd08e0        	call	LC009
2416  0794 241e          	jruge	L155
2419  0796 7b03          	ld	a,(OFST+0,sp)
2420  0798 cd08cd        	call	LC007
2421  079b 724c0028      	inc	(_LED_Act_WW,x)
2422  079f 6b02          	ld	(OFST-1,sp),a
2426  07a1 7b03          	ld	a,(OFST+0,sp)
2427  07a3 ab04          	add	a,#4
2428  07a5 cd08cd        	call	LC007
2429  07a8 5d            	tnzw	x
2430  07a9 2704          	jreq	L653
2431  07ab               L063:
2432  07ab 48            	sll	a
2433  07ac 5a            	decw	x
2434  07ad 26fc          	jrne	L063
2435  07af               L653:
2436  07af 43            	cpl	a
2437  07b0 1401          	and	a,(OFST-2,sp)
2438  07b2 6b01          	ld	(OFST-2,sp),a
2440  07b4               L155:
2441                     ; 461 							if (LED_Act_WW[i] > LED_Target_WW[i]) { LED_Act_WW[i]--; LED_Update = TRUE; ClrBit(AtTarget, i+4);}
2443  07b4 7b03          	ld	a,(OFST+0,sp)
2444  07b6 cd08e0        	call	LC009
2445  07b9 231e          	jrule	L355
2448  07bb 7b03          	ld	a,(OFST+0,sp)
2449  07bd cd08cd        	call	LC007
2450  07c0 724a0028      	dec	(_LED_Act_WW,x)
2451  07c4 6b02          	ld	(OFST-1,sp),a
2455  07c6 7b03          	ld	a,(OFST+0,sp)
2456  07c8 ab04          	add	a,#4
2457  07ca cd08cd        	call	LC007
2458  07cd 5d            	tnzw	x
2459  07ce 2704          	jreq	L263
2460  07d0               L463:
2461  07d0 48            	sll	a
2462  07d1 5a            	decw	x
2463  07d2 26fc          	jrne	L463
2464  07d4               L263:
2465  07d4 43            	cpl	a
2466  07d5 1401          	and	a,(OFST-2,sp)
2467  07d7 6b01          	ld	(OFST-2,sp),a
2469  07d9               L355:
2470                     ; 462 							if (LED_Act_WW[i] == LED_Target_WW[i]) { LED_LastSaved_WW[i] = LED_Target_WW[i]; SetBit(AtTarget, i+4);}
2472  07d9 7b03          	ld	a,(OFST+0,sp)
2473  07db cd08e0        	call	LC009
2474  07de 2703cc089b    	jrne	L755
2477  07e3 7b03          	ld	a,(OFST+0,sp)
2478  07e5 5f            	clrw	x
2479  07e6 97            	ld	xl,a
2480  07e7 d60038        	ld	a,(_LED_Target_WW,x)
2481  07ea d70030        	ld	(_LED_LastSaved_WW,x),a
2484  07ed 7b03          	ld	a,(OFST+0,sp)
2485  07ef ab04          	add	a,#4
2486  07f1 cd08cd        	call	LC007
2487  07f4 5d            	tnzw	x
2488  07f5 2704          	jreq	L663
2489  07f7               L073:
2490  07f7 48            	sll	a
2491  07f8 5a            	decw	x
2492  07f9 26fc          	jrne	L073
2493  07fb               L663:
2494  07fb 1a01          	or	a,(OFST-2,sp)
2495  07fd cc0899        	jp	LC005
2496  0800               L125:
2497                     ; 465 				} else if (!RF_RX_LED_GroupEnabled[i])			// If group is turned off, do not save targets and go to OFF
2499  0800 5f            	clrw	x
2500  0801 97            	ld	xl,a
2501  0802 724d0000      	tnz	(_RF_RX_LED_GroupEnabled,x)
2502  0806 26d8          	jrne	L755
2503                     ; 467 					if(!bitRead(Main_Config, MAINCONFIG_FADEE))
2505  0808 cd08ee        	call	LC010
2506  080b 2647          	jrne	L365
2507                     ; 469 						if (LED_Act_CW[i] != 0) {LED_Act_CW[i] = 0; LED_Update = TRUE; ClrBit(AtTarget, i);}
2509  080d 7b03          	ld	a,(OFST+0,sp)
2510  080f 5f            	clrw	x
2511  0810 97            	ld	xl,a
2512  0811 724d002c      	tnz	(_LED_Act_CW,x)
2513  0815 271c          	jreq	L565
2516  0817 cd08cd        	call	LC007
2517  081a 724f002c      	clr	(_LED_Act_CW,x)
2518  081e 6b02          	ld	(OFST-1,sp),a
2522  0820 5f            	clrw	x
2523  0821 7b03          	ld	a,(OFST+0,sp)
2524  0823 cd08fc        	call	LC011
2525  0826 2704          	jreq	L273
2526  0828               L473:
2527  0828 48            	sll	a
2528  0829 5a            	decw	x
2529  082a 26fc          	jrne	L473
2530  082c               L273:
2531  082c 43            	cpl	a
2532  082d 1401          	and	a,(OFST-2,sp)
2533  082f 6b01          	ld	(OFST-2,sp),a
2535  0831 7b03          	ld	a,(OFST+0,sp)
2536  0833               L565:
2537                     ; 470 						if (LED_Act_WW[i] != 0) {LED_Act_WW[i] = 0; LED_Update = TRUE; ClrBit(AtTarget, i+4);}
2539  0833 5f            	clrw	x
2540  0834 97            	ld	xl,a
2541  0835 724d0028      	tnz	(_LED_Act_WW,x)
2542  0839 2760          	jreq	L755
2545  083b cd08cd        	call	LC007
2546  083e 724f0028      	clr	(_LED_Act_WW,x)
2547  0842 6b02          	ld	(OFST-1,sp),a
2551  0844 7b03          	ld	a,(OFST+0,sp)
2552  0846 ab04          	add	a,#4
2553  0848 cd08cd        	call	LC007
2554  084b 5d            	tnzw	x
2555  084c 2748          	jreq	L604
2556  084e               L004:
2557  084e 48            	sll	a
2558  084f 5a            	decw	x
2559  0850 26fc          	jrne	L004
2560  0852 2042          	jp	L604
2561  0854               L365:
2562                     ; 473 						if (LED_Act_CW[i] != 0) {LED_Act_CW[i]--; LED_Update = TRUE; ClrBit(AtTarget, i);}
2564  0854 7b03          	ld	a,(OFST+0,sp)
2565  0856 5f            	clrw	x
2566  0857 97            	ld	xl,a
2567  0858 724d002c      	tnz	(_LED_Act_CW,x)
2568  085c 271b          	jreq	L375
2571  085e ad6d          	call	LC007
2572  0860 724a002c      	dec	(_LED_Act_CW,x)
2573  0864 6b02          	ld	(OFST-1,sp),a
2577  0866 5f            	clrw	x
2578  0867 7b03          	ld	a,(OFST+0,sp)
2579  0869 cd08fc        	call	LC011
2580  086c 2704          	jreq	L204
2581  086e               L404:
2582  086e 48            	sll	a
2583  086f 5a            	decw	x
2584  0870 26fc          	jrne	L404
2585  0872               L204:
2586  0872 43            	cpl	a
2587  0873 1401          	and	a,(OFST-2,sp)
2588  0875 6b01          	ld	(OFST-2,sp),a
2590  0877 7b03          	ld	a,(OFST+0,sp)
2591  0879               L375:
2592                     ; 474 						if (LED_Act_WW[i] != 0) {LED_Act_WW[i]--; LED_Update = TRUE; ClrBit(AtTarget, i+4);}
2594  0879 5f            	clrw	x
2595  087a 97            	ld	xl,a
2596  087b 724d0028      	tnz	(_LED_Act_WW,x)
2597  087f 271a          	jreq	L755
2600  0881 ad4a          	call	LC007
2601  0883 724a0028      	dec	(_LED_Act_WW,x)
2602  0887 6b02          	ld	(OFST-1,sp),a
2606  0889 7b03          	ld	a,(OFST+0,sp)
2607  088b ab04          	add	a,#4
2608  088d ad3e          	call	LC007
2609  088f 5d            	tnzw	x
2610  0890 2704          	jreq	L604
2611  0892               L014:
2612  0892 48            	sll	a
2613  0893 5a            	decw	x
2614  0894 26fc          	jrne	L014
2615  0896               L604:
2616  0896 43            	cpl	a
2617  0897 1401          	and	a,(OFST-2,sp)
2618  0899               LC005:
2619  0899 6b01          	ld	(OFST-2,sp),a
2621  089b               L755:
2622                     ; 436 			for (i=0;i<4;i++)
2624  089b 0c03          	inc	(OFST+0,sp)
2628  089d 7b03          	ld	a,(OFST+0,sp)
2629  089f a104          	cp	a,#4
2630  08a1 2403cc06a1    	jrult	L315
2631  08a6               L115:
2632                     ; 479 		if (LED_Update)										//send stream only if there was an update
2634  08a6 7b02          	ld	a,(OFST-1,sp)
2635  08a8 270f          	jreq	L775
2636                     ; 481 			WS2811_Load_Stream();
2638  08aa cd039e        	call	_WS2811_Load_Stream
2640                     ; 483 			LED_Fade_Timer = Conf_LED_Fade_Delay;
2642  08ad c6007e        	ld	a,_Conf_LED_Fade_Delay
2643  08b0 5f            	clrw	x
2644  08b1 97            	ld	xl,a
2645  08b2 cf0000        	ldw	_LED_Fade_Timer,x
2646                     ; 484 			LED_Was_Updated = TRUE;
2648  08b5 35010043      	mov	_LED_Was_Updated,#1
2649                     ; 485 			LED_Update = FALSE;
2651  08b9               L775:
2652                     ; 487 		if ((AtTarget==255) && LED_Was_Updated)
2654  08b9 7b01          	ld	a,(OFST-2,sp)
2655  08bb 4c            	inc	a
2656  08bc 260c          	jrne	L106
2658  08be c60043        	ld	a,_LED_Was_Updated
2659  08c1 2707          	jreq	L106
2660                     ; 490 			Save_Targets();
2662  08c3 cd007a        	call	_Save_Targets
2664                     ; 491 			LED_Was_Updated = FALSE;
2666  08c6 725f0043      	clr	_LED_Was_Updated
2667  08ca               L106:
2668                     ; 493 	}
2671  08ca 5b03          	addw	sp,#3
2672  08cc 81            	ret	
2673  08cd               LC007:
2674  08cd 5f            	clrw	x
2675  08ce 97            	ld	xl,a
2676  08cf a601          	ld	a,#1
2677  08d1 81            	ret	
2678  08d2               LC008:
2679  08d2 5f            	clrw	x
2680  08d3 97            	ld	xl,a
2681  08d4 905f          	clrw	y
2682  08d6 9097          	ld	yl,a
2683  08d8 90d6002c      	ld	a,(_LED_Act_CW,y)
2684  08dc d1003c        	cp	a,(_LED_Target_CW,x)
2685  08df 81            	ret	
2686  08e0               LC009:
2687  08e0 5f            	clrw	x
2688  08e1 97            	ld	xl,a
2689  08e2 905f          	clrw	y
2690  08e4 9097          	ld	yl,a
2691  08e6 90d60028      	ld	a,(_LED_Act_WW,y)
2692  08ea d10038        	cp	a,(_LED_Target_WW,x)
2693  08ed 81            	ret	
2694  08ee               LC010:
2695  08ee ce007f        	ldw	x,_Main_Config
2696  08f1 54            	srlw	x
2697  08f2 54            	srlw	x
2698  08f3 54            	srlw	x
2699  08f4 54            	srlw	x
2700  08f5 01            	rrwa	x,a
2701  08f6 a401          	and	a,#1
2702  08f8 5f            	clrw	x
2703  08f9 97            	ld	xl,a
2704  08fa 5d            	tnzw	x
2705  08fb 81            	ret	
2706  08fc               LC011:
2707  08fc 97            	ld	xl,a
2708  08fd a601          	ld	a,#1
2709  08ff 5d            	tnzw	x
2710  0900 81            	ret	
2711  0901               LC012:
2712  0901 5f            	clrw	x
2713  0902 97            	ld	xl,a
2714  0903 d6003c        	ld	a,(_LED_Target_CW,x)
2715  0906 d70034        	ld	(_LED_LastSaved_CW,x),a
2716                     ; 459 							if (LED_Act_CW[i] == LED_Target_CW[i]) { LED_LastSaved_CW[i] = LED_Target_CW[i]; SetBit(AtTarget, i);}
2718  0909 5f            	clrw	x
2719  090a 81            	ret	
2753                     ; 495 void RF_Schedule(void)
2753                     ; 496 {
2754                     	switch	.text
2755  090b               _RF_Schedule:
2757  090b 88            	push	a
2758       00000001      OFST:	set	1
2761                     ; 498 	RX_Size = RF_RX_Handle();
2763  090c cd0000        	call	_RF_RX_Handle
2765                     ; 499 	RF_TX_Handle();
2767  090f cd0000        	call	_RF_TX_Handle
2769                     ; 500 }
2772  0912 84            	pop	a
2773  0913 81            	ret	
2800                     ; 502 void main(void)
2800                     ; 503 {
2801                     	switch	.text
2802  0914               _main:
2806                     ; 505 	StartUp();
2808  0914 cd0309        	call	_StartUp
2810  0917               L726:
2811                     ; 511 		 AD_Schedule();
2813  0917 cd0533        	call	_AD_Schedule
2815                     ; 512 		 LED_Schedule();
2817  091a cd068c        	call	_LED_Schedule
2819                     ; 513 		 RF_Schedule();
2821  091d adec          	call	_RF_Schedule
2824  091f 20f6          	jra	L726
3092                     	xdef	_main
3093                     	xdef	_RF_Schedule
3094                     	xdef	_LED_Schedule
3095                     	xdef	_LED_ChekMotion
3096                     	xdef	_Motion_Parse
3097                     	xdef	_LED_CheckNewRemote
3098                     	xdef	_AD_Schedule
3099                     	xdef	_LT8900_Test
3100                     	xdef	_Light_Flash
3101                     	xdef	_WS2811_Load_Stream
3102                     	xdef	_StartUp
3103                     	xdef	_EE_Read_Config
3104                     	xdef	_SetDefaults
3105                     	xdef	_Save_Targets
3106                     	xdef	_Init_GPIOS
3107                     	switch	.bss
3108  0000               _WS2811_2_Stream:
3109  0000 000000000000  	ds.b	20
3110                     	xdef	_WS2811_2_Stream
3111  0014               _WS2811_1_Stream:
3112  0014 000000000000  	ds.b	20
3113                     	xdef	_WS2811_1_Stream
3114  0028               _LED_Act_WW:
3115  0028 00000000      	ds.b	4
3116                     	xdef	_LED_Act_WW
3117  002c               _LED_Act_CW:
3118  002c 00000000      	ds.b	4
3119                     	xdef	_LED_Act_CW
3120  0030               _LED_LastSaved_WW:
3121  0030 00000000      	ds.b	4
3122                     	xdef	_LED_LastSaved_WW
3123  0034               _LED_LastSaved_CW:
3124  0034 00000000      	ds.b	4
3125                     	xdef	_LED_LastSaved_CW
3126  0038               _LED_Target_WW:
3127  0038 00000000      	ds.b	4
3128                     	xdef	_LED_Target_WW
3129  003c               _LED_Target_CW:
3130  003c 00000000      	ds.b	4
3131                     	xdef	_LED_Target_CW
3132  0040               _Status_Disp_EN:
3133  0040 00            	ds.b	1
3134                     	xdef	_Status_Disp_EN
3135  0041               _RF_TX_MotionRadar:
3136  0041 00            	ds.b	1
3137                     	xdef	_RF_TX_MotionRadar
3138  0042               _RF_TX_MotionIR:
3139  0042 00            	ds.b	1
3140                     	xdef	_RF_TX_MotionIR
3141  0043               _LED_Was_Updated:
3142  0043 00            	ds.b	1
3143                     	xdef	_LED_Was_Updated
3144  0044               _LEDGroup_Def_WW:
3145  0044 000000000000  	ds.b	16
3146                     	xdef	_LEDGroup_Def_WW
3147  0054               _LEDGroup_Def_CW:
3148  0054 000000000000  	ds.b	16
3149                     	xdef	_LEDGroup_Def_CW
3150  0064               _LED_MotionReq:
3151  0064 00000000      	ds.b	4
3152                     	xdef	_LED_MotionReq
3153                     	xref	_RF_RX_Motion
3154                     	xref	_RF_RX_LED_MotionAct
3155                     	xref	_RF_RX_LED_NightMode
3156                     	xref	_RF_RX_LED_GroupEnabled
3157                     	xref	_RF_TX_Timer
3158                     	xref	_RF_RX_MI_ValidAddress
3159                     	xref	_RF_RX_MI_NewRemote
3160  0068               _TxData:
3161  0068 000000000000  	ds.b	8
3162                     	xdef	_TxData
3163  0070               _LastMotion_Uptime:
3164  0070 00000000      	ds.b	4
3165                     	xdef	_LastMotion_Uptime
3166  0074               _RADAR_Conf_Timer:
3167  0074 0000          	ds.b	2
3168                     	xdef	_RADAR_Conf_Timer
3169  0076               _PIR_Conf_Timer:
3170  0076 0000          	ds.b	2
3171                     	xdef	_PIR_Conf_Timer
3172  0078               _RADAR_Motion:
3173  0078 00            	ds.b	1
3174                     	xdef	_RADAR_Motion
3175  0079               _PIR_Motion:
3176  0079 00            	ds.b	1
3177                     	xdef	_PIR_Motion
3178                     	xref	_AD_Trigger_Timer
3179                     	xref	_LED_Fade_Timer
3180                     	xref	_Uptime
3181  007a               _Conf_LED_NightMode_Brightness:
3182  007a 00            	ds.b	1
3183                     	xdef	_Conf_LED_NightMode_Brightness
3184  007b               _Conf_LED_Max_Brightness:
3185  007b 00            	ds.b	1
3186                     	xdef	_Conf_LED_Max_Brightness
3187  007c               _Conf_LED_TurnOff_Delay_S:
3188  007c 0000          	ds.b	2
3189                     	xdef	_Conf_LED_TurnOff_Delay_S
3190  007e               _Conf_LED_Fade_Delay:
3191  007e 00            	ds.b	1
3192                     	xdef	_Conf_LED_Fade_Delay
3193  007f               _Main_Config:
3194  007f 0000          	ds.b	2
3195                     	xdef	_Main_Config
3196  0081               _Main_State:
3197  0081 00            	ds.b	1
3198                     	xdef	_Main_State
3199                     	xdef	_EE_Store_Config
3200                     	xdef	_GR_WW_Set
3201                     	xdef	_GR_CW_Set
3202                     	xref	_Serial_Send_PWM_MotionDet
3203                     	xref	_RF_TX_Handle
3204                     	xref	_RF_RX_Handle
3205                     	xref	_RF_GetNodeID
3206                     	xref	_RF_SetNodeID
3207                     	xref	_ADC_Start
3208                     	xref	_ADC_CheckState
3209                     	xref	_ADC_Init
3210                     	xref	_WS2811_Gamma_Corr
3211                     	xref	_WS2811_2_Update_800K
3212                     	xref	_WS2811_1_Update_800K
3213                     	xref	_WS2811_Init
3214                     	xref	_EEPROM_Read4Byte
3215                     	xref	_EEPROM_Program4Byte
3216                     	xref	_EEPROM_Read2Byte
3217                     	xref	_EEPROM_Program2Byte
3218                     	xref	_EEPROM_ReadByte
3219                     	xref	_EEPROM_ProgramByte
3220                     	xref	_EEPROM_Config
3221                     	xref	_LT8900_softReset
3222                     	xref	_LT8900_sendPacket
3223                     	xref	_LT8900_startListening
3224                     	xref	_LT8900_setChannel
3225                     	xref	_LT8900_InitRegisters
3226                     	xref	_LT8900_Init
3227                     	xref	_Timer_Init
3228                     	xref	__delay_ms
3229                     	xref	_UART2_Cmd
3230                     	xref	_UART2_Init
3231                     	xref	_UART2_DeInit
3232                     	xref	_GPIO_WriteLow
3233                     	xref	_GPIO_WriteHigh
3234                     	xref	_GPIO_Init
3235                     	xref	_EXTI_SetExtIntSensitivity
3236                     	xref.b	c_lreg
3237                     	xref.b	c_x
3257                     	xref	c_uitolx
3258                     	xref	c_imul
3259                     	xref	c_ladd
3260                     	xref	c_lsub
3261                     	xref	c_lcmp
3262                     	xref	c_ltor
3263                     	xref	c_rtol
3264                     	end
