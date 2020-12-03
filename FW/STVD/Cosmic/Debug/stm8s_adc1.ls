   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 52 void ADC1_DeInit(void)
  43                     ; 53 {
  45                     .text:	section	.text,new
  46  0000               _ADC1_DeInit:
  50                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  52  0000 725f5400      	clr	21504
  53                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  55  0004 725f5401      	clr	21505
  56                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  58  0008 725f5402      	clr	21506
  59                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  61  000c 725f5403      	clr	21507
  62                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  64  0010 725f5406      	clr	21510
  65                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  67  0014 725f5407      	clr	21511
  68                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  70  0018 35ff5408      	mov	21512,#255
  71                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  73  001c 35035409      	mov	21513,#3
  74                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  76  0020 725f540a      	clr	21514
  77                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  79  0024 725f540b      	clr	21515
  80                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  82  0028 725f540e      	clr	21518
  83                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  85  002c 725f540f      	clr	21519
  86                     ; 66 }
  89  0030 81            	ret
 540                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 540                     ; 89 {
 541                     .text:	section	.text,new
 542  0000               _ADC1_Init:
 544  0000 89            	pushw	x
 545       00000000      OFST:	set	0
 548                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 550                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 552                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 554                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 556                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 558                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 560                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 562                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 564                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 566  0001 7b08          	ld	a,(OFST+8,sp)
 567  0003 88            	push	a
 568  0004 9f            	ld	a,xl
 569  0005 97            	ld	xl,a
 570  0006 7b02          	ld	a,(OFST+2,sp)
 571  0008 95            	ld	xh,a
 572  0009 cd0000        	call	_ADC1_ConversionConfig
 574  000c 84            	pop	a
 575                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 577  000d 7b05          	ld	a,(OFST+5,sp)
 578  000f cd0000        	call	_ADC1_PrescalerConfig
 580                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 582  0012 7b07          	ld	a,(OFST+7,sp)
 583  0014 97            	ld	xl,a
 584  0015 7b06          	ld	a,(OFST+6,sp)
 585  0017 95            	ld	xh,a
 586  0018 cd0000        	call	_ADC1_ExternalTriggerConfig
 588                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 590  001b 7b0a          	ld	a,(OFST+10,sp)
 591  001d 97            	ld	xl,a
 592  001e 7b09          	ld	a,(OFST+9,sp)
 593  0020 95            	ld	xh,a
 594  0021 cd0000        	call	_ADC1_SchmittTriggerConfig
 596                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 598  0024 72105401      	bset	21505,#0
 599                     ; 119 }
 602  0028 85            	popw	x
 603  0029 81            	ret
 638                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 638                     ; 127 {
 639                     .text:	section	.text,new
 640  0000               _ADC1_Cmd:
 644                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 646                     ; 131   if (NewState != DISABLE)
 648  0000 4d            	tnz	a
 649  0001 2706          	jreq	L362
 650                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 652  0003 72105401      	bset	21505,#0
 654  0007 2004          	jra	L562
 655  0009               L362:
 656                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 658  0009 72115401      	bres	21505,#0
 659  000d               L562:
 660                     ; 139 }
 663  000d 81            	ret
 698                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 698                     ; 147 {
 699                     .text:	section	.text,new
 700  0000               _ADC1_ScanModeCmd:
 704                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 706                     ; 151   if (NewState != DISABLE)
 708  0000 4d            	tnz	a
 709  0001 2706          	jreq	L503
 710                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 712  0003 72125402      	bset	21506,#1
 714  0007 2004          	jra	L703
 715  0009               L503:
 716                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 718  0009 72135402      	bres	21506,#1
 719  000d               L703:
 720                     ; 159 }
 723  000d 81            	ret
 758                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 758                     ; 167 {
 759                     .text:	section	.text,new
 760  0000               _ADC1_DataBufferCmd:
 764                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 766                     ; 171   if (NewState != DISABLE)
 768  0000 4d            	tnz	a
 769  0001 2706          	jreq	L723
 770                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 772  0003 721e5403      	bset	21507,#7
 774  0007 2004          	jra	L133
 775  0009               L723:
 776                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 778  0009 721f5403      	bres	21507,#7
 779  000d               L133:
 780                     ; 179 }
 783  000d 81            	ret
 939                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 939                     ; 191 {
 940                     .text:	section	.text,new
 941  0000               _ADC1_ITConfig:
 943  0000 89            	pushw	x
 944       00000000      OFST:	set	0
 947                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 949                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 951                     ; 196   if (NewState != DISABLE)
 953  0001 0d05          	tnz	(OFST+5,sp)
 954  0003 2709          	jreq	L714
 955                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 957  0005 9f            	ld	a,xl
 958  0006 ca5400        	or	a,21504
 959  0009 c75400        	ld	21504,a
 961  000c 2009          	jra	L124
 962  000e               L714:
 963                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 965  000e 7b02          	ld	a,(OFST+2,sp)
 966  0010 43            	cpl	a
 967  0011 c45400        	and	a,21504
 968  0014 c75400        	ld	21504,a
 969  0017               L124:
 970                     ; 206 }
 973  0017 85            	popw	x
 974  0018 81            	ret
1010                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1010                     ; 215 {
1011                     .text:	section	.text,new
1012  0000               _ADC1_PrescalerConfig:
1014  0000 88            	push	a
1015       00000000      OFST:	set	0
1018                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1020                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1022  0001 c65401        	ld	a,21505
1023  0004 a48f          	and	a,#143
1024  0006 c75401        	ld	21505,a
1025                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1027  0009 c65401        	ld	a,21505
1028  000c 1a01          	or	a,(OFST+1,sp)
1029  000e c75401        	ld	21505,a
1030                     ; 223 }
1033  0011 84            	pop	a
1034  0012 81            	ret
1081                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1081                     ; 234 {
1082                     .text:	section	.text,new
1083  0000               _ADC1_SchmittTriggerConfig:
1085  0000 89            	pushw	x
1086       00000000      OFST:	set	0
1089                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1091                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1093                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1095  0001 9e            	ld	a,xh
1096  0002 a1ff          	cp	a,#255
1097  0004 2620          	jrne	L364
1098                     ; 241     if (NewState != DISABLE)
1100  0006 9f            	ld	a,xl
1101  0007 4d            	tnz	a
1102  0008 270a          	jreq	L564
1103                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1105  000a 725f5407      	clr	21511
1106                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1108  000e 725f5406      	clr	21510
1110  0012 2078          	jra	L174
1111  0014               L564:
1112                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1114  0014 c65407        	ld	a,21511
1115  0017 aaff          	or	a,#255
1116  0019 c75407        	ld	21511,a
1117                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1119  001c c65406        	ld	a,21510
1120  001f aaff          	or	a,#255
1121  0021 c75406        	ld	21510,a
1122  0024 2066          	jra	L174
1123  0026               L364:
1124                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1126  0026 7b01          	ld	a,(OFST+1,sp)
1127  0028 a108          	cp	a,#8
1128  002a 242f          	jruge	L374
1129                     ; 254     if (NewState != DISABLE)
1131  002c 0d02          	tnz	(OFST+2,sp)
1132  002e 2716          	jreq	L574
1133                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1135  0030 7b01          	ld	a,(OFST+1,sp)
1136  0032 5f            	clrw	x
1137  0033 97            	ld	xl,a
1138  0034 a601          	ld	a,#1
1139  0036 5d            	tnzw	x
1140  0037 2704          	jreq	L42
1141  0039               L62:
1142  0039 48            	sll	a
1143  003a 5a            	decw	x
1144  003b 26fc          	jrne	L62
1145  003d               L42:
1146  003d 43            	cpl	a
1147  003e c45407        	and	a,21511
1148  0041 c75407        	ld	21511,a
1150  0044 2046          	jra	L174
1151  0046               L574:
1152                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1154  0046 7b01          	ld	a,(OFST+1,sp)
1155  0048 5f            	clrw	x
1156  0049 97            	ld	xl,a
1157  004a a601          	ld	a,#1
1158  004c 5d            	tnzw	x
1159  004d 2704          	jreq	L03
1160  004f               L23:
1161  004f 48            	sll	a
1162  0050 5a            	decw	x
1163  0051 26fc          	jrne	L23
1164  0053               L03:
1165  0053 ca5407        	or	a,21511
1166  0056 c75407        	ld	21511,a
1167  0059 2031          	jra	L174
1168  005b               L374:
1169                     ; 265     if (NewState != DISABLE)
1171  005b 0d02          	tnz	(OFST+2,sp)
1172  005d 2718          	jreq	L305
1173                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1175  005f 7b01          	ld	a,(OFST+1,sp)
1176  0061 a008          	sub	a,#8
1177  0063 5f            	clrw	x
1178  0064 97            	ld	xl,a
1179  0065 a601          	ld	a,#1
1180  0067 5d            	tnzw	x
1181  0068 2704          	jreq	L43
1182  006a               L63:
1183  006a 48            	sll	a
1184  006b 5a            	decw	x
1185  006c 26fc          	jrne	L63
1186  006e               L43:
1187  006e 43            	cpl	a
1188  006f c45406        	and	a,21510
1189  0072 c75406        	ld	21510,a
1191  0075 2015          	jra	L174
1192  0077               L305:
1193                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1195  0077 7b01          	ld	a,(OFST+1,sp)
1196  0079 a008          	sub	a,#8
1197  007b 5f            	clrw	x
1198  007c 97            	ld	xl,a
1199  007d a601          	ld	a,#1
1200  007f 5d            	tnzw	x
1201  0080 2704          	jreq	L04
1202  0082               L24:
1203  0082 48            	sll	a
1204  0083 5a            	decw	x
1205  0084 26fc          	jrne	L24
1206  0086               L04:
1207  0086 ca5406        	or	a,21510
1208  0089 c75406        	ld	21510,a
1209  008c               L174:
1210                     ; 274 }
1213  008c 85            	popw	x
1214  008d 81            	ret
1271                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1271                     ; 287 {
1272                     .text:	section	.text,new
1273  0000               _ADC1_ConversionConfig:
1275  0000 89            	pushw	x
1276       00000000      OFST:	set	0
1279                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1281                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1283                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1285                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1287  0001 72175402      	bres	21506,#3
1288                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1290  0005 c65402        	ld	a,21506
1291  0008 1a05          	or	a,(OFST+5,sp)
1292  000a c75402        	ld	21506,a
1293                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1295  000d 9e            	ld	a,xh
1296  000e a101          	cp	a,#1
1297  0010 2606          	jrne	L535
1298                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1300  0012 72125401      	bset	21505,#1
1302  0016 2004          	jra	L735
1303  0018               L535:
1304                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1306  0018 72135401      	bres	21505,#1
1307  001c               L735:
1308                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1310  001c c65400        	ld	a,21504
1311  001f a4f0          	and	a,#240
1312  0021 c75400        	ld	21504,a
1313                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1315  0024 c65400        	ld	a,21504
1316  0027 1a02          	or	a,(OFST+2,sp)
1317  0029 c75400        	ld	21504,a
1318                     ; 313 }
1321  002c 85            	popw	x
1322  002d 81            	ret
1368                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1368                     ; 326 {
1369                     .text:	section	.text,new
1370  0000               _ADC1_ExternalTriggerConfig:
1372  0000 89            	pushw	x
1373       00000000      OFST:	set	0
1376                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1378                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1380                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1382  0001 c65402        	ld	a,21506
1383  0004 a4cf          	and	a,#207
1384  0006 c75402        	ld	21506,a
1385                     ; 334   if (NewState != DISABLE)
1387  0009 9f            	ld	a,xl
1388  000a 4d            	tnz	a
1389  000b 2706          	jreq	L365
1390                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1392  000d 721c5402      	bset	21506,#6
1394  0011 2004          	jra	L565
1395  0013               L365:
1396                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1398  0013 721d5402      	bres	21506,#6
1399  0017               L565:
1400                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1402  0017 c65402        	ld	a,21506
1403  001a 1a01          	or	a,(OFST+1,sp)
1404  001c c75402        	ld	21506,a
1405                     ; 347 }
1408  001f 85            	popw	x
1409  0020 81            	ret
1433                     ; 358 void ADC1_StartConversion(void)
1433                     ; 359 {
1434                     .text:	section	.text,new
1435  0000               _ADC1_StartConversion:
1439                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1441  0000 72105401      	bset	21505,#0
1442                     ; 361 }
1445  0004 81            	ret
1485                     ; 370 uint16_t ADC1_GetConversionValue(void)
1485                     ; 371 {
1486                     .text:	section	.text,new
1487  0000               _ADC1_GetConversionValue:
1489  0000 5205          	subw	sp,#5
1490       00000005      OFST:	set	5
1493                     ; 372   uint16_t temph = 0;
1495                     ; 373   uint8_t templ = 0;
1497                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1499  0002 c65402        	ld	a,21506
1500  0005 a508          	bcp	a,#8
1501  0007 2715          	jreq	L516
1502                     ; 378     templ = ADC1->DRL;
1504  0009 c65405        	ld	a,21509
1505  000c 6b03          	ld	(OFST-2,sp),a
1507                     ; 380     temph = ADC1->DRH;
1509  000e c65404        	ld	a,21508
1510  0011 5f            	clrw	x
1511  0012 97            	ld	xl,a
1512  0013 1f04          	ldw	(OFST-1,sp),x
1514                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1516  0015 1e04          	ldw	x,(OFST-1,sp)
1517  0017 7b03          	ld	a,(OFST-2,sp)
1518  0019 02            	rlwa	x,a
1519  001a 1f04          	ldw	(OFST-1,sp),x
1522  001c 2021          	jra	L716
1523  001e               L516:
1524                     ; 387     temph = ADC1->DRH;
1526  001e c65404        	ld	a,21508
1527  0021 5f            	clrw	x
1528  0022 97            	ld	xl,a
1529  0023 1f04          	ldw	(OFST-1,sp),x
1531                     ; 389     templ = ADC1->DRL;
1533  0025 c65405        	ld	a,21509
1534  0028 6b03          	ld	(OFST-2,sp),a
1536                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1538  002a 1e04          	ldw	x,(OFST-1,sp)
1539  002c 4f            	clr	a
1540  002d 02            	rlwa	x,a
1541  002e 1f01          	ldw	(OFST-4,sp),x
1543  0030 7b03          	ld	a,(OFST-2,sp)
1544  0032 97            	ld	xl,a
1545  0033 a640          	ld	a,#64
1546  0035 42            	mul	x,a
1547  0036 01            	rrwa	x,a
1548  0037 1a02          	or	a,(OFST-3,sp)
1549  0039 01            	rrwa	x,a
1550  003a 1a01          	or	a,(OFST-4,sp)
1551  003c 01            	rrwa	x,a
1552  003d 1f04          	ldw	(OFST-1,sp),x
1554  003f               L716:
1555                     ; 394   return ((uint16_t)temph);
1557  003f 1e04          	ldw	x,(OFST-1,sp)
1560  0041 5b05          	addw	sp,#5
1561  0043 81            	ret
1607                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1607                     ; 406 {
1608                     .text:	section	.text,new
1609  0000               _ADC1_AWDChannelConfig:
1611  0000 89            	pushw	x
1612       00000000      OFST:	set	0
1615                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1617                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1619                     ; 411   if (Channel < (uint8_t)8)
1621  0001 9e            	ld	a,xh
1622  0002 a108          	cp	a,#8
1623  0004 242e          	jruge	L346
1624                     ; 413     if (NewState != DISABLE)
1626  0006 9f            	ld	a,xl
1627  0007 4d            	tnz	a
1628  0008 2714          	jreq	L546
1629                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1631  000a 9e            	ld	a,xh
1632  000b 5f            	clrw	x
1633  000c 97            	ld	xl,a
1634  000d a601          	ld	a,#1
1635  000f 5d            	tnzw	x
1636  0010 2704          	jreq	L65
1637  0012               L06:
1638  0012 48            	sll	a
1639  0013 5a            	decw	x
1640  0014 26fc          	jrne	L06
1641  0016               L65:
1642  0016 ca540f        	or	a,21519
1643  0019 c7540f        	ld	21519,a
1645  001c 2047          	jra	L156
1646  001e               L546:
1647                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1649  001e 7b01          	ld	a,(OFST+1,sp)
1650  0020 5f            	clrw	x
1651  0021 97            	ld	xl,a
1652  0022 a601          	ld	a,#1
1653  0024 5d            	tnzw	x
1654  0025 2704          	jreq	L26
1655  0027               L46:
1656  0027 48            	sll	a
1657  0028 5a            	decw	x
1658  0029 26fc          	jrne	L46
1659  002b               L26:
1660  002b 43            	cpl	a
1661  002c c4540f        	and	a,21519
1662  002f c7540f        	ld	21519,a
1663  0032 2031          	jra	L156
1664  0034               L346:
1665                     ; 424     if (NewState != DISABLE)
1667  0034 0d02          	tnz	(OFST+2,sp)
1668  0036 2717          	jreq	L356
1669                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1671  0038 7b01          	ld	a,(OFST+1,sp)
1672  003a a008          	sub	a,#8
1673  003c 5f            	clrw	x
1674  003d 97            	ld	xl,a
1675  003e a601          	ld	a,#1
1676  0040 5d            	tnzw	x
1677  0041 2704          	jreq	L66
1678  0043               L07:
1679  0043 48            	sll	a
1680  0044 5a            	decw	x
1681  0045 26fc          	jrne	L07
1682  0047               L66:
1683  0047 ca540e        	or	a,21518
1684  004a c7540e        	ld	21518,a
1686  004d 2016          	jra	L156
1687  004f               L356:
1688                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1690  004f 7b01          	ld	a,(OFST+1,sp)
1691  0051 a008          	sub	a,#8
1692  0053 5f            	clrw	x
1693  0054 97            	ld	xl,a
1694  0055 a601          	ld	a,#1
1695  0057 5d            	tnzw	x
1696  0058 2704          	jreq	L27
1697  005a               L47:
1698  005a 48            	sll	a
1699  005b 5a            	decw	x
1700  005c 26fc          	jrne	L47
1701  005e               L27:
1702  005e 43            	cpl	a
1703  005f c4540e        	and	a,21518
1704  0062 c7540e        	ld	21518,a
1705  0065               L156:
1706                     ; 433 }
1709  0065 85            	popw	x
1710  0066 81            	ret
1743                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1743                     ; 442 {
1744                     .text:	section	.text,new
1745  0000               _ADC1_SetHighThreshold:
1747  0000 89            	pushw	x
1748       00000000      OFST:	set	0
1751                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1753  0001 54            	srlw	x
1754  0002 54            	srlw	x
1755  0003 9f            	ld	a,xl
1756  0004 c75408        	ld	21512,a
1757                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1759  0007 7b02          	ld	a,(OFST+2,sp)
1760  0009 c75409        	ld	21513,a
1761                     ; 445 }
1764  000c 85            	popw	x
1765  000d 81            	ret
1798                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1798                     ; 454 {
1799                     .text:	section	.text,new
1800  0000               _ADC1_SetLowThreshold:
1804                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1806  0000 9f            	ld	a,xl
1807  0001 c7540b        	ld	21515,a
1808                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1810  0004 54            	srlw	x
1811  0005 54            	srlw	x
1812  0006 9f            	ld	a,xl
1813  0007 c7540a        	ld	21514,a
1814                     ; 457 }
1817  000a 81            	ret
1864                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1864                     ; 467 {
1865                     .text:	section	.text,new
1866  0000               _ADC1_GetBufferValue:
1868  0000 88            	push	a
1869  0001 5205          	subw	sp,#5
1870       00000005      OFST:	set	5
1873                     ; 468   uint16_t temph = 0;
1875                     ; 469   uint8_t templ = 0;
1877                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1879                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1881  0003 c65402        	ld	a,21506
1882  0006 a508          	bcp	a,#8
1883  0008 271f          	jreq	L727
1884                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1886  000a 7b06          	ld	a,(OFST+1,sp)
1887  000c 48            	sll	a
1888  000d 5f            	clrw	x
1889  000e 97            	ld	xl,a
1890  000f d653e1        	ld	a,(21473,x)
1891  0012 6b03          	ld	(OFST-2,sp),a
1893                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1895  0014 7b06          	ld	a,(OFST+1,sp)
1896  0016 48            	sll	a
1897  0017 5f            	clrw	x
1898  0018 97            	ld	xl,a
1899  0019 d653e0        	ld	a,(21472,x)
1900  001c 5f            	clrw	x
1901  001d 97            	ld	xl,a
1902  001e 1f04          	ldw	(OFST-1,sp),x
1904                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1906  0020 1e04          	ldw	x,(OFST-1,sp)
1907  0022 7b03          	ld	a,(OFST-2,sp)
1908  0024 02            	rlwa	x,a
1909  0025 1f04          	ldw	(OFST-1,sp),x
1912  0027 202b          	jra	L137
1913  0029               L727:
1914                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1916  0029 7b06          	ld	a,(OFST+1,sp)
1917  002b 48            	sll	a
1918  002c 5f            	clrw	x
1919  002d 97            	ld	xl,a
1920  002e d653e0        	ld	a,(21472,x)
1921  0031 5f            	clrw	x
1922  0032 97            	ld	xl,a
1923  0033 1f04          	ldw	(OFST-1,sp),x
1925                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1927  0035 7b06          	ld	a,(OFST+1,sp)
1928  0037 48            	sll	a
1929  0038 5f            	clrw	x
1930  0039 97            	ld	xl,a
1931  003a d653e1        	ld	a,(21473,x)
1932  003d 6b03          	ld	(OFST-2,sp),a
1934                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1936  003f 1e04          	ldw	x,(OFST-1,sp)
1937  0041 4f            	clr	a
1938  0042 02            	rlwa	x,a
1939  0043 1f01          	ldw	(OFST-4,sp),x
1941  0045 7b03          	ld	a,(OFST-2,sp)
1942  0047 97            	ld	xl,a
1943  0048 a640          	ld	a,#64
1944  004a 42            	mul	x,a
1945  004b 01            	rrwa	x,a
1946  004c 1a02          	or	a,(OFST-3,sp)
1947  004e 01            	rrwa	x,a
1948  004f 1a01          	or	a,(OFST-4,sp)
1949  0051 01            	rrwa	x,a
1950  0052 1f04          	ldw	(OFST-1,sp),x
1952  0054               L137:
1953                     ; 493   return ((uint16_t)temph);
1955  0054 1e04          	ldw	x,(OFST-1,sp)
1958  0056 5b06          	addw	sp,#6
1959  0058 81            	ret
2023                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2023                     ; 503 {
2024                     .text:	section	.text,new
2025  0000               _ADC1_GetAWDChannelStatus:
2027  0000 88            	push	a
2028  0001 88            	push	a
2029       00000001      OFST:	set	1
2032                     ; 504   uint8_t status = 0;
2034                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2036                     ; 509   if (Channel < (uint8_t)8)
2038  0002 a108          	cp	a,#8
2039  0004 2412          	jruge	L367
2040                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2042  0006 5f            	clrw	x
2043  0007 97            	ld	xl,a
2044  0008 a601          	ld	a,#1
2045  000a 5d            	tnzw	x
2046  000b 2704          	jreq	L601
2047  000d               L011:
2048  000d 48            	sll	a
2049  000e 5a            	decw	x
2050  000f 26fc          	jrne	L011
2051  0011               L601:
2052  0011 c4540d        	and	a,21517
2053  0014 6b01          	ld	(OFST+0,sp),a
2056  0016 2014          	jra	L567
2057  0018               L367:
2058                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2060  0018 7b02          	ld	a,(OFST+1,sp)
2061  001a a008          	sub	a,#8
2062  001c 5f            	clrw	x
2063  001d 97            	ld	xl,a
2064  001e a601          	ld	a,#1
2065  0020 5d            	tnzw	x
2066  0021 2704          	jreq	L211
2067  0023               L411:
2068  0023 48            	sll	a
2069  0024 5a            	decw	x
2070  0025 26fc          	jrne	L411
2071  0027               L211:
2072  0027 c4540c        	and	a,21516
2073  002a 6b01          	ld	(OFST+0,sp),a
2075  002c               L567:
2076                     ; 518   return ((FlagStatus)status);
2078  002c 7b01          	ld	a,(OFST+0,sp)
2081  002e 85            	popw	x
2082  002f 81            	ret
2236                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2236                     ; 528 {
2237                     .text:	section	.text,new
2238  0000               _ADC1_GetFlagStatus:
2240  0000 88            	push	a
2241  0001 88            	push	a
2242       00000001      OFST:	set	1
2245                     ; 529   uint8_t flagstatus = 0;
2247                     ; 530   uint8_t temp = 0;
2249                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2251                     ; 535   if ((Flag & 0x0F) == 0x01)
2253  0002 a40f          	and	a,#15
2254  0004 a101          	cp	a,#1
2255  0006 2609          	jrne	L1501
2256                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2258  0008 c65403        	ld	a,21507
2259  000b a440          	and	a,#64
2260  000d 6b01          	ld	(OFST+0,sp),a
2263  000f 2045          	jra	L3501
2264  0011               L1501:
2265                     ; 540   else if ((Flag & 0xF0) == 0x10)
2267  0011 7b02          	ld	a,(OFST+1,sp)
2268  0013 a4f0          	and	a,#240
2269  0015 a110          	cp	a,#16
2270  0017 2636          	jrne	L5501
2271                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2273  0019 7b02          	ld	a,(OFST+1,sp)
2274  001b a40f          	and	a,#15
2275  001d 6b01          	ld	(OFST+0,sp),a
2277                     ; 544     if (temp < 8)
2279  001f 7b01          	ld	a,(OFST+0,sp)
2280  0021 a108          	cp	a,#8
2281  0023 2414          	jruge	L7501
2282                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2284  0025 7b01          	ld	a,(OFST+0,sp)
2285  0027 5f            	clrw	x
2286  0028 97            	ld	xl,a
2287  0029 a601          	ld	a,#1
2288  002b 5d            	tnzw	x
2289  002c 2704          	jreq	L021
2290  002e               L221:
2291  002e 48            	sll	a
2292  002f 5a            	decw	x
2293  0030 26fc          	jrne	L221
2294  0032               L021:
2295  0032 c4540d        	and	a,21517
2296  0035 6b01          	ld	(OFST+0,sp),a
2299  0037 201d          	jra	L3501
2300  0039               L7501:
2301                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2303  0039 7b01          	ld	a,(OFST+0,sp)
2304  003b a008          	sub	a,#8
2305  003d 5f            	clrw	x
2306  003e 97            	ld	xl,a
2307  003f a601          	ld	a,#1
2308  0041 5d            	tnzw	x
2309  0042 2704          	jreq	L421
2310  0044               L621:
2311  0044 48            	sll	a
2312  0045 5a            	decw	x
2313  0046 26fc          	jrne	L621
2314  0048               L421:
2315  0048 c4540c        	and	a,21516
2316  004b 6b01          	ld	(OFST+0,sp),a
2318  004d 2007          	jra	L3501
2319  004f               L5501:
2320                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2322  004f c65400        	ld	a,21504
2323  0052 1402          	and	a,(OFST+1,sp)
2324  0054 6b01          	ld	(OFST+0,sp),a
2326  0056               L3501:
2327                     ; 557   return ((FlagStatus)flagstatus);
2329  0056 7b01          	ld	a,(OFST+0,sp)
2332  0058 85            	popw	x
2333  0059 81            	ret
2375                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2375                     ; 568 {
2376                     .text:	section	.text,new
2377  0000               _ADC1_ClearFlag:
2379  0000 88            	push	a
2380  0001 88            	push	a
2381       00000001      OFST:	set	1
2384                     ; 569   uint8_t temp = 0;
2386                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2388                     ; 574   if ((Flag & 0x0F) == 0x01)
2390  0002 a40f          	and	a,#15
2391  0004 a101          	cp	a,#1
2392  0006 2606          	jrne	L5011
2393                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2395  0008 721d5403      	bres	21507,#6
2397  000c 204b          	jra	L7011
2398  000e               L5011:
2399                     ; 579   else if ((Flag & 0xF0) == 0x10)
2401  000e 7b02          	ld	a,(OFST+1,sp)
2402  0010 a4f0          	and	a,#240
2403  0012 a110          	cp	a,#16
2404  0014 263a          	jrne	L1111
2405                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2407  0016 7b02          	ld	a,(OFST+1,sp)
2408  0018 a40f          	and	a,#15
2409  001a 6b01          	ld	(OFST+0,sp),a
2411                     ; 583     if (temp < 8)
2413  001c 7b01          	ld	a,(OFST+0,sp)
2414  001e a108          	cp	a,#8
2415  0020 2416          	jruge	L3111
2416                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2418  0022 7b01          	ld	a,(OFST+0,sp)
2419  0024 5f            	clrw	x
2420  0025 97            	ld	xl,a
2421  0026 a601          	ld	a,#1
2422  0028 5d            	tnzw	x
2423  0029 2704          	jreq	L231
2424  002b               L431:
2425  002b 48            	sll	a
2426  002c 5a            	decw	x
2427  002d 26fc          	jrne	L431
2428  002f               L231:
2429  002f 43            	cpl	a
2430  0030 c4540d        	and	a,21517
2431  0033 c7540d        	ld	21517,a
2433  0036 2021          	jra	L7011
2434  0038               L3111:
2435                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2437  0038 7b01          	ld	a,(OFST+0,sp)
2438  003a a008          	sub	a,#8
2439  003c 5f            	clrw	x
2440  003d 97            	ld	xl,a
2441  003e a601          	ld	a,#1
2442  0040 5d            	tnzw	x
2443  0041 2704          	jreq	L631
2444  0043               L041:
2445  0043 48            	sll	a
2446  0044 5a            	decw	x
2447  0045 26fc          	jrne	L041
2448  0047               L631:
2449  0047 43            	cpl	a
2450  0048 c4540c        	and	a,21516
2451  004b c7540c        	ld	21516,a
2452  004e 2009          	jra	L7011
2453  0050               L1111:
2454                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2456  0050 7b02          	ld	a,(OFST+1,sp)
2457  0052 43            	cpl	a
2458  0053 c45400        	and	a,21504
2459  0056 c75400        	ld	21504,a
2460  0059               L7011:
2461                     ; 596 }
2464  0059 85            	popw	x
2465  005a 81            	ret
2518                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2518                     ; 617 {
2519                     .text:	section	.text,new
2520  0000               _ADC1_GetITStatus:
2522  0000 89            	pushw	x
2523  0001 88            	push	a
2524       00000001      OFST:	set	1
2527                     ; 618   ITStatus itstatus = RESET;
2529                     ; 619   uint8_t temp = 0;
2531                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2533                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2535  0002 01            	rrwa	x,a
2536  0003 a4f0          	and	a,#240
2537  0005 5f            	clrw	x
2538  0006 02            	rlwa	x,a
2539  0007 a30010        	cpw	x,#16
2540  000a 2636          	jrne	L5411
2541                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2543  000c 7b03          	ld	a,(OFST+2,sp)
2544  000e a40f          	and	a,#15
2545  0010 6b01          	ld	(OFST+0,sp),a
2547                     ; 628     if (temp < 8)
2549  0012 7b01          	ld	a,(OFST+0,sp)
2550  0014 a108          	cp	a,#8
2551  0016 2414          	jruge	L7411
2552                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2554  0018 7b01          	ld	a,(OFST+0,sp)
2555  001a 5f            	clrw	x
2556  001b 97            	ld	xl,a
2557  001c a601          	ld	a,#1
2558  001e 5d            	tnzw	x
2559  001f 2704          	jreq	L441
2560  0021               L641:
2561  0021 48            	sll	a
2562  0022 5a            	decw	x
2563  0023 26fc          	jrne	L641
2564  0025               L441:
2565  0025 c4540d        	and	a,21517
2566  0028 6b01          	ld	(OFST+0,sp),a
2569  002a 201d          	jra	L3511
2570  002c               L7411:
2571                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2573  002c 7b01          	ld	a,(OFST+0,sp)
2574  002e a008          	sub	a,#8
2575  0030 5f            	clrw	x
2576  0031 97            	ld	xl,a
2577  0032 a601          	ld	a,#1
2578  0034 5d            	tnzw	x
2579  0035 2704          	jreq	L051
2580  0037               L251:
2581  0037 48            	sll	a
2582  0038 5a            	decw	x
2583  0039 26fc          	jrne	L251
2584  003b               L051:
2585  003b c4540c        	and	a,21516
2586  003e 6b01          	ld	(OFST+0,sp),a
2588  0040 2007          	jra	L3511
2589  0042               L5411:
2590                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2592  0042 c65400        	ld	a,21504
2593  0045 1403          	and	a,(OFST+2,sp)
2594  0047 6b01          	ld	(OFST+0,sp),a
2596  0049               L3511:
2597                     ; 641   return ((ITStatus)itstatus);
2599  0049 7b01          	ld	a,(OFST+0,sp)
2602  004b 5b03          	addw	sp,#3
2603  004d 81            	ret
2646                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2646                     ; 663 {
2647                     .text:	section	.text,new
2648  0000               _ADC1_ClearITPendingBit:
2650  0000 89            	pushw	x
2651  0001 88            	push	a
2652       00000001      OFST:	set	1
2655                     ; 664   uint8_t temp = 0;
2657                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2659                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2661  0002 01            	rrwa	x,a
2662  0003 a4f0          	and	a,#240
2663  0005 5f            	clrw	x
2664  0006 02            	rlwa	x,a
2665  0007 a30010        	cpw	x,#16
2666  000a 263a          	jrne	L5711
2667                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2669  000c 7b03          	ld	a,(OFST+2,sp)
2670  000e a40f          	and	a,#15
2671  0010 6b01          	ld	(OFST+0,sp),a
2673                     ; 673     if (temp < 8)
2675  0012 7b01          	ld	a,(OFST+0,sp)
2676  0014 a108          	cp	a,#8
2677  0016 2416          	jruge	L7711
2678                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2680  0018 7b01          	ld	a,(OFST+0,sp)
2681  001a 5f            	clrw	x
2682  001b 97            	ld	xl,a
2683  001c a601          	ld	a,#1
2684  001e 5d            	tnzw	x
2685  001f 2704          	jreq	L651
2686  0021               L061:
2687  0021 48            	sll	a
2688  0022 5a            	decw	x
2689  0023 26fc          	jrne	L061
2690  0025               L651:
2691  0025 43            	cpl	a
2692  0026 c4540d        	and	a,21517
2693  0029 c7540d        	ld	21517,a
2695  002c 2021          	jra	L3021
2696  002e               L7711:
2697                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2699  002e 7b01          	ld	a,(OFST+0,sp)
2700  0030 a008          	sub	a,#8
2701  0032 5f            	clrw	x
2702  0033 97            	ld	xl,a
2703  0034 a601          	ld	a,#1
2704  0036 5d            	tnzw	x
2705  0037 2704          	jreq	L261
2706  0039               L461:
2707  0039 48            	sll	a
2708  003a 5a            	decw	x
2709  003b 26fc          	jrne	L461
2710  003d               L261:
2711  003d 43            	cpl	a
2712  003e c4540c        	and	a,21516
2713  0041 c7540c        	ld	21516,a
2714  0044 2009          	jra	L3021
2715  0046               L5711:
2716                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2718  0046 7b03          	ld	a,(OFST+2,sp)
2719  0048 43            	cpl	a
2720  0049 c45400        	and	a,21504
2721  004c c75400        	ld	21504,a
2722  004f               L3021:
2723                     ; 686 }
2726  004f 5b03          	addw	sp,#3
2727  0051 81            	ret
2740                     	xdef	_ADC1_ClearITPendingBit
2741                     	xdef	_ADC1_GetITStatus
2742                     	xdef	_ADC1_ClearFlag
2743                     	xdef	_ADC1_GetFlagStatus
2744                     	xdef	_ADC1_GetAWDChannelStatus
2745                     	xdef	_ADC1_GetBufferValue
2746                     	xdef	_ADC1_SetLowThreshold
2747                     	xdef	_ADC1_SetHighThreshold
2748                     	xdef	_ADC1_GetConversionValue
2749                     	xdef	_ADC1_StartConversion
2750                     	xdef	_ADC1_AWDChannelConfig
2751                     	xdef	_ADC1_ExternalTriggerConfig
2752                     	xdef	_ADC1_ConversionConfig
2753                     	xdef	_ADC1_SchmittTriggerConfig
2754                     	xdef	_ADC1_PrescalerConfig
2755                     	xdef	_ADC1_ITConfig
2756                     	xdef	_ADC1_DataBufferCmd
2757                     	xdef	_ADC1_ScanModeCmd
2758                     	xdef	_ADC1_Cmd
2759                     	xdef	_ADC1_Init
2760                     	xdef	_ADC1_DeInit
2779                     	end
