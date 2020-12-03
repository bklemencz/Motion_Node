   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 50 void SPI_DeInit(void)
  43                     ; 51 {
  45                     .text:	section	.text,new
  46  0000               _SPI_DeInit:
  50                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  52  0000 725f5200      	clr	20992
  53                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  55  0004 725f5201      	clr	20993
  56                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  58  0008 725f5202      	clr	20994
  59                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  61  000c 35025203      	mov	20995,#2
  62                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  64  0010 35075205      	mov	20997,#7
  65                     ; 57 }
  68  0014 81            	ret
 382                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 382                     ; 79 {
 383                     .text:	section	.text,new
 384  0000               _SPI_Init:
 386  0000 89            	pushw	x
 387  0001 88            	push	a
 388       00000001      OFST:	set	1
 391                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 393                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 395                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 397                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 399                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 401                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 403                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 405                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 407                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 407                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 409  0002 7b07          	ld	a,(OFST+6,sp)
 410  0004 1a08          	or	a,(OFST+7,sp)
 411  0006 6b01          	ld	(OFST+0,sp),a
 413  0008 9f            	ld	a,xl
 414  0009 1a02          	or	a,(OFST+1,sp)
 415  000b 1a01          	or	a,(OFST+0,sp)
 416  000d c75200        	ld	20992,a
 417                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 419  0010 7b09          	ld	a,(OFST+8,sp)
 420  0012 1a0a          	or	a,(OFST+9,sp)
 421  0014 c75201        	ld	20993,a
 422                     ; 97   if (Mode == SPI_MODE_MASTER)
 424  0017 7b06          	ld	a,(OFST+5,sp)
 425  0019 a104          	cp	a,#4
 426  001b 2606          	jrne	L102
 427                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 429  001d 72105201      	bset	20993,#0
 431  0021 2004          	jra	L302
 432  0023               L102:
 433                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 435  0023 72115201      	bres	20993,#0
 436  0027               L302:
 437                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 439  0027 c65200        	ld	a,20992
 440  002a 1a06          	or	a,(OFST+5,sp)
 441  002c c75200        	ld	20992,a
 442                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 444  002f 7b0b          	ld	a,(OFST+10,sp)
 445  0031 c75205        	ld	20997,a
 446                     ; 111 }
 449  0034 5b03          	addw	sp,#3
 450  0036 81            	ret
 505                     ; 119 void SPI_Cmd(FunctionalState NewState)
 505                     ; 120 {
 506                     .text:	section	.text,new
 507  0000               _SPI_Cmd:
 511                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 513                     ; 124   if (NewState != DISABLE)
 515  0000 4d            	tnz	a
 516  0001 2706          	jreq	L332
 517                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 519  0003 721c5200      	bset	20992,#6
 521  0007 2004          	jra	L532
 522  0009               L332:
 523                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 525  0009 721d5200      	bres	20992,#6
 526  000d               L532:
 527                     ; 132 }
 530  000d 81            	ret
 637                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 637                     ; 142 {
 638                     .text:	section	.text,new
 639  0000               _SPI_ITConfig:
 641  0000 89            	pushw	x
 642  0001 88            	push	a
 643       00000001      OFST:	set	1
 646                     ; 143   uint8_t itpos = 0;
 648                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 650                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 652                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 654  0002 9e            	ld	a,xh
 655  0003 a40f          	and	a,#15
 656  0005 5f            	clrw	x
 657  0006 97            	ld	xl,a
 658  0007 a601          	ld	a,#1
 659  0009 5d            	tnzw	x
 660  000a 2704          	jreq	L41
 661  000c               L61:
 662  000c 48            	sll	a
 663  000d 5a            	decw	x
 664  000e 26fc          	jrne	L61
 665  0010               L41:
 666  0010 6b01          	ld	(OFST+0,sp),a
 668                     ; 151   if (NewState != DISABLE)
 670  0012 0d03          	tnz	(OFST+2,sp)
 671  0014 270a          	jreq	L503
 672                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 674  0016 c65202        	ld	a,20994
 675  0019 1a01          	or	a,(OFST+0,sp)
 676  001b c75202        	ld	20994,a
 678  001e 2009          	jra	L703
 679  0020               L503:
 680                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 682  0020 7b01          	ld	a,(OFST+0,sp)
 683  0022 43            	cpl	a
 684  0023 c45202        	and	a,20994
 685  0026 c75202        	ld	20994,a
 686  0029               L703:
 687                     ; 159 }
 690  0029 5b03          	addw	sp,#3
 691  002b 81            	ret
 723                     ; 166 void SPI_SendData(uint8_t Data)
 723                     ; 167 {
 724                     .text:	section	.text,new
 725  0000               _SPI_SendData:
 729                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 731  0000 c75204        	ld	20996,a
 732                     ; 169 }
 735  0003 81            	ret
 758                     ; 176 uint8_t SPI_ReceiveData(void)
 758                     ; 177 {
 759                     .text:	section	.text,new
 760  0000               _SPI_ReceiveData:
 764                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 766  0000 c65204        	ld	a,20996
 769  0003 81            	ret
 805                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 805                     ; 188 {
 806                     .text:	section	.text,new
 807  0000               _SPI_NSSInternalSoftwareCmd:
 811                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 813                     ; 192   if (NewState != DISABLE)
 815  0000 4d            	tnz	a
 816  0001 2706          	jreq	L353
 817                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 819  0003 72105201      	bset	20993,#0
 821  0007 2004          	jra	L553
 822  0009               L353:
 823                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 825  0009 72115201      	bres	20993,#0
 826  000d               L553:
 827                     ; 200 }
 830  000d 81            	ret
 853                     ; 207 void SPI_TransmitCRC(void)
 853                     ; 208 {
 854                     .text:	section	.text,new
 855  0000               _SPI_TransmitCRC:
 859                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 861  0000 72185201      	bset	20993,#4
 862                     ; 210 }
 865  0004 81            	ret
 901                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 901                     ; 219 {
 902                     .text:	section	.text,new
 903  0000               _SPI_CalculateCRCCmd:
 907                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 909                     ; 223   if (NewState != DISABLE)
 911  0000 4d            	tnz	a
 912  0001 2706          	jreq	L504
 913                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 915  0003 721a5201      	bset	20993,#5
 917  0007 2004          	jra	L704
 918  0009               L504:
 919                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 921  0009 721b5201      	bres	20993,#5
 922  000d               L704:
 923                     ; 231 }
 926  000d 81            	ret
 988                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 988                     ; 239 {
 989                     .text:	section	.text,new
 990  0000               _SPI_GetCRC:
 992  0000 88            	push	a
 993       00000001      OFST:	set	1
 996                     ; 240   uint8_t crcreg = 0;
 998                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1000                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1002  0001 4d            	tnz	a
1003  0002 2707          	jreq	L144
1004                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1006  0004 c65207        	ld	a,20999
1007  0007 6b01          	ld	(OFST+0,sp),a
1010  0009 2005          	jra	L344
1011  000b               L144:
1012                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1014  000b c65206        	ld	a,20998
1015  000e 6b01          	ld	(OFST+0,sp),a
1017  0010               L344:
1018                     ; 255   return crcreg;
1020  0010 7b01          	ld	a,(OFST+0,sp)
1023  0012 5b01          	addw	sp,#1
1024  0014 81            	ret
1049                     ; 263 void SPI_ResetCRC(void)
1049                     ; 264 {
1050                     .text:	section	.text,new
1051  0000               _SPI_ResetCRC:
1055                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1057  0000 a601          	ld	a,#1
1058  0002 cd0000        	call	_SPI_CalculateCRCCmd
1060                     ; 270   SPI_Cmd(ENABLE);
1062  0005 a601          	ld	a,#1
1063  0007 cd0000        	call	_SPI_Cmd
1065                     ; 271 }
1068  000a 81            	ret
1092                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1092                     ; 279 {
1093                     .text:	section	.text,new
1094  0000               _SPI_GetCRCPolynomial:
1098                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1100  0000 c65205        	ld	a,20997
1103  0003 81            	ret
1159                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1159                     ; 289 {
1160                     .text:	section	.text,new
1161  0000               _SPI_BiDirectionalLineConfig:
1165                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1167                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1169  0000 4d            	tnz	a
1170  0001 2706          	jreq	L315
1171                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1173  0003 721c5201      	bset	20993,#6
1175  0007 2004          	jra	L515
1176  0009               L315:
1177                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1179  0009 721d5201      	bres	20993,#6
1180  000d               L515:
1181                     ; 301 }
1184  000d 81            	ret
1305                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1305                     ; 312 {
1306                     .text:	section	.text,new
1307  0000               _SPI_GetFlagStatus:
1309  0000 88            	push	a
1310       00000001      OFST:	set	1
1313                     ; 313   FlagStatus status = RESET;
1315                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1317                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1319  0001 c45203        	and	a,20995
1320  0004 2706          	jreq	L375
1321                     ; 320     status = SET; /* SPI_FLAG is set */
1323  0006 a601          	ld	a,#1
1324  0008 6b01          	ld	(OFST+0,sp),a
1327  000a 2002          	jra	L575
1328  000c               L375:
1329                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1331  000c 0f01          	clr	(OFST+0,sp)
1333  000e               L575:
1334                     ; 328   return status;
1336  000e 7b01          	ld	a,(OFST+0,sp)
1339  0010 5b01          	addw	sp,#1
1340  0012 81            	ret
1375                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1375                     ; 347 {
1376                     .text:	section	.text,new
1377  0000               _SPI_ClearFlag:
1381                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1383                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1385  0000 43            	cpl	a
1386  0001 c75203        	ld	20995,a
1387                     ; 351 }
1390  0004 81            	ret
1464                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1464                     ; 367 {
1465                     .text:	section	.text,new
1466  0000               _SPI_GetITStatus:
1468  0000 88            	push	a
1469  0001 89            	pushw	x
1470       00000002      OFST:	set	2
1473                     ; 368   ITStatus pendingbitstatus = RESET;
1475                     ; 369   uint8_t itpos = 0;
1477                     ; 370   uint8_t itmask1 = 0;
1479                     ; 371   uint8_t itmask2 = 0;
1481                     ; 372   uint8_t enablestatus = 0;
1483                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1485                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1487  0002 a40f          	and	a,#15
1488  0004 5f            	clrw	x
1489  0005 97            	ld	xl,a
1490  0006 a601          	ld	a,#1
1491  0008 5d            	tnzw	x
1492  0009 2704          	jreq	L05
1493  000b               L25:
1494  000b 48            	sll	a
1495  000c 5a            	decw	x
1496  000d 26fc          	jrne	L25
1497  000f               L05:
1498  000f 6b01          	ld	(OFST-1,sp),a
1500                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1502  0011 7b03          	ld	a,(OFST+1,sp)
1503  0013 4e            	swap	a
1504  0014 a40f          	and	a,#15
1505  0016 6b02          	ld	(OFST+0,sp),a
1507                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1509  0018 7b02          	ld	a,(OFST+0,sp)
1510  001a 5f            	clrw	x
1511  001b 97            	ld	xl,a
1512  001c a601          	ld	a,#1
1513  001e 5d            	tnzw	x
1514  001f 2704          	jreq	L45
1515  0021               L65:
1516  0021 48            	sll	a
1517  0022 5a            	decw	x
1518  0023 26fc          	jrne	L65
1519  0025               L45:
1520  0025 6b02          	ld	(OFST+0,sp),a
1522                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1524  0027 c65203        	ld	a,20995
1525  002a 1402          	and	a,(OFST+0,sp)
1526  002c 6b02          	ld	(OFST+0,sp),a
1528                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1530  002e c65202        	ld	a,20994
1531  0031 1501          	bcp	a,(OFST-1,sp)
1532  0033 270a          	jreq	L746
1534  0035 0d02          	tnz	(OFST+0,sp)
1535  0037 2706          	jreq	L746
1536                     ; 387     pendingbitstatus = SET;
1538  0039 a601          	ld	a,#1
1539  003b 6b02          	ld	(OFST+0,sp),a
1542  003d 2002          	jra	L156
1543  003f               L746:
1544                     ; 392     pendingbitstatus = RESET;
1546  003f 0f02          	clr	(OFST+0,sp)
1548  0041               L156:
1549                     ; 395   return  pendingbitstatus;
1551  0041 7b02          	ld	a,(OFST+0,sp)
1554  0043 5b03          	addw	sp,#3
1555  0045 81            	ret
1598                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1598                     ; 413 {
1599                     .text:	section	.text,new
1600  0000               _SPI_ClearITPendingBit:
1602  0000 88            	push	a
1603       00000001      OFST:	set	1
1606                     ; 414   uint8_t itpos = 0;
1608                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1610                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1612  0001 a4f0          	and	a,#240
1613  0003 4e            	swap	a
1614  0004 a40f          	and	a,#15
1615  0006 5f            	clrw	x
1616  0007 97            	ld	xl,a
1617  0008 a601          	ld	a,#1
1618  000a 5d            	tnzw	x
1619  000b 2704          	jreq	L26
1620  000d               L46:
1621  000d 48            	sll	a
1622  000e 5a            	decw	x
1623  000f 26fc          	jrne	L46
1624  0011               L26:
1625  0011 6b01          	ld	(OFST+0,sp),a
1627                     ; 422   SPI->SR = (uint8_t)(~itpos);
1629  0013 7b01          	ld	a,(OFST+0,sp)
1630  0015 43            	cpl	a
1631  0016 c75203        	ld	20995,a
1632                     ; 424 }
1635  0019 84            	pop	a
1636  001a 81            	ret
1649                     	xdef	_SPI_ClearITPendingBit
1650                     	xdef	_SPI_GetITStatus
1651                     	xdef	_SPI_ClearFlag
1652                     	xdef	_SPI_GetFlagStatus
1653                     	xdef	_SPI_BiDirectionalLineConfig
1654                     	xdef	_SPI_GetCRCPolynomial
1655                     	xdef	_SPI_ResetCRC
1656                     	xdef	_SPI_GetCRC
1657                     	xdef	_SPI_CalculateCRCCmd
1658                     	xdef	_SPI_TransmitCRC
1659                     	xdef	_SPI_NSSInternalSoftwareCmd
1660                     	xdef	_SPI_ReceiveData
1661                     	xdef	_SPI_SendData
1662                     	xdef	_SPI_ITConfig
1663                     	xdef	_SPI_Cmd
1664                     	xdef	_SPI_Init
1665                     	xdef	_SPI_DeInit
1684                     	end
