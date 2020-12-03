   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 53 void UART2_DeInit(void)
  43                     ; 54 {
  45                     .text:	section	.text,new
  46  0000               _UART2_DeInit:
  50                     ; 57   (void) UART2->SR;
  52  0000 c65240        	ld	a,21056
  53                     ; 58   (void)UART2->DR;
  55  0003 c65241        	ld	a,21057
  56                     ; 60   UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  58  0006 725f5243      	clr	21059
  59                     ; 61   UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  61  000a 725f5242      	clr	21058
  62                     ; 63   UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  64  000e 725f5244      	clr	21060
  65                     ; 64   UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  67  0012 725f5245      	clr	21061
  68                     ; 65   UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  70  0016 725f5246      	clr	21062
  71                     ; 66   UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  73  001a 725f5247      	clr	21063
  74                     ; 67   UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  76  001e 725f5248      	clr	21064
  77                     ; 68   UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  79  0022 725f5249      	clr	21065
  80                     ; 69 }
  83  0026 81            	ret
 394                     .const:	section	.text
 395  0000               L01:
 396  0000 00000064      	dc.l	100
 397                     ; 85 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 397                     ; 86 {
 398                     .text:	section	.text,new
 399  0000               _UART2_Init:
 401  0000 520e          	subw	sp,#14
 402       0000000e      OFST:	set	14
 405                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 409                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 413                     ; 91   assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 415                     ; 92   assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 417                     ; 93   assert_param(IS_UART2_STOPBITS_OK(StopBits));
 419                     ; 94   assert_param(IS_UART2_PARITY_OK(Parity));
 421                     ; 95   assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 423                     ; 96   assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 425                     ; 99   UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 427  0002 72195244      	bres	21060,#4
 428                     ; 101   UART2->CR1 |= (uint8_t)WordLength; 
 430  0006 c65244        	ld	a,21060
 431  0009 1a15          	or	a,(OFST+7,sp)
 432  000b c75244        	ld	21060,a
 433                     ; 104   UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 435  000e c65246        	ld	a,21062
 436  0011 a4cf          	and	a,#207
 437  0013 c75246        	ld	21062,a
 438                     ; 106   UART2->CR3 |= (uint8_t)StopBits; 
 440  0016 c65246        	ld	a,21062
 441  0019 1a16          	or	a,(OFST+8,sp)
 442  001b c75246        	ld	21062,a
 443                     ; 109   UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 445  001e c65244        	ld	a,21060
 446  0021 a4f9          	and	a,#249
 447  0023 c75244        	ld	21060,a
 448                     ; 111   UART2->CR1 |= (uint8_t)Parity;
 450  0026 c65244        	ld	a,21060
 451  0029 1a17          	or	a,(OFST+9,sp)
 452  002b c75244        	ld	21060,a
 453                     ; 114   UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 455  002e 725f5242      	clr	21058
 456                     ; 116   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 458  0032 c65243        	ld	a,21059
 459  0035 a40f          	and	a,#15
 460  0037 c75243        	ld	21059,a
 461                     ; 118   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 463  003a c65243        	ld	a,21059
 464  003d a4f0          	and	a,#240
 465  003f c75243        	ld	21059,a
 466                     ; 121   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 468  0042 96            	ldw	x,sp
 469  0043 1c0011        	addw	x,#OFST+3
 470  0046 cd0000        	call	c_ltor
 472  0049 a604          	ld	a,#4
 473  004b cd0000        	call	c_llsh
 475  004e 96            	ldw	x,sp
 476  004f 1c0001        	addw	x,#OFST-13
 477  0052 cd0000        	call	c_rtol
 480  0055 cd0000        	call	_CLK_GetClockFreq
 482  0058 96            	ldw	x,sp
 483  0059 1c0001        	addw	x,#OFST-13
 484  005c cd0000        	call	c_ludv
 486  005f 96            	ldw	x,sp
 487  0060 1c000b        	addw	x,#OFST-3
 488  0063 cd0000        	call	c_rtol
 491                     ; 122   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 493  0066 96            	ldw	x,sp
 494  0067 1c0011        	addw	x,#OFST+3
 495  006a cd0000        	call	c_ltor
 497  006d a604          	ld	a,#4
 498  006f cd0000        	call	c_llsh
 500  0072 96            	ldw	x,sp
 501  0073 1c0001        	addw	x,#OFST-13
 502  0076 cd0000        	call	c_rtol
 505  0079 cd0000        	call	_CLK_GetClockFreq
 507  007c a664          	ld	a,#100
 508  007e cd0000        	call	c_smul
 510  0081 96            	ldw	x,sp
 511  0082 1c0001        	addw	x,#OFST-13
 512  0085 cd0000        	call	c_ludv
 514  0088 96            	ldw	x,sp
 515  0089 1c0007        	addw	x,#OFST-7
 516  008c cd0000        	call	c_rtol
 519                     ; 126   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 519                     ; 127                                 << 4) / 100) & (uint8_t)0x0F); 
 521  008f 96            	ldw	x,sp
 522  0090 1c000b        	addw	x,#OFST-3
 523  0093 cd0000        	call	c_ltor
 525  0096 a664          	ld	a,#100
 526  0098 cd0000        	call	c_smul
 528  009b 96            	ldw	x,sp
 529  009c 1c0001        	addw	x,#OFST-13
 530  009f cd0000        	call	c_rtol
 533  00a2 96            	ldw	x,sp
 534  00a3 1c0007        	addw	x,#OFST-7
 535  00a6 cd0000        	call	c_ltor
 537  00a9 96            	ldw	x,sp
 538  00aa 1c0001        	addw	x,#OFST-13
 539  00ad cd0000        	call	c_lsub
 541  00b0 a604          	ld	a,#4
 542  00b2 cd0000        	call	c_llsh
 544  00b5 ae0000        	ldw	x,#L01
 545  00b8 cd0000        	call	c_ludv
 547  00bb b603          	ld	a,c_lreg+3
 548  00bd a40f          	and	a,#15
 549  00bf 6b05          	ld	(OFST-9,sp),a
 551                     ; 128   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 553  00c1 96            	ldw	x,sp
 554  00c2 1c000b        	addw	x,#OFST-3
 555  00c5 cd0000        	call	c_ltor
 557  00c8 a604          	ld	a,#4
 558  00ca cd0000        	call	c_lursh
 560  00cd b603          	ld	a,c_lreg+3
 561  00cf a4f0          	and	a,#240
 562  00d1 b703          	ld	c_lreg+3,a
 563  00d3 3f02          	clr	c_lreg+2
 564  00d5 3f01          	clr	c_lreg+1
 565  00d7 3f00          	clr	c_lreg
 566  00d9 b603          	ld	a,c_lreg+3
 567  00db 6b06          	ld	(OFST-8,sp),a
 569                     ; 130   UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 571  00dd 7b05          	ld	a,(OFST-9,sp)
 572  00df 1a06          	or	a,(OFST-8,sp)
 573  00e1 c75243        	ld	21059,a
 574                     ; 132   UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 576  00e4 7b0e          	ld	a,(OFST+0,sp)
 577  00e6 c75242        	ld	21058,a
 578                     ; 135   UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 580  00e9 c65245        	ld	a,21061
 581  00ec a4f3          	and	a,#243
 582  00ee c75245        	ld	21061,a
 583                     ; 137   UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 585  00f1 c65246        	ld	a,21062
 586  00f4 a4f8          	and	a,#248
 587  00f6 c75246        	ld	21062,a
 588                     ; 139   UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 588                     ; 140     UART2_CR3_CPHA | UART2_CR3_LBCL));
 590  00f9 7b18          	ld	a,(OFST+10,sp)
 591  00fb a407          	and	a,#7
 592  00fd ca5246        	or	a,21062
 593  0100 c75246        	ld	21062,a
 594                     ; 142   if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 596  0103 7b19          	ld	a,(OFST+11,sp)
 597  0105 a504          	bcp	a,#4
 598  0107 2706          	jreq	L171
 599                     ; 145     UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 601  0109 72165245      	bset	21061,#3
 603  010d 2004          	jra	L371
 604  010f               L171:
 605                     ; 150     UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 607  010f 72175245      	bres	21061,#3
 608  0113               L371:
 609                     ; 152   if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 611  0113 7b19          	ld	a,(OFST+11,sp)
 612  0115 a508          	bcp	a,#8
 613  0117 2706          	jreq	L571
 614                     ; 155     UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 616  0119 72145245      	bset	21061,#2
 618  011d 2004          	jra	L771
 619  011f               L571:
 620                     ; 160     UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 622  011f 72155245      	bres	21061,#2
 623  0123               L771:
 624                     ; 164   if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 626  0123 7b18          	ld	a,(OFST+10,sp)
 627  0125 a580          	bcp	a,#128
 628  0127 2706          	jreq	L102
 629                     ; 167     UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 631  0129 72175246      	bres	21062,#3
 633  012d 200a          	jra	L302
 634  012f               L102:
 635                     ; 171     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 637  012f 7b18          	ld	a,(OFST+10,sp)
 638  0131 a408          	and	a,#8
 639  0133 ca5246        	or	a,21062
 640  0136 c75246        	ld	21062,a
 641  0139               L302:
 642                     ; 173 }
 645  0139 5b0e          	addw	sp,#14
 646  013b 81            	ret
 701                     ; 181 void UART2_Cmd(FunctionalState NewState)
 701                     ; 182 {
 702                     .text:	section	.text,new
 703  0000               _UART2_Cmd:
 707                     ; 183   if (NewState != DISABLE)
 709  0000 4d            	tnz	a
 710  0001 2706          	jreq	L332
 711                     ; 186     UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 713  0003 721b5244      	bres	21060,#5
 715  0007 2004          	jra	L532
 716  0009               L332:
 717                     ; 191     UART2->CR1 |= UART2_CR1_UARTD; 
 719  0009 721a5244      	bset	21060,#5
 720  000d               L532:
 721                     ; 193 }
 724  000d 81            	ret
 852                     ; 210 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 852                     ; 211 {
 853                     .text:	section	.text,new
 854  0000               _UART2_ITConfig:
 856  0000 89            	pushw	x
 857  0001 89            	pushw	x
 858       00000002      OFST:	set	2
 861                     ; 212   uint8_t uartreg = 0, itpos = 0x00;
 865                     ; 215   assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 867                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 869                     ; 219   uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
 871  0002 9e            	ld	a,xh
 872  0003 6b01          	ld	(OFST-1,sp),a
 874                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
 876  0005 9f            	ld	a,xl
 877  0006 a40f          	and	a,#15
 878  0008 5f            	clrw	x
 879  0009 97            	ld	xl,a
 880  000a a601          	ld	a,#1
 881  000c 5d            	tnzw	x
 882  000d 2704          	jreq	L61
 883  000f               L02:
 884  000f 48            	sll	a
 885  0010 5a            	decw	x
 886  0011 26fc          	jrne	L02
 887  0013               L61:
 888  0013 6b02          	ld	(OFST+0,sp),a
 890                     ; 224   if (NewState != DISABLE)
 892  0015 0d07          	tnz	(OFST+5,sp)
 893  0017 273a          	jreq	L313
 894                     ; 227     if (uartreg == 0x01)
 896  0019 7b01          	ld	a,(OFST-1,sp)
 897  001b a101          	cp	a,#1
 898  001d 260a          	jrne	L513
 899                     ; 229       UART2->CR1 |= itpos;
 901  001f c65244        	ld	a,21060
 902  0022 1a02          	or	a,(OFST+0,sp)
 903  0024 c75244        	ld	21060,a
 905  0027 2066          	jra	L133
 906  0029               L513:
 907                     ; 231     else if (uartreg == 0x02)
 909  0029 7b01          	ld	a,(OFST-1,sp)
 910  002b a102          	cp	a,#2
 911  002d 260a          	jrne	L123
 912                     ; 233       UART2->CR2 |= itpos;
 914  002f c65245        	ld	a,21061
 915  0032 1a02          	or	a,(OFST+0,sp)
 916  0034 c75245        	ld	21061,a
 918  0037 2056          	jra	L133
 919  0039               L123:
 920                     ; 235     else if (uartreg == 0x03)
 922  0039 7b01          	ld	a,(OFST-1,sp)
 923  003b a103          	cp	a,#3
 924  003d 260a          	jrne	L523
 925                     ; 237       UART2->CR4 |= itpos;
 927  003f c65247        	ld	a,21063
 928  0042 1a02          	or	a,(OFST+0,sp)
 929  0044 c75247        	ld	21063,a
 931  0047 2046          	jra	L133
 932  0049               L523:
 933                     ; 241       UART2->CR6 |= itpos;
 935  0049 c65249        	ld	a,21065
 936  004c 1a02          	or	a,(OFST+0,sp)
 937  004e c75249        	ld	21065,a
 938  0051 203c          	jra	L133
 939  0053               L313:
 940                     ; 247     if (uartreg == 0x01)
 942  0053 7b01          	ld	a,(OFST-1,sp)
 943  0055 a101          	cp	a,#1
 944  0057 260b          	jrne	L333
 945                     ; 249       UART2->CR1 &= (uint8_t)(~itpos);
 947  0059 7b02          	ld	a,(OFST+0,sp)
 948  005b 43            	cpl	a
 949  005c c45244        	and	a,21060
 950  005f c75244        	ld	21060,a
 952  0062 202b          	jra	L133
 953  0064               L333:
 954                     ; 251     else if (uartreg == 0x02)
 956  0064 7b01          	ld	a,(OFST-1,sp)
 957  0066 a102          	cp	a,#2
 958  0068 260b          	jrne	L733
 959                     ; 253       UART2->CR2 &= (uint8_t)(~itpos);
 961  006a 7b02          	ld	a,(OFST+0,sp)
 962  006c 43            	cpl	a
 963  006d c45245        	and	a,21061
 964  0070 c75245        	ld	21061,a
 966  0073 201a          	jra	L133
 967  0075               L733:
 968                     ; 255     else if (uartreg == 0x03)
 970  0075 7b01          	ld	a,(OFST-1,sp)
 971  0077 a103          	cp	a,#3
 972  0079 260b          	jrne	L343
 973                     ; 257       UART2->CR4 &= (uint8_t)(~itpos);
 975  007b 7b02          	ld	a,(OFST+0,sp)
 976  007d 43            	cpl	a
 977  007e c45247        	and	a,21063
 978  0081 c75247        	ld	21063,a
 980  0084 2009          	jra	L133
 981  0086               L343:
 982                     ; 261       UART2->CR6 &= (uint8_t)(~itpos);
 984  0086 7b02          	ld	a,(OFST+0,sp)
 985  0088 43            	cpl	a
 986  0089 c45249        	and	a,21065
 987  008c c75249        	ld	21065,a
 988  008f               L133:
 989                     ; 264 }
 992  008f 5b04          	addw	sp,#4
 993  0091 81            	ret
1050                     ; 272 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1050                     ; 273 {
1051                     .text:	section	.text,new
1052  0000               _UART2_IrDAConfig:
1056                     ; 274   assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1058                     ; 276   if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1060  0000 4d            	tnz	a
1061  0001 2706          	jreq	L573
1062                     ; 278     UART2->CR5 |= UART2_CR5_IRLP;
1064  0003 72145248      	bset	21064,#2
1066  0007 2004          	jra	L773
1067  0009               L573:
1068                     ; 282     UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1070  0009 72155248      	bres	21064,#2
1071  000d               L773:
1072                     ; 284 }
1075  000d 81            	ret
1110                     ; 292 void UART2_IrDACmd(FunctionalState NewState)
1110                     ; 293 {
1111                     .text:	section	.text,new
1112  0000               _UART2_IrDACmd:
1116                     ; 295   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1118                     ; 297   if (NewState != DISABLE)
1120  0000 4d            	tnz	a
1121  0001 2706          	jreq	L714
1122                     ; 300     UART2->CR5 |= UART2_CR5_IREN;
1124  0003 72125248      	bset	21064,#1
1126  0007 2004          	jra	L124
1127  0009               L714:
1128                     ; 305     UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1130  0009 72135248      	bres	21064,#1
1131  000d               L124:
1132                     ; 307 }
1135  000d 81            	ret
1194                     ; 316 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1194                     ; 317 {
1195                     .text:	section	.text,new
1196  0000               _UART2_LINBreakDetectionConfig:
1200                     ; 319   assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1202                     ; 321   if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1204  0000 4d            	tnz	a
1205  0001 2706          	jreq	L154
1206                     ; 323     UART2->CR4 |= UART2_CR4_LBDL;
1208  0003 721a5247      	bset	21063,#5
1210  0007 2004          	jra	L354
1211  0009               L154:
1212                     ; 327     UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1214  0009 721b5247      	bres	21063,#5
1215  000d               L354:
1216                     ; 329 }
1219  000d 81            	ret
1340                     ; 341 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1340                     ; 342                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1340                     ; 343                      UART2_LinDivUp_TypeDef UART2_DivUp)
1340                     ; 344 {
1341                     .text:	section	.text,new
1342  0000               _UART2_LINConfig:
1344  0000 89            	pushw	x
1345       00000000      OFST:	set	0
1348                     ; 346   assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1350                     ; 347   assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1352                     ; 348   assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1354                     ; 350   if (UART2_Mode != UART2_LIN_MODE_MASTER)
1356  0001 9e            	ld	a,xh
1357  0002 4d            	tnz	a
1358  0003 2706          	jreq	L335
1359                     ; 352     UART2->CR6 |=  UART2_CR6_LSLV;
1361  0005 721a5249      	bset	21065,#5
1363  0009 2004          	jra	L535
1364  000b               L335:
1365                     ; 356     UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1367  000b 721b5249      	bres	21065,#5
1368  000f               L535:
1369                     ; 359   if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1371  000f 0d02          	tnz	(OFST+2,sp)
1372  0011 2706          	jreq	L735
1373                     ; 361     UART2->CR6 |=  UART2_CR6_LASE ;
1375  0013 72185249      	bset	21065,#4
1377  0017 2004          	jra	L145
1378  0019               L735:
1379                     ; 365     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1381  0019 72195249      	bres	21065,#4
1382  001d               L145:
1383                     ; 368   if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1385  001d 0d05          	tnz	(OFST+5,sp)
1386  001f 2706          	jreq	L345
1387                     ; 370     UART2->CR6 |=  UART2_CR6_LDUM;
1389  0021 721e5249      	bset	21065,#7
1391  0025 2004          	jra	L545
1392  0027               L345:
1393                     ; 374     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1395  0027 721f5249      	bres	21065,#7
1396  002b               L545:
1397                     ; 376 }
1400  002b 85            	popw	x
1401  002c 81            	ret
1436                     ; 384 void UART2_LINCmd(FunctionalState NewState)
1436                     ; 385 {
1437                     .text:	section	.text,new
1438  0000               _UART2_LINCmd:
1442                     ; 386   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1444                     ; 388   if (NewState != DISABLE)
1446  0000 4d            	tnz	a
1447  0001 2706          	jreq	L565
1448                     ; 391     UART2->CR3 |= UART2_CR3_LINEN;
1450  0003 721c5246      	bset	21062,#6
1452  0007 2004          	jra	L765
1453  0009               L565:
1454                     ; 396     UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1456  0009 721d5246      	bres	21062,#6
1457  000d               L765:
1458                     ; 398 }
1461  000d 81            	ret
1496                     ; 406 void UART2_SmartCardCmd(FunctionalState NewState)
1496                     ; 407 {
1497                     .text:	section	.text,new
1498  0000               _UART2_SmartCardCmd:
1502                     ; 409   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1504                     ; 411   if (NewState != DISABLE)
1506  0000 4d            	tnz	a
1507  0001 2706          	jreq	L706
1508                     ; 414     UART2->CR5 |= UART2_CR5_SCEN;
1510  0003 721a5248      	bset	21064,#5
1512  0007 2004          	jra	L116
1513  0009               L706:
1514                     ; 419     UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1516  0009 721b5248      	bres	21064,#5
1517  000d               L116:
1518                     ; 421 }
1521  000d 81            	ret
1557                     ; 429 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1557                     ; 430 {
1558                     .text:	section	.text,new
1559  0000               _UART2_SmartCardNACKCmd:
1563                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1565                     ; 434   if (NewState != DISABLE)
1567  0000 4d            	tnz	a
1568  0001 2706          	jreq	L136
1569                     ; 437     UART2->CR5 |= UART2_CR5_NACK;
1571  0003 72185248      	bset	21064,#4
1573  0007 2004          	jra	L336
1574  0009               L136:
1575                     ; 442     UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1577  0009 72195248      	bres	21064,#4
1578  000d               L336:
1579                     ; 444 }
1582  000d 81            	ret
1639                     ; 452 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1639                     ; 453 {
1640                     .text:	section	.text,new
1641  0000               _UART2_WakeUpConfig:
1645                     ; 454   assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1647                     ; 456   UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
1649  0000 72175244      	bres	21060,#3
1650                     ; 457   UART2->CR1 |= (uint8_t)UART2_WakeUp;
1652  0004 ca5244        	or	a,21060
1653  0007 c75244        	ld	21060,a
1654                     ; 458 }
1657  000a 81            	ret
1693                     ; 466 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1693                     ; 467 {
1694                     .text:	section	.text,new
1695  0000               _UART2_ReceiverWakeUpCmd:
1699                     ; 468   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1701                     ; 470   if (NewState != DISABLE)
1703  0000 4d            	tnz	a
1704  0001 2706          	jreq	L107
1705                     ; 473     UART2->CR2 |= UART2_CR2_RWU;
1707  0003 72125245      	bset	21061,#1
1709  0007 2004          	jra	L307
1710  0009               L107:
1711                     ; 478     UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
1713  0009 72135245      	bres	21061,#1
1714  000d               L307:
1715                     ; 480 }
1718  000d 81            	ret
1741                     ; 487 uint8_t UART2_ReceiveData8(void)
1741                     ; 488 {
1742                     .text:	section	.text,new
1743  0000               _UART2_ReceiveData8:
1747                     ; 489   return ((uint8_t)UART2->DR);
1749  0000 c65241        	ld	a,21057
1752  0003 81            	ret
1784                     ; 497 uint16_t UART2_ReceiveData9(void)
1784                     ; 498 {
1785                     .text:	section	.text,new
1786  0000               _UART2_ReceiveData9:
1788  0000 89            	pushw	x
1789       00000002      OFST:	set	2
1792                     ; 499   uint16_t temp = 0;
1794                     ; 501   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
1796  0001 c65244        	ld	a,21060
1797  0004 5f            	clrw	x
1798  0005 a480          	and	a,#128
1799  0007 5f            	clrw	x
1800  0008 02            	rlwa	x,a
1801  0009 58            	sllw	x
1802  000a 1f01          	ldw	(OFST-1,sp),x
1804                     ; 503   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
1806  000c c65241        	ld	a,21057
1807  000f 5f            	clrw	x
1808  0010 97            	ld	xl,a
1809  0011 01            	rrwa	x,a
1810  0012 1a02          	or	a,(OFST+0,sp)
1811  0014 01            	rrwa	x,a
1812  0015 1a01          	or	a,(OFST-1,sp)
1813  0017 01            	rrwa	x,a
1814  0018 01            	rrwa	x,a
1815  0019 a4ff          	and	a,#255
1816  001b 01            	rrwa	x,a
1817  001c a401          	and	a,#1
1818  001e 01            	rrwa	x,a
1821  001f 5b02          	addw	sp,#2
1822  0021 81            	ret
1854                     ; 511 void UART2_SendData8(uint8_t Data)
1854                     ; 512 {
1855                     .text:	section	.text,new
1856  0000               _UART2_SendData8:
1860                     ; 514   UART2->DR = Data;
1862  0000 c75241        	ld	21057,a
1863                     ; 515 }
1866  0003 81            	ret
1898                     ; 522 void UART2_SendData9(uint16_t Data)
1898                     ; 523 {
1899                     .text:	section	.text,new
1900  0000               _UART2_SendData9:
1902  0000 89            	pushw	x
1903       00000000      OFST:	set	0
1906                     ; 525   UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
1908  0001 721d5244      	bres	21060,#6
1909                     ; 528   UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
1911  0005 54            	srlw	x
1912  0006 54            	srlw	x
1913  0007 9f            	ld	a,xl
1914  0008 a440          	and	a,#64
1915  000a ca5244        	or	a,21060
1916  000d c75244        	ld	21060,a
1917                     ; 531   UART2->DR   = (uint8_t)(Data);                    
1919  0010 7b02          	ld	a,(OFST+2,sp)
1920  0012 c75241        	ld	21057,a
1921                     ; 532 }
1924  0015 85            	popw	x
1925  0016 81            	ret
1948                     ; 539 void UART2_SendBreak(void)
1948                     ; 540 {
1949                     .text:	section	.text,new
1950  0000               _UART2_SendBreak:
1954                     ; 541   UART2->CR2 |= UART2_CR2_SBK;
1956  0000 72105245      	bset	21061,#0
1957                     ; 542 }
1960  0004 81            	ret
1992                     ; 549 void UART2_SetAddress(uint8_t UART2_Address)
1992                     ; 550 {
1993                     .text:	section	.text,new
1994  0000               _UART2_SetAddress:
1996  0000 88            	push	a
1997       00000000      OFST:	set	0
2000                     ; 552   assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2002                     ; 555   UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
2004  0001 c65247        	ld	a,21063
2005  0004 a4f0          	and	a,#240
2006  0006 c75247        	ld	21063,a
2007                     ; 557   UART2->CR4 |= UART2_Address;
2009  0009 c65247        	ld	a,21063
2010  000c 1a01          	or	a,(OFST+1,sp)
2011  000e c75247        	ld	21063,a
2012                     ; 558 }
2015  0011 84            	pop	a
2016  0012 81            	ret
2048                     ; 566 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2048                     ; 567 {
2049                     .text:	section	.text,new
2050  0000               _UART2_SetGuardTime:
2054                     ; 569   UART2->GTR = UART2_GuardTime;
2056  0000 c7524a        	ld	21066,a
2057                     ; 570 }
2060  0003 81            	ret
2092                     ; 594 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2092                     ; 595 {
2093                     .text:	section	.text,new
2094  0000               _UART2_SetPrescaler:
2098                     ; 597   UART2->PSCR = UART2_Prescaler;
2100  0000 c7524b        	ld	21067,a
2101                     ; 598 }
2104  0003 81            	ret
2261                     ; 606 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2261                     ; 607 {
2262                     .text:	section	.text,new
2263  0000               _UART2_GetFlagStatus:
2265  0000 89            	pushw	x
2266  0001 88            	push	a
2267       00000001      OFST:	set	1
2270                     ; 608   FlagStatus status = RESET;
2272                     ; 611   assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2274                     ; 614   if (UART2_FLAG == UART2_FLAG_LBDF)
2276  0002 a30210        	cpw	x,#528
2277  0005 2610          	jrne	L3211
2278                     ; 616     if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2280  0007 9f            	ld	a,xl
2281  0008 c45247        	and	a,21063
2282  000b 2706          	jreq	L5211
2283                     ; 619       status = SET;
2285  000d a601          	ld	a,#1
2286  000f 6b01          	ld	(OFST+0,sp),a
2289  0011 2039          	jra	L1311
2290  0013               L5211:
2291                     ; 624       status = RESET;
2293  0013 0f01          	clr	(OFST+0,sp)
2295  0015 2035          	jra	L1311
2296  0017               L3211:
2297                     ; 627   else if (UART2_FLAG == UART2_FLAG_SBK)
2299  0017 1e02          	ldw	x,(OFST+1,sp)
2300  0019 a30101        	cpw	x,#257
2301  001c 2611          	jrne	L3311
2302                     ; 629     if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2304  001e c65245        	ld	a,21061
2305  0021 1503          	bcp	a,(OFST+2,sp)
2306  0023 2706          	jreq	L5311
2307                     ; 632       status = SET;
2309  0025 a601          	ld	a,#1
2310  0027 6b01          	ld	(OFST+0,sp),a
2313  0029 2021          	jra	L1311
2314  002b               L5311:
2315                     ; 637       status = RESET;
2317  002b 0f01          	clr	(OFST+0,sp)
2319  002d 201d          	jra	L1311
2320  002f               L3311:
2321                     ; 640   else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2323  002f 1e02          	ldw	x,(OFST+1,sp)
2324  0031 a30302        	cpw	x,#770
2325  0034 2707          	jreq	L5411
2327  0036 1e02          	ldw	x,(OFST+1,sp)
2328  0038 a30301        	cpw	x,#769
2329  003b 2614          	jrne	L3411
2330  003d               L5411:
2331                     ; 642     if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2333  003d c65249        	ld	a,21065
2334  0040 1503          	bcp	a,(OFST+2,sp)
2335  0042 2706          	jreq	L7411
2336                     ; 645       status = SET;
2338  0044 a601          	ld	a,#1
2339  0046 6b01          	ld	(OFST+0,sp),a
2342  0048 2002          	jra	L1311
2343  004a               L7411:
2344                     ; 650       status = RESET;
2346  004a 0f01          	clr	(OFST+0,sp)
2348  004c               L1311:
2349                     ; 668   return  status;
2351  004c 7b01          	ld	a,(OFST+0,sp)
2354  004e 5b03          	addw	sp,#3
2355  0050 81            	ret
2356  0051               L3411:
2357                     ; 655     if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2359  0051 c65240        	ld	a,21056
2360  0054 1503          	bcp	a,(OFST+2,sp)
2361  0056 2706          	jreq	L5511
2362                     ; 658       status = SET;
2364  0058 a601          	ld	a,#1
2365  005a 6b01          	ld	(OFST+0,sp),a
2368  005c 20ee          	jra	L1311
2369  005e               L5511:
2370                     ; 663       status = RESET;
2372  005e 0f01          	clr	(OFST+0,sp)
2374  0060 20ea          	jra	L1311
2409                     ; 699 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2409                     ; 700 {
2410                     .text:	section	.text,new
2411  0000               _UART2_ClearFlag:
2413  0000 89            	pushw	x
2414       00000000      OFST:	set	0
2417                     ; 701   assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2419                     ; 704   if (UART2_FLAG == UART2_FLAG_RXNE)
2421  0001 a30020        	cpw	x,#32
2422  0004 2606          	jrne	L7711
2423                     ; 706     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2425  0006 35df5240      	mov	21056,#223
2427  000a 201e          	jra	L1021
2428  000c               L7711:
2429                     ; 709   else if (UART2_FLAG == UART2_FLAG_LBDF)
2431  000c 1e01          	ldw	x,(OFST+1,sp)
2432  000e a30210        	cpw	x,#528
2433  0011 2606          	jrne	L3021
2434                     ; 711     UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2436  0013 72195247      	bres	21063,#4
2438  0017 2011          	jra	L1021
2439  0019               L3021:
2440                     ; 714   else if (UART2_FLAG == UART2_FLAG_LHDF)
2442  0019 1e01          	ldw	x,(OFST+1,sp)
2443  001b a30302        	cpw	x,#770
2444  001e 2606          	jrne	L7021
2445                     ; 716     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2447  0020 72135249      	bres	21065,#1
2449  0024 2004          	jra	L1021
2450  0026               L7021:
2451                     ; 721     UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2453  0026 72115249      	bres	21065,#0
2454  002a               L1021:
2455                     ; 723 }
2458  002a 85            	popw	x
2459  002b 81            	ret
2533                     ; 738 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2533                     ; 739 {
2534                     .text:	section	.text,new
2535  0000               _UART2_GetITStatus:
2537  0000 89            	pushw	x
2538  0001 89            	pushw	x
2539       00000002      OFST:	set	2
2542                     ; 740   ITStatus pendingbitstatus = RESET;
2544                     ; 741   uint8_t itpos = 0;
2546                     ; 742   uint8_t itmask1 = 0;
2548                     ; 743   uint8_t itmask2 = 0;
2550                     ; 744   uint8_t enablestatus = 0;
2552                     ; 747   assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2554                     ; 750   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
2556  0002 9f            	ld	a,xl
2557  0003 a40f          	and	a,#15
2558  0005 5f            	clrw	x
2559  0006 97            	ld	xl,a
2560  0007 a601          	ld	a,#1
2561  0009 5d            	tnzw	x
2562  000a 2704          	jreq	L27
2563  000c               L47:
2564  000c 48            	sll	a
2565  000d 5a            	decw	x
2566  000e 26fc          	jrne	L47
2567  0010               L27:
2568  0010 6b01          	ld	(OFST-1,sp),a
2570                     ; 752   itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
2572  0012 7b04          	ld	a,(OFST+2,sp)
2573  0014 4e            	swap	a
2574  0015 a40f          	and	a,#15
2575  0017 6b02          	ld	(OFST+0,sp),a
2577                     ; 754   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2579  0019 7b02          	ld	a,(OFST+0,sp)
2580  001b 5f            	clrw	x
2581  001c 97            	ld	xl,a
2582  001d a601          	ld	a,#1
2583  001f 5d            	tnzw	x
2584  0020 2704          	jreq	L67
2585  0022               L001:
2586  0022 48            	sll	a
2587  0023 5a            	decw	x
2588  0024 26fc          	jrne	L001
2589  0026               L67:
2590  0026 6b02          	ld	(OFST+0,sp),a
2592                     ; 757   if (UART2_IT == UART2_IT_PE)
2594  0028 1e03          	ldw	x,(OFST+1,sp)
2595  002a a30100        	cpw	x,#256
2596  002d 261c          	jrne	L5421
2597                     ; 760     enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
2599  002f c65244        	ld	a,21060
2600  0032 1402          	and	a,(OFST+0,sp)
2601  0034 6b02          	ld	(OFST+0,sp),a
2603                     ; 763     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2605  0036 c65240        	ld	a,21056
2606  0039 1501          	bcp	a,(OFST-1,sp)
2607  003b 270a          	jreq	L7421
2609  003d 0d02          	tnz	(OFST+0,sp)
2610  003f 2706          	jreq	L7421
2611                     ; 766       pendingbitstatus = SET;
2613  0041 a601          	ld	a,#1
2614  0043 6b02          	ld	(OFST+0,sp),a
2617  0045 2064          	jra	L3521
2618  0047               L7421:
2619                     ; 771       pendingbitstatus = RESET;
2621  0047 0f02          	clr	(OFST+0,sp)
2623  0049 2060          	jra	L3521
2624  004b               L5421:
2625                     ; 774   else if (UART2_IT == UART2_IT_LBDF)
2627  004b 1e03          	ldw	x,(OFST+1,sp)
2628  004d a30346        	cpw	x,#838
2629  0050 261c          	jrne	L5521
2630                     ; 777     enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
2632  0052 c65247        	ld	a,21063
2633  0055 1402          	and	a,(OFST+0,sp)
2634  0057 6b02          	ld	(OFST+0,sp),a
2636                     ; 779     if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2638  0059 c65247        	ld	a,21063
2639  005c 1501          	bcp	a,(OFST-1,sp)
2640  005e 270a          	jreq	L7521
2642  0060 0d02          	tnz	(OFST+0,sp)
2643  0062 2706          	jreq	L7521
2644                     ; 782       pendingbitstatus = SET;
2646  0064 a601          	ld	a,#1
2647  0066 6b02          	ld	(OFST+0,sp),a
2650  0068 2041          	jra	L3521
2651  006a               L7521:
2652                     ; 787       pendingbitstatus = RESET;
2654  006a 0f02          	clr	(OFST+0,sp)
2656  006c 203d          	jra	L3521
2657  006e               L5521:
2658                     ; 790   else if (UART2_IT == UART2_IT_LHDF)
2660  006e 1e03          	ldw	x,(OFST+1,sp)
2661  0070 a30412        	cpw	x,#1042
2662  0073 261c          	jrne	L5621
2663                     ; 793     enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
2665  0075 c65249        	ld	a,21065
2666  0078 1402          	and	a,(OFST+0,sp)
2667  007a 6b02          	ld	(OFST+0,sp),a
2669                     ; 795     if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2671  007c c65249        	ld	a,21065
2672  007f 1501          	bcp	a,(OFST-1,sp)
2673  0081 270a          	jreq	L7621
2675  0083 0d02          	tnz	(OFST+0,sp)
2676  0085 2706          	jreq	L7621
2677                     ; 798       pendingbitstatus = SET;
2679  0087 a601          	ld	a,#1
2680  0089 6b02          	ld	(OFST+0,sp),a
2683  008b 201e          	jra	L3521
2684  008d               L7621:
2685                     ; 803       pendingbitstatus = RESET;
2687  008d 0f02          	clr	(OFST+0,sp)
2689  008f 201a          	jra	L3521
2690  0091               L5621:
2691                     ; 809     enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
2693  0091 c65245        	ld	a,21061
2694  0094 1402          	and	a,(OFST+0,sp)
2695  0096 6b02          	ld	(OFST+0,sp),a
2697                     ; 811     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2699  0098 c65240        	ld	a,21056
2700  009b 1501          	bcp	a,(OFST-1,sp)
2701  009d 270a          	jreq	L5721
2703  009f 0d02          	tnz	(OFST+0,sp)
2704  00a1 2706          	jreq	L5721
2705                     ; 814       pendingbitstatus = SET;
2707  00a3 a601          	ld	a,#1
2708  00a5 6b02          	ld	(OFST+0,sp),a
2711  00a7 2002          	jra	L3521
2712  00a9               L5721:
2713                     ; 819       pendingbitstatus = RESET;
2715  00a9 0f02          	clr	(OFST+0,sp)
2717  00ab               L3521:
2718                     ; 823   return  pendingbitstatus;
2720  00ab 7b02          	ld	a,(OFST+0,sp)
2723  00ad 5b04          	addw	sp,#4
2724  00af 81            	ret
2760                     ; 852 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
2760                     ; 853 {
2761                     .text:	section	.text,new
2762  0000               _UART2_ClearITPendingBit:
2764  0000 89            	pushw	x
2765       00000000      OFST:	set	0
2768                     ; 854   assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
2770                     ; 857   if (UART2_IT == UART2_IT_RXNE)
2772  0001 a30255        	cpw	x,#597
2773  0004 2606          	jrne	L7131
2774                     ; 859     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2776  0006 35df5240      	mov	21056,#223
2778  000a 2011          	jra	L1231
2779  000c               L7131:
2780                     ; 862   else if (UART2_IT == UART2_IT_LBDF)
2782  000c 1e01          	ldw	x,(OFST+1,sp)
2783  000e a30346        	cpw	x,#838
2784  0011 2606          	jrne	L3231
2785                     ; 864     UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
2787  0013 72195247      	bres	21063,#4
2789  0017 2004          	jra	L1231
2790  0019               L3231:
2791                     ; 869     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2793  0019 72135249      	bres	21065,#1
2794  001d               L1231:
2795                     ; 871 }
2798  001d 85            	popw	x
2799  001e 81            	ret
2812                     	xdef	_UART2_ClearITPendingBit
2813                     	xdef	_UART2_GetITStatus
2814                     	xdef	_UART2_ClearFlag
2815                     	xdef	_UART2_GetFlagStatus
2816                     	xdef	_UART2_SetPrescaler
2817                     	xdef	_UART2_SetGuardTime
2818                     	xdef	_UART2_SetAddress
2819                     	xdef	_UART2_SendBreak
2820                     	xdef	_UART2_SendData9
2821                     	xdef	_UART2_SendData8
2822                     	xdef	_UART2_ReceiveData9
2823                     	xdef	_UART2_ReceiveData8
2824                     	xdef	_UART2_ReceiverWakeUpCmd
2825                     	xdef	_UART2_WakeUpConfig
2826                     	xdef	_UART2_SmartCardNACKCmd
2827                     	xdef	_UART2_SmartCardCmd
2828                     	xdef	_UART2_LINCmd
2829                     	xdef	_UART2_LINConfig
2830                     	xdef	_UART2_LINBreakDetectionConfig
2831                     	xdef	_UART2_IrDACmd
2832                     	xdef	_UART2_IrDAConfig
2833                     	xdef	_UART2_ITConfig
2834                     	xdef	_UART2_Cmd
2835                     	xdef	_UART2_Init
2836                     	xdef	_UART2_DeInit
2837                     	xref	_CLK_GetClockFreq
2838                     	xref.b	c_lreg
2839                     	xref.b	c_x
2858                     	xref	c_lursh
2859                     	xref	c_lsub
2860                     	xref	c_smul
2861                     	xref	c_ludv
2862                     	xref	c_rtol
2863                     	xref	c_llsh
2864                     	xref	c_ltor
2865                     	end
