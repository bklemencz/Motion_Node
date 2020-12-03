   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 52 void TIM2_DeInit(void)
  43                     ; 53 {
  45                     .text:	section	.text,new
  46  0000               _TIM2_DeInit:
  50                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  52  0000 725f5300      	clr	21248
  53                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  55  0004 725f5301      	clr	21249
  56                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  58  0008 725f5303      	clr	21251
  59                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  61  000c 725f5308      	clr	21256
  62                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  64  0010 725f5309      	clr	21257
  65                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  67  0014 725f5308      	clr	21256
  68                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  70  0018 725f5309      	clr	21257
  71                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  73  001c 725f5305      	clr	21253
  74                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  76  0020 725f5306      	clr	21254
  77                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  79  0024 725f5307      	clr	21255
  80                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  82  0028 725f530a      	clr	21258
  83                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  85  002c 725f530b      	clr	21259
  86                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  88  0030 725f530c      	clr	21260
  89                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  91  0034 35ff530d      	mov	21261,#255
  92                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  94  0038 35ff530e      	mov	21262,#255
  95                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  97  003c 725f530f      	clr	21263
  98                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 100  0040 725f5310      	clr	21264
 101                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 103  0044 725f5311      	clr	21265
 104                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 106  0048 725f5312      	clr	21266
 107                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 109  004c 725f5313      	clr	21267
 110                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 112  0050 725f5314      	clr	21268
 113                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 115  0054 725f5302      	clr	21250
 116                     ; 81 }
 119  0058 81            	ret
 285                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 285                     ; 90                         uint16_t TIM2_Period)
 285                     ; 91 {
 286                     .text:	section	.text,new
 287  0000               _TIM2_TimeBaseInit:
 289  0000 88            	push	a
 290       00000000      OFST:	set	0
 293                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 295  0001 c7530c        	ld	21260,a
 296                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 298  0004 7b04          	ld	a,(OFST+4,sp)
 299  0006 c7530d        	ld	21261,a
 300                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 302  0009 7b05          	ld	a,(OFST+5,sp)
 303  000b c7530e        	ld	21262,a
 304                     ; 97 }
 307  000e 84            	pop	a
 308  000f 81            	ret
 463                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 463                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 463                     ; 110                   uint16_t TIM2_Pulse,
 463                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 463                     ; 112 {
 464                     .text:	section	.text,new
 465  0000               _TIM2_OC1Init:
 467  0000 89            	pushw	x
 468  0001 88            	push	a
 469       00000001      OFST:	set	1
 472                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 474                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 476                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 478                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 480  0002 c65308        	ld	a,21256
 481  0005 a4fc          	and	a,#252
 482  0007 c75308        	ld	21256,a
 483                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 483                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 485  000a 7b08          	ld	a,(OFST+7,sp)
 486  000c a402          	and	a,#2
 487  000e 6b01          	ld	(OFST+0,sp),a
 489  0010 9f            	ld	a,xl
 490  0011 a401          	and	a,#1
 491  0013 1a01          	or	a,(OFST+0,sp)
 492  0015 ca5308        	or	a,21256
 493  0018 c75308        	ld	21256,a
 494                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 494                     ; 126                           (uint8_t)TIM2_OCMode);
 496  001b c65305        	ld	a,21253
 497  001e a48f          	and	a,#143
 498  0020 1a02          	or	a,(OFST+1,sp)
 499  0022 c75305        	ld	21253,a
 500                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 502  0025 7b06          	ld	a,(OFST+5,sp)
 503  0027 c7530f        	ld	21263,a
 504                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 506  002a 7b07          	ld	a,(OFST+6,sp)
 507  002c c75310        	ld	21264,a
 508                     ; 131 }
 511  002f 5b03          	addw	sp,#3
 512  0031 81            	ret
 574                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 574                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 574                     ; 144                   uint16_t TIM2_Pulse,
 574                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 574                     ; 146 {
 575                     .text:	section	.text,new
 576  0000               _TIM2_OC2Init:
 578  0000 89            	pushw	x
 579  0001 88            	push	a
 580       00000001      OFST:	set	1
 583                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 585                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 587                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 589                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 591  0002 c65308        	ld	a,21256
 592  0005 a4cf          	and	a,#207
 593  0007 c75308        	ld	21256,a
 594                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 594                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 596  000a 7b08          	ld	a,(OFST+7,sp)
 597  000c a420          	and	a,#32
 598  000e 6b01          	ld	(OFST+0,sp),a
 600  0010 9f            	ld	a,xl
 601  0011 a410          	and	a,#16
 602  0013 1a01          	or	a,(OFST+0,sp)
 603  0015 ca5308        	or	a,21256
 604  0018 c75308        	ld	21256,a
 605                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 605                     ; 162                           (uint8_t)TIM2_OCMode);
 607  001b c65306        	ld	a,21254
 608  001e a48f          	and	a,#143
 609  0020 1a02          	or	a,(OFST+1,sp)
 610  0022 c75306        	ld	21254,a
 611                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 613  0025 7b06          	ld	a,(OFST+5,sp)
 614  0027 c75311        	ld	21265,a
 615                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 617  002a 7b07          	ld	a,(OFST+6,sp)
 618  002c c75312        	ld	21266,a
 619                     ; 168 }
 622  002f 5b03          	addw	sp,#3
 623  0031 81            	ret
 685                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 685                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 685                     ; 181                   uint16_t TIM2_Pulse,
 685                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 685                     ; 183 {
 686                     .text:	section	.text,new
 687  0000               _TIM2_OC3Init:
 689  0000 89            	pushw	x
 690  0001 88            	push	a
 691       00000001      OFST:	set	1
 694                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 696                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 698                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 700                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 702  0002 c65309        	ld	a,21257
 703  0005 a4fc          	and	a,#252
 704  0007 c75309        	ld	21257,a
 705                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 705                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 707  000a 7b08          	ld	a,(OFST+7,sp)
 708  000c a402          	and	a,#2
 709  000e 6b01          	ld	(OFST+0,sp),a
 711  0010 9f            	ld	a,xl
 712  0011 a401          	and	a,#1
 713  0013 1a01          	or	a,(OFST+0,sp)
 714  0015 ca5309        	or	a,21257
 715  0018 c75309        	ld	21257,a
 716                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 716                     ; 196                           (uint8_t)TIM2_OCMode);
 718  001b c65307        	ld	a,21255
 719  001e a48f          	and	a,#143
 720  0020 1a02          	or	a,(OFST+1,sp)
 721  0022 c75307        	ld	21255,a
 722                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 724  0025 7b06          	ld	a,(OFST+5,sp)
 725  0027 c75313        	ld	21267,a
 726                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 728  002a 7b07          	ld	a,(OFST+6,sp)
 729  002c c75314        	ld	21268,a
 730                     ; 201 }
 733  002f 5b03          	addw	sp,#3
 734  0031 81            	ret
 925                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 925                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 925                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 925                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 925                     ; 216                  uint8_t TIM2_ICFilter)
 925                     ; 217 {
 926                     .text:	section	.text,new
 927  0000               _TIM2_ICInit:
 929  0000 89            	pushw	x
 930       00000000      OFST:	set	0
 933                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 935                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 937                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 939                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 941                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 943                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 945  0001 9e            	ld	a,xh
 946  0002 4d            	tnz	a
 947  0003 2614          	jrne	L763
 948                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 948                     ; 229                (uint8_t)TIM2_ICSelection,
 948                     ; 230                (uint8_t)TIM2_ICFilter);
 950  0005 7b07          	ld	a,(OFST+7,sp)
 951  0007 88            	push	a
 952  0008 7b06          	ld	a,(OFST+6,sp)
 953  000a 97            	ld	xl,a
 954  000b 7b03          	ld	a,(OFST+3,sp)
 955  000d 95            	ld	xh,a
 956  000e cd0000        	call	L3_TI1_Config
 958  0011 84            	pop	a
 959                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 961  0012 7b06          	ld	a,(OFST+6,sp)
 962  0014 cd0000        	call	_TIM2_SetIC1Prescaler
 965  0017 202c          	jra	L173
 966  0019               L763:
 967                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 969  0019 7b01          	ld	a,(OFST+1,sp)
 970  001b a101          	cp	a,#1
 971  001d 2614          	jrne	L373
 972                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 972                     ; 239                (uint8_t)TIM2_ICSelection,
 972                     ; 240                (uint8_t)TIM2_ICFilter);
 974  001f 7b07          	ld	a,(OFST+7,sp)
 975  0021 88            	push	a
 976  0022 7b06          	ld	a,(OFST+6,sp)
 977  0024 97            	ld	xl,a
 978  0025 7b03          	ld	a,(OFST+3,sp)
 979  0027 95            	ld	xh,a
 980  0028 cd0000        	call	L5_TI2_Config
 982  002b 84            	pop	a
 983                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 985  002c 7b06          	ld	a,(OFST+6,sp)
 986  002e cd0000        	call	_TIM2_SetIC2Prescaler
 989  0031 2012          	jra	L173
 990  0033               L373:
 991                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
 991                     ; 249                (uint8_t)TIM2_ICSelection,
 991                     ; 250                (uint8_t)TIM2_ICFilter);
 993  0033 7b07          	ld	a,(OFST+7,sp)
 994  0035 88            	push	a
 995  0036 7b06          	ld	a,(OFST+6,sp)
 996  0038 97            	ld	xl,a
 997  0039 7b03          	ld	a,(OFST+3,sp)
 998  003b 95            	ld	xh,a
 999  003c cd0000        	call	L7_TI3_Config
1001  003f 84            	pop	a
1002                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1004  0040 7b06          	ld	a,(OFST+6,sp)
1005  0042 cd0000        	call	_TIM2_SetIC3Prescaler
1007  0045               L173:
1008                     ; 255 }
1011  0045 85            	popw	x
1012  0046 81            	ret
1102                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1102                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1102                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1102                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1102                     ; 270                      uint8_t TIM2_ICFilter)
1102                     ; 271 {
1103                     .text:	section	.text,new
1104  0000               _TIM2_PWMIConfig:
1106  0000 89            	pushw	x
1107  0001 89            	pushw	x
1108       00000002      OFST:	set	2
1111                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1113                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1115                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1117                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1119                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1121                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1123                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1125  0002 9f            	ld	a,xl
1126  0003 a144          	cp	a,#68
1127  0005 2706          	jreq	L734
1128                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1130  0007 a644          	ld	a,#68
1131  0009 6b01          	ld	(OFST-1,sp),a
1134  000b 2002          	jra	L144
1135  000d               L734:
1136                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1138  000d 0f01          	clr	(OFST-1,sp)
1140  000f               L144:
1141                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1143  000f 7b07          	ld	a,(OFST+5,sp)
1144  0011 a101          	cp	a,#1
1145  0013 2606          	jrne	L344
1146                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1148  0015 a602          	ld	a,#2
1149  0017 6b02          	ld	(OFST+0,sp),a
1152  0019 2004          	jra	L544
1153  001b               L344:
1154                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1156  001b a601          	ld	a,#1
1157  001d 6b02          	ld	(OFST+0,sp),a
1159  001f               L544:
1160                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1162  001f 0d03          	tnz	(OFST+1,sp)
1163  0021 2626          	jrne	L744
1164                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1164                     ; 305                (uint8_t)TIM2_ICFilter);
1166  0023 7b09          	ld	a,(OFST+7,sp)
1167  0025 88            	push	a
1168  0026 7b08          	ld	a,(OFST+6,sp)
1169  0028 97            	ld	xl,a
1170  0029 7b05          	ld	a,(OFST+3,sp)
1171  002b 95            	ld	xh,a
1172  002c cd0000        	call	L3_TI1_Config
1174  002f 84            	pop	a
1175                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1177  0030 7b08          	ld	a,(OFST+6,sp)
1178  0032 cd0000        	call	_TIM2_SetIC1Prescaler
1180                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1182  0035 7b09          	ld	a,(OFST+7,sp)
1183  0037 88            	push	a
1184  0038 7b03          	ld	a,(OFST+1,sp)
1185  003a 97            	ld	xl,a
1186  003b 7b02          	ld	a,(OFST+0,sp)
1187  003d 95            	ld	xh,a
1188  003e cd0000        	call	L5_TI2_Config
1190  0041 84            	pop	a
1191                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1193  0042 7b08          	ld	a,(OFST+6,sp)
1194  0044 cd0000        	call	_TIM2_SetIC2Prescaler
1197  0047 2024          	jra	L154
1198  0049               L744:
1199                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1199                     ; 320                (uint8_t)TIM2_ICFilter);
1201  0049 7b09          	ld	a,(OFST+7,sp)
1202  004b 88            	push	a
1203  004c 7b08          	ld	a,(OFST+6,sp)
1204  004e 97            	ld	xl,a
1205  004f 7b05          	ld	a,(OFST+3,sp)
1206  0051 95            	ld	xh,a
1207  0052 cd0000        	call	L5_TI2_Config
1209  0055 84            	pop	a
1210                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1212  0056 7b08          	ld	a,(OFST+6,sp)
1213  0058 cd0000        	call	_TIM2_SetIC2Prescaler
1215                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1217  005b 7b09          	ld	a,(OFST+7,sp)
1218  005d 88            	push	a
1219  005e 7b03          	ld	a,(OFST+1,sp)
1220  0060 97            	ld	xl,a
1221  0061 7b02          	ld	a,(OFST+0,sp)
1222  0063 95            	ld	xh,a
1223  0064 cd0000        	call	L3_TI1_Config
1225  0067 84            	pop	a
1226                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1228  0068 7b08          	ld	a,(OFST+6,sp)
1229  006a cd0000        	call	_TIM2_SetIC1Prescaler
1231  006d               L154:
1232                     ; 331 }
1235  006d 5b04          	addw	sp,#4
1236  006f 81            	ret
1291                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1291                     ; 340 {
1292                     .text:	section	.text,new
1293  0000               _TIM2_Cmd:
1297                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1299                     ; 345   if (NewState != DISABLE)
1301  0000 4d            	tnz	a
1302  0001 2706          	jreq	L105
1303                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1305  0003 72105300      	bset	21248,#0
1307  0007 2004          	jra	L305
1308  0009               L105:
1309                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1311  0009 72115300      	bres	21248,#0
1312  000d               L305:
1313                     ; 353 }
1316  000d 81            	ret
1395                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1395                     ; 369 {
1396                     .text:	section	.text,new
1397  0000               _TIM2_ITConfig:
1399  0000 89            	pushw	x
1400       00000000      OFST:	set	0
1403                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1405                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1407                     ; 374   if (NewState != DISABLE)
1409  0001 9f            	ld	a,xl
1410  0002 4d            	tnz	a
1411  0003 2709          	jreq	L345
1412                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1414  0005 9e            	ld	a,xh
1415  0006 ca5301        	or	a,21249
1416  0009 c75301        	ld	21249,a
1418  000c 2009          	jra	L545
1419  000e               L345:
1420                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1422  000e 7b01          	ld	a,(OFST+1,sp)
1423  0010 43            	cpl	a
1424  0011 c45301        	and	a,21249
1425  0014 c75301        	ld	21249,a
1426  0017               L545:
1427                     ; 384 }
1430  0017 85            	popw	x
1431  0018 81            	ret
1467                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1467                     ; 393 {
1468                     .text:	section	.text,new
1469  0000               _TIM2_UpdateDisableConfig:
1473                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1475                     ; 398   if (NewState != DISABLE)
1477  0000 4d            	tnz	a
1478  0001 2706          	jreq	L565
1479                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1481  0003 72125300      	bset	21248,#1
1483  0007 2004          	jra	L765
1484  0009               L565:
1485                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1487  0009 72135300      	bres	21248,#1
1488  000d               L765:
1489                     ; 406 }
1492  000d 81            	ret
1550                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1550                     ; 417 {
1551                     .text:	section	.text,new
1552  0000               _TIM2_UpdateRequestConfig:
1556                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1558                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1560  0000 4d            	tnz	a
1561  0001 2706          	jreq	L716
1562                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1564  0003 72145300      	bset	21248,#2
1566  0007 2004          	jra	L126
1567  0009               L716:
1568                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1570  0009 72155300      	bres	21248,#2
1571  000d               L126:
1572                     ; 430 }
1575  000d 81            	ret
1632                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1632                     ; 441 {
1633                     .text:	section	.text,new
1634  0000               _TIM2_SelectOnePulseMode:
1638                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1640                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1642  0000 4d            	tnz	a
1643  0001 2706          	jreq	L156
1644                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1646  0003 72165300      	bset	21248,#3
1648  0007 2004          	jra	L356
1649  0009               L156:
1650                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1652  0009 72175300      	bres	21248,#3
1653  000d               L356:
1654                     ; 454 }
1657  000d 81            	ret
1725                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1725                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1725                     ; 486 {
1726                     .text:	section	.text,new
1727  0000               _TIM2_PrescalerConfig:
1731                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1733                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1735                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1737  0000 9e            	ld	a,xh
1738  0001 c7530c        	ld	21260,a
1739                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1741  0004 9f            	ld	a,xl
1742  0005 c75304        	ld	21252,a
1743                     ; 496 }
1746  0008 81            	ret
1804                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1804                     ; 508 {
1805                     .text:	section	.text,new
1806  0000               _TIM2_ForcedOC1Config:
1808  0000 88            	push	a
1809       00000000      OFST:	set	0
1812                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1814                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1814                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1816  0001 c65305        	ld	a,21253
1817  0004 a48f          	and	a,#143
1818  0006 1a01          	or	a,(OFST+1,sp)
1819  0008 c75305        	ld	21253,a
1820                     ; 515 }
1823  000b 84            	pop	a
1824  000c 81            	ret
1860                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1860                     ; 527 {
1861                     .text:	section	.text,new
1862  0000               _TIM2_ForcedOC2Config:
1864  0000 88            	push	a
1865       00000000      OFST:	set	0
1868                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1870                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1870                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1872  0001 c65306        	ld	a,21254
1873  0004 a48f          	and	a,#143
1874  0006 1a01          	or	a,(OFST+1,sp)
1875  0008 c75306        	ld	21254,a
1876                     ; 534 }
1879  000b 84            	pop	a
1880  000c 81            	ret
1916                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1916                     ; 546 {
1917                     .text:	section	.text,new
1918  0000               _TIM2_ForcedOC3Config:
1920  0000 88            	push	a
1921       00000000      OFST:	set	0
1924                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1926                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1926                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1928  0001 c65307        	ld	a,21255
1929  0004 a48f          	and	a,#143
1930  0006 1a01          	or	a,(OFST+1,sp)
1931  0008 c75307        	ld	21255,a
1932                     ; 553 }
1935  000b 84            	pop	a
1936  000c 81            	ret
1972                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1972                     ; 562 {
1973                     .text:	section	.text,new
1974  0000               _TIM2_ARRPreloadConfig:
1978                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1980                     ; 567   if (NewState != DISABLE)
1982  0000 4d            	tnz	a
1983  0001 2706          	jreq	L7001
1984                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
1986  0003 721e5300      	bset	21248,#7
1988  0007 2004          	jra	L1101
1989  0009               L7001:
1990                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
1992  0009 721f5300      	bres	21248,#7
1993  000d               L1101:
1994                     ; 575 }
1997  000d 81            	ret
2033                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2033                     ; 584 {
2034                     .text:	section	.text,new
2035  0000               _TIM2_OC1PreloadConfig:
2039                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2041                     ; 589   if (NewState != DISABLE)
2043  0000 4d            	tnz	a
2044  0001 2706          	jreq	L1301
2045                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2047  0003 72165305      	bset	21253,#3
2049  0007 2004          	jra	L3301
2050  0009               L1301:
2051                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2053  0009 72175305      	bres	21253,#3
2054  000d               L3301:
2055                     ; 597 }
2058  000d 81            	ret
2094                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2094                     ; 606 {
2095                     .text:	section	.text,new
2096  0000               _TIM2_OC2PreloadConfig:
2100                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2102                     ; 611   if (NewState != DISABLE)
2104  0000 4d            	tnz	a
2105  0001 2706          	jreq	L3501
2106                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2108  0003 72165306      	bset	21254,#3
2110  0007 2004          	jra	L5501
2111  0009               L3501:
2112                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2114  0009 72175306      	bres	21254,#3
2115  000d               L5501:
2116                     ; 619 }
2119  000d 81            	ret
2155                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2155                     ; 628 {
2156                     .text:	section	.text,new
2157  0000               _TIM2_OC3PreloadConfig:
2161                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2163                     ; 633   if (NewState != DISABLE)
2165  0000 4d            	tnz	a
2166  0001 2706          	jreq	L5701
2167                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2169  0003 72165307      	bset	21255,#3
2171  0007 2004          	jra	L7701
2172  0009               L5701:
2173                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2175  0009 72175307      	bres	21255,#3
2176  000d               L7701:
2177                     ; 641 }
2180  000d 81            	ret
2253                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2253                     ; 654 {
2254                     .text:	section	.text,new
2255  0000               _TIM2_GenerateEvent:
2259                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2261                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2263  0000 c75304        	ld	21252,a
2264                     ; 660 }
2267  0003 81            	ret
2303                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2303                     ; 671 {
2304                     .text:	section	.text,new
2305  0000               _TIM2_OC1PolarityConfig:
2309                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2311                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2313  0000 4d            	tnz	a
2314  0001 2706          	jreq	L1511
2315                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2317  0003 72125308      	bset	21256,#1
2319  0007 2004          	jra	L3511
2320  0009               L1511:
2321                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2323  0009 72135308      	bres	21256,#1
2324  000d               L3511:
2325                     ; 684 }
2328  000d 81            	ret
2364                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2364                     ; 695 {
2365                     .text:	section	.text,new
2366  0000               _TIM2_OC2PolarityConfig:
2370                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2372                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2374  0000 4d            	tnz	a
2375  0001 2706          	jreq	L3711
2376                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2378  0003 721a5308      	bset	21256,#5
2380  0007 2004          	jra	L5711
2381  0009               L3711:
2382                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2384  0009 721b5308      	bres	21256,#5
2385  000d               L5711:
2386                     ; 708 }
2389  000d 81            	ret
2425                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2425                     ; 719 {
2426                     .text:	section	.text,new
2427  0000               _TIM2_OC3PolarityConfig:
2431                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2433                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2435  0000 4d            	tnz	a
2436  0001 2706          	jreq	L5121
2437                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2439  0003 72125309      	bset	21257,#1
2441  0007 2004          	jra	L7121
2442  0009               L5121:
2443                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2445  0009 72135309      	bres	21257,#1
2446  000d               L7121:
2447                     ; 732 }
2450  000d 81            	ret
2495                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2495                     ; 746 {
2496                     .text:	section	.text,new
2497  0000               _TIM2_CCxCmd:
2499  0000 89            	pushw	x
2500       00000000      OFST:	set	0
2503                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2505                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2507                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2509  0001 9e            	ld	a,xh
2510  0002 4d            	tnz	a
2511  0003 2610          	jrne	L3421
2512                     ; 754     if (NewState != DISABLE)
2514  0005 9f            	ld	a,xl
2515  0006 4d            	tnz	a
2516  0007 2706          	jreq	L5421
2517                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2519  0009 72105308      	bset	21256,#0
2521  000d 202a          	jra	L1521
2522  000f               L5421:
2523                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2525  000f 72115308      	bres	21256,#0
2526  0013 2024          	jra	L1521
2527  0015               L3421:
2528                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2530  0015 7b01          	ld	a,(OFST+1,sp)
2531  0017 a101          	cp	a,#1
2532  0019 2610          	jrne	L3521
2533                     ; 767     if (NewState != DISABLE)
2535  001b 0d02          	tnz	(OFST+2,sp)
2536  001d 2706          	jreq	L5521
2537                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2539  001f 72185308      	bset	21256,#4
2541  0023 2014          	jra	L1521
2542  0025               L5521:
2543                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2545  0025 72195308      	bres	21256,#4
2546  0029 200e          	jra	L1521
2547  002b               L3521:
2548                     ; 779     if (NewState != DISABLE)
2550  002b 0d02          	tnz	(OFST+2,sp)
2551  002d 2706          	jreq	L3621
2552                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2554  002f 72105309      	bset	21257,#0
2556  0033 2004          	jra	L1521
2557  0035               L3621:
2558                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2560  0035 72115309      	bres	21257,#0
2561  0039               L1521:
2562                     ; 788 }
2565  0039 85            	popw	x
2566  003a 81            	ret
2611                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2611                     ; 811 {
2612                     .text:	section	.text,new
2613  0000               _TIM2_SelectOCxM:
2615  0000 89            	pushw	x
2616       00000000      OFST:	set	0
2619                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2621                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2623                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2625  0001 9e            	ld	a,xh
2626  0002 4d            	tnz	a
2627  0003 2610          	jrne	L1131
2628                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2630  0005 72115308      	bres	21256,#0
2631                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2631                     ; 823                             | (uint8_t)TIM2_OCMode);
2633  0009 c65305        	ld	a,21253
2634  000c a48f          	and	a,#143
2635  000e 1a02          	or	a,(OFST+2,sp)
2636  0010 c75305        	ld	21253,a
2638  0013 2024          	jra	L3131
2639  0015               L1131:
2640                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2642  0015 7b01          	ld	a,(OFST+1,sp)
2643  0017 a101          	cp	a,#1
2644  0019 2610          	jrne	L5131
2645                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2647  001b 72195308      	bres	21256,#4
2648                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2648                     ; 832                             | (uint8_t)TIM2_OCMode);
2650  001f c65306        	ld	a,21254
2651  0022 a48f          	and	a,#143
2652  0024 1a02          	or	a,(OFST+2,sp)
2653  0026 c75306        	ld	21254,a
2655  0029 200e          	jra	L3131
2656  002b               L5131:
2657                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2659  002b 72115309      	bres	21257,#0
2660                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2660                     ; 841                             | (uint8_t)TIM2_OCMode);
2662  002f c65307        	ld	a,21255
2663  0032 a48f          	and	a,#143
2664  0034 1a02          	or	a,(OFST+2,sp)
2665  0036 c75307        	ld	21255,a
2666  0039               L3131:
2667                     ; 843 }
2670  0039 85            	popw	x
2671  003a 81            	ret
2703                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2703                     ; 852 {
2704                     .text:	section	.text,new
2705  0000               _TIM2_SetCounter:
2709                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2711  0000 9e            	ld	a,xh
2712  0001 c7530a        	ld	21258,a
2713                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2715  0004 9f            	ld	a,xl
2716  0005 c7530b        	ld	21259,a
2717                     ; 856 }
2720  0008 81            	ret
2752                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2752                     ; 865 {
2753                     .text:	section	.text,new
2754  0000               _TIM2_SetAutoreload:
2758                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2760  0000 9e            	ld	a,xh
2761  0001 c7530d        	ld	21261,a
2762                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2764  0004 9f            	ld	a,xl
2765  0005 c7530e        	ld	21262,a
2766                     ; 869 }
2769  0008 81            	ret
2801                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2801                     ; 878 {
2802                     .text:	section	.text,new
2803  0000               _TIM2_SetCompare1:
2807                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2809  0000 9e            	ld	a,xh
2810  0001 c7530f        	ld	21263,a
2811                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2813  0004 9f            	ld	a,xl
2814  0005 c75310        	ld	21264,a
2815                     ; 882 }
2818  0008 81            	ret
2850                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2850                     ; 891 {
2851                     .text:	section	.text,new
2852  0000               _TIM2_SetCompare2:
2856                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2858  0000 9e            	ld	a,xh
2859  0001 c75311        	ld	21265,a
2860                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2862  0004 9f            	ld	a,xl
2863  0005 c75312        	ld	21266,a
2864                     ; 895 }
2867  0008 81            	ret
2899                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2899                     ; 904 {
2900                     .text:	section	.text,new
2901  0000               _TIM2_SetCompare3:
2905                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2907  0000 9e            	ld	a,xh
2908  0001 c75313        	ld	21267,a
2909                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2911  0004 9f            	ld	a,xl
2912  0005 c75314        	ld	21268,a
2913                     ; 908 }
2916  0008 81            	ret
2952                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2952                     ; 921 {
2953                     .text:	section	.text,new
2954  0000               _TIM2_SetIC1Prescaler:
2956  0000 88            	push	a
2957       00000000      OFST:	set	0
2960                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2962                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2962                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2964  0001 c65305        	ld	a,21253
2965  0004 a4f3          	and	a,#243
2966  0006 1a01          	or	a,(OFST+1,sp)
2967  0008 c75305        	ld	21253,a
2968                     ; 928 }
2971  000b 84            	pop	a
2972  000c 81            	ret
3008                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3008                     ; 941 {
3009                     .text:	section	.text,new
3010  0000               _TIM2_SetIC2Prescaler:
3012  0000 88            	push	a
3013       00000000      OFST:	set	0
3016                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3018                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3018                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3020  0001 c65306        	ld	a,21254
3021  0004 a4f3          	and	a,#243
3022  0006 1a01          	or	a,(OFST+1,sp)
3023  0008 c75306        	ld	21254,a
3024                     ; 948 }
3027  000b 84            	pop	a
3028  000c 81            	ret
3064                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3064                     ; 961 {
3065                     .text:	section	.text,new
3066  0000               _TIM2_SetIC3Prescaler:
3068  0000 88            	push	a
3069       00000000      OFST:	set	0
3072                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3074                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3074                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3076  0001 c65307        	ld	a,21255
3077  0004 a4f3          	and	a,#243
3078  0006 1a01          	or	a,(OFST+1,sp)
3079  0008 c75307        	ld	21255,a
3080                     ; 968 }
3083  000b 84            	pop	a
3084  000c 81            	ret
3130                     ; 975 uint16_t TIM2_GetCapture1(void)
3130                     ; 976 {
3131                     .text:	section	.text,new
3132  0000               _TIM2_GetCapture1:
3134  0000 5204          	subw	sp,#4
3135       00000004      OFST:	set	4
3138                     ; 978   uint16_t tmpccr1 = 0;
3140                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3144                     ; 981   tmpccr1h = TIM2->CCR1H;
3146  0002 c6530f        	ld	a,21263
3147  0005 6b02          	ld	(OFST-2,sp),a
3149                     ; 982   tmpccr1l = TIM2->CCR1L;
3151  0007 c65310        	ld	a,21264
3152  000a 6b01          	ld	(OFST-3,sp),a
3154                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3156  000c 7b01          	ld	a,(OFST-3,sp)
3157  000e 5f            	clrw	x
3158  000f 97            	ld	xl,a
3159  0010 1f03          	ldw	(OFST-1,sp),x
3161                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3163  0012 7b02          	ld	a,(OFST-2,sp)
3164  0014 5f            	clrw	x
3165  0015 97            	ld	xl,a
3166  0016 4f            	clr	a
3167  0017 02            	rlwa	x,a
3168  0018 01            	rrwa	x,a
3169  0019 1a04          	or	a,(OFST+0,sp)
3170  001b 01            	rrwa	x,a
3171  001c 1a03          	or	a,(OFST-1,sp)
3172  001e 01            	rrwa	x,a
3173  001f 1f03          	ldw	(OFST-1,sp),x
3175                     ; 987   return (uint16_t)tmpccr1;
3177  0021 1e03          	ldw	x,(OFST-1,sp)
3180  0023 5b04          	addw	sp,#4
3181  0025 81            	ret
3227                     ; 995 uint16_t TIM2_GetCapture2(void)
3227                     ; 996 {
3228                     .text:	section	.text,new
3229  0000               _TIM2_GetCapture2:
3231  0000 5204          	subw	sp,#4
3232       00000004      OFST:	set	4
3235                     ; 998   uint16_t tmpccr2 = 0;
3237                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3241                     ; 1001   tmpccr2h = TIM2->CCR2H;
3243  0002 c65311        	ld	a,21265
3244  0005 6b02          	ld	(OFST-2,sp),a
3246                     ; 1002   tmpccr2l = TIM2->CCR2L;
3248  0007 c65312        	ld	a,21266
3249  000a 6b01          	ld	(OFST-3,sp),a
3251                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3253  000c 7b01          	ld	a,(OFST-3,sp)
3254  000e 5f            	clrw	x
3255  000f 97            	ld	xl,a
3256  0010 1f03          	ldw	(OFST-1,sp),x
3258                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3260  0012 7b02          	ld	a,(OFST-2,sp)
3261  0014 5f            	clrw	x
3262  0015 97            	ld	xl,a
3263  0016 4f            	clr	a
3264  0017 02            	rlwa	x,a
3265  0018 01            	rrwa	x,a
3266  0019 1a04          	or	a,(OFST+0,sp)
3267  001b 01            	rrwa	x,a
3268  001c 1a03          	or	a,(OFST-1,sp)
3269  001e 01            	rrwa	x,a
3270  001f 1f03          	ldw	(OFST-1,sp),x
3272                     ; 1007   return (uint16_t)tmpccr2;
3274  0021 1e03          	ldw	x,(OFST-1,sp)
3277  0023 5b04          	addw	sp,#4
3278  0025 81            	ret
3324                     ; 1015 uint16_t TIM2_GetCapture3(void)
3324                     ; 1016 {
3325                     .text:	section	.text,new
3326  0000               _TIM2_GetCapture3:
3328  0000 5204          	subw	sp,#4
3329       00000004      OFST:	set	4
3332                     ; 1018   uint16_t tmpccr3 = 0;
3334                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3338                     ; 1021   tmpccr3h = TIM2->CCR3H;
3340  0002 c65313        	ld	a,21267
3341  0005 6b02          	ld	(OFST-2,sp),a
3343                     ; 1022   tmpccr3l = TIM2->CCR3L;
3345  0007 c65314        	ld	a,21268
3346  000a 6b01          	ld	(OFST-3,sp),a
3348                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3350  000c 7b01          	ld	a,(OFST-3,sp)
3351  000e 5f            	clrw	x
3352  000f 97            	ld	xl,a
3353  0010 1f03          	ldw	(OFST-1,sp),x
3355                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3357  0012 7b02          	ld	a,(OFST-2,sp)
3358  0014 5f            	clrw	x
3359  0015 97            	ld	xl,a
3360  0016 4f            	clr	a
3361  0017 02            	rlwa	x,a
3362  0018 01            	rrwa	x,a
3363  0019 1a04          	or	a,(OFST+0,sp)
3364  001b 01            	rrwa	x,a
3365  001c 1a03          	or	a,(OFST-1,sp)
3366  001e 01            	rrwa	x,a
3367  001f 1f03          	ldw	(OFST-1,sp),x
3369                     ; 1027   return (uint16_t)tmpccr3;
3371  0021 1e03          	ldw	x,(OFST-1,sp)
3374  0023 5b04          	addw	sp,#4
3375  0025 81            	ret
3407                     ; 1035 uint16_t TIM2_GetCounter(void)
3407                     ; 1036 {
3408                     .text:	section	.text,new
3409  0000               _TIM2_GetCounter:
3411  0000 89            	pushw	x
3412       00000002      OFST:	set	2
3415                     ; 1037   uint16_t tmpcntr = 0;
3417                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3419  0001 c6530a        	ld	a,21258
3420  0004 5f            	clrw	x
3421  0005 97            	ld	xl,a
3422  0006 4f            	clr	a
3423  0007 02            	rlwa	x,a
3424  0008 1f01          	ldw	(OFST-1,sp),x
3426                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3428  000a c6530b        	ld	a,21259
3429  000d 5f            	clrw	x
3430  000e 97            	ld	xl,a
3431  000f 01            	rrwa	x,a
3432  0010 1a02          	or	a,(OFST+0,sp)
3433  0012 01            	rrwa	x,a
3434  0013 1a01          	or	a,(OFST-1,sp)
3435  0015 01            	rrwa	x,a
3438  0016 5b02          	addw	sp,#2
3439  0018 81            	ret
3463                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3463                     ; 1050 {
3464                     .text:	section	.text,new
3465  0000               _TIM2_GetPrescaler:
3469                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3471  0000 c6530c        	ld	a,21260
3474  0003 81            	ret
3609                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3609                     ; 1069 {
3610                     .text:	section	.text,new
3611  0000               _TIM2_GetFlagStatus:
3613  0000 89            	pushw	x
3614  0001 89            	pushw	x
3615       00000002      OFST:	set	2
3618                     ; 1070   FlagStatus bitstatus = RESET;
3620                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3624                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3626                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3628  0002 9f            	ld	a,xl
3629  0003 c45302        	and	a,21250
3630  0006 6b01          	ld	(OFST-1,sp),a
3632                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3634  0008 7b03          	ld	a,(OFST+1,sp)
3635  000a 6b02          	ld	(OFST+0,sp),a
3637                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3639  000c c65303        	ld	a,21251
3640  000f 1402          	and	a,(OFST+0,sp)
3641  0011 1a01          	or	a,(OFST-1,sp)
3642  0013 2706          	jreq	L3561
3643                     ; 1081     bitstatus = SET;
3645  0015 a601          	ld	a,#1
3646  0017 6b02          	ld	(OFST+0,sp),a
3649  0019 2002          	jra	L5561
3650  001b               L3561:
3651                     ; 1085     bitstatus = RESET;
3653  001b 0f02          	clr	(OFST+0,sp)
3655  001d               L5561:
3656                     ; 1087   return (FlagStatus)bitstatus;
3658  001d 7b02          	ld	a,(OFST+0,sp)
3661  001f 5b04          	addw	sp,#4
3662  0021 81            	ret
3697                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3697                     ; 1104 {
3698                     .text:	section	.text,new
3699  0000               _TIM2_ClearFlag:
3703                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3705                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3707  0000 9f            	ld	a,xl
3708  0001 43            	cpl	a
3709  0002 c75302        	ld	21250,a
3710                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3712  0005 35ff5303      	mov	21251,#255
3713                     ; 1111 }
3716  0009 81            	ret
3776                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3776                     ; 1124 {
3777                     .text:	section	.text,new
3778  0000               _TIM2_GetITStatus:
3780  0000 88            	push	a
3781  0001 89            	pushw	x
3782       00000002      OFST:	set	2
3785                     ; 1125   ITStatus bitstatus = RESET;
3787                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3791                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3793                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3795  0002 c45302        	and	a,21250
3796  0005 6b01          	ld	(OFST-1,sp),a
3798                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3800  0007 c65301        	ld	a,21249
3801  000a 1403          	and	a,(OFST+1,sp)
3802  000c 6b02          	ld	(OFST+0,sp),a
3804                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3806  000e 0d01          	tnz	(OFST-1,sp)
3807  0010 270a          	jreq	L3271
3809  0012 0d02          	tnz	(OFST+0,sp)
3810  0014 2706          	jreq	L3271
3811                     ; 1137     bitstatus = SET;
3813  0016 a601          	ld	a,#1
3814  0018 6b02          	ld	(OFST+0,sp),a
3817  001a 2002          	jra	L5271
3818  001c               L3271:
3819                     ; 1141     bitstatus = RESET;
3821  001c 0f02          	clr	(OFST+0,sp)
3823  001e               L5271:
3824                     ; 1143   return (ITStatus)(bitstatus);
3826  001e 7b02          	ld	a,(OFST+0,sp)
3829  0020 5b03          	addw	sp,#3
3830  0022 81            	ret
3866                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3866                     ; 1157 {
3867                     .text:	section	.text,new
3868  0000               _TIM2_ClearITPendingBit:
3872                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3874                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3876  0000 43            	cpl	a
3877  0001 c75302        	ld	21250,a
3878                     ; 1163 }
3881  0004 81            	ret
3927                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3927                     ; 1182                        uint8_t TIM2_ICSelection,
3927                     ; 1183                        uint8_t TIM2_ICFilter)
3927                     ; 1184 {
3928                     .text:	section	.text,new
3929  0000               L3_TI1_Config:
3931  0000 89            	pushw	x
3932  0001 88            	push	a
3933       00000001      OFST:	set	1
3936                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3938  0002 72115308      	bres	21256,#0
3939                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3939                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3941  0006 7b06          	ld	a,(OFST+5,sp)
3942  0008 97            	ld	xl,a
3943  0009 a610          	ld	a,#16
3944  000b 42            	mul	x,a
3945  000c 9f            	ld	a,xl
3946  000d 1a03          	or	a,(OFST+2,sp)
3947  000f 6b01          	ld	(OFST+0,sp),a
3949  0011 c65305        	ld	a,21253
3950  0014 a40c          	and	a,#12
3951  0016 1a01          	or	a,(OFST+0,sp)
3952  0018 c75305        	ld	21253,a
3953                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3955  001b 0d02          	tnz	(OFST+1,sp)
3956  001d 2706          	jreq	L5671
3957                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3959  001f 72125308      	bset	21256,#1
3961  0023 2004          	jra	L7671
3962  0025               L5671:
3963                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3965  0025 72135308      	bres	21256,#1
3966  0029               L7671:
3967                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
3969  0029 72105308      	bset	21256,#0
3970                     ; 1203 }
3973  002d 5b03          	addw	sp,#3
3974  002f 81            	ret
4020                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4020                     ; 1222                        uint8_t TIM2_ICSelection,
4020                     ; 1223                        uint8_t TIM2_ICFilter)
4020                     ; 1224 {
4021                     .text:	section	.text,new
4022  0000               L5_TI2_Config:
4024  0000 89            	pushw	x
4025  0001 88            	push	a
4026       00000001      OFST:	set	1
4029                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4031  0002 72195308      	bres	21256,#4
4032                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4032                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4034  0006 7b06          	ld	a,(OFST+5,sp)
4035  0008 97            	ld	xl,a
4036  0009 a610          	ld	a,#16
4037  000b 42            	mul	x,a
4038  000c 9f            	ld	a,xl
4039  000d 1a03          	or	a,(OFST+2,sp)
4040  000f 6b01          	ld	(OFST+0,sp),a
4042  0011 c65306        	ld	a,21254
4043  0014 a40c          	and	a,#12
4044  0016 1a01          	or	a,(OFST+0,sp)
4045  0018 c75306        	ld	21254,a
4046                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4048  001b 0d02          	tnz	(OFST+1,sp)
4049  001d 2706          	jreq	L1102
4050                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4052  001f 721a5308      	bset	21256,#5
4054  0023 2004          	jra	L3102
4055  0025               L1102:
4056                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4058  0025 721b5308      	bres	21256,#5
4059  0029               L3102:
4060                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4062  0029 72185308      	bset	21256,#4
4063                     ; 1245 }
4066  002d 5b03          	addw	sp,#3
4067  002f 81            	ret
4113                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4113                     ; 1262                        uint8_t TIM2_ICFilter)
4113                     ; 1263 {
4114                     .text:	section	.text,new
4115  0000               L7_TI3_Config:
4117  0000 89            	pushw	x
4118  0001 88            	push	a
4119       00000001      OFST:	set	1
4122                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4124  0002 72115309      	bres	21257,#0
4125                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4125                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4127  0006 7b06          	ld	a,(OFST+5,sp)
4128  0008 97            	ld	xl,a
4129  0009 a610          	ld	a,#16
4130  000b 42            	mul	x,a
4131  000c 9f            	ld	a,xl
4132  000d 1a03          	or	a,(OFST+2,sp)
4133  000f 6b01          	ld	(OFST+0,sp),a
4135  0011 c65307        	ld	a,21255
4136  0014 a40c          	and	a,#12
4137  0016 1a01          	or	a,(OFST+0,sp)
4138  0018 c75307        	ld	21255,a
4139                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4141  001b 0d02          	tnz	(OFST+1,sp)
4142  001d 2706          	jreq	L5302
4143                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4145  001f 72125309      	bset	21257,#1
4147  0023 2004          	jra	L7302
4148  0025               L5302:
4149                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4151  0025 72135309      	bres	21257,#1
4152  0029               L7302:
4153                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4155  0029 72105309      	bset	21257,#0
4156                     ; 1283 }
4159  002d 5b03          	addw	sp,#3
4160  002f 81            	ret
4173                     	xdef	_TIM2_ClearITPendingBit
4174                     	xdef	_TIM2_GetITStatus
4175                     	xdef	_TIM2_ClearFlag
4176                     	xdef	_TIM2_GetFlagStatus
4177                     	xdef	_TIM2_GetPrescaler
4178                     	xdef	_TIM2_GetCounter
4179                     	xdef	_TIM2_GetCapture3
4180                     	xdef	_TIM2_GetCapture2
4181                     	xdef	_TIM2_GetCapture1
4182                     	xdef	_TIM2_SetIC3Prescaler
4183                     	xdef	_TIM2_SetIC2Prescaler
4184                     	xdef	_TIM2_SetIC1Prescaler
4185                     	xdef	_TIM2_SetCompare3
4186                     	xdef	_TIM2_SetCompare2
4187                     	xdef	_TIM2_SetCompare1
4188                     	xdef	_TIM2_SetAutoreload
4189                     	xdef	_TIM2_SetCounter
4190                     	xdef	_TIM2_SelectOCxM
4191                     	xdef	_TIM2_CCxCmd
4192                     	xdef	_TIM2_OC3PolarityConfig
4193                     	xdef	_TIM2_OC2PolarityConfig
4194                     	xdef	_TIM2_OC1PolarityConfig
4195                     	xdef	_TIM2_GenerateEvent
4196                     	xdef	_TIM2_OC3PreloadConfig
4197                     	xdef	_TIM2_OC2PreloadConfig
4198                     	xdef	_TIM2_OC1PreloadConfig
4199                     	xdef	_TIM2_ARRPreloadConfig
4200                     	xdef	_TIM2_ForcedOC3Config
4201                     	xdef	_TIM2_ForcedOC2Config
4202                     	xdef	_TIM2_ForcedOC1Config
4203                     	xdef	_TIM2_PrescalerConfig
4204                     	xdef	_TIM2_SelectOnePulseMode
4205                     	xdef	_TIM2_UpdateRequestConfig
4206                     	xdef	_TIM2_UpdateDisableConfig
4207                     	xdef	_TIM2_ITConfig
4208                     	xdef	_TIM2_Cmd
4209                     	xdef	_TIM2_PWMIConfig
4210                     	xdef	_TIM2_ICInit
4211                     	xdef	_TIM2_OC3Init
4212                     	xdef	_TIM2_OC2Init
4213                     	xdef	_TIM2_OC1Init
4214                     	xdef	_TIM2_TimeBaseInit
4215                     	xdef	_TIM2_DeInit
4234                     	end
