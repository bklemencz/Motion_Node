   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  19                     .const:	section	.text
  20  0000               L5_LookUpAllX:
  21  0000 0000          	dc.w	0
  22  0002 0032          	dc.w	50
  23  0004 0064          	dc.w	100
  24  0006 0096          	dc.w	150
  25  0008 00c8          	dc.w	200
  26  000a 00fa          	dc.w	250
  27  000c 012c          	dc.w	300
  28  000e 015e          	dc.w	350
  29  0010 0190          	dc.w	400
  30  0012 01c2          	dc.w	450
  31  0014 01f4          	dc.w	500
  32  0016 0226          	dc.w	550
  33  0018 0258          	dc.w	600
  34  001a 028a          	dc.w	650
  35  001c 02bc          	dc.w	700
  36  001e 02ee          	dc.w	750
  37  0020 0320          	dc.w	800
  38  0022 0352          	dc.w	850
  39  0024 0384          	dc.w	900
  40  0026 03b6          	dc.w	950
  41  0028 0400          	dc.w	1024
  42  002a               L7_LookUpLUXD50:
  43  002a 00            	dc.b	0
  44  002b 28            	dc.b	40
  45  002c 50            	dc.b	80
  46  002d 78            	dc.b	120
  47  002e 8c            	dc.b	140
  48  002f 96            	dc.b	150
  49  0030 a0            	dc.b	160
  50  0031 aa            	dc.b	170
  51  0032 af            	dc.b	175
  52  0033 b4            	dc.b	180
  53  0034 b9            	dc.b	185
  54  0035 be            	dc.b	190
  55  0036 c3            	dc.b	195
  56  0037 c8            	dc.b	200
  57  0038 cd            	dc.b	205
  58  0039 d2            	dc.b	210
  59  003a d7            	dc.b	215
  60  003b dc            	dc.b	220
  61  003c e1            	dc.b	225
  62  003d e6            	dc.b	230
  63  003e ff            	dc.b	255
  96                     ; 31 void ADC_Init(void)
  96                     ; 32 {
  98                     	switch	.text
  99  0000               _ADC_Init:
 103                     ; 33 	GPIO_Init(AD_GPIO_PORT,(GPIO_Pin_TypeDef)NTC_AD_PIN, GPIO_MODE_IN_FL_NO_IT);
 105  0000 4b00          	push	#0
 106  0002 4b01          	push	#1
 107  0004 ae5005        	ldw	x,#20485
 108  0007 cd0000        	call	_GPIO_Init
 110  000a 85            	popw	x
 111                     ; 34 	GPIO_Init(AD_GPIO_PORT,(GPIO_Pin_TypeDef)LDR_AD_PIN, GPIO_MODE_IN_FL_NO_IT);
 113  000b 4b00          	push	#0
 114  000d 4b02          	push	#2
 115  000f ae5005        	ldw	x,#20485
 116  0012 cd0000        	call	_GPIO_Init
 118  0015 85            	popw	x
 119                     ; 35 	GPIO_Init(AD_GPIO_PORT,(GPIO_Pin_TypeDef)GAS_AD_PIN, GPIO_MODE_IN_FL_NO_IT);
 121  0016 4b00          	push	#0
 122  0018 4b04          	push	#4
 123  001a ae5005        	ldw	x,#20485
 124  001d cd0000        	call	_GPIO_Init
 126  0020 85            	popw	x
 127                     ; 38 	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D4, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_ALL, DISABLE );
 129  0021 4b00          	push	#0
 130  0023 4bff          	push	#255
 131  0025 4b08          	push	#8
 132  0027 4b00          	push	#0
 133  0029 4b00          	push	#0
 134  002b 4b20          	push	#32
 135  002d ae0002        	ldw	x,#2
 136  0030 cd0000        	call	_ADC1_Init
 138  0033 5b06          	addw	sp,#6
 139                     ; 39 	ADC1_ScanModeCmd(ENABLE);
 141  0035 a601          	ld	a,#1
 142  0037 cd0000        	call	_ADC1_ScanModeCmd
 144                     ; 40 	ADC1_ITConfig(ADC1_IT_EOCIE, ENABLE);
 146  003a 4b01          	push	#1
 147  003c ae0020        	ldw	x,#32
 148  003f cd0000        	call	_ADC1_ITConfig
 150  0042 84            	pop	a
 151                     ; 41 }
 154  0043 81            	ret	
 208                     ; 43 uint8_t NTC_SteinHart(uint16_t reading)
 208                     ; 44 {
 209                     	switch	.text
 210  0044               _NTC_SteinHart:
 212  0044 5209          	subw	sp,#9
 213       00000009      OFST:	set	9
 216                     ; 48 	avg_res = NTC_SER_RES*((1023.0 / reading) - 1);
 218  0046 cd0000        	call	c_uitof
 220  0049 96            	ldw	x,sp
 221  004a 5c            	incw	x
 222  004b cd0000        	call	c_rtol
 225  004e ae0057        	ldw	x,#L55
 226  0051 cd0000        	call	c_ltor
 228  0054 96            	ldw	x,sp
 229  0055 5c            	incw	x
 230  0056 cd0000        	call	c_fdiv
 232  0059 ae0053        	ldw	x,#L56
 233  005c cd0000        	call	c_fsub
 235  005f ae004f        	ldw	x,#L57
 236  0062 cd0000        	call	c_fmul
 238  0065 96            	ldw	x,sp
 239  0066 1c0006        	addw	x,#OFST-3
 240  0069 cd0000        	call	c_rtol
 243                     ; 49 	steinhart = avg_res / NTC_R_NOM;     // (R/Ro)
 245  006c 96            	ldw	x,sp
 246  006d 1c0006        	addw	x,#OFST-3
 247  0070 cd0000        	call	c_ltor
 249  0073 ae004f        	ldw	x,#L57
 250  0076 cd0000        	call	c_fdiv
 252  0079 96            	ldw	x,sp
 253  007a 1c0006        	addw	x,#OFST-3
 254  007d cd0000        	call	c_rtol
 257                     ; 50   steinhart = log(steinhart);                  // ln(R/Ro)
 259  0080 1e08          	ldw	x,(OFST-1,sp)
 260  0082 89            	pushw	x
 261  0083 1e08          	ldw	x,(OFST-1,sp)
 262  0085 89            	pushw	x
 263  0086 cd0000        	call	_log
 265  0089 5b04          	addw	sp,#4
 266  008b 96            	ldw	x,sp
 267  008c 1c0006        	addw	x,#OFST-3
 268  008f cd0000        	call	c_rtol
 271                     ; 51   steinhart /= NTC_COEFF;                   // 1/B * ln(R/Ro)
 273  0092 ae0f6e        	ldw	x,#3950
 274  0095 cd0000        	call	c_itof
 276  0098 96            	ldw	x,sp
 277  0099 1c0006        	addw	x,#OFST-3
 278  009c cd0000        	call	c_fgdiv
 281                     ; 52   steinhart += 1.0 / (NTC_T_NOM + 273.15); // + (1/To)
 283  009f ae0047        	ldw	x,#L501
 284  00a2 cd0000        	call	c_ltor
 286  00a5 96            	ldw	x,sp
 287  00a6 1c0006        	addw	x,#OFST-3
 288  00a9 cd0000        	call	c_fgadd
 291                     ; 53   steinhart = 1.0 / steinhart;                 // Invert
 293  00ac ae0053        	ldw	x,#L56
 294  00af cd0000        	call	c_ltor
 296  00b2 96            	ldw	x,sp
 297  00b3 1c0006        	addw	x,#OFST-3
 298  00b6 cd0000        	call	c_fdiv
 300  00b9 96            	ldw	x,sp
 301  00ba 1c0006        	addw	x,#OFST-3
 302  00bd cd0000        	call	c_rtol
 305                     ; 54   steinhart -= 273.15;
 307  00c0 ae004b        	ldw	x,#L511
 308  00c3 cd0000        	call	c_ltor
 310  00c6 96            	ldw	x,sp
 311  00c7 1c0006        	addw	x,#OFST-3
 312  00ca cd0000        	call	c_fgsub
 315                     ; 55 	output = (steinhart + 4) * 5.0 ;
 317  00cd 96            	ldw	x,sp
 318  00ce 1c0006        	addw	x,#OFST-3
 319  00d1 cd0000        	call	c_ltor
 321  00d4 ae0043        	ldw	x,#L521
 322  00d7 cd0000        	call	c_fadd
 324  00da ae003f        	ldw	x,#L531
 325  00dd cd0000        	call	c_fmul
 327  00e0 cd0000        	call	c_ftol
 329  00e3 b603          	ld	a,c_lreg+3
 331                     ; 56 	return output;
 335  00e5 5b09          	addw	sp,#9
 336  00e7 81            	ret	
 402                     ; 58 uint8_t ADC_InterPolate (uint16_t ADValue, uint16_t *LookUpX, uint8_t *LookUpY)
 402                     ; 59 {
 403                     	switch	.text
 404  00e8               _ADC_InterPolate:
 406  00e8 89            	pushw	x
 407  00e9 5211          	subw	sp,#17
 408       00000011      OFST:	set	17
 411                     ; 62 	for (i=0;i<AD_MAX_LOOKUP_SIZE;i++)
 413  00eb 4f            	clr	a
 414  00ec 6b11          	ld	(OFST+0,sp),a
 416  00ee               L171:
 417                     ; 64 		if ((LookUpX[i]<=ADValue)&&(LookUpX[i+1]>=ADValue))
 419  00ee 5f            	clrw	x
 420  00ef 97            	ld	xl,a
 421  00f0 58            	sllw	x
 422  00f1 72fb16        	addw	x,(OFST+5,sp)
 423  00f4 fe            	ldw	x,(x)
 424  00f5 1312          	cpw	x,(OFST+1,sp)
 425  00f7 2303cc019b    	jrugt	L771
 427  00fc 5f            	clrw	x
 428  00fd 97            	ld	xl,a
 429  00fe 58            	sllw	x
 430  00ff 72fb16        	addw	x,(OFST+5,sp)
 431  0102 ee02          	ldw	x,(2,x)
 432  0104 1312          	cpw	x,(OFST+1,sp)
 433  0106 25f1          	jrult	L771
 434                     ; 66 			mu = (float)(ADValue - LookUpX[i]) / (float)(LookUpX[i+1] - LookUpX[i]);
 436  0108 5f            	clrw	x
 437  0109 97            	ld	xl,a
 438  010a 58            	sllw	x
 439  010b 72fb16        	addw	x,(OFST+5,sp)
 440  010e 905f          	clrw	y
 441  0110 ee02          	ldw	x,(2,x)
 442  0112 9097          	ld	yl,a
 443  0114 9058          	sllw	y
 444  0116 72f916        	addw	y,(OFST+5,sp)
 445  0119 cd01aa        	call	LC001
 447  011c 96            	ldw	x,sp
 448  011d 1c0009        	addw	x,#OFST-8
 449  0120 cd0000        	call	c_rtol
 452  0123 1e12          	ldw	x,(OFST+1,sp)
 453  0125 7b11          	ld	a,(OFST+0,sp)
 454  0127 905f          	clrw	y
 455  0129 9097          	ld	yl,a
 456  012b 9058          	sllw	y
 457  012d 72f916        	addw	y,(OFST+5,sp)
 458  0130 ad78          	call	LC001
 460  0132 96            	ldw	x,sp
 461  0133 1c0009        	addw	x,#OFST-8
 462  0136 cd0000        	call	c_fdiv
 464  0139 96            	ldw	x,sp
 465  013a 1c000d        	addw	x,#OFST-4
 466  013d cd0000        	call	c_rtol
 469                     ; 67 			return (uint8_t) (LookUpY[i]*(1-mu) + LookUpY[i+1] * mu);
 471  0140 7b11          	ld	a,(OFST+0,sp)
 472  0142 5f            	clrw	x
 473  0143 97            	ld	xl,a
 474  0144 72fb18        	addw	x,(OFST+7,sp)
 475  0147 e601          	ld	a,(1,x)
 476  0149 5f            	clrw	x
 477  014a 97            	ld	xl,a
 478  014b cd0000        	call	c_itof
 480  014e 96            	ldw	x,sp
 481  014f 1c0009        	addw	x,#OFST-8
 482  0152 cd0000        	call	c_rtol
 485  0155 96            	ldw	x,sp
 486  0156 1c000d        	addw	x,#OFST-4
 487  0159 cd0000        	call	c_ltor
 489  015c 96            	ldw	x,sp
 490  015d 1c0009        	addw	x,#OFST-8
 491  0160 cd0000        	call	c_fmul
 493  0163 96            	ldw	x,sp
 494  0164 1c0005        	addw	x,#OFST-12
 495  0167 cd0000        	call	c_rtol
 498  016a 7b11          	ld	a,(OFST+0,sp)
 499  016c 5f            	clrw	x
 500  016d 97            	ld	xl,a
 501  016e 72fb18        	addw	x,(OFST+7,sp)
 502  0171 f6            	ld	a,(x)
 503  0172 5f            	clrw	x
 504  0173 97            	ld	xl,a
 505  0174 cd0000        	call	c_itof
 507  0177 96            	ldw	x,sp
 508  0178 5c            	incw	x
 509  0179 cd0000        	call	c_rtol
 512  017c a601          	ld	a,#1
 513  017e cd0000        	call	c_ctof
 515  0181 96            	ldw	x,sp
 516  0182 1c000d        	addw	x,#OFST-4
 517  0185 cd0000        	call	c_fsub
 519  0188 96            	ldw	x,sp
 520  0189 5c            	incw	x
 521  018a cd0000        	call	c_fmul
 523  018d 96            	ldw	x,sp
 524  018e 1c0005        	addw	x,#OFST-12
 525  0191 cd0000        	call	c_fadd
 527  0194 cd0000        	call	c_ftol
 529  0197 b603          	ld	a,c_lreg+3
 531  0199 200c          	jra	L03
 532  019b               L771:
 533                     ; 62 	for (i=0;i<AD_MAX_LOOKUP_SIZE;i++)
 535  019b 0c11          	inc	(OFST+0,sp)
 539  019d 7b11          	ld	a,(OFST+0,sp)
 540  019f a115          	cp	a,#21
 541  01a1 2403cc00ee    	jrult	L171
 542                     ; 70 	return 0;
 544  01a6 4f            	clr	a
 546  01a7               L03:
 548  01a7 5b13          	addw	sp,#19
 549  01a9 81            	ret	
 550  01aa               LC001:
 551  01aa 01            	rrwa	x,a
 552  01ab 90e001        	sub	a,(1,y)
 553  01ae 01            	rrwa	x,a
 554  01af 90f2          	sbc	a,(y)
 555  01b1 01            	rrwa	x,a
 556  01b2 cc0000        	jp	c_uitof
 583                     ; 73 void ADC_Start(void)
 583                     ; 74 {
 584                     	switch	.text
 585  01b5               _ADC_Start:
 589                     ; 75 	SetBit(Main_State, MAINSTATE_AD);
 591  01b5 72120000      	bset	_Main_State,#1
 592                     ; 76 	Status_Disp_EN = FALSE;
 594  01b9 725f0000      	clr	_Status_Disp_EN
 595                     ; 77 	GPIO_WriteLow(STATUS_2_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_2_PIN);
 597  01bd 4b01          	push	#1
 598  01bf ae500f        	ldw	x,#20495
 599  01c2 cd0000        	call	_GPIO_WriteLow
 601  01c5 84            	pop	a
 602                     ; 78 	GPIO_WriteLow(STATUS_3_GPIO_PORT, (GPIO_Pin_TypeDef) STATUS_3_PIN);
 604  01c6 4b04          	push	#4
 605  01c8 ae500f        	ldw	x,#20495
 606  01cb cd0000        	call	_GPIO_WriteLow
 608  01ce 84            	pop	a
 609                     ; 79 	ADC1_StartConversion();
 612                     ; 80 }
 615  01cf cc0000        	jp	_ADC1_StartConversion
 675                     ; 82 bool ADC_CheckState(void)
 675                     ; 83 {
 676                     	switch	.text
 677  01d2               _ADC_CheckState:
 681                     ; 84 		if (AD_NrOfValues < (AD_AVG_COUNT-1)) return FALSE;
 683  01d2 c60000        	ld	a,_AD_NrOfValues
 684  01d5 a109          	cp	a,#9
 685  01d7 2402          	jruge	L132
 688  01d9 4f            	clr	a
 691  01da 81            	ret	
 692  01db               L132:
 693                     ; 87 		Status_Disp_EN = TRUE; ClrBit(Main_State, MAINSTATE_AD);
 695  01db 35010000      	mov	_Status_Disp_EN,#1
 698  01df 72130000      	bres	_Main_State,#1
 699                     ; 88 		AD_NTC_Result_Avg = AD_NTC_Results_Sum / AD_AVG_COUNT;
 701  01e3 ce000e        	ldw	x,_AD_NTC_Results_Sum
 702  01e6 a60a          	ld	a,#10
 703  01e8 62            	div	x,a
 704  01e9 cf0008        	ldw	_AD_NTC_Result_Avg,x
 705                     ; 89 		AD_LDR_Results_Avg = AD_LDR_Results_Sum / AD_AVG_COUNT;
 707  01ec ce000c        	ldw	x,_AD_LDR_Results_Sum
 708  01ef a60a          	ld	a,#10
 709  01f1 62            	div	x,a
 710  01f2 cf0006        	ldw	_AD_LDR_Results_Avg,x
 711                     ; 90 		AD_GAS_Results_Avg = AD_GAS_Results_Sum / AD_AVG_COUNT;
 713  01f5 ce000a        	ldw	x,_AD_GAS_Results_Sum
 714  01f8 a60a          	ld	a,#10
 715  01fa 62            	div	x,a
 716  01fb cf0004        	ldw	_AD_GAS_Results_Avg,x
 717                     ; 92 		AD_NTC_TempX5 = NTC_SteinHart(AD_NTC_Result_Avg);
 719  01fe ce0008        	ldw	x,_AD_NTC_Result_Avg
 720  0201 cd0044        	call	_NTC_SteinHart
 722  0204 c70003        	ld	_AD_NTC_TempX5,a
 723                     ; 93 		AD_LDR_LUXD50 = ADC_InterPolate(AD_LDR_Results_Avg, LookUpAllX, LookUpLUXD50);
 725  0207 ae002a        	ldw	x,#L7_LookUpLUXD50
 726  020a 89            	pushw	x
 727  020b ae0000        	ldw	x,#L5_LookUpAllX
 728  020e 89            	pushw	x
 729  020f ce0006        	ldw	x,_AD_LDR_Results_Avg
 730  0212 cd00e8        	call	_ADC_InterPolate
 732  0215 5b04          	addw	sp,#4
 733  0217 c70002        	ld	_AD_LDR_LUXD50,a
 734                     ; 95 		AD_AirQuality = AD_GAS_Results_Avg%256;
 736  021a 5500050001    	mov	_AD_AirQuality,_AD_GAS_Results_Avg+1
 737                     ; 96 		AD_NrOfValues = 0; AD_NTC_Results_Sum = 0; AD_LDR_Results_Sum = 0; AD_GAS_Results_Sum = 0;
 739  021f 725f0000      	clr	_AD_NrOfValues
 742  0223 5f            	clrw	x
 743  0224 cf000e        	ldw	_AD_NTC_Results_Sum,x
 746  0227 cf000c        	ldw	_AD_LDR_Results_Sum,x
 749  022a cf000a        	ldw	_AD_GAS_Results_Sum,x
 750                     ; 97 		return TRUE;
 752  022d a601          	ld	a,#1
 755  022f 81            	ret	
 785                     ; 101 void ADC_INTHANDLE(void)
 785                     ; 102 {
 786                     	switch	.text
 787  0230               _ADC_INTHANDLE:
 789  0230 89            	pushw	x
 790       00000002      OFST:	set	2
 793                     ; 103 	AD_NTC_Results_Sum += ADC1_GetBufferValue(0);
 795  0231 4f            	clr	a
 796  0232 cd0000        	call	_ADC1_GetBufferValue
 798  0235 1f01          	ldw	(OFST-1,sp),x
 800  0237 72bb000e      	addw	x,_AD_NTC_Results_Sum
 801  023b cf000e        	ldw	_AD_NTC_Results_Sum,x
 802                     ; 104 	AD_LDR_Results_Sum += ADC1_GetBufferValue(1);
 804  023e a601          	ld	a,#1
 805  0240 cd0000        	call	_ADC1_GetBufferValue
 807  0243 1f01          	ldw	(OFST-1,sp),x
 809  0245 72bb000c      	addw	x,_AD_LDR_Results_Sum
 810  0249 cf000c        	ldw	_AD_LDR_Results_Sum,x
 811                     ; 105 	AD_GAS_Results_Sum += ADC1_GetBufferValue(2);
 813  024c a602          	ld	a,#2
 814  024e cd0000        	call	_ADC1_GetBufferValue
 816  0251 1f01          	ldw	(OFST-1,sp),x
 818  0253 72bb000a      	addw	x,_AD_GAS_Results_Sum
 819  0257 cf000a        	ldw	_AD_GAS_Results_Sum,x
 820                     ; 106 	AD_NrOfValues++;
 822  025a 725c0000      	inc	_AD_NrOfValues
 823                     ; 107 	ADC1_ClearITPendingBit(ADC1_IT_EOC);
 825  025e ae0080        	ldw	x,#128
 826  0261 cd0000        	call	_ADC1_ClearITPendingBit
 828                     ; 108 	if (AD_NrOfValues < (AD_AVG_COUNT-1)) {ADC1_StartConversion();}
 830  0264 c60000        	ld	a,_AD_NrOfValues
 831  0267 a109          	cp	a,#9
 832  0269 2403          	jruge	L542
 835  026b cd0000        	call	_ADC1_StartConversion
 837  026e               L542:
 838                     ; 109 }
 841  026e 85            	popw	x
 842  026f 81            	ret	
 955                     	xdef	_ADC_InterPolate
 956                     	xdef	_NTC_SteinHart
 957                     	switch	.bss
 958  0000               _AD_NrOfValues:
 959  0000 00            	ds.b	1
 960                     	xdef	_AD_NrOfValues
 961  0001               _AD_AirQuality:
 962  0001 00            	ds.b	1
 963                     	xdef	_AD_AirQuality
 964  0002               _AD_LDR_LUXD50:
 965  0002 00            	ds.b	1
 966                     	xdef	_AD_LDR_LUXD50
 967  0003               _AD_NTC_TempX5:
 968  0003 00            	ds.b	1
 969                     	xdef	_AD_NTC_TempX5
 970  0004               _AD_GAS_Results_Avg:
 971  0004 0000          	ds.b	2
 972                     	xdef	_AD_GAS_Results_Avg
 973  0006               _AD_LDR_Results_Avg:
 974  0006 0000          	ds.b	2
 975                     	xdef	_AD_LDR_Results_Avg
 976  0008               _AD_NTC_Result_Avg:
 977  0008 0000          	ds.b	2
 978                     	xdef	_AD_NTC_Result_Avg
 979  000a               _AD_GAS_Results_Sum:
 980  000a 0000          	ds.b	2
 981                     	xdef	_AD_GAS_Results_Sum
 982  000c               _AD_LDR_Results_Sum:
 983  000c 0000          	ds.b	2
 984                     	xdef	_AD_LDR_Results_Sum
 985  000e               _AD_NTC_Results_Sum:
 986  000e 0000          	ds.b	2
 987                     	xdef	_AD_NTC_Results_Sum
 988                     	xref	_Status_Disp_EN
 989                     	xref	_Main_State
 990                     	xref	_log
 991                     	xdef	_ADC_Start
 992                     	xdef	_ADC_CheckState
 993                     	xdef	_ADC_INTHANDLE
 994                     	xdef	_ADC_Init
 995                     	xref	_GPIO_WriteLow
 996                     	xref	_GPIO_Init
 997                     	xref	_ADC1_ClearITPendingBit
 998                     	xref	_ADC1_GetBufferValue
 999                     	xref	_ADC1_StartConversion
1000                     	xref	_ADC1_ITConfig
1001                     	xref	_ADC1_ScanModeCmd
1002                     	xref	_ADC1_Init
1003                     	switch	.const
1004  003f               L531:
1005  003f 40a00000      	dc.w	16544,0
1006  0043               L521:
1007  0043 40800000      	dc.w	16512,0
1008  0047               L501:
1009  0047 3b5bcf0e      	dc.w	15195,-12530
1010  004b               L511:
1011  004b 43889333      	dc.w	17288,-27853
1012  004f               L57:
1013  004f 461c4000      	dc.w	17948,16384
1014  0053               L56:
1015  0053 3f800000      	dc.w	16256,0
1016  0057               L55:
1017  0057 447fc000      	dc.w	17535,-16384
1018                     	xref.b	c_lreg
1019                     	xref.b	c_x
1039                     	xref	c_ctof
1040                     	xref	c_ftol
1041                     	xref	c_fadd
1042                     	xref	c_fgsub
1043                     	xref	c_fgadd
1044                     	xref	c_fgdiv
1045                     	xref	c_itof
1046                     	xref	c_fmul
1047                     	xref	c_fsub
1048                     	xref	c_fdiv
1049                     	xref	c_rtol
1050                     	xref	c_uitof
1051                     	xref	c_ltor
1052                     	end
