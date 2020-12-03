   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 49 void TIM4_DeInit(void)
  43                     ; 50 {
  45                     .text:	section	.text,new
  46  0000               _TIM4_DeInit:
  50                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  52  0000 725f5340      	clr	21312
  53                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  55  0004 725f5341      	clr	21313
  56                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  58  0008 725f5344      	clr	21316
  59                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  61  000c 725f5345      	clr	21317
  62                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  64  0010 35ff5346      	mov	21318,#255
  65                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  67  0014 725f5342      	clr	21314
  68                     ; 57 }
  71  0018 81            	ret
 175                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 175                     ; 66 {
 176                     .text:	section	.text,new
 177  0000               _TIM4_TimeBaseInit:
 181                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 183                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 185  0000 9e            	ld	a,xh
 186  0001 c75345        	ld	21317,a
 187                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 189  0004 9f            	ld	a,xl
 190  0005 c75346        	ld	21318,a
 191                     ; 73 }
 194  0008 81            	ret
 249                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 249                     ; 82 {
 250                     .text:	section	.text,new
 251  0000               _TIM4_Cmd:
 255                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 257                     ; 87   if (NewState != DISABLE)
 259  0000 4d            	tnz	a
 260  0001 2706          	jreq	L311
 261                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 263  0003 72105340      	bset	21312,#0
 265  0007 2004          	jra	L511
 266  0009               L311:
 267                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 269  0009 72115340      	bres	21312,#0
 270  000d               L511:
 271                     ; 95 }
 274  000d 81            	ret
 332                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 332                     ; 108 {
 333                     .text:	section	.text,new
 334  0000               _TIM4_ITConfig:
 336  0000 89            	pushw	x
 337       00000000      OFST:	set	0
 340                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 342                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 344                     ; 113   if (NewState != DISABLE)
 346  0001 9f            	ld	a,xl
 347  0002 4d            	tnz	a
 348  0003 2709          	jreq	L741
 349                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 351  0005 9e            	ld	a,xh
 352  0006 ca5341        	or	a,21313
 353  0009 c75341        	ld	21313,a
 355  000c 2009          	jra	L151
 356  000e               L741:
 357                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 359  000e 7b01          	ld	a,(OFST+1,sp)
 360  0010 43            	cpl	a
 361  0011 c45341        	and	a,21313
 362  0014 c75341        	ld	21313,a
 363  0017               L151:
 364                     ; 123 }
 367  0017 85            	popw	x
 368  0018 81            	ret
 404                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 404                     ; 132 {
 405                     .text:	section	.text,new
 406  0000               _TIM4_UpdateDisableConfig:
 410                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 412                     ; 137   if (NewState != DISABLE)
 414  0000 4d            	tnz	a
 415  0001 2706          	jreq	L171
 416                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 418  0003 72125340      	bset	21312,#1
 420  0007 2004          	jra	L371
 421  0009               L171:
 422                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 424  0009 72135340      	bres	21312,#1
 425  000d               L371:
 426                     ; 145 }
 429  000d 81            	ret
 487                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 487                     ; 156 {
 488                     .text:	section	.text,new
 489  0000               _TIM4_UpdateRequestConfig:
 493                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 495                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 497  0000 4d            	tnz	a
 498  0001 2706          	jreq	L322
 499                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 501  0003 72145340      	bset	21312,#2
 503  0007 2004          	jra	L522
 504  0009               L322:
 505                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 507  0009 72155340      	bres	21312,#2
 508  000d               L522:
 509                     ; 169 }
 512  000d 81            	ret
 569                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 569                     ; 180 {
 570                     .text:	section	.text,new
 571  0000               _TIM4_SelectOnePulseMode:
 575                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 577                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 579  0000 4d            	tnz	a
 580  0001 2706          	jreq	L552
 581                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 583  0003 72165340      	bset	21312,#3
 585  0007 2004          	jra	L752
 586  0009               L552:
 587                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 589  0009 72175340      	bres	21312,#3
 590  000d               L752:
 591                     ; 193 }
 594  000d 81            	ret
 662                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 662                     ; 216 {
 663                     .text:	section	.text,new
 664  0000               _TIM4_PrescalerConfig:
 668                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 670                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 672                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 674  0000 9e            	ld	a,xh
 675  0001 c75345        	ld	21317,a
 676                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 678  0004 9f            	ld	a,xl
 679  0005 c75343        	ld	21315,a
 680                     ; 226 }
 683  0008 81            	ret
 719                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 719                     ; 235 {
 720                     .text:	section	.text,new
 721  0000               _TIM4_ARRPreloadConfig:
 725                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 727                     ; 240   if (NewState != DISABLE)
 729  0000 4d            	tnz	a
 730  0001 2706          	jreq	L133
 731                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 733  0003 721e5340      	bset	21312,#7
 735  0007 2004          	jra	L333
 736  0009               L133:
 737                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 739  0009 721f5340      	bres	21312,#7
 740  000d               L333:
 741                     ; 248 }
 744  000d 81            	ret
 793                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 793                     ; 258 {
 794                     .text:	section	.text,new
 795  0000               _TIM4_GenerateEvent:
 799                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 801                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 803  0000 c75343        	ld	21315,a
 804                     ; 264 }
 807  0003 81            	ret
 839                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 839                     ; 273 {
 840                     .text:	section	.text,new
 841  0000               _TIM4_SetCounter:
 845                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 847  0000 c75344        	ld	21316,a
 848                     ; 276 }
 851  0003 81            	ret
 883                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 883                     ; 285 {
 884                     .text:	section	.text,new
 885  0000               _TIM4_SetAutoreload:
 889                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 891  0000 c75346        	ld	21318,a
 892                     ; 288 }
 895  0003 81            	ret
 918                     ; 295 uint8_t TIM4_GetCounter(void)
 918                     ; 296 {
 919                     .text:	section	.text,new
 920  0000               _TIM4_GetCounter:
 924                     ; 298   return (uint8_t)(TIM4->CNTR);
 926  0000 c65344        	ld	a,21316
 929  0003 81            	ret
 953                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 953                     ; 307 {
 954                     .text:	section	.text,new
 955  0000               _TIM4_GetPrescaler:
 959                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 961  0000 c65345        	ld	a,21317
 964  0003 81            	ret
1043                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1043                     ; 320 {
1044                     .text:	section	.text,new
1045  0000               _TIM4_GetFlagStatus:
1047  0000 88            	push	a
1048       00000001      OFST:	set	1
1051                     ; 321   FlagStatus bitstatus = RESET;
1053                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1055                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1057  0001 c45342        	and	a,21314
1058  0004 2706          	jreq	L174
1059                     ; 328     bitstatus = SET;
1061  0006 a601          	ld	a,#1
1062  0008 6b01          	ld	(OFST+0,sp),a
1065  000a 2002          	jra	L374
1066  000c               L174:
1067                     ; 332     bitstatus = RESET;
1069  000c 0f01          	clr	(OFST+0,sp)
1071  000e               L374:
1072                     ; 334   return ((FlagStatus)bitstatus);
1074  000e 7b01          	ld	a,(OFST+0,sp)
1077  0010 5b01          	addw	sp,#1
1078  0012 81            	ret
1113                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1113                     ; 345 {
1114                     .text:	section	.text,new
1115  0000               _TIM4_ClearFlag:
1119                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1121                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1123  0000 43            	cpl	a
1124  0001 c75342        	ld	21314,a
1125                     ; 351 }
1128  0004 81            	ret
1188                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1188                     ; 361 {
1189                     .text:	section	.text,new
1190  0000               _TIM4_GetITStatus:
1192  0000 88            	push	a
1193  0001 89            	pushw	x
1194       00000002      OFST:	set	2
1197                     ; 362   ITStatus bitstatus = RESET;
1199                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1203                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1205                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1207  0002 c45342        	and	a,21314
1208  0005 6b01          	ld	(OFST-1,sp),a
1210                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1212  0007 c65341        	ld	a,21313
1213  000a 1403          	and	a,(OFST+1,sp)
1214  000c 6b02          	ld	(OFST+0,sp),a
1216                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1218  000e 0d01          	tnz	(OFST-1,sp)
1219  0010 270a          	jreq	L145
1221  0012 0d02          	tnz	(OFST+0,sp)
1222  0014 2706          	jreq	L145
1223                     ; 375     bitstatus = (ITStatus)SET;
1225  0016 a601          	ld	a,#1
1226  0018 6b02          	ld	(OFST+0,sp),a
1229  001a 2002          	jra	L345
1230  001c               L145:
1231                     ; 379     bitstatus = (ITStatus)RESET;
1233  001c 0f02          	clr	(OFST+0,sp)
1235  001e               L345:
1236                     ; 381   return ((ITStatus)bitstatus);
1238  001e 7b02          	ld	a,(OFST+0,sp)
1241  0020 5b03          	addw	sp,#3
1242  0022 81            	ret
1278                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1278                     ; 392 {
1279                     .text:	section	.text,new
1280  0000               _TIM4_ClearITPendingBit:
1284                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1286                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1288  0000 43            	cpl	a
1289  0001 c75342        	ld	21314,a
1290                     ; 398 }
1293  0004 81            	ret
1306                     	xdef	_TIM4_ClearITPendingBit
1307                     	xdef	_TIM4_GetITStatus
1308                     	xdef	_TIM4_ClearFlag
1309                     	xdef	_TIM4_GetFlagStatus
1310                     	xdef	_TIM4_GetPrescaler
1311                     	xdef	_TIM4_GetCounter
1312                     	xdef	_TIM4_SetAutoreload
1313                     	xdef	_TIM4_SetCounter
1314                     	xdef	_TIM4_GenerateEvent
1315                     	xdef	_TIM4_ARRPreloadConfig
1316                     	xdef	_TIM4_PrescalerConfig
1317                     	xdef	_TIM4_SelectOnePulseMode
1318                     	xdef	_TIM4_UpdateRequestConfig
1319                     	xdef	_TIM4_UpdateDisableConfig
1320                     	xdef	_TIM4_ITConfig
1321                     	xdef	_TIM4_Cmd
1322                     	xdef	_TIM4_TimeBaseInit
1323                     	xdef	_TIM4_DeInit
1342                     	end
