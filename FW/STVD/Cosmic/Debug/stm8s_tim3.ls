   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 51 void TIM3_DeInit(void)
  43                     ; 52 {
  45                     .text:	section	.text,new
  46  0000               _TIM3_DeInit:
  50                     ; 53   TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  52  0000 725f5320      	clr	21280
  53                     ; 54   TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  55  0004 725f5321      	clr	21281
  56                     ; 55   TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  58  0008 725f5323      	clr	21283
  59                     ; 58   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  61  000c 725f5327      	clr	21287
  62                     ; 61   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  64  0010 725f5327      	clr	21287
  65                     ; 62   TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  67  0014 725f5325      	clr	21285
  68                     ; 63   TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  70  0018 725f5326      	clr	21286
  71                     ; 64   TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  73  001c 725f5328      	clr	21288
  74                     ; 65   TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  76  0020 725f5329      	clr	21289
  77                     ; 66   TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  79  0024 725f532a      	clr	21290
  80                     ; 67   TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  82  0028 35ff532b      	mov	21291,#255
  83                     ; 68   TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  85  002c 35ff532c      	mov	21292,#255
  86                     ; 69   TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  88  0030 725f532d      	clr	21293
  89                     ; 70   TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  91  0034 725f532e      	clr	21294
  92                     ; 71   TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  94  0038 725f532f      	clr	21295
  95                     ; 72   TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
  97  003c 725f5330      	clr	21296
  98                     ; 73   TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
 100  0040 725f5322      	clr	21282
 101                     ; 74 }
 104  0044 81            	ret
 270                     ; 82 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 270                     ; 83                         uint16_t TIM3_Period)
 270                     ; 84 {
 271                     .text:	section	.text,new
 272  0000               _TIM3_TimeBaseInit:
 274  0000 88            	push	a
 275       00000000      OFST:	set	0
 278                     ; 86   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 280  0001 c7532a        	ld	21290,a
 281                     ; 88   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 283  0004 7b04          	ld	a,(OFST+4,sp)
 284  0006 c7532b        	ld	21291,a
 285                     ; 89   TIM3->ARRL = (uint8_t)(TIM3_Period);
 287  0009 7b05          	ld	a,(OFST+5,sp)
 288  000b c7532c        	ld	21292,a
 289                     ; 90 }
 292  000e 84            	pop	a
 293  000f 81            	ret
 448                     ; 100 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 448                     ; 101                   TIM3_OutputState_TypeDef TIM3_OutputState,
 448                     ; 102                   uint16_t TIM3_Pulse,
 448                     ; 103                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 448                     ; 104 {
 449                     .text:	section	.text,new
 450  0000               _TIM3_OC1Init:
 452  0000 89            	pushw	x
 453  0001 88            	push	a
 454       00000001      OFST:	set	1
 457                     ; 106   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 459                     ; 107   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 461                     ; 108   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 463                     ; 111   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 465  0002 c65327        	ld	a,21287
 466  0005 a4fc          	and	a,#252
 467  0007 c75327        	ld	21287,a
 468                     ; 113   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 470  000a 7b08          	ld	a,(OFST+7,sp)
 471  000c a402          	and	a,#2
 472  000e 6b01          	ld	(OFST+0,sp),a
 474  0010 9f            	ld	a,xl
 475  0011 a401          	and	a,#1
 476  0013 1a01          	or	a,(OFST+0,sp)
 477  0015 ca5327        	or	a,21287
 478  0018 c75327        	ld	21287,a
 479                     ; 116   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 481  001b c65325        	ld	a,21285
 482  001e a48f          	and	a,#143
 483  0020 1a02          	or	a,(OFST+1,sp)
 484  0022 c75325        	ld	21285,a
 485                     ; 119   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 487  0025 7b06          	ld	a,(OFST+5,sp)
 488  0027 c7532d        	ld	21293,a
 489                     ; 120   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 491  002a 7b07          	ld	a,(OFST+6,sp)
 492  002c c7532e        	ld	21294,a
 493                     ; 121 }
 496  002f 5b03          	addw	sp,#3
 497  0031 81            	ret
 559                     ; 131 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 559                     ; 132                   TIM3_OutputState_TypeDef TIM3_OutputState,
 559                     ; 133                   uint16_t TIM3_Pulse,
 559                     ; 134                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 559                     ; 135 {
 560                     .text:	section	.text,new
 561  0000               _TIM3_OC2Init:
 563  0000 89            	pushw	x
 564  0001 88            	push	a
 565       00000001      OFST:	set	1
 568                     ; 137   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 570                     ; 138   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 572                     ; 139   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 574                     ; 143   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 576  0002 c65327        	ld	a,21287
 577  0005 a4cf          	and	a,#207
 578  0007 c75327        	ld	21287,a
 579                     ; 145   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 581  000a 7b08          	ld	a,(OFST+7,sp)
 582  000c a420          	and	a,#32
 583  000e 6b01          	ld	(OFST+0,sp),a
 585  0010 9f            	ld	a,xl
 586  0011 a410          	and	a,#16
 587  0013 1a01          	or	a,(OFST+0,sp)
 588  0015 ca5327        	or	a,21287
 589  0018 c75327        	ld	21287,a
 590                     ; 149   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 592  001b c65326        	ld	a,21286
 593  001e a48f          	and	a,#143
 594  0020 1a02          	or	a,(OFST+1,sp)
 595  0022 c75326        	ld	21286,a
 596                     ; 153   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 598  0025 7b06          	ld	a,(OFST+5,sp)
 599  0027 c7532f        	ld	21295,a
 600                     ; 154   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 602  002a 7b07          	ld	a,(OFST+6,sp)
 603  002c c75330        	ld	21296,a
 604                     ; 155 }
 607  002f 5b03          	addw	sp,#3
 608  0031 81            	ret
 790                     ; 166 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 790                     ; 167                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 790                     ; 168                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 790                     ; 169                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 790                     ; 170                  uint8_t TIM3_ICFilter)
 790                     ; 171 {
 791                     .text:	section	.text,new
 792  0000               _TIM3_ICInit:
 794  0000 89            	pushw	x
 795       00000000      OFST:	set	0
 798                     ; 173   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 800                     ; 174   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 802                     ; 175   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 804                     ; 176   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 806                     ; 177   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 808                     ; 179   if (TIM3_Channel != TIM3_CHANNEL_2)
 810  0001 9e            	ld	a,xh
 811  0002 a101          	cp	a,#1
 812  0004 2714          	jreq	L333
 813                     ; 182     TI1_Config((uint8_t)TIM3_ICPolarity,
 813                     ; 183                (uint8_t)TIM3_ICSelection,
 813                     ; 184                (uint8_t)TIM3_ICFilter);
 815  0006 7b07          	ld	a,(OFST+7,sp)
 816  0008 88            	push	a
 817  0009 7b06          	ld	a,(OFST+6,sp)
 818  000b 97            	ld	xl,a
 819  000c 7b03          	ld	a,(OFST+3,sp)
 820  000e 95            	ld	xh,a
 821  000f cd0000        	call	L3_TI1_Config
 823  0012 84            	pop	a
 824                     ; 187     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 826  0013 7b06          	ld	a,(OFST+6,sp)
 827  0015 cd0000        	call	_TIM3_SetIC1Prescaler
 830  0018 2012          	jra	L533
 831  001a               L333:
 832                     ; 192     TI2_Config((uint8_t)TIM3_ICPolarity,
 832                     ; 193                (uint8_t)TIM3_ICSelection,
 832                     ; 194                (uint8_t)TIM3_ICFilter);
 834  001a 7b07          	ld	a,(OFST+7,sp)
 835  001c 88            	push	a
 836  001d 7b06          	ld	a,(OFST+6,sp)
 837  001f 97            	ld	xl,a
 838  0020 7b03          	ld	a,(OFST+3,sp)
 839  0022 95            	ld	xh,a
 840  0023 cd0000        	call	L5_TI2_Config
 842  0026 84            	pop	a
 843                     ; 197     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 845  0027 7b06          	ld	a,(OFST+6,sp)
 846  0029 cd0000        	call	_TIM3_SetIC2Prescaler
 848  002c               L533:
 849                     ; 199 }
 852  002c 85            	popw	x
 853  002d 81            	ret
 943                     ; 210 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 943                     ; 211                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 943                     ; 212                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 943                     ; 213                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 943                     ; 214                      uint8_t TIM3_ICFilter)
 943                     ; 215 {
 944                     .text:	section	.text,new
 945  0000               _TIM3_PWMIConfig:
 947  0000 89            	pushw	x
 948  0001 89            	pushw	x
 949       00000002      OFST:	set	2
 952                     ; 216   uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 954                     ; 217   uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 956                     ; 220   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 958                     ; 221   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 960                     ; 222   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 962                     ; 223   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 964                     ; 226   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 966  0002 9f            	ld	a,xl
 967  0003 a144          	cp	a,#68
 968  0005 2706          	jreq	L773
 969                     ; 228     icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
 971  0007 a644          	ld	a,#68
 972  0009 6b01          	ld	(OFST-1,sp),a
 975  000b 2002          	jra	L104
 976  000d               L773:
 977                     ; 232     icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
 979  000d 0f01          	clr	(OFST-1,sp)
 981  000f               L104:
 982                     ; 236   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 984  000f 7b07          	ld	a,(OFST+5,sp)
 985  0011 a101          	cp	a,#1
 986  0013 2606          	jrne	L304
 987                     ; 238     icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
 989  0015 a602          	ld	a,#2
 990  0017 6b02          	ld	(OFST+0,sp),a
 993  0019 2004          	jra	L504
 994  001b               L304:
 995                     ; 242     icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
 997  001b a601          	ld	a,#1
 998  001d 6b02          	ld	(OFST+0,sp),a
1000  001f               L504:
1001                     ; 245   if (TIM3_Channel != TIM3_CHANNEL_2)
1003  001f 7b03          	ld	a,(OFST+1,sp)
1004  0021 a101          	cp	a,#1
1005  0023 2726          	jreq	L704
1006                     ; 248     TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1006                     ; 249                (uint8_t)TIM3_ICFilter);
1008  0025 7b09          	ld	a,(OFST+7,sp)
1009  0027 88            	push	a
1010  0028 7b08          	ld	a,(OFST+6,sp)
1011  002a 97            	ld	xl,a
1012  002b 7b05          	ld	a,(OFST+3,sp)
1013  002d 95            	ld	xh,a
1014  002e cd0000        	call	L3_TI1_Config
1016  0031 84            	pop	a
1017                     ; 252     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1019  0032 7b08          	ld	a,(OFST+6,sp)
1020  0034 cd0000        	call	_TIM3_SetIC1Prescaler
1022                     ; 255     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1024  0037 7b09          	ld	a,(OFST+7,sp)
1025  0039 88            	push	a
1026  003a 7b03          	ld	a,(OFST+1,sp)
1027  003c 97            	ld	xl,a
1028  003d 7b02          	ld	a,(OFST+0,sp)
1029  003f 95            	ld	xh,a
1030  0040 cd0000        	call	L5_TI2_Config
1032  0043 84            	pop	a
1033                     ; 258     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1035  0044 7b08          	ld	a,(OFST+6,sp)
1036  0046 cd0000        	call	_TIM3_SetIC2Prescaler
1039  0049 2024          	jra	L114
1040  004b               L704:
1041                     ; 263     TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1041                     ; 264                (uint8_t)TIM3_ICFilter);
1043  004b 7b09          	ld	a,(OFST+7,sp)
1044  004d 88            	push	a
1045  004e 7b08          	ld	a,(OFST+6,sp)
1046  0050 97            	ld	xl,a
1047  0051 7b05          	ld	a,(OFST+3,sp)
1048  0053 95            	ld	xh,a
1049  0054 cd0000        	call	L5_TI2_Config
1051  0057 84            	pop	a
1052                     ; 267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1054  0058 7b08          	ld	a,(OFST+6,sp)
1055  005a cd0000        	call	_TIM3_SetIC2Prescaler
1057                     ; 270     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1059  005d 7b09          	ld	a,(OFST+7,sp)
1060  005f 88            	push	a
1061  0060 7b03          	ld	a,(OFST+1,sp)
1062  0062 97            	ld	xl,a
1063  0063 7b02          	ld	a,(OFST+0,sp)
1064  0065 95            	ld	xh,a
1065  0066 cd0000        	call	L3_TI1_Config
1067  0069 84            	pop	a
1068                     ; 273     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1070  006a 7b08          	ld	a,(OFST+6,sp)
1071  006c cd0000        	call	_TIM3_SetIC1Prescaler
1073  006f               L114:
1074                     ; 275 }
1077  006f 5b04          	addw	sp,#4
1078  0071 81            	ret
1133                     ; 283 void TIM3_Cmd(FunctionalState NewState)
1133                     ; 284 {
1134                     .text:	section	.text,new
1135  0000               _TIM3_Cmd:
1139                     ; 286   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1141                     ; 289   if (NewState != DISABLE)
1143  0000 4d            	tnz	a
1144  0001 2706          	jreq	L144
1145                     ; 291     TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1147  0003 72105320      	bset	21280,#0
1149  0007 2004          	jra	L344
1150  0009               L144:
1151                     ; 295     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1153  0009 72115320      	bres	21280,#0
1154  000d               L344:
1155                     ; 297 }
1158  000d 81            	ret
1230                     ; 311 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1230                     ; 312 {
1231                     .text:	section	.text,new
1232  0000               _TIM3_ITConfig:
1234  0000 89            	pushw	x
1235       00000000      OFST:	set	0
1238                     ; 314   assert_param(IS_TIM3_IT_OK(TIM3_IT));
1240                     ; 315   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1242                     ; 317   if (NewState != DISABLE)
1244  0001 9f            	ld	a,xl
1245  0002 4d            	tnz	a
1246  0003 2709          	jreq	L105
1247                     ; 320     TIM3->IER |= (uint8_t)TIM3_IT;
1249  0005 9e            	ld	a,xh
1250  0006 ca5321        	or	a,21281
1251  0009 c75321        	ld	21281,a
1253  000c 2009          	jra	L305
1254  000e               L105:
1255                     ; 325     TIM3->IER &= (uint8_t)(~TIM3_IT);
1257  000e 7b01          	ld	a,(OFST+1,sp)
1258  0010 43            	cpl	a
1259  0011 c45321        	and	a,21281
1260  0014 c75321        	ld	21281,a
1261  0017               L305:
1262                     ; 327 }
1265  0017 85            	popw	x
1266  0018 81            	ret
1302                     ; 335 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1302                     ; 336 {
1303                     .text:	section	.text,new
1304  0000               _TIM3_UpdateDisableConfig:
1308                     ; 338   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1310                     ; 341   if (NewState != DISABLE)
1312  0000 4d            	tnz	a
1313  0001 2706          	jreq	L325
1314                     ; 343     TIM3->CR1 |= TIM3_CR1_UDIS;
1316  0003 72125320      	bset	21280,#1
1318  0007 2004          	jra	L525
1319  0009               L325:
1320                     ; 347     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1322  0009 72135320      	bres	21280,#1
1323  000d               L525:
1324                     ; 349 }
1327  000d 81            	ret
1385                     ; 359 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1385                     ; 360 {
1386                     .text:	section	.text,new
1387  0000               _TIM3_UpdateRequestConfig:
1391                     ; 362   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1393                     ; 365   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1395  0000 4d            	tnz	a
1396  0001 2706          	jreq	L555
1397                     ; 367     TIM3->CR1 |= TIM3_CR1_URS;
1399  0003 72145320      	bset	21280,#2
1401  0007 2004          	jra	L755
1402  0009               L555:
1403                     ; 371     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1405  0009 72155320      	bres	21280,#2
1406  000d               L755:
1407                     ; 373 }
1410  000d 81            	ret
1467                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1467                     ; 384 {
1468                     .text:	section	.text,new
1469  0000               _TIM3_SelectOnePulseMode:
1473                     ; 386   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1475                     ; 389   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1477  0000 4d            	tnz	a
1478  0001 2706          	jreq	L706
1479                     ; 391     TIM3->CR1 |= TIM3_CR1_OPM;
1481  0003 72165320      	bset	21280,#3
1483  0007 2004          	jra	L116
1484  0009               L706:
1485                     ; 395     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1487  0009 72175320      	bres	21280,#3
1488  000d               L116:
1489                     ; 397 }
1492  000d 81            	ret
1560                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1560                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1560                     ; 429 {
1561                     .text:	section	.text,new
1562  0000               _TIM3_PrescalerConfig:
1566                     ; 431   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1568                     ; 432   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1570                     ; 435   TIM3->PSCR = (uint8_t)Prescaler;
1572  0000 9e            	ld	a,xh
1573  0001 c7532a        	ld	21290,a
1574                     ; 438   TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
1576  0004 9f            	ld	a,xl
1577  0005 c75324        	ld	21284,a
1578                     ; 439 }
1581  0008 81            	ret
1639                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1639                     ; 451 {
1640                     .text:	section	.text,new
1641  0000               _TIM3_ForcedOC1Config:
1643  0000 88            	push	a
1644       00000000      OFST:	set	0
1647                     ; 453   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1649                     ; 456   TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
1651  0001 c65325        	ld	a,21285
1652  0004 a48f          	and	a,#143
1653  0006 1a01          	or	a,(OFST+1,sp)
1654  0008 c75325        	ld	21285,a
1655                     ; 457 }
1658  000b 84            	pop	a
1659  000c 81            	ret
1695                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1695                     ; 469 {
1696                     .text:	section	.text,new
1697  0000               _TIM3_ForcedOC2Config:
1699  0000 88            	push	a
1700       00000000      OFST:	set	0
1703                     ; 471   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1705                     ; 474   TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
1707  0001 c65326        	ld	a,21286
1708  0004 a48f          	and	a,#143
1709  0006 1a01          	or	a,(OFST+1,sp)
1710  0008 c75326        	ld	21286,a
1711                     ; 475 }
1714  000b 84            	pop	a
1715  000c 81            	ret
1751                     ; 483 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1751                     ; 484 {
1752                     .text:	section	.text,new
1753  0000               _TIM3_ARRPreloadConfig:
1757                     ; 486   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1759                     ; 489   if (NewState != DISABLE)
1761  0000 4d            	tnz	a
1762  0001 2706          	jreq	L727
1763                     ; 491     TIM3->CR1 |= TIM3_CR1_ARPE;
1765  0003 721e5320      	bset	21280,#7
1767  0007 2004          	jra	L137
1768  0009               L727:
1769                     ; 495     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
1771  0009 721f5320      	bres	21280,#7
1772  000d               L137:
1773                     ; 497 }
1776  000d 81            	ret
1812                     ; 505 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1812                     ; 506 {
1813                     .text:	section	.text,new
1814  0000               _TIM3_OC1PreloadConfig:
1818                     ; 508   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1820                     ; 511   if (NewState != DISABLE)
1822  0000 4d            	tnz	a
1823  0001 2706          	jreq	L157
1824                     ; 513     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1826  0003 72165325      	bset	21285,#3
1828  0007 2004          	jra	L357
1829  0009               L157:
1830                     ; 517     TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1832  0009 72175325      	bres	21285,#3
1833  000d               L357:
1834                     ; 519 }
1837  000d 81            	ret
1873                     ; 527 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1873                     ; 528 {
1874                     .text:	section	.text,new
1875  0000               _TIM3_OC2PreloadConfig:
1879                     ; 530   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1881                     ; 533   if (NewState != DISABLE)
1883  0000 4d            	tnz	a
1884  0001 2706          	jreq	L377
1885                     ; 535     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1887  0003 72165326      	bset	21286,#3
1889  0007 2004          	jra	L577
1890  0009               L377:
1891                     ; 539     TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
1893  0009 72175326      	bres	21286,#3
1894  000d               L577:
1895                     ; 541 }
1898  000d 81            	ret
1963                     ; 552 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1963                     ; 553 {
1964                     .text:	section	.text,new
1965  0000               _TIM3_GenerateEvent:
1969                     ; 555   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1971                     ; 558   TIM3->EGR = (uint8_t)TIM3_EventSource;
1973  0000 c75324        	ld	21284,a
1974                     ; 559 }
1977  0003 81            	ret
2013                     ; 569 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2013                     ; 570 {
2014                     .text:	section	.text,new
2015  0000               _TIM3_OC1PolarityConfig:
2019                     ; 572   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2021                     ; 575   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2023  0000 4d            	tnz	a
2024  0001 2706          	jreq	L5401
2025                     ; 577     TIM3->CCER1 |= TIM3_CCER1_CC1P;
2027  0003 72125327      	bset	21287,#1
2029  0007 2004          	jra	L7401
2030  0009               L5401:
2031                     ; 581     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2033  0009 72135327      	bres	21287,#1
2034  000d               L7401:
2035                     ; 583 }
2038  000d 81            	ret
2074                     ; 593 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2074                     ; 594 {
2075                     .text:	section	.text,new
2076  0000               _TIM3_OC2PolarityConfig:
2080                     ; 596   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2082                     ; 599   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2084  0000 4d            	tnz	a
2085  0001 2706          	jreq	L7601
2086                     ; 601     TIM3->CCER1 |= TIM3_CCER1_CC2P;
2088  0003 721a5327      	bset	21287,#5
2090  0007 2004          	jra	L1701
2091  0009               L7601:
2092                     ; 605     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2094  0009 721b5327      	bres	21287,#5
2095  000d               L1701:
2096                     ; 607 }
2099  000d 81            	ret
2144                     ; 619 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2144                     ; 620 {
2145                     .text:	section	.text,new
2146  0000               _TIM3_CCxCmd:
2148  0000 89            	pushw	x
2149       00000000      OFST:	set	0
2152                     ; 622   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2154                     ; 623   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2156                     ; 625   if (TIM3_Channel == TIM3_CHANNEL_1)
2158  0001 9e            	ld	a,xh
2159  0002 4d            	tnz	a
2160  0003 2610          	jrne	L5111
2161                     ; 628     if (NewState != DISABLE)
2163  0005 9f            	ld	a,xl
2164  0006 4d            	tnz	a
2165  0007 2706          	jreq	L7111
2166                     ; 630       TIM3->CCER1 |= TIM3_CCER1_CC1E;
2168  0009 72105327      	bset	21287,#0
2170  000d 2014          	jra	L3211
2171  000f               L7111:
2172                     ; 634       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2174  000f 72115327      	bres	21287,#0
2175  0013 200e          	jra	L3211
2176  0015               L5111:
2177                     ; 641     if (NewState != DISABLE)
2179  0015 0d02          	tnz	(OFST+2,sp)
2180  0017 2706          	jreq	L5211
2181                     ; 643       TIM3->CCER1 |= TIM3_CCER1_CC2E;
2183  0019 72185327      	bset	21287,#4
2185  001d 2004          	jra	L3211
2186  001f               L5211:
2187                     ; 647       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2189  001f 72195327      	bres	21287,#4
2190  0023               L3211:
2191                     ; 650 }
2194  0023 85            	popw	x
2195  0024 81            	ret
2240                     ; 671 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2240                     ; 672 {
2241                     .text:	section	.text,new
2242  0000               _TIM3_SelectOCxM:
2244  0000 89            	pushw	x
2245       00000000      OFST:	set	0
2248                     ; 674   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2250                     ; 675   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2252                     ; 677   if (TIM3_Channel == TIM3_CHANNEL_1)
2254  0001 9e            	ld	a,xh
2255  0002 4d            	tnz	a
2256  0003 2610          	jrne	L3511
2257                     ; 680     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2259  0005 72115327      	bres	21287,#0
2260                     ; 683     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2262  0009 c65325        	ld	a,21285
2263  000c a48f          	and	a,#143
2264  000e 1a02          	or	a,(OFST+2,sp)
2265  0010 c75325        	ld	21285,a
2267  0013 200e          	jra	L5511
2268  0015               L3511:
2269                     ; 688     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2271  0015 72195327      	bres	21287,#4
2272                     ; 691     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2274  0019 c65326        	ld	a,21286
2275  001c a48f          	and	a,#143
2276  001e 1a02          	or	a,(OFST+2,sp)
2277  0020 c75326        	ld	21286,a
2278  0023               L5511:
2279                     ; 693 }
2282  0023 85            	popw	x
2283  0024 81            	ret
2315                     ; 701 void TIM3_SetCounter(uint16_t Counter)
2315                     ; 702 {
2316                     .text:	section	.text,new
2317  0000               _TIM3_SetCounter:
2321                     ; 704   TIM3->CNTRH = (uint8_t)(Counter >> 8);
2323  0000 9e            	ld	a,xh
2324  0001 c75328        	ld	21288,a
2325                     ; 705   TIM3->CNTRL = (uint8_t)(Counter);
2327  0004 9f            	ld	a,xl
2328  0005 c75329        	ld	21289,a
2329                     ; 706 }
2332  0008 81            	ret
2364                     ; 714 void TIM3_SetAutoreload(uint16_t Autoreload)
2364                     ; 715 {
2365                     .text:	section	.text,new
2366  0000               _TIM3_SetAutoreload:
2370                     ; 717   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
2372  0000 9e            	ld	a,xh
2373  0001 c7532b        	ld	21291,a
2374                     ; 718   TIM3->ARRL = (uint8_t)(Autoreload);
2376  0004 9f            	ld	a,xl
2377  0005 c7532c        	ld	21292,a
2378                     ; 719 }
2381  0008 81            	ret
2413                     ; 727 void TIM3_SetCompare1(uint16_t Compare1)
2413                     ; 728 {
2414                     .text:	section	.text,new
2415  0000               _TIM3_SetCompare1:
2419                     ; 730   TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
2421  0000 9e            	ld	a,xh
2422  0001 c7532d        	ld	21293,a
2423                     ; 731   TIM3->CCR1L = (uint8_t)(Compare1);
2425  0004 9f            	ld	a,xl
2426  0005 c7532e        	ld	21294,a
2427                     ; 732 }
2430  0008 81            	ret
2462                     ; 740 void TIM3_SetCompare2(uint16_t Compare2)
2462                     ; 741 {
2463                     .text:	section	.text,new
2464  0000               _TIM3_SetCompare2:
2468                     ; 743   TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
2470  0000 9e            	ld	a,xh
2471  0001 c7532f        	ld	21295,a
2472                     ; 744   TIM3->CCR2L = (uint8_t)(Compare2);
2474  0004 9f            	ld	a,xl
2475  0005 c75330        	ld	21296,a
2476                     ; 745 }
2479  0008 81            	ret
2515                     ; 757 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2515                     ; 758 {
2516                     .text:	section	.text,new
2517  0000               _TIM3_SetIC1Prescaler:
2519  0000 88            	push	a
2520       00000000      OFST:	set	0
2523                     ; 760   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2525                     ; 763   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
2527  0001 c65325        	ld	a,21285
2528  0004 a4f3          	and	a,#243
2529  0006 1a01          	or	a,(OFST+1,sp)
2530  0008 c75325        	ld	21285,a
2531                     ; 764 }
2534  000b 84            	pop	a
2535  000c 81            	ret
2571                     ; 776 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2571                     ; 777 {
2572                     .text:	section	.text,new
2573  0000               _TIM3_SetIC2Prescaler:
2575  0000 88            	push	a
2576       00000000      OFST:	set	0
2579                     ; 779   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2581                     ; 782   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
2583  0001 c65326        	ld	a,21286
2584  0004 a4f3          	and	a,#243
2585  0006 1a01          	or	a,(OFST+1,sp)
2586  0008 c75326        	ld	21286,a
2587                     ; 783 }
2590  000b 84            	pop	a
2591  000c 81            	ret
2637                     ; 790 uint16_t TIM3_GetCapture1(void)
2637                     ; 791 {
2638                     .text:	section	.text,new
2639  0000               _TIM3_GetCapture1:
2641  0000 5204          	subw	sp,#4
2642       00000004      OFST:	set	4
2645                     ; 793   uint16_t tmpccr1 = 0;
2647                     ; 794   uint8_t tmpccr1l=0, tmpccr1h=0;
2651                     ; 796   tmpccr1h = TIM3->CCR1H;
2653  0002 c6532d        	ld	a,21293
2654  0005 6b02          	ld	(OFST-2,sp),a
2656                     ; 797   tmpccr1l = TIM3->CCR1L;
2658  0007 c6532e        	ld	a,21294
2659  000a 6b01          	ld	(OFST-3,sp),a
2661                     ; 799   tmpccr1 = (uint16_t)(tmpccr1l);
2663  000c 7b01          	ld	a,(OFST-3,sp)
2664  000e 5f            	clrw	x
2665  000f 97            	ld	xl,a
2666  0010 1f03          	ldw	(OFST-1,sp),x
2668                     ; 800   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
2670  0012 7b02          	ld	a,(OFST-2,sp)
2671  0014 5f            	clrw	x
2672  0015 97            	ld	xl,a
2673  0016 4f            	clr	a
2674  0017 02            	rlwa	x,a
2675  0018 01            	rrwa	x,a
2676  0019 1a04          	or	a,(OFST+0,sp)
2677  001b 01            	rrwa	x,a
2678  001c 1a03          	or	a,(OFST-1,sp)
2679  001e 01            	rrwa	x,a
2680  001f 1f03          	ldw	(OFST-1,sp),x
2682                     ; 802   return (uint16_t)tmpccr1;
2684  0021 1e03          	ldw	x,(OFST-1,sp)
2687  0023 5b04          	addw	sp,#4
2688  0025 81            	ret
2734                     ; 810 uint16_t TIM3_GetCapture2(void)
2734                     ; 811 {
2735                     .text:	section	.text,new
2736  0000               _TIM3_GetCapture2:
2738  0000 5204          	subw	sp,#4
2739       00000004      OFST:	set	4
2742                     ; 813   uint16_t tmpccr2 = 0;
2744                     ; 814   uint8_t tmpccr2l=0, tmpccr2h=0;
2748                     ; 816   tmpccr2h = TIM3->CCR2H;
2750  0002 c6532f        	ld	a,21295
2751  0005 6b02          	ld	(OFST-2,sp),a
2753                     ; 817   tmpccr2l = TIM3->CCR2L;
2755  0007 c65330        	ld	a,21296
2756  000a 6b01          	ld	(OFST-3,sp),a
2758                     ; 819   tmpccr2 = (uint16_t)(tmpccr2l);
2760  000c 7b01          	ld	a,(OFST-3,sp)
2761  000e 5f            	clrw	x
2762  000f 97            	ld	xl,a
2763  0010 1f03          	ldw	(OFST-1,sp),x
2765                     ; 820   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
2767  0012 7b02          	ld	a,(OFST-2,sp)
2768  0014 5f            	clrw	x
2769  0015 97            	ld	xl,a
2770  0016 4f            	clr	a
2771  0017 02            	rlwa	x,a
2772  0018 01            	rrwa	x,a
2773  0019 1a04          	or	a,(OFST+0,sp)
2774  001b 01            	rrwa	x,a
2775  001c 1a03          	or	a,(OFST-1,sp)
2776  001e 01            	rrwa	x,a
2777  001f 1f03          	ldw	(OFST-1,sp),x
2779                     ; 822   return (uint16_t)tmpccr2;
2781  0021 1e03          	ldw	x,(OFST-1,sp)
2784  0023 5b04          	addw	sp,#4
2785  0025 81            	ret
2817                     ; 830 uint16_t TIM3_GetCounter(void)
2817                     ; 831 {
2818                     .text:	section	.text,new
2819  0000               _TIM3_GetCounter:
2821  0000 89            	pushw	x
2822       00000002      OFST:	set	2
2825                     ; 832   uint16_t tmpcntr = 0;
2827                     ; 834   tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
2829  0001 c65328        	ld	a,21288
2830  0004 5f            	clrw	x
2831  0005 97            	ld	xl,a
2832  0006 4f            	clr	a
2833  0007 02            	rlwa	x,a
2834  0008 1f01          	ldw	(OFST-1,sp),x
2836                     ; 836   return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
2838  000a c65329        	ld	a,21289
2839  000d 5f            	clrw	x
2840  000e 97            	ld	xl,a
2841  000f 01            	rrwa	x,a
2842  0010 1a02          	or	a,(OFST+0,sp)
2843  0012 01            	rrwa	x,a
2844  0013 1a01          	or	a,(OFST-1,sp)
2845  0015 01            	rrwa	x,a
2848  0016 5b02          	addw	sp,#2
2849  0018 81            	ret
2873                     ; 844 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2873                     ; 845 {
2874                     .text:	section	.text,new
2875  0000               _TIM3_GetPrescaler:
2879                     ; 847   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2881  0000 c6532a        	ld	a,21290
2884  0003 81            	ret
3005                     ; 861 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3005                     ; 862 {
3006                     .text:	section	.text,new
3007  0000               _TIM3_GetFlagStatus:
3009  0000 89            	pushw	x
3010  0001 89            	pushw	x
3011       00000002      OFST:	set	2
3014                     ; 863   FlagStatus bitstatus = RESET;
3016                     ; 864   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3020                     ; 867   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3022                     ; 869   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3024  0002 9f            	ld	a,xl
3025  0003 c45322        	and	a,21282
3026  0006 6b01          	ld	(OFST-1,sp),a
3028                     ; 870   tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3030  0008 7b03          	ld	a,(OFST+1,sp)
3031  000a 6b02          	ld	(OFST+0,sp),a
3033                     ; 872   if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3035  000c c65323        	ld	a,21283
3036  000f 1402          	and	a,(OFST+0,sp)
3037  0011 1a01          	or	a,(OFST-1,sp)
3038  0013 2706          	jreq	L3341
3039                     ; 874     bitstatus = SET;
3041  0015 a601          	ld	a,#1
3042  0017 6b02          	ld	(OFST+0,sp),a
3045  0019 2002          	jra	L5341
3046  001b               L3341:
3047                     ; 878     bitstatus = RESET;
3049  001b 0f02          	clr	(OFST+0,sp)
3051  001d               L5341:
3052                     ; 880   return (FlagStatus)bitstatus;
3054  001d 7b02          	ld	a,(OFST+0,sp)
3057  001f 5b04          	addw	sp,#4
3058  0021 81            	ret
3093                     ; 894 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3093                     ; 895 {
3094                     .text:	section	.text,new
3095  0000               _TIM3_ClearFlag:
3097  0000 89            	pushw	x
3098       00000000      OFST:	set	0
3101                     ; 897   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3103                     ; 900   TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3105  0001 9f            	ld	a,xl
3106  0002 43            	cpl	a
3107  0003 c75322        	ld	21282,a
3108                     ; 901   TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3110  0006 7b01          	ld	a,(OFST+1,sp)
3111  0008 43            	cpl	a
3112  0009 c75323        	ld	21283,a
3113                     ; 902 }
3116  000c 85            	popw	x
3117  000d 81            	ret
3177                     ; 913 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3177                     ; 914 {
3178                     .text:	section	.text,new
3179  0000               _TIM3_GetITStatus:
3181  0000 88            	push	a
3182  0001 89            	pushw	x
3183       00000002      OFST:	set	2
3186                     ; 915   ITStatus bitstatus = RESET;
3188                     ; 916   uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
3192                     ; 919   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3194                     ; 921   TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
3196  0002 c45322        	and	a,21282
3197  0005 6b01          	ld	(OFST-1,sp),a
3199                     ; 923   TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
3201  0007 c65321        	ld	a,21281
3202  000a 1403          	and	a,(OFST+1,sp)
3203  000c 6b02          	ld	(OFST+0,sp),a
3205                     ; 925   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
3207  000e 0d01          	tnz	(OFST-1,sp)
3208  0010 270a          	jreq	L3051
3210  0012 0d02          	tnz	(OFST+0,sp)
3211  0014 2706          	jreq	L3051
3212                     ; 927     bitstatus = SET;
3214  0016 a601          	ld	a,#1
3215  0018 6b02          	ld	(OFST+0,sp),a
3218  001a 2002          	jra	L5051
3219  001c               L3051:
3220                     ; 931     bitstatus = RESET;
3222  001c 0f02          	clr	(OFST+0,sp)
3224  001e               L5051:
3225                     ; 933   return (ITStatus)(bitstatus);
3227  001e 7b02          	ld	a,(OFST+0,sp)
3230  0020 5b03          	addw	sp,#3
3231  0022 81            	ret
3267                     ; 945 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3267                     ; 946 {
3268                     .text:	section	.text,new
3269  0000               _TIM3_ClearITPendingBit:
3273                     ; 948   assert_param(IS_TIM3_IT_OK(TIM3_IT));
3275                     ; 951   TIM3->SR1 = (uint8_t)(~TIM3_IT);
3277  0000 43            	cpl	a
3278  0001 c75322        	ld	21282,a
3279                     ; 952 }
3282  0004 81            	ret
3328                     ; 970 static void TI1_Config(uint8_t TIM3_ICPolarity,
3328                     ; 971                        uint8_t TIM3_ICSelection,
3328                     ; 972                        uint8_t TIM3_ICFilter)
3328                     ; 973 {
3329                     .text:	section	.text,new
3330  0000               L3_TI1_Config:
3332  0000 89            	pushw	x
3333  0001 88            	push	a
3334       00000001      OFST:	set	1
3337                     ; 975   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3339  0002 72115327      	bres	21287,#0
3340                     ; 978   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
3342  0006 7b06          	ld	a,(OFST+5,sp)
3343  0008 97            	ld	xl,a
3344  0009 a610          	ld	a,#16
3345  000b 42            	mul	x,a
3346  000c 9f            	ld	a,xl
3347  000d 1a03          	or	a,(OFST+2,sp)
3348  000f 6b01          	ld	(OFST+0,sp),a
3350  0011 c65325        	ld	a,21285
3351  0014 a40c          	and	a,#12
3352  0016 1a01          	or	a,(OFST+0,sp)
3353  0018 c75325        	ld	21285,a
3354                     ; 981   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3356  001b 0d02          	tnz	(OFST+1,sp)
3357  001d 2706          	jreq	L5451
3358                     ; 983     TIM3->CCER1 |= TIM3_CCER1_CC1P;
3360  001f 72125327      	bset	21287,#1
3362  0023 2004          	jra	L7451
3363  0025               L5451:
3364                     ; 987     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
3366  0025 72135327      	bres	21287,#1
3367  0029               L7451:
3368                     ; 990   TIM3->CCER1 |= TIM3_CCER1_CC1E;
3370  0029 72105327      	bset	21287,#0
3371                     ; 991 }
3374  002d 5b03          	addw	sp,#3
3375  002f 81            	ret
3421                     ; 1009 static void TI2_Config(uint8_t TIM3_ICPolarity,
3421                     ; 1010                        uint8_t TIM3_ICSelection,
3421                     ; 1011                        uint8_t TIM3_ICFilter)
3421                     ; 1012 {
3422                     .text:	section	.text,new
3423  0000               L5_TI2_Config:
3425  0000 89            	pushw	x
3426  0001 88            	push	a
3427       00000001      OFST:	set	1
3430                     ; 1014   TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
3432  0002 72195327      	bres	21287,#4
3433                     ; 1017   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
3433                     ; 1018                                                               TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
3433                     ; 1019                                                                                                 ((uint8_t)( TIM3_ICFilter << 4))));
3435  0006 7b06          	ld	a,(OFST+5,sp)
3436  0008 97            	ld	xl,a
3437  0009 a610          	ld	a,#16
3438  000b 42            	mul	x,a
3439  000c 9f            	ld	a,xl
3440  000d 1a03          	or	a,(OFST+2,sp)
3441  000f 6b01          	ld	(OFST+0,sp),a
3443  0011 c65326        	ld	a,21286
3444  0014 a40c          	and	a,#12
3445  0016 1a01          	or	a,(OFST+0,sp)
3446  0018 c75326        	ld	21286,a
3447                     ; 1022   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3449  001b 0d02          	tnz	(OFST+1,sp)
3450  001d 2706          	jreq	L1751
3451                     ; 1024     TIM3->CCER1 |= TIM3_CCER1_CC2P;
3453  001f 721a5327      	bset	21287,#5
3455  0023 2004          	jra	L3751
3456  0025               L1751:
3457                     ; 1028     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
3459  0025 721b5327      	bres	21287,#5
3460  0029               L3751:
3461                     ; 1032   TIM3->CCER1 |= TIM3_CCER1_CC2E;
3463  0029 72185327      	bset	21287,#4
3464                     ; 1033 }
3467  002d 5b03          	addw	sp,#3
3468  002f 81            	ret
3481                     	xdef	_TIM3_ClearITPendingBit
3482                     	xdef	_TIM3_GetITStatus
3483                     	xdef	_TIM3_ClearFlag
3484                     	xdef	_TIM3_GetFlagStatus
3485                     	xdef	_TIM3_GetPrescaler
3486                     	xdef	_TIM3_GetCounter
3487                     	xdef	_TIM3_GetCapture2
3488                     	xdef	_TIM3_GetCapture1
3489                     	xdef	_TIM3_SetIC2Prescaler
3490                     	xdef	_TIM3_SetIC1Prescaler
3491                     	xdef	_TIM3_SetCompare2
3492                     	xdef	_TIM3_SetCompare1
3493                     	xdef	_TIM3_SetAutoreload
3494                     	xdef	_TIM3_SetCounter
3495                     	xdef	_TIM3_SelectOCxM
3496                     	xdef	_TIM3_CCxCmd
3497                     	xdef	_TIM3_OC2PolarityConfig
3498                     	xdef	_TIM3_OC1PolarityConfig
3499                     	xdef	_TIM3_GenerateEvent
3500                     	xdef	_TIM3_OC2PreloadConfig
3501                     	xdef	_TIM3_OC1PreloadConfig
3502                     	xdef	_TIM3_ARRPreloadConfig
3503                     	xdef	_TIM3_ForcedOC2Config
3504                     	xdef	_TIM3_ForcedOC1Config
3505                     	xdef	_TIM3_PrescalerConfig
3506                     	xdef	_TIM3_SelectOnePulseMode
3507                     	xdef	_TIM3_UpdateRequestConfig
3508                     	xdef	_TIM3_UpdateDisableConfig
3509                     	xdef	_TIM3_ITConfig
3510                     	xdef	_TIM3_Cmd
3511                     	xdef	_TIM3_PWMIConfig
3512                     	xdef	_TIM3_ICInit
3513                     	xdef	_TIM3_OC2Init
3514                     	xdef	_TIM3_OC1Init
3515                     	xdef	_TIM3_TimeBaseInit
3516                     	xdef	_TIM3_DeInit
3535                     	end
