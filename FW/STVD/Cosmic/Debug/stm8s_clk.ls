   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     .const:	section	.text
  16  0000               _HSIDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  21  0004               _CLKPrescTable:
  22  0004 01            	dc.b	1
  23  0005 02            	dc.b	2
  24  0006 04            	dc.b	4
  25  0007 08            	dc.b	8
  26  0008 0a            	dc.b	10
  27  0009 10            	dc.b	16
  28  000a 14            	dc.b	20
  29  000b 28            	dc.b	40
  58                     ; 72 void CLK_DeInit(void)
  58                     ; 73 {
  60                     .text:	section	.text,new
  61  0000               _CLK_DeInit:
  65                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  67  0000 350150c0      	mov	20672,#1
  68                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  70  0004 725f50c1      	clr	20673
  71                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  73  0008 35e150c4      	mov	20676,#225
  74                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  76  000c 725f50c5      	clr	20677
  77                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  79  0010 351850c6      	mov	20678,#24
  80                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  82  0014 35ff50c7      	mov	20679,#255
  83                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  85  0018 35ff50ca      	mov	20682,#255
  86                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  88  001c 725f50c8      	clr	20680
  89                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  91  0020 725f50c9      	clr	20681
  93  0024               L52:
  94                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  96  0024 c650c9        	ld	a,20681
  97  0027 a501          	bcp	a,#1
  98  0029 26f9          	jrne	L52
  99                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 101  002b 725f50c9      	clr	20681
 102                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 104  002f 725f50cc      	clr	20684
 105                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 107  0033 725f50cd      	clr	20685
 108                     ; 88 }
 111  0037 81            	ret
 167                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 167                     ; 100 {
 168                     .text:	section	.text,new
 169  0000               _CLK_FastHaltWakeUpCmd:
 173                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 175                     ; 104   if (NewState != DISABLE)
 177  0000 4d            	tnz	a
 178  0001 2706          	jreq	L75
 179                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 181  0003 721450c0      	bset	20672,#2
 183  0007 2004          	jra	L16
 184  0009               L75:
 185                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 187  0009 721550c0      	bres	20672,#2
 188  000d               L16:
 189                     ; 114 }
 192  000d 81            	ret
 227                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 227                     ; 122 {
 228                     .text:	section	.text,new
 229  0000               _CLK_HSECmd:
 233                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 235                     ; 126   if (NewState != DISABLE)
 237  0000 4d            	tnz	a
 238  0001 2706          	jreq	L101
 239                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 241  0003 721050c1      	bset	20673,#0
 243  0007 2004          	jra	L301
 244  0009               L101:
 245                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 247  0009 721150c1      	bres	20673,#0
 248  000d               L301:
 249                     ; 136 }
 252  000d 81            	ret
 287                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 287                     ; 144 {
 288                     .text:	section	.text,new
 289  0000               _CLK_HSICmd:
 293                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 295                     ; 148   if (NewState != DISABLE)
 297  0000 4d            	tnz	a
 298  0001 2706          	jreq	L321
 299                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 301  0003 721050c0      	bset	20672,#0
 303  0007 2004          	jra	L521
 304  0009               L321:
 305                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 307  0009 721150c0      	bres	20672,#0
 308  000d               L521:
 309                     ; 158 }
 312  000d 81            	ret
 347                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 347                     ; 167 {
 348                     .text:	section	.text,new
 349  0000               _CLK_LSICmd:
 353                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 355                     ; 171   if (NewState != DISABLE)
 357  0000 4d            	tnz	a
 358  0001 2706          	jreq	L541
 359                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 361  0003 721650c0      	bset	20672,#3
 363  0007 2004          	jra	L741
 364  0009               L541:
 365                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 367  0009 721750c0      	bres	20672,#3
 368  000d               L741:
 369                     ; 181 }
 372  000d 81            	ret
 407                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 407                     ; 190 {
 408                     .text:	section	.text,new
 409  0000               _CLK_CCOCmd:
 413                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 415                     ; 194   if (NewState != DISABLE)
 417  0000 4d            	tnz	a
 418  0001 2706          	jreq	L761
 419                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 421  0003 721050c9      	bset	20681,#0
 423  0007 2004          	jra	L171
 424  0009               L761:
 425                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 427  0009 721150c9      	bres	20681,#0
 428  000d               L171:
 429                     ; 204 }
 432  000d 81            	ret
 467                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 467                     ; 214 {
 468                     .text:	section	.text,new
 469  0000               _CLK_ClockSwitchCmd:
 473                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 475                     ; 218   if (NewState != DISABLE )
 477  0000 4d            	tnz	a
 478  0001 2706          	jreq	L112
 479                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 481  0003 721250c5      	bset	20677,#1
 483  0007 2004          	jra	L312
 484  0009               L112:
 485                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 487  0009 721350c5      	bres	20677,#1
 488  000d               L312:
 489                     ; 228 }
 492  000d 81            	ret
 528                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 528                     ; 239 {
 529                     .text:	section	.text,new
 530  0000               _CLK_SlowActiveHaltWakeUpCmd:
 534                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 536                     ; 243   if (NewState != DISABLE)
 538  0000 4d            	tnz	a
 539  0001 2706          	jreq	L332
 540                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 542  0003 721a50c0      	bset	20672,#5
 544  0007 2004          	jra	L532
 545  0009               L332:
 546                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 548  0009 721b50c0      	bres	20672,#5
 549  000d               L532:
 550                     ; 253 }
 553  000d 81            	ret
 712                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 712                     ; 264 {
 713                     .text:	section	.text,new
 714  0000               _CLK_PeripheralClockConfig:
 716  0000 89            	pushw	x
 717       00000000      OFST:	set	0
 720                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 722                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 724                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 726  0001 9e            	ld	a,xh
 727  0002 a510          	bcp	a,#16
 728  0004 2633          	jrne	L123
 729                     ; 271     if (NewState != DISABLE)
 731  0006 0d02          	tnz	(OFST+2,sp)
 732  0008 2717          	jreq	L323
 733                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 735  000a 7b01          	ld	a,(OFST+1,sp)
 736  000c a40f          	and	a,#15
 737  000e 5f            	clrw	x
 738  000f 97            	ld	xl,a
 739  0010 a601          	ld	a,#1
 740  0012 5d            	tnzw	x
 741  0013 2704          	jreq	L62
 742  0015               L03:
 743  0015 48            	sll	a
 744  0016 5a            	decw	x
 745  0017 26fc          	jrne	L03
 746  0019               L62:
 747  0019 ca50c7        	or	a,20679
 748  001c c750c7        	ld	20679,a
 750  001f 2049          	jra	L723
 751  0021               L323:
 752                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 754  0021 7b01          	ld	a,(OFST+1,sp)
 755  0023 a40f          	and	a,#15
 756  0025 5f            	clrw	x
 757  0026 97            	ld	xl,a
 758  0027 a601          	ld	a,#1
 759  0029 5d            	tnzw	x
 760  002a 2704          	jreq	L23
 761  002c               L43:
 762  002c 48            	sll	a
 763  002d 5a            	decw	x
 764  002e 26fc          	jrne	L43
 765  0030               L23:
 766  0030 43            	cpl	a
 767  0031 c450c7        	and	a,20679
 768  0034 c750c7        	ld	20679,a
 769  0037 2031          	jra	L723
 770  0039               L123:
 771                     ; 284     if (NewState != DISABLE)
 773  0039 0d02          	tnz	(OFST+2,sp)
 774  003b 2717          	jreq	L133
 775                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 777  003d 7b01          	ld	a,(OFST+1,sp)
 778  003f a40f          	and	a,#15
 779  0041 5f            	clrw	x
 780  0042 97            	ld	xl,a
 781  0043 a601          	ld	a,#1
 782  0045 5d            	tnzw	x
 783  0046 2704          	jreq	L63
 784  0048               L04:
 785  0048 48            	sll	a
 786  0049 5a            	decw	x
 787  004a 26fc          	jrne	L04
 788  004c               L63:
 789  004c ca50ca        	or	a,20682
 790  004f c750ca        	ld	20682,a
 792  0052 2016          	jra	L723
 793  0054               L133:
 794                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 796  0054 7b01          	ld	a,(OFST+1,sp)
 797  0056 a40f          	and	a,#15
 798  0058 5f            	clrw	x
 799  0059 97            	ld	xl,a
 800  005a a601          	ld	a,#1
 801  005c 5d            	tnzw	x
 802  005d 2704          	jreq	L24
 803  005f               L44:
 804  005f 48            	sll	a
 805  0060 5a            	decw	x
 806  0061 26fc          	jrne	L44
 807  0063               L24:
 808  0063 43            	cpl	a
 809  0064 c450ca        	and	a,20682
 810  0067 c750ca        	ld	20682,a
 811  006a               L723:
 812                     ; 295 }
 815  006a 85            	popw	x
 816  006b 81            	ret
1002                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1002                     ; 310 {
1003                     .text:	section	.text,new
1004  0000               _CLK_ClockSwitchConfig:
1006  0000 89            	pushw	x
1007  0001 5204          	subw	sp,#4
1008       00000004      OFST:	set	4
1011                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1013  0003 aeffff        	ldw	x,#65535
1014  0006 1f03          	ldw	(OFST-1,sp),x
1016                     ; 313   ErrorStatus Swif = ERROR;
1018                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1020                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1022                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1024                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1026                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1028  0008 c650c3        	ld	a,20675
1029  000b 6b01          	ld	(OFST-3,sp),a
1031                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1033  000d 7b05          	ld	a,(OFST+1,sp)
1034  000f a101          	cp	a,#1
1035  0011 264b          	jrne	L344
1036                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1038  0013 721250c5      	bset	20677,#1
1039                     ; 331     if (ITState != DISABLE)
1041  0017 0d09          	tnz	(OFST+5,sp)
1042  0019 2706          	jreq	L544
1043                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1045  001b 721450c5      	bset	20677,#2
1047  001f 2004          	jra	L744
1048  0021               L544:
1049                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1051  0021 721550c5      	bres	20677,#2
1052  0025               L744:
1053                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1055  0025 7b06          	ld	a,(OFST+2,sp)
1056  0027 c750c4        	ld	20676,a
1058  002a 2007          	jra	L554
1059  002c               L154:
1060                     ; 346       DownCounter--;
1062  002c 1e03          	ldw	x,(OFST-1,sp)
1063  002e 1d0001        	subw	x,#1
1064  0031 1f03          	ldw	(OFST-1,sp),x
1066  0033               L554:
1067                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1069  0033 c650c5        	ld	a,20677
1070  0036 a501          	bcp	a,#1
1071  0038 2704          	jreq	L164
1073  003a 1e03          	ldw	x,(OFST-1,sp)
1074  003c 26ee          	jrne	L154
1075  003e               L164:
1076                     ; 349     if(DownCounter != 0)
1078  003e 1e03          	ldw	x,(OFST-1,sp)
1079  0040 2706          	jreq	L364
1080                     ; 351       Swif = SUCCESS;
1082  0042 a601          	ld	a,#1
1083  0044 6b02          	ld	(OFST-2,sp),a
1086  0046 2002          	jra	L764
1087  0048               L364:
1088                     ; 355       Swif = ERROR;
1090  0048 0f02          	clr	(OFST-2,sp)
1092  004a               L764:
1093                     ; 390   if(Swif != ERROR)
1095  004a 0d02          	tnz	(OFST-2,sp)
1096  004c 2767          	jreq	L315
1097                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1099  004e 0d0a          	tnz	(OFST+6,sp)
1100  0050 2645          	jrne	L515
1102  0052 7b01          	ld	a,(OFST-3,sp)
1103  0054 a1e1          	cp	a,#225
1104  0056 263f          	jrne	L515
1105                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1107  0058 721150c0      	bres	20672,#0
1109  005c 2057          	jra	L315
1110  005e               L344:
1111                     ; 361     if (ITState != DISABLE)
1113  005e 0d09          	tnz	(OFST+5,sp)
1114  0060 2706          	jreq	L174
1115                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1117  0062 721450c5      	bset	20677,#2
1119  0066 2004          	jra	L374
1120  0068               L174:
1121                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1123  0068 721550c5      	bres	20677,#2
1124  006c               L374:
1125                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1127  006c 7b06          	ld	a,(OFST+2,sp)
1128  006e c750c4        	ld	20676,a
1130  0071 2007          	jra	L105
1131  0073               L574:
1132                     ; 376       DownCounter--;
1134  0073 1e03          	ldw	x,(OFST-1,sp)
1135  0075 1d0001        	subw	x,#1
1136  0078 1f03          	ldw	(OFST-1,sp),x
1138  007a               L105:
1139                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1141  007a c650c5        	ld	a,20677
1142  007d a508          	bcp	a,#8
1143  007f 2704          	jreq	L505
1145  0081 1e03          	ldw	x,(OFST-1,sp)
1146  0083 26ee          	jrne	L574
1147  0085               L505:
1148                     ; 379     if(DownCounter != 0)
1150  0085 1e03          	ldw	x,(OFST-1,sp)
1151  0087 270a          	jreq	L705
1152                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1154  0089 721250c5      	bset	20677,#1
1155                     ; 383       Swif = SUCCESS;
1157  008d a601          	ld	a,#1
1158  008f 6b02          	ld	(OFST-2,sp),a
1161  0091 20b7          	jra	L764
1162  0093               L705:
1163                     ; 387       Swif = ERROR;
1165  0093 0f02          	clr	(OFST-2,sp)
1167  0095 20b3          	jra	L764
1168  0097               L515:
1169                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1171  0097 0d0a          	tnz	(OFST+6,sp)
1172  0099 260c          	jrne	L125
1174  009b 7b01          	ld	a,(OFST-3,sp)
1175  009d a1d2          	cp	a,#210
1176  009f 2606          	jrne	L125
1177                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1179  00a1 721750c0      	bres	20672,#3
1181  00a5 200e          	jra	L315
1182  00a7               L125:
1183                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1185  00a7 0d0a          	tnz	(OFST+6,sp)
1186  00a9 260a          	jrne	L315
1188  00ab 7b01          	ld	a,(OFST-3,sp)
1189  00ad a1b4          	cp	a,#180
1190  00af 2604          	jrne	L315
1191                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1193  00b1 721150c1      	bres	20673,#0
1194  00b5               L315:
1195                     ; 406   return(Swif);
1197  00b5 7b02          	ld	a,(OFST-2,sp)
1200  00b7 5b06          	addw	sp,#6
1201  00b9 81            	ret
1339                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1339                     ; 416 {
1340                     .text:	section	.text,new
1341  0000               _CLK_HSIPrescalerConfig:
1343  0000 88            	push	a
1344       00000000      OFST:	set	0
1347                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1349                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1351  0001 c650c6        	ld	a,20678
1352  0004 a4e7          	and	a,#231
1353  0006 c750c6        	ld	20678,a
1354                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1356  0009 c650c6        	ld	a,20678
1357  000c 1a01          	or	a,(OFST+1,sp)
1358  000e c750c6        	ld	20678,a
1359                     ; 425 }
1362  0011 84            	pop	a
1363  0012 81            	ret
1498                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1498                     ; 437 {
1499                     .text:	section	.text,new
1500  0000               _CLK_CCOConfig:
1502  0000 88            	push	a
1503       00000000      OFST:	set	0
1506                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1508                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1510  0001 c650c9        	ld	a,20681
1511  0004 a4e1          	and	a,#225
1512  0006 c750c9        	ld	20681,a
1513                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1515  0009 c650c9        	ld	a,20681
1516  000c 1a01          	or	a,(OFST+1,sp)
1517  000e c750c9        	ld	20681,a
1518                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1520  0011 721050c9      	bset	20681,#0
1521                     ; 449 }
1524  0015 84            	pop	a
1525  0016 81            	ret
1590                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1590                     ; 460 {
1591                     .text:	section	.text,new
1592  0000               _CLK_ITConfig:
1594  0000 89            	pushw	x
1595       00000000      OFST:	set	0
1598                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1600                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1602                     ; 465   if (NewState != DISABLE)
1604  0001 9f            	ld	a,xl
1605  0002 4d            	tnz	a
1606  0003 2719          	jreq	L327
1607                     ; 467     switch (CLK_IT)
1609  0005 9e            	ld	a,xh
1611                     ; 475     default:
1611                     ; 476       break;
1612  0006 a00c          	sub	a,#12
1613  0008 270a          	jreq	L756
1614  000a a010          	sub	a,#16
1615  000c 2624          	jrne	L137
1616                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1616                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1618  000e 721450c5      	bset	20677,#2
1619                     ; 471       break;
1621  0012 201e          	jra	L137
1622  0014               L756:
1623                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1623                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1625  0014 721450c8      	bset	20680,#2
1626                     ; 474       break;
1628  0018 2018          	jra	L137
1629  001a               L166:
1630                     ; 475     default:
1630                     ; 476       break;
1632  001a 2016          	jra	L137
1633  001c               L727:
1635  001c 2014          	jra	L137
1636  001e               L327:
1637                     ; 481     switch (CLK_IT)
1639  001e 7b01          	ld	a,(OFST+1,sp)
1641                     ; 489     default:
1641                     ; 490       break;
1642  0020 a00c          	sub	a,#12
1643  0022 270a          	jreq	L566
1644  0024 a010          	sub	a,#16
1645  0026 260a          	jrne	L137
1646                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1646                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1648  0028 721550c5      	bres	20677,#2
1649                     ; 485       break;
1651  002c 2004          	jra	L137
1652  002e               L566:
1653                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1653                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1655  002e 721550c8      	bres	20680,#2
1656                     ; 488       break;
1657  0032               L137:
1658                     ; 493 }
1661  0032 85            	popw	x
1662  0033 81            	ret
1663  0034               L766:
1664                     ; 489     default:
1664                     ; 490       break;
1666  0034 20fc          	jra	L137
1667  0036               L537:
1668  0036 20fa          	jra	L137
1703                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1703                     ; 501 {
1704                     .text:	section	.text,new
1705  0000               _CLK_SYSCLKConfig:
1707  0000 88            	push	a
1708       00000000      OFST:	set	0
1711                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1713                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1715  0001 a580          	bcp	a,#128
1716  0003 2614          	jrne	L557
1717                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1719  0005 c650c6        	ld	a,20678
1720  0008 a4e7          	and	a,#231
1721  000a c750c6        	ld	20678,a
1722                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1724  000d 7b01          	ld	a,(OFST+1,sp)
1725  000f a418          	and	a,#24
1726  0011 ca50c6        	or	a,20678
1727  0014 c750c6        	ld	20678,a
1729  0017 2012          	jra	L757
1730  0019               L557:
1731                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1733  0019 c650c6        	ld	a,20678
1734  001c a4f8          	and	a,#248
1735  001e c750c6        	ld	20678,a
1736                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1738  0021 7b01          	ld	a,(OFST+1,sp)
1739  0023 a407          	and	a,#7
1740  0025 ca50c6        	or	a,20678
1741  0028 c750c6        	ld	20678,a
1742  002b               L757:
1743                     ; 515 }
1746  002b 84            	pop	a
1747  002c 81            	ret
1803                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1803                     ; 524 {
1804                     .text:	section	.text,new
1805  0000               _CLK_SWIMConfig:
1809                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1811                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1813  0000 4d            	tnz	a
1814  0001 2706          	jreq	L7001
1815                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1817  0003 721050cd      	bset	20685,#0
1819  0007 2004          	jra	L1101
1820  0009               L7001:
1821                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1823  0009 721150cd      	bres	20685,#0
1824  000d               L1101:
1825                     ; 538 }
1828  000d 81            	ret
1852                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1852                     ; 548 {
1853                     .text:	section	.text,new
1854  0000               _CLK_ClockSecuritySystemEnable:
1858                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1860  0000 721050c8      	bset	20680,#0
1861                     ; 551 }
1864  0004 81            	ret
1889                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1889                     ; 560 {
1890                     .text:	section	.text,new
1891  0000               _CLK_GetSYSCLKSource:
1895                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1897  0000 c650c3        	ld	a,20675
1900  0003 81            	ret
1957                     ; 569 uint32_t CLK_GetClockFreq(void)
1957                     ; 570 {
1958                     .text:	section	.text,new
1959  0000               _CLK_GetClockFreq:
1961  0000 5209          	subw	sp,#9
1962       00000009      OFST:	set	9
1965                     ; 571   uint32_t clockfrequency = 0;
1967                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1969                     ; 573   uint8_t tmp = 0, presc = 0;
1973                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1975  0002 c650c3        	ld	a,20675
1976  0005 6b09          	ld	(OFST+0,sp),a
1978                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1980  0007 7b09          	ld	a,(OFST+0,sp)
1981  0009 a1e1          	cp	a,#225
1982  000b 2641          	jrne	L7501
1983                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1985  000d c650c6        	ld	a,20678
1986  0010 a418          	and	a,#24
1987  0012 6b09          	ld	(OFST+0,sp),a
1989                     ; 581     tmp = (uint8_t)(tmp >> 3);
1991  0014 0409          	srl	(OFST+0,sp)
1992  0016 0409          	srl	(OFST+0,sp)
1993  0018 0409          	srl	(OFST+0,sp)
1995                     ; 582     presc = HSIDivFactor[tmp];
1997  001a 7b09          	ld	a,(OFST+0,sp)
1998  001c 5f            	clrw	x
1999  001d 97            	ld	xl,a
2000  001e d60000        	ld	a,(_HSIDivFactor,x)
2001  0021 6b09          	ld	(OFST+0,sp),a
2003                     ; 583     clockfrequency = HSI_VALUE / presc;
2005  0023 7b09          	ld	a,(OFST+0,sp)
2006  0025 b703          	ld	c_lreg+3,a
2007  0027 3f02          	clr	c_lreg+2
2008  0029 3f01          	clr	c_lreg+1
2009  002b 3f00          	clr	c_lreg
2010  002d 96            	ldw	x,sp
2011  002e 1c0001        	addw	x,#OFST-8
2012  0031 cd0000        	call	c_rtol
2015  0034 ae2400        	ldw	x,#9216
2016  0037 bf02          	ldw	c_lreg+2,x
2017  0039 ae00f4        	ldw	x,#244
2018  003c bf00          	ldw	c_lreg,x
2019  003e 96            	ldw	x,sp
2020  003f 1c0001        	addw	x,#OFST-8
2021  0042 cd0000        	call	c_ludv
2023  0045 96            	ldw	x,sp
2024  0046 1c0005        	addw	x,#OFST-4
2025  0049 cd0000        	call	c_rtol
2029  004c 201c          	jra	L1601
2030  004e               L7501:
2031                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2033  004e 7b09          	ld	a,(OFST+0,sp)
2034  0050 a1d2          	cp	a,#210
2035  0052 260c          	jrne	L3601
2036                     ; 587     clockfrequency = LSI_VALUE;
2038  0054 aef400        	ldw	x,#62464
2039  0057 1f07          	ldw	(OFST-2,sp),x
2040  0059 ae0001        	ldw	x,#1
2041  005c 1f05          	ldw	(OFST-4,sp),x
2044  005e 200a          	jra	L1601
2045  0060               L3601:
2046                     ; 591     clockfrequency = HSE_VALUE;
2048  0060 ae2400        	ldw	x,#9216
2049  0063 1f07          	ldw	(OFST-2,sp),x
2050  0065 ae00f4        	ldw	x,#244
2051  0068 1f05          	ldw	(OFST-4,sp),x
2053  006a               L1601:
2054                     ; 594   return((uint32_t)clockfrequency);
2056  006a 96            	ldw	x,sp
2057  006b 1c0005        	addw	x,#OFST-4
2058  006e cd0000        	call	c_ltor
2062  0071 5b09          	addw	sp,#9
2063  0073 81            	ret
2162                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2162                     ; 605 {
2163                     .text:	section	.text,new
2164  0000               _CLK_AdjustHSICalibrationValue:
2166  0000 88            	push	a
2167       00000000      OFST:	set	0
2170                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2172                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2174  0001 c650cc        	ld	a,20684
2175  0004 a4f8          	and	a,#248
2176  0006 1a01          	or	a,(OFST+1,sp)
2177  0008 c750cc        	ld	20684,a
2178                     ; 611 }
2181  000b 84            	pop	a
2182  000c 81            	ret
2206                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2206                     ; 623 {
2207                     .text:	section	.text,new
2208  0000               _CLK_SYSCLKEmergencyClear:
2212                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2214  0000 721150c5      	bres	20677,#0
2215                     ; 625 }
2218  0004 81            	ret
2367                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2367                     ; 635 {
2368                     .text:	section	.text,new
2369  0000               _CLK_GetFlagStatus:
2371  0000 89            	pushw	x
2372  0001 5203          	subw	sp,#3
2373       00000003      OFST:	set	3
2376                     ; 636   uint16_t statusreg = 0;
2378                     ; 637   uint8_t tmpreg = 0;
2380                     ; 638   FlagStatus bitstatus = RESET;
2382                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2384                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2386  0003 01            	rrwa	x,a
2387  0004 9f            	ld	a,xl
2388  0005 a4ff          	and	a,#255
2389  0007 97            	ld	xl,a
2390  0008 4f            	clr	a
2391  0009 02            	rlwa	x,a
2392  000a 1f01          	ldw	(OFST-2,sp),x
2393  000c 01            	rrwa	x,a
2395                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2397  000d 1e01          	ldw	x,(OFST-2,sp)
2398  000f a30100        	cpw	x,#256
2399  0012 2607          	jrne	L5221
2400                     ; 649     tmpreg = CLK->ICKR;
2402  0014 c650c0        	ld	a,20672
2403  0017 6b03          	ld	(OFST+0,sp),a
2406  0019 202f          	jra	L7221
2407  001b               L5221:
2408                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2410  001b 1e01          	ldw	x,(OFST-2,sp)
2411  001d a30200        	cpw	x,#512
2412  0020 2607          	jrne	L1321
2413                     ; 653     tmpreg = CLK->ECKR;
2415  0022 c650c1        	ld	a,20673
2416  0025 6b03          	ld	(OFST+0,sp),a
2419  0027 2021          	jra	L7221
2420  0029               L1321:
2421                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2423  0029 1e01          	ldw	x,(OFST-2,sp)
2424  002b a30300        	cpw	x,#768
2425  002e 2607          	jrne	L5321
2426                     ; 657     tmpreg = CLK->SWCR;
2428  0030 c650c5        	ld	a,20677
2429  0033 6b03          	ld	(OFST+0,sp),a
2432  0035 2013          	jra	L7221
2433  0037               L5321:
2434                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2436  0037 1e01          	ldw	x,(OFST-2,sp)
2437  0039 a30400        	cpw	x,#1024
2438  003c 2607          	jrne	L1421
2439                     ; 661     tmpreg = CLK->CSSR;
2441  003e c650c8        	ld	a,20680
2442  0041 6b03          	ld	(OFST+0,sp),a
2445  0043 2005          	jra	L7221
2446  0045               L1421:
2447                     ; 665     tmpreg = CLK->CCOR;
2449  0045 c650c9        	ld	a,20681
2450  0048 6b03          	ld	(OFST+0,sp),a
2452  004a               L7221:
2453                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2455  004a 7b05          	ld	a,(OFST+2,sp)
2456  004c 1503          	bcp	a,(OFST+0,sp)
2457  004e 2706          	jreq	L5421
2458                     ; 670     bitstatus = SET;
2460  0050 a601          	ld	a,#1
2461  0052 6b03          	ld	(OFST+0,sp),a
2464  0054 2002          	jra	L7421
2465  0056               L5421:
2466                     ; 674     bitstatus = RESET;
2468  0056 0f03          	clr	(OFST+0,sp)
2470  0058               L7421:
2471                     ; 678   return((FlagStatus)bitstatus);
2473  0058 7b03          	ld	a,(OFST+0,sp)
2476  005a 5b05          	addw	sp,#5
2477  005c 81            	ret
2523                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2523                     ; 688 {
2524                     .text:	section	.text,new
2525  0000               _CLK_GetITStatus:
2527  0000 88            	push	a
2528  0001 88            	push	a
2529       00000001      OFST:	set	1
2532                     ; 689   ITStatus bitstatus = RESET;
2534                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2536                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2538  0002 a11c          	cp	a,#28
2539  0004 2611          	jrne	L3721
2540                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2542  0006 c450c5        	and	a,20677
2543  0009 a10c          	cp	a,#12
2544  000b 2606          	jrne	L5721
2545                     ; 699       bitstatus = SET;
2547  000d a601          	ld	a,#1
2548  000f 6b01          	ld	(OFST+0,sp),a
2551  0011 2015          	jra	L1031
2552  0013               L5721:
2553                     ; 703       bitstatus = RESET;
2555  0013 0f01          	clr	(OFST+0,sp)
2557  0015 2011          	jra	L1031
2558  0017               L3721:
2559                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2561  0017 c650c8        	ld	a,20680
2562  001a 1402          	and	a,(OFST+1,sp)
2563  001c a10c          	cp	a,#12
2564  001e 2606          	jrne	L3031
2565                     ; 711       bitstatus = SET;
2567  0020 a601          	ld	a,#1
2568  0022 6b01          	ld	(OFST+0,sp),a
2571  0024 2002          	jra	L1031
2572  0026               L3031:
2573                     ; 715       bitstatus = RESET;
2575  0026 0f01          	clr	(OFST+0,sp)
2577  0028               L1031:
2578                     ; 720   return bitstatus;
2580  0028 7b01          	ld	a,(OFST+0,sp)
2583  002a 85            	popw	x
2584  002b 81            	ret
2620                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2620                     ; 730 {
2621                     .text:	section	.text,new
2622  0000               _CLK_ClearITPendingBit:
2626                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2628                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2630  0000 a10c          	cp	a,#12
2631  0002 2606          	jrne	L5231
2632                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2634  0004 721750c8      	bres	20680,#3
2636  0008 2004          	jra	L7231
2637  000a               L5231:
2638                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2640  000a 721750c5      	bres	20677,#3
2641  000e               L7231:
2642                     ; 745 }
2645  000e 81            	ret
2680                     	xdef	_CLKPrescTable
2681                     	xdef	_HSIDivFactor
2682                     	xdef	_CLK_ClearITPendingBit
2683                     	xdef	_CLK_GetITStatus
2684                     	xdef	_CLK_GetFlagStatus
2685                     	xdef	_CLK_GetSYSCLKSource
2686                     	xdef	_CLK_GetClockFreq
2687                     	xdef	_CLK_AdjustHSICalibrationValue
2688                     	xdef	_CLK_SYSCLKEmergencyClear
2689                     	xdef	_CLK_ClockSecuritySystemEnable
2690                     	xdef	_CLK_SWIMConfig
2691                     	xdef	_CLK_SYSCLKConfig
2692                     	xdef	_CLK_ITConfig
2693                     	xdef	_CLK_CCOConfig
2694                     	xdef	_CLK_HSIPrescalerConfig
2695                     	xdef	_CLK_ClockSwitchConfig
2696                     	xdef	_CLK_PeripheralClockConfig
2697                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2698                     	xdef	_CLK_FastHaltWakeUpCmd
2699                     	xdef	_CLK_ClockSwitchCmd
2700                     	xdef	_CLK_CCOCmd
2701                     	xdef	_CLK_LSICmd
2702                     	xdef	_CLK_HSICmd
2703                     	xdef	_CLK_HSECmd
2704                     	xdef	_CLK_DeInit
2705                     	xref.b	c_lreg
2706                     	xref.b	c_x
2725                     	xref	c_ltor
2726                     	xref	c_ludv
2727                     	xref	c_rtol
2728                     	end
