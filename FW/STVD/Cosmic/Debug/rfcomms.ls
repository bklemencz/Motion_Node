   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  57                     ; 63 void RF_SetNodeID(uint8_t Node)
  57                     ; 64 {
  59                     	switch	.text
  60  0000               _RF_SetNodeID:
  64                     ; 65   RF_NODEID = Node;
  66  0000 c7005e        	ld	_RF_NODEID,a
  67                     ; 66 }
  70  0003 81            	ret	
  94                     ; 68 uint8_t RF_GetNodeID(void)
  94                     ; 69 {
  95                     	switch	.text
  96  0004               _RF_GetNodeID:
 100                     ; 70   return RF_NODEID;
 102  0004 c6005e        	ld	a,_RF_NODEID
 105  0007 81            	ret	
 179                     ; 74 int8_t RF_RX_Handle()
 179                     ; 75 {
 180                     	switch	.text
 181  0008               _RF_RX_Handle:
 183  0008 89            	pushw	x
 184       00000002      OFST:	set	2
 187                     ; 76   bool ValidMI = FALSE;
 189  0009 0f02          	clr	(OFST+0,sp)
 191                     ; 79   if (LT8900_available())
 193  000b cd0000        	call	_LT8900_available
 195  000e 4d            	tnz	a
 196  000f 2603cc0093    	jreq	L76
 197                     ; 82       GPIO_WriteHigh(STATUS_1_GPIO_PORT,(GPIO_Pin_TypeDef)STATUS_1_PIN);
 199  0014 4b10          	push	#16
 200  0016 ae5019        	ldw	x,#20505
 201  0019 cd0000        	call	_GPIO_WriteHigh
 203  001c 84            	pop	a
 204                     ; 83       packetSize = LT8900_read(RF_RX_Buffer, 16);
 206  001d 4b10          	push	#16
 207  001f ae004d        	ldw	x,#_RF_RX_Buffer
 208  0022 cd0000        	call	_LT8900_read
 210  0025 84            	pop	a
 211  0026 01            	rrwa	x,a
 212  0027 6b01          	ld	(OFST-1,sp),a
 214                     ; 84       if (packetSize > 0)
 216  0029 9c            	rvf	
 217  002a 2d2b          	jrsle	L17
 218                     ; 86         SetBit(Main_State, MAINSTATE_RFRX);
 220  002c 72180000      	bset	_Main_State,#4
 221                     ; 88         if (bitRead(Main_Config, MAINCONFIG_MIREM)) ValidMI = RF_RX_MIRemote(RF_RX_Buffer,packetSize);
 223  0030 ce0000        	ldw	x,_Main_Config
 224  0033 54            	srlw	x
 225  0034 01            	rrwa	x,a
 226  0035 a401          	and	a,#1
 227  0037 5f            	clrw	x
 228  0038 97            	ld	xl,a
 229  0039 5d            	tnzw	x
 230  003a 270d          	jreq	L37
 233  003c 7b01          	ld	a,(OFST-1,sp)
 234  003e 88            	push	a
 235  003f ae004d        	ldw	x,#_RF_RX_Buffer
 236  0042 cd020a        	call	_RF_RX_MIRemote
 238  0045 5b01          	addw	sp,#1
 239  0047 6b02          	ld	(OFST+0,sp),a
 241  0049               L37:
 242                     ; 89         if (!ValidMI) RF_RX_Command(RF_RX_Buffer,packetSize);
 244  0049 7b02          	ld	a,(OFST+0,sp)
 245  004b 260a          	jrne	L17
 248  004d 7b01          	ld	a,(OFST-1,sp)
 249  004f 88            	push	a
 250  0050 ae004d        	ldw	x,#_RF_RX_Buffer
 251  0053 cd0b6d        	call	_RF_RX_Command
 253  0056 84            	pop	a
 254  0057               L17:
 255                     ; 98       LT8900_startListening();      // LT8900 Clear FIFOS, Rx Enable
 257  0057 cd0000        	call	_LT8900_startListening
 259                     ; 100       if (bitRead(Main_Config, MAINCONFIG_FADEDELEN) && RF_RX_MI_FirstPress)
 261  005a ce0000        	ldw	x,_Main_Config
 262  005d a606          	ld	a,#6
 263  005f               L62:
 264  005f 54            	srlw	x
 265  0060 4a            	dec	a
 266  0061 26fc          	jrne	L62
 267  0063 01            	rrwa	x,a
 268  0064 a401          	and	a,#1
 269  0066 5f            	clrw	x
 270  0067 97            	ld	xl,a
 271  0068 5d            	tnzw	x
 272  0069 271d          	jreq	L77
 274  006b c60036        	ld	a,_RF_RX_MI_FirstPress
 275  006e 2718          	jreq	L77
 276                     ; 102         GPIO_WriteHigh(WS2811_GPIO_PORT, (GPIO_Pin_TypeDef) WS2811_1_PIN);
 278  0070 4b02          	push	#2
 279  0072 ae5000        	ldw	x,#20480
 280  0075 cd0000        	call	_GPIO_WriteHigh
 282  0078 ae015e        	ldw	x,#350
 283  007b cf0000        	ldw	_LED_Fade_Timer,x
 284  007e 84            	pop	a
 285                     ; 103         LED_Fade_Timer = LED_DELAY_AFTER_RX;
 287                     ; 104         GPIO_WriteLow(WS2811_GPIO_PORT, (GPIO_Pin_TypeDef) WS2811_1_PIN);
 289  007f 4b02          	push	#2
 290  0081 ae5000        	ldw	x,#20480
 291  0084 cd0000        	call	_GPIO_WriteLow
 293  0087 84            	pop	a
 294  0088               L77:
 295                     ; 106       GPIO_WriteLow(STATUS_1_GPIO_PORT,(GPIO_Pin_TypeDef)STATUS_1_PIN);
 297  0088 4b10          	push	#16
 298  008a ae5019        	ldw	x,#20505
 299  008d cd0000        	call	_GPIO_WriteLow
 301  0090 84            	pop	a
 302                     ; 107       return packetSize;
 304  0091 7b01          	ld	a,(OFST-1,sp)
 306  0093               L76:
 307                     ; 111 }
 310  0093 85            	popw	x
 311  0094 81            	ret	
 356                     ; 112 void RF_TX_Handle(void)
 356                     ; 113 {
 357                     	switch	.text
 358  0095               _RF_TX_Handle:
 360  0095 88            	push	a
 361       00000001      OFST:	set	1
 364                     ; 115   if (bitRead(Main_Config, MAINCONFIG_RFPERTXEN) && (RF_TX_Timer == 0))       // if periodic messages enabled and timer is up
 366  0096 ce0000        	ldw	x,_Main_Config
 367  0099 4f            	clr	a
 368  009a 01            	rrwa	x,a
 369  009b 48            	sll	a
 370  009c 4f            	clr	a
 371  009d 49            	rlc	a
 372  009e 5f            	clrw	x
 373  009f 97            	ld	xl,a
 374  00a0 5d            	tnzw	x
 375  00a1 2729          	jreq	L511
 377  00a3 ce0000        	ldw	x,_RF_TX_Timer
 378  00a6 2624          	jrne	L511
 379                     ; 117     RF_TX_BuildPeriodic(&RF_TX_DataTX);
 381  00a8 ae0002        	ldw	x,#_RF_TX_DataTX
 382  00ab ad69          	call	_RF_TX_BuildPeriodic
 384                     ; 118     PacketS = RF_TX_BuildBuffer(RF_TX_Buffer,&RF_TX_DataTX);
 386  00ad ad51          	call	LC001
 387  00af 6b01          	ld	(OFST+0,sp),a
 389                     ; 119     GPIO_WriteHigh(STATUS_1_GPIO_PORT,(GPIO_Pin_TypeDef)STATUS_1_PIN);
 391  00b1 ad59          	call	LC002
 392                     ; 120     LT8900_sendPacket(RF_TX_Buffer, PacketS);
 394  00b3 7b01          	ld	a,(OFST+0,sp)
 395  00b5 88            	push	a
 396  00b6 ae003c        	ldw	x,#_RF_TX_Buffer
 397  00b9 cd0000        	call	_LT8900_sendPacket
 399  00bc ae2710        	ldw	x,#10000
 400  00bf cf0000        	ldw	_RF_TX_Timer,x
 401  00c2 84            	pop	a
 402                     ; 121     RF_TX_Timer = RF_TX_PERIODIC_TIME;
 404                     ; 122     GPIO_WriteLow(STATUS_1_GPIO_PORT,(GPIO_Pin_TypeDef)STATUS_1_PIN);
 406  00c3 4b10          	push	#16
 407  00c5 ae5019        	ldw	x,#20505
 408  00c8 cd0000        	call	_GPIO_WriteLow
 410  00cb 84            	pop	a
 411  00cc               L511:
 412                     ; 124   if((RF_TX_MotionIR || RF_TX_MotionRadar) && !RF_TX_MotionAlarm_Sent)
 414  00cc c60000        	ld	a,_RF_TX_MotionIR
 415  00cf 2605          	jrne	L121
 417  00d1 c60000        	ld	a,_RF_TX_MotionRadar
 418  00d4 2728          	jreq	L711
 419  00d6               L121:
 421  00d6 c60000        	ld	a,_RF_TX_MotionAlarm_Sent
 422  00d9 2623          	jrne	L711
 423                     ; 126     RF_TX_BuildMotionAlarm(&RF_TX_DataTX);
 425  00db ae0002        	ldw	x,#_RF_TX_DataTX
 426  00de cd016f        	call	_RF_TX_BuildMotionAlarm
 428                     ; 127     PacketS = RF_TX_BuildBuffer(RF_TX_Buffer,&RF_TX_DataTX);
 430  00e1 ad1d          	call	LC001
 431  00e3 6b01          	ld	(OFST+0,sp),a
 433                     ; 128     GPIO_WriteHigh(STATUS_1_GPIO_PORT,(GPIO_Pin_TypeDef)STATUS_1_PIN);
 435  00e5 ad25          	call	LC002
 436                     ; 129     LT8900_sendPacket(RF_TX_Buffer, PacketS);
 438  00e7 7b01          	ld	a,(OFST+0,sp)
 439  00e9 88            	push	a
 440  00ea ae003c        	ldw	x,#_RF_TX_Buffer
 441  00ed cd0000        	call	_LT8900_sendPacket
 443  00f0 84            	pop	a
 444                     ; 130     GPIO_WriteLow(STATUS_1_GPIO_PORT,(GPIO_Pin_TypeDef)STATUS_1_PIN);
 446  00f1 4b10          	push	#16
 447  00f3 ae5019        	ldw	x,#20505
 448  00f6 cd0000        	call	_GPIO_WriteLow
 450  00f9 35010000      	mov	_RF_TX_MotionAlarm_Sent,#1
 451  00fd 84            	pop	a
 452                     ; 131     RF_TX_MotionAlarm_Sent = TRUE;
 454  00fe               L711:
 455                     ; 133 }
 458  00fe 84            	pop	a
 459  00ff 81            	ret	
 460  0100               LC001:
 461  0100 ae0002        	ldw	x,#_RF_TX_DataTX
 462  0103 89            	pushw	x
 463  0104 ae003c        	ldw	x,#_RF_TX_Buffer
 464  0107 cd01a3        	call	_RF_TX_BuildBuffer
 466  010a 85            	popw	x
 467  010b 81            	ret	
 468  010c               LC002:
 469  010c 4b10          	push	#16
 470  010e ae5019        	ldw	x,#20505
 471  0111 cd0000        	call	_GPIO_WriteHigh
 473  0114 84            	pop	a
 474  0115 81            	ret	
 565                     ; 135 void RF_TX_BuildPeriodic(RF_Datagram_t *DataToSend)
 565                     ; 136 {
 566                     	switch	.text
 567  0116               _RF_TX_BuildPeriodic:
 569       00000000      OFST:	set	0
 572                     ; 137   DataToSend->NodeID = RF_NODEID;
 574  0116 c6005e        	ld	a,_RF_NODEID
 575  0119 f7            	ld	(x),a
 576                     ; 138   RF_TX_Counter++;
 578  011a 725c003b      	inc	_RF_TX_Counter
 579                     ; 139   DataToSend->Sequence = RF_TX_Counter;
 581  011e c6003b        	ld	a,_RF_TX_Counter
 582  0121 e701          	ld	(1,x),a
 583                     ; 140   DataToSend->Control = RF_TX_MSG_PER*64;
 585  0123 a680          	ld	a,#128
 586                     ; 141   SetBit(DataToSend->Control, RF_TX_ARQ);
 588  0125 a4ef          	and	a,#239
 589  0127 aa20          	or	a,#32
 590                     ; 142   ClrBit(DataToSend->Control, RF_TX_ARS);
 592                     ; 143   DataToSend->Control = DataToSend->Control + 5;    // Data Length Status + 3xADC + ItemID
 594  0129 ab05          	add	a,#5
 595  012b e702          	ld	(2,x),a
 596                     ; 144   DataToSend->ItemID = RF_TX_PER_ITEM;
 598  012d a641          	ld	a,#65
 599  012f e703          	ld	(3,x),a
 600                     ; 145   DataToSend->Data[0] = AD_NTC_TempX5;
 602  0131 c60000        	ld	a,_AD_NTC_TempX5
 603  0134 e704          	ld	(4,x),a
 604                     ; 146   DataToSend->Data[1] = AD_LDR_LUXD50;
 606  0136 c60000        	ld	a,_AD_LDR_LUXD50
 607  0139 e705          	ld	(5,x),a
 608                     ; 147   DataToSend->Data[2] = AD_AirQuality;
 610  013b c60000        	ld	a,_AD_AirQuality
 611  013e e706          	ld	(6,x),a
 612                     ; 148 	DataToSend->Data[3] = 0;
 614  0140 6f07          	clr	(7,x)
 615                     ; 149   if (RF_TX_MotionIR) {SetBit(DataToSend->Data[3], 0);}
 617  0142 c60000        	ld	a,_RF_TX_MotionIR
 618  0145 2706          	jreq	L361
 621  0147 e607          	ld	a,(7,x)
 622  0149 aa01          	or	a,#1
 623  014b e707          	ld	(7,x),a
 624  014d               L361:
 625                     ; 150   if (RF_TX_MotionRadar) {SetBit(DataToSend->Data[3], 1);}
 627  014d c60000        	ld	a,_RF_TX_MotionRadar
 628  0150 2706          	jreq	L561
 631  0152 e607          	ld	a,(7,x)
 632  0154 aa02          	or	a,#2
 633  0156 e707          	ld	(7,x),a
 634  0158               L561:
 635                     ; 151   if (!RF_TX_MotionIR && !RF_TX_MotionRadar) RF_TX_MotionAlarm_Sent = FALSE;
 637  0158 c60000        	ld	a,_RF_TX_MotionIR
 638  015b 2609          	jrne	L761
 640  015d 725d0000      	tnz	_RF_TX_MotionRadar
 641  0161 2603          	jrne	L761
 644  0163 c70000        	ld	_RF_TX_MotionAlarm_Sent,a
 645  0166               L761:
 646                     ; 152 	RF_TX_MotionIR=FALSE;	RF_TX_MotionRadar=FALSE;
 648  0166 725f0000      	clr	_RF_TX_MotionIR
 651  016a 725f0000      	clr	_RF_TX_MotionRadar
 652                     ; 153 }
 655  016e 81            	ret	
 697                     ; 155 void RF_TX_BuildMotionAlarm(RF_Datagram_t *DataToSend)
 697                     ; 156 {
 698                     	switch	.text
 699  016f               _RF_TX_BuildMotionAlarm:
 701       00000000      OFST:	set	0
 704                     ; 157   DataToSend->NodeID = RF_NODEID;
 706  016f c6005e        	ld	a,_RF_NODEID
 707  0172 f7            	ld	(x),a
 708                     ; 158   RF_TX_Counter++;
 710  0173 725c003b      	inc	_RF_TX_Counter
 711                     ; 159   DataToSend->Sequence = RF_TX_Counter;
 713  0177 c6003b        	ld	a,_RF_TX_Counter
 714  017a e701          	ld	(1,x),a
 715                     ; 160   DataToSend->Control = RF_TX_MSG_ALM*64;
 717  017c a6c0          	ld	a,#192
 718                     ; 161   SetBit(DataToSend->Control, RF_TX_ARQ);
 720  017e a4ef          	and	a,#239
 721  0180 aa20          	or	a,#32
 722                     ; 162   ClrBit(DataToSend->Control, RF_TX_ARS);
 724  0182 ab02          	add	a,#2
 725  0184 e702          	ld	(2,x),a
 726                     ; 163   DataToSend->Control = DataToSend->Control + 2;    // Data Length Status + 3xADC + ItemID
 728                     ; 164   DataToSend->ItemID = RF_TX_ALM_ITEM;
 730  0186 a640          	ld	a,#64
 731  0188 e703          	ld	(3,x),a
 732                     ; 165 	DataToSend->Data[0] = 0;
 734  018a 6f04          	clr	(4,x)
 735                     ; 166   if (RF_TX_MotionIR) {SetBit(DataToSend->Data[0], 0);}
 737  018c c60000        	ld	a,_RF_TX_MotionIR
 738  018f 2706          	jreq	L112
 741  0191 e604          	ld	a,(4,x)
 742  0193 aa01          	or	a,#1
 743  0195 e704          	ld	(4,x),a
 744  0197               L112:
 745                     ; 167   if (RF_TX_MotionRadar) {SetBit(DataToSend->Data[0], 1);}
 747  0197 c60000        	ld	a,_RF_TX_MotionRadar
 748  019a 2706          	jreq	L312
 751  019c e604          	ld	a,(4,x)
 752  019e aa02          	or	a,#2
 753  01a0 e704          	ld	(4,x),a
 754  01a2               L312:
 755                     ; 169 }
 758  01a2 81            	ret	
 812                     ; 171 uint8_t RF_TX_BuildBuffer(uint8_t *BufferSend, RF_Datagram_t *DataToSend)
 812                     ; 172 {
 813                     	switch	.text
 814  01a3               _RF_TX_BuildBuffer:
 816  01a3 89            	pushw	x
 817  01a4 88            	push	a
 818       00000001      OFST:	set	1
 821                     ; 174   BufferSend[0] = DataToSend->NodeID;
 823  01a5 1e06          	ldw	x,(OFST+5,sp)
 824  01a7 f6            	ld	a,(x)
 825  01a8 1e02          	ldw	x,(OFST+1,sp)
 826  01aa f7            	ld	(x),a
 827                     ; 175   BufferSend[1] = DataToSend->Sequence;
 829  01ab 1e06          	ldw	x,(OFST+5,sp)
 830  01ad e601          	ld	a,(1,x)
 831  01af 1e02          	ldw	x,(OFST+1,sp)
 832  01b1 e701          	ld	(1,x),a
 833                     ; 176   BufferSend[2] = DataToSend->Control;
 835  01b3 1e06          	ldw	x,(OFST+5,sp)
 836  01b5 e602          	ld	a,(2,x)
 837  01b7 1e02          	ldw	x,(OFST+1,sp)
 838  01b9 e702          	ld	(2,x),a
 839                     ; 177   BufferSend[3] = DataToSend->ItemID;
 841  01bb 1e06          	ldw	x,(OFST+5,sp)
 842  01bd e603          	ld	a,(3,x)
 843  01bf 1e02          	ldw	x,(OFST+1,sp)
 844                     ; 178   for (i=0; i<(DataToSend->Control%16);i++)
 846  01c1 0f01          	clr	(OFST+0,sp)
 847  01c3 e703          	ld	(3,x),a
 850  01c5 2015          	jra	L742
 851  01c7               L342:
 852                     ; 180     BufferSend[4+i] = DataToSend->Data[i];
 854  01c7 7b01          	ld	a,(OFST+0,sp)
 855  01c9 5f            	clrw	x
 856  01ca 97            	ld	xl,a
 857  01cb 72fb02        	addw	x,(OFST+1,sp)
 858  01ce 905f          	clrw	y
 859  01d0 9097          	ld	yl,a
 860  01d2 72f906        	addw	y,(OFST+5,sp)
 861  01d5 90e604        	ld	a,(4,y)
 862  01d8 e704          	ld	(4,x),a
 863                     ; 178   for (i=0; i<(DataToSend->Control%16);i++)
 865  01da 0c01          	inc	(OFST+0,sp)
 867  01dc               L742:
 870  01dc 1e06          	ldw	x,(OFST+5,sp)
 871  01de e602          	ld	a,(2,x)
 872  01e0 a40f          	and	a,#15
 873  01e2 1101          	cp	a,(OFST+0,sp)
 874  01e4 22e1          	jrugt	L342
 875                     ; 182   return DataToSend->Control%16 + 3;
 877  01e6 e602          	ld	a,(2,x)
 878  01e8 a40f          	and	a,#15
 879  01ea ab03          	add	a,#3
 882  01ec 5b03          	addw	sp,#3
 883  01ee 81            	ret	
 910                     ; 185 void RF_RX_Check_LT8900(void)
 910                     ; 186 {
 911                     	switch	.text
 912  01ef               _RF_RX_Check_LT8900:
 916                     ; 187 	if ((LT8900_readRegister(R_CHANNEL)%32) != DEFAULT_CHANNEL)
 918  01ef a607          	ld	a,#7
 919  01f1 cd0000        	call	_LT8900_readRegister
 921  01f4 01            	rrwa	x,a
 922  01f5 a41f          	and	a,#31
 923  01f7 5f            	clrw	x
 924  01f8 02            	rlwa	x,a
 925  01f9 a3004a        	cpw	x,#74
 926  01fc 270b          	jreq	L362
 927                     ; 189 		LT8900_InitRegisters();
 929  01fe cd0000        	call	_LT8900_InitRegisters
 931                     ; 190 		LT8900_setChannel(DEFAULT_CHANNEL);                                                         // Set recieve channel
 933  0201 a64a          	ld	a,#74
 934  0203 cd0000        	call	_LT8900_setChannel
 936                     ; 191 		LT8900_startListening();
 938  0206 cd0000        	call	_LT8900_startListening
 940  0209               L362:
 941                     ; 193 }
 944  0209 81            	ret	
1059                     ; 195 bool RF_RX_MIRemote(uint8_t *RX_Buffer, int8_t Lenght)
1059                     ; 196 {
1060                     	switch	.text
1061  020a               _RF_RX_MIRemote:
1063  020a 89            	pushw	x
1064  020b 5206          	subw	sp,#6
1065       00000006      OFST:	set	6
1068                     ; 207   if ((Lenght == 7) && (RX_Buffer[0]==0x5A))
1070  020d 7b0b          	ld	a,(OFST+5,sp)
1071  020f a107          	cp	a,#7
1072  0211 2703cc0ae2    	jrne	L723
1074  0216 f6            	ld	a,(x)
1075  0217 a15a          	cp	a,#90
1076  0219 26f8          	jrne	L723
1077                     ; 210     Valid = TRUE;
1079  021b a601          	ld	a,#1
1080  021d 6b03          	ld	(OFST-3,sp),a
1082                     ; 211     if (RF_RX_MI_LastCounter != RX_Buffer[5])
1084  021f e605          	ld	a,(5,x)
1085  0221 c1003a        	cp	a,_RF_RX_MI_LastCounter
1086  0224 2603cc0ae4    	jreq	L5311
1087                     ; 213       Rem_Address = RX_Buffer[1] * 256 + RX_Buffer[2];
1089  0229 e601          	ld	a,(1,x)
1090  022b 5f            	clrw	x
1091  022c 97            	ld	xl,a
1092  022d 1607          	ldw	y,(OFST+1,sp)
1093  022f 4f            	clr	a
1094  0230 90eb02        	add	a,(2,y)
1095  0233 2401          	jrnc	L011
1096  0235 5c            	incw	x
1097  0236               L011:
1098  0236 02            	rlwa	x,a
1099  0237 1f01          	ldw	(OFST-5,sp),x
1101                     ; 214       Counter = RX_Buffer[5];
1103  0239 1e07          	ldw	x,(OFST+1,sp)
1104  023b e605          	ld	a,(5,x)
1105  023d 6b04          	ld	(OFST-2,sp),a
1107                     ; 215       RF_RX_MI_LastCounter = Counter;
1109  023f c7003a        	ld	_RF_RX_MI_LastCounter,a
1110                     ; 216       Group = RX_Buffer[3];
1112  0242 e603          	ld	a,(3,x)
1113  0244 6b06          	ld	(OFST+0,sp),a
1115                     ; 217       if (RX_Buffer[4]/16) KeyHold = TRUE;
1117  0246 e604          	ld	a,(4,x)
1118  0248 5f            	clrw	x
1119  0249 97            	ld	xl,a
1120  024a 57            	sraw	x
1121  024b 57            	sraw	x
1122  024c 57            	sraw	x
1123  024d 57            	sraw	x
1124  024e 2706          	jreq	L333
1127  0250 a601          	ld	a,#1
1128  0252 6b04          	ld	(OFST-2,sp),a
1131  0254 2002          	jra	L533
1132  0256               L333:
1133                     ; 218                       else KeyHold = FALSE;
1135  0256 0f04          	clr	(OFST-2,sp)
1137  0258               L533:
1138                     ; 219       Command = RX_Buffer[4] % 16;                //AllON-0x05, AllOFF-0x09,
1140  0258 1e07          	ldw	x,(OFST+1,sp)
1141  025a e604          	ld	a,(4,x)
1142  025c a40f          	and	a,#15
1143  025e 6b05          	ld	(OFST-1,sp),a
1145                     ; 226       if (RF_RX_MI_ChkAddress(Rem_Address,RX_Buffer[4]))
1147  0260 e604          	ld	a,(4,x)
1148  0262 88            	push	a
1149  0263 1e02          	ldw	x,(OFST-4,sp)
1150  0265 cd0b35        	call	_RF_RX_MI_ChkAddress
1152  0268 5b01          	addw	sp,#1
1153  026a 4d            	tnz	a
1154  026b 27b9          	jreq	L5311
1155                     ; 230         if (Command == 0x05)
1157  026d 7b05          	ld	a,(OFST-1,sp)
1158  026f a105          	cp	a,#5
1159  0271 2703cc02ff    	jrne	L143
1160                     ; 232           if (!KeyHold) {
1162  0276 7b04          	ld	a,(OFST-2,sp)
1163  0278 265d          	jrne	L343
1164                     ; 233             if (RF_RX_MI_PrevCommand!=Command)
1166  027a c60035        	ld	a,_RF_RX_MI_PrevCommand
1167  027d 1105          	cp	a,(OFST-1,sp)
1168  027f 270b          	jreq	L543
1169                     ; 235               RF_RX_MI_PrevCommand = Command;
1171  0281 7b05          	ld	a,(OFST-1,sp)
1172  0283 c70035        	ld	_RF_RX_MI_PrevCommand,a
1173                     ; 236               RF_RX_MI_FirstPress = TRUE;
1175  0286 35010036      	mov	_RF_RX_MI_FirstPress,#1
1177  028a 2004          	jra	L743
1178  028c               L543:
1179                     ; 237             } else RF_RX_MI_FirstPress = FALSE;
1181  028c 725f0036      	clr	_RF_RX_MI_FirstPress
1182  0290               L743:
1183                     ; 238             for (i=0;i<4;i++)                     //All on to last PWM
1185  0290 4f            	clr	a
1186  0291 6b06          	ld	(OFST+0,sp),a
1188  0293               L153:
1189                     ; 241 							RF_RX_LED_GroupEnabled[i] = TRUE;
1191  0293 5f            	clrw	x
1192  0294 97            	ld	xl,a
1193  0295 a601          	ld	a,#1
1194  0297 d70028        	ld	(_RF_RX_LED_GroupEnabled,x),a
1195                     ; 242               RF_RX_LED_MotionAct[i] = FALSE;
1197  029a 5f            	clrw	x
1198  029b 7b06          	ld	a,(OFST+0,sp)
1199  029d 97            	ld	xl,a
1200  029e 724f002c      	clr	(_RF_RX_LED_MotionAct,x)
1201                     ; 243               RF_RX_LED_NightMode[i] = FALSE;
1203  02a2 5f            	clrw	x
1204  02a3 97            	ld	xl,a
1205  02a4 724f0030      	clr	(_RF_RX_LED_NightMode,x)
1206                     ; 244               LED_Target_CW[i] = LED_LastSaved_CW[i];
1208  02a8 5f            	clrw	x
1209  02a9 97            	ld	xl,a
1210  02aa d60000        	ld	a,(_LED_LastSaved_CW,x)
1211  02ad d70000        	ld	(_LED_Target_CW,x),a
1212                     ; 245               LED_Target_WW[i] = LED_LastSaved_WW[i];
1214  02b0 5f            	clrw	x
1215  02b1 7b06          	ld	a,(OFST+0,sp)
1216  02b3 97            	ld	xl,a
1217  02b4 d60000        	ld	a,(_LED_LastSaved_WW,x)
1218  02b7 d70000        	ld	(_LED_Target_WW,x),a
1219                     ; 238             for (i=0;i<4;i++)                     //All on to last PWM
1221  02ba 0c06          	inc	(OFST+0,sp)
1225  02bc 7b06          	ld	a,(OFST+0,sp)
1226  02be a104          	cp	a,#4
1227  02c0 25d1          	jrult	L153
1228                     ; 247             Serial_Send_PWM_NightEN(255,0);       // All night off
1230  02c2 aeff00        	ldw	x,#65280
1231  02c5 cd0000        	call	_Serial_Send_PWM_NightEN
1233                     ; 248             Serial_Send_PWM_MotionEN(255,0);      // All motion off
1235  02c8 aeff00        	ldw	x,#65280
1236  02cb cd0000        	call	_Serial_Send_PWM_MotionEN
1238                     ; 249             Serial_Send_PWM_Onoff(255,1);         // All On
1240  02ce aeff01        	ldw	x,#65281
1241  02d1 cd0000        	call	_Serial_Send_PWM_Onoff
1244  02d4 cc0ae4        	jra	L5311
1245  02d7               L343:
1246                     ; 253             for (i=0;i<4;i++)                     //All on to last PWM
1248  02d7 4f            	clr	a
1249  02d8 6b06          	ld	(OFST+0,sp),a
1251  02da               L163:
1252                     ; 255               RF_RX_LED_NightMode[i] = TRUE;
1254  02da 5f            	clrw	x
1255  02db 97            	ld	xl,a
1256  02dc a601          	ld	a,#1
1257  02de d70030        	ld	(_RF_RX_LED_NightMode,x),a
1258                     ; 256               RF_RX_LED_GroupEnabled[i] = TRUE;
1260  02e1 5f            	clrw	x
1261  02e2 7b06          	ld	a,(OFST+0,sp)
1262  02e4 97            	ld	xl,a
1263  02e5 a601          	ld	a,#1
1264  02e7 d70028        	ld	(_RF_RX_LED_GroupEnabled,x),a
1265                     ; 257               RF_RX_MI_FirstPress = FALSE;
1267  02ea 725f0036      	clr	_RF_RX_MI_FirstPress
1268                     ; 253             for (i=0;i<4;i++)                     //All on to last PWM
1270  02ee 0c06          	inc	(OFST+0,sp)
1274  02f0 7b06          	ld	a,(OFST+0,sp)
1275  02f2 a104          	cp	a,#4
1276  02f4 25e4          	jrult	L163
1277                     ; 259             Serial_Send_PWM_NightEN(255,1);
1279  02f6 aeff01        	ldw	x,#65281
1280  02f9 cd0000        	call	_Serial_Send_PWM_NightEN
1282  02fc cc0ae4        	jra	L5311
1283  02ff               L143:
1284                     ; 264         else if (Command == 0x09)
1286  02ff a109          	cp	a,#9
1287  0301 265f          	jrne	L173
1288                     ; 266           if (!KeyHold) {
1290  0303 7b04          	ld	a,(OFST-2,sp)
1291  0305 263c          	jrne	L373
1292                     ; 267             if (RF_RX_MI_PrevCommand!=Command)
1294  0307 c60035        	ld	a,_RF_RX_MI_PrevCommand
1295  030a 1105          	cp	a,(OFST-1,sp)
1296  030c 270b          	jreq	L573
1297                     ; 269               RF_RX_MI_PrevCommand = Command;
1299  030e 7b05          	ld	a,(OFST-1,sp)
1300  0310 c70035        	ld	_RF_RX_MI_PrevCommand,a
1301                     ; 270               RF_RX_MI_FirstPress = TRUE;
1303  0313 35010036      	mov	_RF_RX_MI_FirstPress,#1
1305  0317 2004          	jra	L773
1306  0319               L573:
1307                     ; 271             } else RF_RX_MI_FirstPress = FALSE;
1309  0319 725f0036      	clr	_RF_RX_MI_FirstPress
1310  031d               L773:
1311                     ; 272             for (i=0;i<4;i++)                     //All Off mm
1313  031d 4f            	clr	a
1314  031e 6b06          	ld	(OFST+0,sp),a
1316  0320               L104:
1317                     ; 275               RF_RX_LED_GroupEnabled[i] = FALSE;
1319  0320 5f            	clrw	x
1320  0321 97            	ld	xl,a
1321  0322 724f0028      	clr	(_RF_RX_LED_GroupEnabled,x)
1322                     ; 277               RF_RX_LED_MotionAct[i] = FALSE;
1324  0326 5f            	clrw	x
1325  0327 97            	ld	xl,a
1326  0328 724f002c      	clr	(_RF_RX_LED_MotionAct,x)
1327                     ; 272             for (i=0;i<4;i++)                     //All Off mm
1329  032c 0c06          	inc	(OFST+0,sp)
1333  032e 7b06          	ld	a,(OFST+0,sp)
1334  0330 a104          	cp	a,#4
1335  0332 25ec          	jrult	L104
1336                     ; 279             Serial_Send_PWM_MotionEN(255,0);
1338  0334 aeff00        	ldw	x,#65280
1339  0337 cd0000        	call	_Serial_Send_PWM_MotionEN
1341                     ; 280             Serial_Send_PWM_Onoff(255,0);
1343  033a aeff00        	ldw	x,#65280
1344  033d cd0000        	call	_Serial_Send_PWM_Onoff
1347  0340 cc0ae4        	jra	L5311
1348  0343               L373:
1349                     ; 283             for (i=0;i<4;i++)
1351  0343 4f            	clr	a
1352  0344 6b06          	ld	(OFST+0,sp),a
1354  0346               L114:
1355                     ; 285               RF_RX_LED_MotionAct[i] = TRUE;
1357  0346 5f            	clrw	x
1358  0347 97            	ld	xl,a
1359  0348 a601          	ld	a,#1
1360  034a d7002c        	ld	(_RF_RX_LED_MotionAct,x),a
1361                     ; 286               RF_RX_MI_FirstPress = FALSE;
1363  034d 725f0036      	clr	_RF_RX_MI_FirstPress
1364                     ; 283             for (i=0;i<4;i++)
1366  0351 0c06          	inc	(OFST+0,sp)
1370  0353 7b06          	ld	a,(OFST+0,sp)
1371  0355 a104          	cp	a,#4
1372  0357 25ed          	jrult	L114
1373                     ; 288             Serial_Send_PWM_MotionEN(255,1);
1375  0359 aeff01        	ldw	x,#65281
1376  035c cd0000        	call	_Serial_Send_PWM_MotionEN
1378  035f cc0ae4        	jra	L5311
1379  0362               L173:
1380                     ; 297         else if (Command == 0x08)
1382  0362 a108          	cp	a,#8
1383  0364 264e          	jrne	L124
1384                     ; 299           if (!KeyHold) {
1386  0366 7b04          	ld	a,(OFST-2,sp)
1387  0368 2635          	jrne	L324
1388                     ; 301               if (RF_RX_MI_PrevCommand!=Command)
1390  036a c60035        	ld	a,_RF_RX_MI_PrevCommand
1391  036d 1105          	cp	a,(OFST-1,sp)
1392  036f 270b          	jreq	L524
1393                     ; 303                 RF_RX_MI_PrevCommand = Command;
1395  0371 7b05          	ld	a,(OFST-1,sp)
1396  0373 c70035        	ld	_RF_RX_MI_PrevCommand,a
1397                     ; 304                 RF_RX_MI_FirstPress = TRUE;
1399  0376 35010036      	mov	_RF_RX_MI_FirstPress,#1
1401  037a 2004          	jra	L724
1402  037c               L524:
1403                     ; 305               } else RF_RX_MI_FirstPress = FALSE;
1405  037c 725f0036      	clr	_RF_RX_MI_FirstPress
1406  0380               L724:
1407                     ; 306               RF_RX_LED_GroupEnabled[0] = TRUE;
1409  0380 35010028      	mov	_RF_RX_LED_GroupEnabled,#1
1410                     ; 307               RF_RX_LED_MotionAct[0] = FALSE;
1412  0384 725f002c      	clr	_RF_RX_LED_MotionAct
1413                     ; 308               RF_RX_LED_NightMode[0] = FALSE;
1415  0388 725f0030      	clr	_RF_RX_LED_NightMode
1416                     ; 309               LED_Target_CW[0] = LED_LastSaved_CW[0];
1418  038c 5500000000    	mov	_LED_Target_CW,_LED_LastSaved_CW
1419                     ; 310               LED_Target_WW[0] = LED_LastSaved_WW[0];
1421                     ; 311               Serial_Send_PWM_Onoff(101,TRUE);
1423  0391 ae6501        	ldw	x,#25857
1424  0394 5500000000    	mov	_LED_Target_WW,_LED_LastSaved_WW
1425  0399 cd0000        	call	_Serial_Send_PWM_Onoff
1428  039c cc0ae4        	jra	L5311
1429  039f               L324:
1430                     ; 314               RF_RX_LED_NightMode[0] = TRUE;
1432  039f 35010030      	mov	_RF_RX_LED_NightMode,#1
1433                     ; 315               RF_RX_LED_GroupEnabled[0] = TRUE;
1435  03a3 35010028      	mov	_RF_RX_LED_GroupEnabled,#1
1436                     ; 316               RF_RX_MI_FirstPress = FALSE;
1438  03a7 725f0036      	clr	_RF_RX_MI_FirstPress
1439                     ; 317               Serial_Send_PWM_NightEN(101,TRUE);
1441  03ab ae6501        	ldw	x,#25857
1442  03ae cd0000        	call	_Serial_Send_PWM_NightEN
1444  03b1 cc0ae4        	jra	L5311
1445  03b4               L124:
1446                     ; 322         else if (Command == 0x0B)
1448  03b4 a10b          	cp	a,#11
1449  03b6 263c          	jrne	L534
1450                     ; 324           if (!KeyHold) {
1452  03b8 7b04          	ld	a,(OFST-2,sp)
1453  03ba 2627          	jrne	L734
1454                     ; 325             if (RF_RX_MI_PrevCommand!=Command)
1456  03bc c60035        	ld	a,_RF_RX_MI_PrevCommand
1457  03bf 1105          	cp	a,(OFST-1,sp)
1458  03c1 270b          	jreq	L144
1459                     ; 327               RF_RX_MI_PrevCommand = Command;
1461  03c3 7b05          	ld	a,(OFST-1,sp)
1462  03c5 c70035        	ld	_RF_RX_MI_PrevCommand,a
1463                     ; 328               RF_RX_MI_FirstPress = TRUE;
1465  03c8 35010036      	mov	_RF_RX_MI_FirstPress,#1
1467  03cc 2004          	jra	L344
1468  03ce               L144:
1469                     ; 329             } else RF_RX_MI_FirstPress = FALSE;
1471  03ce 725f0036      	clr	_RF_RX_MI_FirstPress
1472  03d2               L344:
1473                     ; 330               RF_RX_LED_GroupEnabled[0] = FALSE;
1475  03d2 725f0028      	clr	_RF_RX_LED_GroupEnabled
1476                     ; 332               RF_RX_LED_MotionAct[0] = FALSE;
1478  03d6 725f002c      	clr	_RF_RX_LED_MotionAct
1479                     ; 333               Serial_Send_PWM_Onoff(101,FALSE);
1481  03da ae6500        	ldw	x,#25856
1482  03dd cd0000        	call	_Serial_Send_PWM_Onoff
1485  03e0 cc0ae4        	jra	L5311
1486  03e3               L734:
1487                     ; 336               RF_RX_LED_MotionAct[0] = TRUE;
1489  03e3 3501002c      	mov	_RF_RX_LED_MotionAct,#1
1490                     ; 337               RF_RX_MI_FirstPress = FALSE;
1492  03e7 725f0036      	clr	_RF_RX_MI_FirstPress
1493                     ; 338               Serial_Send_PWM_MotionEN(101,TRUE);
1495  03eb ae6501        	ldw	x,#25857
1496  03ee cd0000        	call	_Serial_Send_PWM_MotionEN
1498  03f1 cc0ae4        	jra	L5311
1499  03f4               L534:
1500                     ; 348         else if (Command == 0x0D)
1502  03f4 a10d          	cp	a,#13
1503  03f6 264e          	jrne	L154
1504                     ; 350           if (!KeyHold) {
1506  03f8 7b04          	ld	a,(OFST-2,sp)
1507  03fa 2635          	jrne	L354
1508                     ; 351             if (RF_RX_MI_PrevCommand!=Command)
1510  03fc c60035        	ld	a,_RF_RX_MI_PrevCommand
1511  03ff 1105          	cp	a,(OFST-1,sp)
1512  0401 270b          	jreq	L554
1513                     ; 353               RF_RX_MI_PrevCommand = Command;
1515  0403 7b05          	ld	a,(OFST-1,sp)
1516  0405 c70035        	ld	_RF_RX_MI_PrevCommand,a
1517                     ; 354               RF_RX_MI_FirstPress = TRUE;
1519  0408 35010036      	mov	_RF_RX_MI_FirstPress,#1
1521  040c 2004          	jra	L754
1522  040e               L554:
1523                     ; 355             } else RF_RX_MI_FirstPress = FALSE;
1525  040e 725f0036      	clr	_RF_RX_MI_FirstPress
1526  0412               L754:
1527                     ; 357               RF_RX_LED_GroupEnabled[1] = TRUE;
1529  0412 35010029      	mov	_RF_RX_LED_GroupEnabled+1,#1
1530                     ; 358               RF_RX_LED_MotionAct[1] = FALSE;
1532  0416 725f002d      	clr	_RF_RX_LED_MotionAct+1
1533                     ; 359               RF_RX_LED_NightMode[1] = FALSE;
1535  041a 725f0031      	clr	_RF_RX_LED_NightMode+1
1536                     ; 360               LED_Target_CW[1] = LED_LastSaved_CW[1];
1538  041e 5500010001    	mov	_LED_Target_CW+1,_LED_LastSaved_CW+1
1539                     ; 361               LED_Target_WW[1] = LED_LastSaved_WW[1];
1541                     ; 362               Serial_Send_PWM_Onoff(102,TRUE);
1543  0423 ae6601        	ldw	x,#26113
1544  0426 5500010001    	mov	_LED_Target_WW+1,_LED_LastSaved_WW+1
1545  042b cd0000        	call	_Serial_Send_PWM_Onoff
1548  042e cc0ae4        	jra	L5311
1549  0431               L354:
1550                     ; 365               RF_RX_LED_NightMode[1] = TRUE;
1552  0431 35010031      	mov	_RF_RX_LED_NightMode+1,#1
1553                     ; 366               RF_RX_LED_GroupEnabled[1] = TRUE;
1555  0435 35010029      	mov	_RF_RX_LED_GroupEnabled+1,#1
1556                     ; 367               RF_RX_MI_FirstPress = FALSE;
1558  0439 725f0036      	clr	_RF_RX_MI_FirstPress
1559                     ; 368               Serial_Send_PWM_NightEN(102,TRUE);
1561  043d ae6601        	ldw	x,#26113
1562  0440 cd0000        	call	_Serial_Send_PWM_NightEN
1564  0443 cc0ae4        	jra	L5311
1565  0446               L154:
1566                     ; 373         else if (Command == 0x03)
1568  0446 a103          	cp	a,#3
1569  0448 263c          	jrne	L564
1570                     ; 375           if (!KeyHold) {
1572  044a 7b04          	ld	a,(OFST-2,sp)
1573  044c 2627          	jrne	L764
1574                     ; 376             if (RF_RX_MI_PrevCommand!=Command)
1576  044e c60035        	ld	a,_RF_RX_MI_PrevCommand
1577  0451 1105          	cp	a,(OFST-1,sp)
1578  0453 270b          	jreq	L174
1579                     ; 378               RF_RX_MI_PrevCommand = Command;
1581  0455 7b05          	ld	a,(OFST-1,sp)
1582  0457 c70035        	ld	_RF_RX_MI_PrevCommand,a
1583                     ; 379               RF_RX_MI_FirstPress = TRUE;
1585  045a 35010036      	mov	_RF_RX_MI_FirstPress,#1
1587  045e 2004          	jra	L374
1588  0460               L174:
1589                     ; 380             } else RF_RX_MI_FirstPress = FALSE;
1591  0460 725f0036      	clr	_RF_RX_MI_FirstPress
1592  0464               L374:
1593                     ; 381               RF_RX_LED_GroupEnabled[1] = FALSE;
1595  0464 725f0029      	clr	_RF_RX_LED_GroupEnabled+1
1596                     ; 383               RF_RX_LED_MotionAct[1] = FALSE;
1598  0468 725f002d      	clr	_RF_RX_LED_MotionAct+1
1599                     ; 384               Serial_Send_PWM_Onoff(102,FALSE);
1601  046c ae6600        	ldw	x,#26112
1602  046f cd0000        	call	_Serial_Send_PWM_Onoff
1605  0472 cc0ae4        	jra	L5311
1606  0475               L764:
1607                     ; 387               RF_RX_LED_MotionAct[1] = TRUE;
1609  0475 3501002d      	mov	_RF_RX_LED_MotionAct+1,#1
1610                     ; 388               RF_RX_MI_FirstPress = FALSE;
1612  0479 725f0036      	clr	_RF_RX_MI_FirstPress
1613                     ; 389               Serial_Send_PWM_MotionEN(102,TRUE);
1615  047d ae6601        	ldw	x,#26113
1616  0480 cd0000        	call	_Serial_Send_PWM_MotionEN
1618  0483 cc0ae4        	jra	L5311
1619  0486               L564:
1620                     ; 399         else if (Command == 0x07)
1622  0486 a107          	cp	a,#7
1623  0488 264e          	jrne	L105
1624                     ; 401           if (!KeyHold) {
1626  048a 7b04          	ld	a,(OFST-2,sp)
1627  048c 2635          	jrne	L305
1628                     ; 402             if (RF_RX_MI_PrevCommand!=Command)
1630  048e c60035        	ld	a,_RF_RX_MI_PrevCommand
1631  0491 1105          	cp	a,(OFST-1,sp)
1632  0493 270b          	jreq	L505
1633                     ; 404               RF_RX_MI_PrevCommand = Command;
1635  0495 7b05          	ld	a,(OFST-1,sp)
1636  0497 c70035        	ld	_RF_RX_MI_PrevCommand,a
1637                     ; 405               RF_RX_MI_FirstPress = TRUE;
1639  049a 35010036      	mov	_RF_RX_MI_FirstPress,#1
1641  049e 2004          	jra	L705
1642  04a0               L505:
1643                     ; 406             } else RF_RX_MI_FirstPress = FALSE;
1645  04a0 725f0036      	clr	_RF_RX_MI_FirstPress
1646  04a4               L705:
1647                     ; 408               RF_RX_LED_GroupEnabled[2] = TRUE;
1649  04a4 3501002a      	mov	_RF_RX_LED_GroupEnabled+2,#1
1650                     ; 409               RF_RX_LED_MotionAct[2] = FALSE;
1652  04a8 725f002e      	clr	_RF_RX_LED_MotionAct+2
1653                     ; 410               RF_RX_LED_NightMode[2] = FALSE;
1655  04ac 725f0032      	clr	_RF_RX_LED_NightMode+2
1656                     ; 411               LED_Target_CW[2] = LED_LastSaved_CW[2];
1658  04b0 5500020002    	mov	_LED_Target_CW+2,_LED_LastSaved_CW+2
1659                     ; 412               LED_Target_WW[2] = LED_LastSaved_WW[2];
1661                     ; 413               Serial_Send_PWM_Onoff(103,TRUE);
1663  04b5 ae6701        	ldw	x,#26369
1664  04b8 5500020002    	mov	_LED_Target_WW+2,_LED_LastSaved_WW+2
1665  04bd cd0000        	call	_Serial_Send_PWM_Onoff
1668  04c0 cc0ae4        	jra	L5311
1669  04c3               L305:
1670                     ; 416               RF_RX_LED_NightMode[2] = TRUE;
1672  04c3 35010032      	mov	_RF_RX_LED_NightMode+2,#1
1673                     ; 417               RF_RX_LED_GroupEnabled[2] = TRUE;
1675  04c7 3501002a      	mov	_RF_RX_LED_GroupEnabled+2,#1
1676                     ; 418               RF_RX_MI_FirstPress = FALSE;
1678  04cb 725f0036      	clr	_RF_RX_MI_FirstPress
1679                     ; 419               Serial_Send_PWM_NightEN(103,TRUE);
1681  04cf ae6701        	ldw	x,#26369
1682  04d2 cd0000        	call	_Serial_Send_PWM_NightEN
1684  04d5 cc0ae4        	jra	L5311
1685  04d8               L105:
1686                     ; 424         else if (Command == 0x0A)
1688  04d8 a10a          	cp	a,#10
1689  04da 263c          	jrne	L515
1690                     ; 426           if (!KeyHold) {
1692  04dc 7b04          	ld	a,(OFST-2,sp)
1693  04de 2627          	jrne	L715
1694                     ; 427             if (RF_RX_MI_PrevCommand!=Command)
1696  04e0 c60035        	ld	a,_RF_RX_MI_PrevCommand
1697  04e3 1105          	cp	a,(OFST-1,sp)
1698  04e5 270b          	jreq	L125
1699                     ; 429               RF_RX_MI_PrevCommand = Command;
1701  04e7 7b05          	ld	a,(OFST-1,sp)
1702  04e9 c70035        	ld	_RF_RX_MI_PrevCommand,a
1703                     ; 430               RF_RX_MI_FirstPress = TRUE;
1705  04ec 35010036      	mov	_RF_RX_MI_FirstPress,#1
1707  04f0 2004          	jra	L325
1708  04f2               L125:
1709                     ; 431             } else RF_RX_MI_FirstPress = FALSE;
1711  04f2 725f0036      	clr	_RF_RX_MI_FirstPress
1712  04f6               L325:
1713                     ; 432               RF_RX_LED_GroupEnabled[2] = FALSE;
1715  04f6 725f002a      	clr	_RF_RX_LED_GroupEnabled+2
1716                     ; 434               RF_RX_LED_MotionAct[2] = FALSE;
1718  04fa 725f002e      	clr	_RF_RX_LED_MotionAct+2
1719                     ; 435               Serial_Send_PWM_Onoff(103,FALSE);
1721  04fe ae6700        	ldw	x,#26368
1722  0501 cd0000        	call	_Serial_Send_PWM_Onoff
1725  0504 cc0ae4        	jra	L5311
1726  0507               L715:
1727                     ; 438               RF_RX_LED_MotionAct[2] = TRUE;
1729  0507 3501002e      	mov	_RF_RX_LED_MotionAct+2,#1
1730                     ; 439               RF_RX_MI_FirstPress = FALSE;
1732  050b 725f0036      	clr	_RF_RX_MI_FirstPress
1733                     ; 440               Serial_Send_PWM_MotionEN(103,TRUE);
1735  050f ae6701        	ldw	x,#26369
1736  0512 cd0000        	call	_Serial_Send_PWM_MotionEN
1738  0515 cc0ae4        	jra	L5311
1739  0518               L515:
1740                     ; 449         else if (Command == 0x02)
1742  0518 a102          	cp	a,#2
1743  051a 264e          	jrne	L135
1744                     ; 451           if (!KeyHold) {
1746  051c 7b04          	ld	a,(OFST-2,sp)
1747  051e 2635          	jrne	L335
1748                     ; 452             if (RF_RX_MI_PrevCommand!=Command)
1750  0520 c60035        	ld	a,_RF_RX_MI_PrevCommand
1751  0523 1105          	cp	a,(OFST-1,sp)
1752  0525 270b          	jreq	L535
1753                     ; 454               RF_RX_MI_PrevCommand = Command;
1755  0527 7b05          	ld	a,(OFST-1,sp)
1756  0529 c70035        	ld	_RF_RX_MI_PrevCommand,a
1757                     ; 455               RF_RX_MI_FirstPress = TRUE;
1759  052c 35010036      	mov	_RF_RX_MI_FirstPress,#1
1761  0530 2004          	jra	L735
1762  0532               L535:
1763                     ; 456             } else RF_RX_MI_FirstPress = FALSE;
1765  0532 725f0036      	clr	_RF_RX_MI_FirstPress
1766  0536               L735:
1767                     ; 458               RF_RX_LED_GroupEnabled[3] = TRUE;
1769  0536 3501002b      	mov	_RF_RX_LED_GroupEnabled+3,#1
1770                     ; 459               RF_RX_LED_MotionAct[3] = FALSE;
1772  053a 725f002f      	clr	_RF_RX_LED_MotionAct+3
1773                     ; 460               RF_RX_LED_NightMode[3] = FALSE;
1775  053e 725f0033      	clr	_RF_RX_LED_NightMode+3
1776                     ; 461               LED_Target_CW[3] = LED_LastSaved_CW[3];
1778  0542 5500030003    	mov	_LED_Target_CW+3,_LED_LastSaved_CW+3
1779                     ; 462               LED_Target_WW[3] = LED_LastSaved_WW[3];
1781                     ; 463               Serial_Send_PWM_Onoff(104,TRUE);
1783  0547 ae6801        	ldw	x,#26625
1784  054a 5500030003    	mov	_LED_Target_WW+3,_LED_LastSaved_WW+3
1785  054f cd0000        	call	_Serial_Send_PWM_Onoff
1788  0552 cc0ae4        	jra	L5311
1789  0555               L335:
1790                     ; 466               RF_RX_LED_NightMode[3] = TRUE;
1792  0555 35010033      	mov	_RF_RX_LED_NightMode+3,#1
1793                     ; 467               RF_RX_LED_GroupEnabled[3] = TRUE;
1795  0559 3501002b      	mov	_RF_RX_LED_GroupEnabled+3,#1
1796                     ; 468               RF_RX_MI_FirstPress = FALSE;
1798  055d 725f0036      	clr	_RF_RX_MI_FirstPress
1799                     ; 469               Serial_Send_PWM_NightEN(104,TRUE);
1801  0561 ae6801        	ldw	x,#26625
1802  0564 cd0000        	call	_Serial_Send_PWM_NightEN
1804  0567 cc0ae4        	jra	L5311
1805  056a               L135:
1806                     ; 474         else if (Command == 0x06)
1808  056a a106          	cp	a,#6
1809  056c 263c          	jrne	L545
1810                     ; 476           if (!KeyHold) {
1812  056e 7b04          	ld	a,(OFST-2,sp)
1813  0570 2627          	jrne	L745
1814                     ; 477             if (RF_RX_MI_PrevCommand!=Command)
1816  0572 c60035        	ld	a,_RF_RX_MI_PrevCommand
1817  0575 1105          	cp	a,(OFST-1,sp)
1818  0577 270b          	jreq	L155
1819                     ; 479               RF_RX_MI_PrevCommand = Command;
1821  0579 7b05          	ld	a,(OFST-1,sp)
1822  057b c70035        	ld	_RF_RX_MI_PrevCommand,a
1823                     ; 480               RF_RX_MI_FirstPress = TRUE;
1825  057e 35010036      	mov	_RF_RX_MI_FirstPress,#1
1827  0582 2004          	jra	L355
1828  0584               L155:
1829                     ; 481             } else RF_RX_MI_FirstPress = FALSE;
1831  0584 725f0036      	clr	_RF_RX_MI_FirstPress
1832  0588               L355:
1833                     ; 482               RF_RX_LED_GroupEnabled[3] = FALSE;
1835  0588 725f002b      	clr	_RF_RX_LED_GroupEnabled+3
1836                     ; 483               Serial_Send_PWM_Onoff(104,FALSE);
1838  058c ae6800        	ldw	x,#26624
1839  058f cd0000        	call	_Serial_Send_PWM_Onoff
1841                     ; 485               RF_RX_LED_MotionAct[3] = FALSE;
1843  0592 725f002f      	clr	_RF_RX_LED_MotionAct+3
1845  0596 cc0ae4        	jra	L5311
1846  0599               L745:
1847                     ; 488               RF_RX_LED_MotionAct[3] = TRUE;
1849  0599 3501002f      	mov	_RF_RX_LED_MotionAct+3,#1
1850                     ; 489               RF_RX_MI_FirstPress = FALSE;
1852  059d 725f0036      	clr	_RF_RX_MI_FirstPress
1853                     ; 490               Serial_Send_PWM_MotionEN(104,TRUE);
1855  05a1 ae6801        	ldw	x,#26625
1856  05a4 cd0000        	call	_Serial_Send_PWM_MotionEN
1858  05a7 cc0ae4        	jra	L5311
1859  05aa               L545:
1860                     ; 498         else if (Command == 0x0C)
1862  05aa a10c          	cp	a,#12
1863  05ac 2703cc0722    	jrne	L165
1864                     ; 500           RF_RX_MI_FirstPress = FALSE;
1866  05b1 725f0036      	clr	_RF_RX_MI_FirstPress
1867                     ; 501           if (!KeyHold)                     // single press
1869  05b5 7b04          	ld	a,(OFST-2,sp)
1870  05b7 2703cc0648    	jrne	L365
1871                     ; 503             if (Group == 0)                 //global command
1873  05bc 7b06          	ld	a,(OFST+0,sp)
1874  05be 2655          	jrne	L565
1875                     ; 505               for (i=0;i<4;i++)
1877  05c0 6b06          	ld	(OFST+0,sp),a
1879  05c2               L765:
1880                     ; 507                 if (RF_RX_LED_GroupEnabled[i])
1882  05c2 cd0b0d        	call	LC014
1883  05c5 2743          	jreq	L575
1884                     ; 509                   LED_Target_CW[i]++;
1886  05c7 5f            	clrw	x
1887  05c8 97            	ld	xl,a
1888  05c9 724c0000      	inc	(_LED_Target_CW,x)
1889                     ; 510                   LED_Target_WW[i]++;
1891  05cd 5f            	clrw	x
1892  05ce 97            	ld	xl,a
1893  05cf 724c0000      	inc	(_LED_Target_WW,x)
1894                     ; 511                   if (LED_Target_CW[i] > Conf_LED_Max_Brightness) LED_Target_CW[i] = Conf_LED_Max_Brightness;
1896  05d3 cd0aed        	call	LC008
1897  05d6 c10000        	cp	a,_Conf_LED_Max_Brightness
1898  05d9 2308          	jrule	L775
1901  05db 7b06          	ld	a,(OFST+0,sp)
1902  05dd cd0aff        	call	LC012
1903  05e0 d70000        	ld	(_LED_Target_CW,x),a
1904  05e3               L775:
1905                     ; 512                   if (LED_Target_WW[i] > Conf_LED_Max_Brightness) LED_Target_WW[i] = Conf_LED_Max_Brightness;
1907  05e3 7b06          	ld	a,(OFST+0,sp)
1908  05e5 cd0af3        	call	LC009
1909  05e8 c10000        	cp	a,_Conf_LED_Max_Brightness
1910  05eb 2308          	jrule	L106
1913  05ed 7b06          	ld	a,(OFST+0,sp)
1914  05ef cd0aff        	call	LC012
1915  05f2 d70000        	ld	(_LED_Target_WW,x),a
1916  05f5               L106:
1917                     ; 513                   Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
1919  05f5 7b06          	ld	a,(OFST+0,sp)
1920  05f7 cd0af3        	call	LC009
1921  05fa 88            	push	a
1922  05fb 7b07          	ld	a,(OFST+1,sp)
1923  05fd cd0aed        	call	LC008
1924  0600 97            	ld	xl,a
1925  0601 7b07          	ld	a,(OFST+1,sp)
1926  0603 ab65          	add	a,#101
1927  0605 95            	ld	xh,a
1928  0606 cd0000        	call	_Serial_Send_PWM_Bright
1930  0609 84            	pop	a
1931  060a               L575:
1932                     ; 505               for (i=0;i<4;i++)
1934  060a 0c06          	inc	(OFST+0,sp)
1938  060c 7b06          	ld	a,(OFST+0,sp)
1939  060e a104          	cp	a,#4
1940  0610 25b0          	jrult	L765
1942  0612 cc06f2        	jra	L316
1943  0615               L565:
1944                     ; 518               if (RF_RX_LED_GroupEnabled[Group-1])
1946  0615 cd0b05        	call	LC013
1947  0618 27f8          	jreq	L316
1948                     ; 520                 LED_Target_CW[Group-1]++;
1950  061a 5f            	clrw	x
1951  061b 97            	ld	xl,a
1952  061c 5a            	decw	x
1953  061d 724c0000      	inc	(_LED_Target_CW,x)
1954                     ; 521                 LED_Target_WW[Group-1]++;
1956  0621 5f            	clrw	x
1957  0622 97            	ld	xl,a
1958  0623 5a            	decw	x
1959  0624 724c0000      	inc	(_LED_Target_WW,x)
1960                     ; 522                 if (LED_Target_CW[Group-1] > Conf_LED_Max_Brightness) LED_Target_CW[Group-1] = Conf_LED_Max_Brightness;
1962  0628 cd0af9        	call	LC010
1963  062b c10000        	cp	a,_Conf_LED_Max_Brightness
1964  062e 2308          	jrule	L706
1967  0630 7b06          	ld	a,(OFST+0,sp)
1968  0632 cd0b14        	call	LC015
1969  0635 d70000        	ld	(_LED_Target_CW,x),a
1970  0638               L706:
1971                     ; 523                 if (LED_Target_WW[Group-1] > Conf_LED_Max_Brightness) LED_Target_WW[Group-1] = Conf_LED_Max_Brightness;
1973  0638 7b06          	ld	a,(OFST+0,sp)
1974  063a cd0afc        	call	LC011
1975  063d c10000        	cp	a,_Conf_LED_Max_Brightness
1976  0640 2203cc06dd    	jrule	L146
1978                     ; 524                 Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
1980  0645 cc06d5        	jp	LC007
1981  0648               L365:
1982                     ; 530             if (Group == 0)                   //global command
1984  0648 7b06          	ld	a,(OFST+0,sp)
1985  064a 265a          	jrne	L516
1986                     ; 532               for (i=0;i<4;i++)
1988  064c 6b06          	ld	(OFST+0,sp),a
1990  064e               L716:
1991                     ; 534                 if (RF_RX_LED_GroupEnabled[i])
1993  064e cd0b0d        	call	LC014
1994  0651 2749          	jreq	L526
1995                     ; 536                   LED_Target_CW[i] += RF_MILIGHT_HOLD_STEP;
1997  0653 cd0aed        	call	LC008
1998  0656 cd0b1b        	call	LC016
1999  0659 7b06          	ld	a,(OFST+0,sp)
2000  065b 97            	ld	xl,a
2001  065c d60000        	ld	a,(_LED_Target_WW,x)
2002  065f cd0b22        	call	LC017
2003  0662 7b06          	ld	a,(OFST+0,sp)
2004  0664 97            	ld	xl,a
2005  0665 d60000        	ld	a,(_LED_Target_CW,x)
2006  0668 c10000        	cp	a,_Conf_LED_Max_Brightness
2007  066b 2308          	jrule	L726
2008                     ; 538                   if (LED_Target_CW[i] > Conf_LED_Max_Brightness) LED_Target_CW[i] = Conf_LED_Max_Brightness;
2010  066d 7b06          	ld	a,(OFST+0,sp)
2011  066f cd0aff        	call	LC012
2012  0672 d70000        	ld	(_LED_Target_CW,x),a
2013  0675               L726:
2014                     ; 539                   if (LED_Target_WW[i] > Conf_LED_Max_Brightness) LED_Target_WW[i] = Conf_LED_Max_Brightness;
2016  0675 7b06          	ld	a,(OFST+0,sp)
2017  0677 cd0af3        	call	LC009
2018  067a c10000        	cp	a,_Conf_LED_Max_Brightness
2019  067d 2308          	jrule	L136
2022  067f 7b06          	ld	a,(OFST+0,sp)
2023  0681 cd0aff        	call	LC012
2024  0684 d70000        	ld	(_LED_Target_WW,x),a
2025  0687               L136:
2026                     ; 540                   Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
2028  0687 7b06          	ld	a,(OFST+0,sp)
2029  0689 cd0af3        	call	LC009
2030  068c 88            	push	a
2031  068d 7b07          	ld	a,(OFST+1,sp)
2032  068f cd0aed        	call	LC008
2033  0692 97            	ld	xl,a
2034  0693 7b07          	ld	a,(OFST+1,sp)
2035  0695 ab65          	add	a,#101
2036  0697 95            	ld	xh,a
2037  0698 cd0000        	call	_Serial_Send_PWM_Bright
2039  069b 84            	pop	a
2040  069c               L526:
2041                     ; 532               for (i=0;i<4;i++)
2043  069c 0c06          	inc	(OFST+0,sp)
2047  069e 7b06          	ld	a,(OFST+0,sp)
2048  06a0 a104          	cp	a,#4
2049  06a2 25aa          	jrult	L716
2051  06a4 204c          	jra	L316
2052  06a6               L516:
2053                     ; 545               if (RF_RX_LED_GroupEnabled[Group-1])
2055  06a6 cd0b05        	call	LC013
2056  06a9 2747          	jreq	L316
2057                     ; 547                 LED_Target_CW[Group-1] += RF_MILIGHT_HOLD_STEP;
2059  06ab cd0af9        	call	LC010
2060  06ae cd0b1b        	call	LC016
2061  06b1 7b06          	ld	a,(OFST+0,sp)
2062  06b3 cd0b2f        	call	LC019
2063  06b6 cd0b22        	call	LC017
2064  06b9 7b06          	ld	a,(OFST+0,sp)
2065  06bb cd0b29        	call	LC018
2066  06be c10000        	cp	a,_Conf_LED_Max_Brightness
2067  06c1 2308          	jrule	L736
2068                     ; 549                 if (LED_Target_CW[Group-1] > Conf_LED_Max_Brightness) LED_Target_CW[Group-1] = Conf_LED_Max_Brightness;
2070  06c3 7b06          	ld	a,(OFST+0,sp)
2071  06c5 cd0b14        	call	LC015
2072  06c8 d70000        	ld	(_LED_Target_CW,x),a
2073  06cb               L736:
2074                     ; 550                 if (LED_Target_WW[Group-1] > Conf_LED_Max_Brightness) LED_Target_WW[Group-1] = Conf_LED_Max_Brightness;
2076  06cb 7b06          	ld	a,(OFST+0,sp)
2077  06cd cd0afc        	call	LC011
2078  06d0 c10000        	cp	a,_Conf_LED_Max_Brightness
2079  06d3 2308          	jrule	L146
2082  06d5               LC007:
2084  06d5 7b06          	ld	a,(OFST+0,sp)
2085  06d7 cd0b14        	call	LC015
2086  06da d70000        	ld	(_LED_Target_WW,x),a
2087  06dd               L146:
2088                     ; 551                 Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
2092  06dd 7b06          	ld	a,(OFST+0,sp)
2093  06df cd0afc        	call	LC011
2094  06e2 88            	push	a
2095  06e3 7b07          	ld	a,(OFST+1,sp)
2096  06e5 cd0af9        	call	LC010
2097  06e8 97            	ld	xl,a
2098  06e9 7b07          	ld	a,(OFST+1,sp)
2099  06eb ab64          	add	a,#100
2100  06ed 95            	ld	xh,a
2101  06ee cd0000        	call	_Serial_Send_PWM_Bright
2102  06f1 84            	pop	a
2103  06f2               L316:
2104                     ; 555           for (i=0;i<4;i++)                 //limit maximum
2106  06f2 4f            	clr	a
2107  06f3 6b06          	ld	(OFST+0,sp),a
2109  06f5               L346:
2110                     ; 557             if (LED_Target_CW[i] > Conf_LED_Max_Brightness) LED_Target_CW[i] = Conf_LED_Max_Brightness;
2112  06f5 cd0aed        	call	LC008
2113  06f8 c10000        	cp	a,_Conf_LED_Max_Brightness
2114  06fb 2308          	jrule	L156
2117  06fd 7b06          	ld	a,(OFST+0,sp)
2118  06ff cd0aff        	call	LC012
2119  0702 d70000        	ld	(_LED_Target_CW,x),a
2120  0705               L156:
2121                     ; 558             if (LED_Target_WW[i] > Conf_LED_Max_Brightness) LED_Target_WW[i] = Conf_LED_Max_Brightness;
2123  0705 7b06          	ld	a,(OFST+0,sp)
2124  0707 cd0af3        	call	LC009
2125  070a c10000        	cp	a,_Conf_LED_Max_Brightness
2126  070d 2308          	jrule	L356
2129  070f 7b06          	ld	a,(OFST+0,sp)
2130  0711 cd0aff        	call	LC012
2131  0714 d70000        	ld	(_LED_Target_WW,x),a
2132  0717               L356:
2133                     ; 555           for (i=0;i<4;i++)                 //limit maximum
2135  0717 0c06          	inc	(OFST+0,sp)
2139  0719 7b06          	ld	a,(OFST+0,sp)
2140  071b a104          	cp	a,#4
2141  071d 25d6          	jrult	L346
2143  071f cc0ae4        	jra	L5311
2144  0722               L165:
2145                     ; 566         else if (Command == 0x04)
2147  0722 a104          	cp	a,#4
2148  0724 2703cc0838    	jrne	L756
2149                     ; 568           RF_RX_MI_FirstPress = FALSE;
2151  0729 725f0036      	clr	_RF_RX_MI_FirstPress
2152                     ; 569           if (!KeyHold)                     // single press
2154  072d 7b04          	ld	a,(OFST-2,sp)
2155  072f 2677          	jrne	L166
2156                     ; 571             if (Group == 0)                 //global command
2158  0731 7b06          	ld	a,(OFST+0,sp)
2159  0733 2647          	jrne	L366
2160                     ; 573               for (i=0;i<4;i++)
2162  0735 6b06          	ld	(OFST+0,sp),a
2164  0737               L566:
2165                     ; 575                 if (RF_RX_LED_GroupEnabled[i])
2167  0737 cd0b0d        	call	LC014
2168  073a 2735          	jreq	L376
2169                     ; 577                   if (LED_Target_CW[i] > 2)   LED_Target_CW[i]--;
2171  073c cd0aed        	call	LC008
2172  073f a103          	cp	a,#3
2173  0741 2508          	jrult	L576
2176  0743 7b06          	ld	a,(OFST+0,sp)
2177  0745 5f            	clrw	x
2178  0746 97            	ld	xl,a
2179  0747 724a0000      	dec	(_LED_Target_CW,x)
2180  074b               L576:
2181                     ; 578                   if (LED_Target_WW[i] > 2)   LED_Target_WW[i]--;
2183  074b 7b06          	ld	a,(OFST+0,sp)
2184  074d cd0af3        	call	LC009
2185  0750 a103          	cp	a,#3
2186  0752 2508          	jrult	L776
2189  0754 7b06          	ld	a,(OFST+0,sp)
2190  0756 5f            	clrw	x
2191  0757 97            	ld	xl,a
2192  0758 724a0000      	dec	(_LED_Target_WW,x)
2193  075c               L776:
2194                     ; 579                   Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
2196  075c 7b06          	ld	a,(OFST+0,sp)
2197  075e cd0af3        	call	LC009
2198  0761 88            	push	a
2199  0762 7b07          	ld	a,(OFST+1,sp)
2200  0764 cd0aed        	call	LC008
2201  0767 97            	ld	xl,a
2202  0768 7b07          	ld	a,(OFST+1,sp)
2203  076a ab65          	add	a,#101
2204  076c 95            	ld	xh,a
2205  076d cd0000        	call	_Serial_Send_PWM_Bright
2207  0770 84            	pop	a
2208  0771               L376:
2209                     ; 573               for (i=0;i<4;i++)
2211  0771 0c06          	inc	(OFST+0,sp)
2215  0773 7b06          	ld	a,(OFST+0,sp)
2216  0775 a104          	cp	a,#4
2217  0777 25be          	jrult	L566
2219  0779 cc0ae4        	jra	L5311
2220  077c               L366:
2221                     ; 584               if (RF_RX_LED_GroupEnabled[Group-1])
2223  077c cd0b05        	call	LC013
2224  077f 27f8          	jreq	L5311
2225                     ; 586                 if (LED_Target_CW[Group-1] > 2)   LED_Target_CW[Group-1]--;
2227  0781 cd0af9        	call	LC010
2228  0784 a103          	cp	a,#3
2229  0786 2509          	jrult	L507
2232  0788 7b06          	ld	a,(OFST+0,sp)
2233  078a 5f            	clrw	x
2234  078b 97            	ld	xl,a
2235  078c 5a            	decw	x
2236  078d 724a0000      	dec	(_LED_Target_CW,x)
2237  0791               L507:
2238                     ; 587                 if (LED_Target_CW[Group-1] > 2)   LED_Target_WW[Group-1]--;
2240  0791 7b06          	ld	a,(OFST+0,sp)
2241  0793 cd0af9        	call	LC010
2242  0796 a103          	cp	a,#3
2243  0798 2403cc0820    	jrult	L737
2246  079d 7b06          	ld	a,(OFST+0,sp)
2247  079f 5f            	clrw	x
2248  07a0 97            	ld	xl,a
2249  07a1 5a            	decw	x
2250  07a2 724a0000      	dec	(_LED_Target_WW,x)
2251                     ; 588                 Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
2253  07a6 2078          	jp	L737
2254  07a8               L166:
2255                     ; 594             if (Group == 0)                   //global command
2257  07a8 7b06          	ld	a,(OFST+0,sp)
2258  07aa 264b          	jrne	L317
2259                     ; 596               for (i=0;i<4;i++)
2261  07ac 6b06          	ld	(OFST+0,sp),a
2263  07ae               L517:
2264                     ; 598                 if (RF_RX_LED_GroupEnabled[i])
2266  07ae cd0b0d        	call	LC014
2267  07b1 2739          	jreq	L327
2268                     ; 600                   if (LED_Target_CW[i] > (2+RF_MILIGHT_HOLD_STEP))   LED_Target_CW[i] -= RF_MILIGHT_HOLD_STEP;
2270  07b3 cd0aed        	call	LC008
2271  07b6 a108          	cp	a,#8
2272  07b8 250a          	jrult	L527
2275  07ba 7b06          	ld	a,(OFST+0,sp)
2276  07bc cd0aed        	call	LC008
2277  07bf a005          	sub	a,#5
2278  07c1 d70000        	ld	(_LED_Target_CW,x),a
2279  07c4               L527:
2280                     ; 601                   if (LED_Target_WW[i] > (2+RF_MILIGHT_HOLD_STEP))   LED_Target_WW[i] -= RF_MILIGHT_HOLD_STEP;                  
2282  07c4 7b06          	ld	a,(OFST+0,sp)
2283  07c6 cd0af3        	call	LC009
2284  07c9 a108          	cp	a,#8
2285  07cb 250a          	jrult	L727
2288  07cd 7b06          	ld	a,(OFST+0,sp)
2289  07cf cd0af3        	call	LC009
2290  07d2 a005          	sub	a,#5
2291  07d4 d70000        	ld	(_LED_Target_WW,x),a
2292  07d7               L727:
2293                     ; 602                   Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
2295  07d7 7b06          	ld	a,(OFST+0,sp)
2296  07d9 cd0af3        	call	LC009
2297  07dc 88            	push	a
2298  07dd 7b07          	ld	a,(OFST+1,sp)
2299  07df cd0aed        	call	LC008
2300  07e2 97            	ld	xl,a
2301  07e3 7b07          	ld	a,(OFST+1,sp)
2302  07e5 ab65          	add	a,#101
2303  07e7 95            	ld	xh,a
2304  07e8 cd0000        	call	_Serial_Send_PWM_Bright
2306  07eb 84            	pop	a
2307  07ec               L327:
2308                     ; 596               for (i=0;i<4;i++)
2310  07ec 0c06          	inc	(OFST+0,sp)
2314  07ee 7b06          	ld	a,(OFST+0,sp)
2315  07f0 a104          	cp	a,#4
2316  07f2 25ba          	jrult	L517
2318  07f4 cc0ae4        	jra	L5311
2319  07f7               L317:
2320                     ; 607               if (RF_RX_LED_GroupEnabled[Group-1])
2322  07f7 cd0b05        	call	LC013
2323  07fa 27f8          	jreq	L5311
2324                     ; 609                 if (LED_Target_CW[Group-1] > (2+RF_MILIGHT_HOLD_STEP))  LED_Target_CW[Group-1] -= RF_MILIGHT_HOLD_STEP;
2326  07fc cd0af9        	call	LC010
2327  07ff a108          	cp	a,#8
2328  0801 250a          	jrult	L537
2331  0803 7b06          	ld	a,(OFST+0,sp)
2332  0805 cd0af9        	call	LC010
2333  0808 a005          	sub	a,#5
2334  080a d70000        	ld	(_LED_Target_CW,x),a
2335  080d               L537:
2336                     ; 610                 if (LED_Target_WW[Group-1] > (2+RF_MILIGHT_HOLD_STEP))  LED_Target_WW[Group-1] -= RF_MILIGHT_HOLD_STEP;
2338  080d 7b06          	ld	a,(OFST+0,sp)
2339  080f cd0afc        	call	LC011
2340  0812 a108          	cp	a,#8
2341  0814 250a          	jrult	L737
2344  0816 7b06          	ld	a,(OFST+0,sp)
2345  0818 cd0afc        	call	LC011
2346  081b a005          	sub	a,#5
2347  081d d70000        	ld	(_LED_Target_WW,x),a
2348  0820               L737:
2349                     ; 611                 Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
2353  0820 7b06          	ld	a,(OFST+0,sp)
2354  0822 cd0afc        	call	LC011
2355  0825 88            	push	a
2356  0826 7b07          	ld	a,(OFST+1,sp)
2357  0828 cd0af9        	call	LC010
2358  082b 97            	ld	xl,a
2359  082c 7b07          	ld	a,(OFST+1,sp)
2360  082e ab64          	add	a,#100
2361  0830 95            	ld	xh,a
2362  0831 cd0000        	call	_Serial_Send_PWM_Bright
2363  0834 84            	pop	a
2364  0835 cc0ae4        	jra	L5311
2365  0838               L756:
2366                     ; 622         else if (Command == 0x0E)
2368  0838 a10e          	cp	a,#14
2369  083a 2703cc098c    	jrne	L347
2370                     ; 624           RF_RX_MI_FirstPress = FALSE;
2372  083f 725f0036      	clr	_RF_RX_MI_FirstPress
2373                     ; 625           if (!KeyHold)                     // single press
2375  0843 7b04          	ld	a,(OFST-2,sp)
2376  0845 267a          	jrne	L547
2377                     ; 627             if (Group == 0)                 //global command
2379  0847 7b06          	ld	a,(OFST+0,sp)
2380  0849 2648          	jrne	L747
2381                     ; 629               for (i=0;i<4;i++)
2383  084b 6b06          	ld	(OFST+0,sp),a
2385  084d               L157:
2386                     ; 631                 if (RF_RX_LED_GroupEnabled[i])
2388  084d cd0b0d        	call	LC014
2389  0850 2736          	jreq	L757
2390                     ; 633                   if (LED_Target_CW[i] > 2) LED_Target_CW[i]--;
2392  0852 cd0aed        	call	LC008
2393  0855 a103          	cp	a,#3
2394  0857 2508          	jrult	L167
2397  0859 7b06          	ld	a,(OFST+0,sp)
2398  085b 5f            	clrw	x
2399  085c 97            	ld	xl,a
2400  085d 724a0000      	dec	(_LED_Target_CW,x)
2401  0861               L167:
2402                     ; 634                   if (LED_Target_WW[i] < Conf_LED_Max_Brightness) LED_Target_WW[i]++;
2404  0861 7b06          	ld	a,(OFST+0,sp)
2405  0863 cd0af3        	call	LC009
2406  0866 c10000        	cp	a,_Conf_LED_Max_Brightness
2407  0869 2408          	jruge	L367
2410  086b 7b06          	ld	a,(OFST+0,sp)
2411  086d 5f            	clrw	x
2412  086e 97            	ld	xl,a
2413  086f 724c0000      	inc	(_LED_Target_WW,x)
2414  0873               L367:
2415                     ; 635                   Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
2417  0873 7b06          	ld	a,(OFST+0,sp)
2418  0875 cd0af3        	call	LC009
2419  0878 88            	push	a
2420  0879 7b07          	ld	a,(OFST+1,sp)
2421  087b cd0aed        	call	LC008
2422  087e 97            	ld	xl,a
2423  087f 7b07          	ld	a,(OFST+1,sp)
2424  0881 ab65          	add	a,#101
2425  0883 95            	ld	xh,a
2426  0884 cd0000        	call	_Serial_Send_PWM_Bright
2428  0887 84            	pop	a
2429  0888               L757:
2430                     ; 629               for (i=0;i<4;i++)
2432  0888 0c06          	inc	(OFST+0,sp)
2436  088a 7b06          	ld	a,(OFST+0,sp)
2437  088c a104          	cp	a,#4
2438  088e 25bd          	jrult	L157
2440  0890 cc095c        	jra	L577
2441  0893               L747:
2442                     ; 640               if (RF_RX_LED_GroupEnabled[Group-1])
2444  0893 cd0b05        	call	LC013
2445  0896 27f8          	jreq	L577
2446                     ; 642                 if (LED_Target_CW[Group-1] > 2) LED_Target_CW[Group-1]--;
2448  0898 cd0af9        	call	LC010
2449  089b a103          	cp	a,#3
2450  089d 2509          	jrult	L177
2453  089f 7b06          	ld	a,(OFST+0,sp)
2454  08a1 5f            	clrw	x
2455  08a2 97            	ld	xl,a
2456  08a3 5a            	decw	x
2457  08a4 724a0000      	dec	(_LED_Target_CW,x)
2458  08a8               L177:
2459                     ; 643                 if (LED_Target_WW[Group-1] < Conf_LED_Max_Brightness) LED_Target_WW[Group-1]++;
2461  08a8 7b06          	ld	a,(OFST+0,sp)
2462  08aa cd0afc        	call	LC011
2463  08ad c10000        	cp	a,_Conf_LED_Max_Brightness
2464  08b0 2503cc0947    	jruge	L3201
2467  08b5 7b06          	ld	a,(OFST+0,sp)
2468  08b7 5f            	clrw	x
2469  08b8 97            	ld	xl,a
2470  08b9 5a            	decw	x
2471  08ba 724c0000      	inc	(_LED_Target_WW,x)
2472                     ; 644                 Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
2474  08be cc0947        	jp	L3201
2475  08c1               L547:
2476                     ; 650             if (Group == 0)                   //global command
2478  08c1 7b06          	ld	a,(OFST+0,sp)
2479  08c3 2652          	jrne	L777
2480                     ; 652               for (i=0;i<4;i++)
2482  08c5 6b06          	ld	(OFST+0,sp),a
2484  08c7               L1001:
2485                     ; 654                 if (RF_RX_LED_GroupEnabled[i])
2487  08c7 cd0b0d        	call	LC014
2488  08ca 2741          	jreq	L7001
2489                     ; 656                   if (LED_Target_CW[i] > (2+RF_MILIGHT_HOLD_STEP)) LED_Target_CW[i] -= RF_MILIGHT_HOLD_STEP;
2491  08cc cd0aed        	call	LC008
2492  08cf a108          	cp	a,#8
2493  08d1 250a          	jrult	L1101
2496  08d3 7b06          	ld	a,(OFST+0,sp)
2497  08d5 cd0aed        	call	LC008
2498  08d8 a005          	sub	a,#5
2499  08da d70000        	ld	(_LED_Target_CW,x),a
2500  08dd               L1101:
2501                     ; 657                   LED_Target_WW[i] += RF_MILIGHT_HOLD_STEP;
2503  08dd 7b06          	ld	a,(OFST+0,sp)
2504  08df cd0af3        	call	LC009
2505  08e2 cd0b22        	call	LC017
2506  08e5 7b06          	ld	a,(OFST+0,sp)
2507  08e7 97            	ld	xl,a
2508  08e8 d60000        	ld	a,(_LED_Target_WW,x)
2509  08eb c10000        	cp	a,_Conf_LED_Max_Brightness
2510  08ee 2308          	jrule	L3101
2511                     ; 658                   if (LED_Target_WW[i] > Conf_LED_Max_Brightness) LED_Target_WW[i] = Conf_LED_Max_Brightness;
2513  08f0 7b06          	ld	a,(OFST+0,sp)
2514  08f2 cd0aff        	call	LC012
2515  08f5 d70000        	ld	(_LED_Target_WW,x),a
2516  08f8               L3101:
2517                     ; 659                   Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
2519  08f8 7b06          	ld	a,(OFST+0,sp)
2520  08fa cd0af3        	call	LC009
2521  08fd 88            	push	a
2522  08fe 7b07          	ld	a,(OFST+1,sp)
2523  0900 cd0aed        	call	LC008
2524  0903 97            	ld	xl,a
2525  0904 7b07          	ld	a,(OFST+1,sp)
2526  0906 ab65          	add	a,#101
2527  0908 95            	ld	xh,a
2528  0909 cd0000        	call	_Serial_Send_PWM_Bright
2530  090c 84            	pop	a
2531  090d               L7001:
2532                     ; 652               for (i=0;i<4;i++)
2534  090d 0c06          	inc	(OFST+0,sp)
2538  090f 7b06          	ld	a,(OFST+0,sp)
2539  0911 a104          	cp	a,#4
2540  0913 25b2          	jrult	L1001
2542  0915 2045          	jra	L577
2543  0917               L777:
2544                     ; 665               if (RF_RX_LED_GroupEnabled[Group-1])
2546  0917 cd0b05        	call	LC013
2547  091a 2740          	jreq	L577
2548                     ; 667                 if (LED_Target_CW[Group-1] > (2+RF_MILIGHT_HOLD_STEP))  LED_Target_CW[Group-1] -= RF_MILIGHT_HOLD_STEP;
2550  091c cd0af9        	call	LC010
2551  091f a108          	cp	a,#8
2552  0921 250a          	jrult	L1201
2555  0923 7b06          	ld	a,(OFST+0,sp)
2556  0925 cd0af9        	call	LC010
2557  0928 a005          	sub	a,#5
2558  092a d70000        	ld	(_LED_Target_CW,x),a
2559  092d               L1201:
2560                     ; 668                 LED_Target_WW[Group-1] += RF_MILIGHT_HOLD_STEP;
2562  092d 7b06          	ld	a,(OFST+0,sp)
2563  092f cd0afc        	call	LC011
2564  0932 cd0b22        	call	LC017
2565  0935 7b06          	ld	a,(OFST+0,sp)
2566  0937 cd0b2f        	call	LC019
2567  093a c10000        	cp	a,_Conf_LED_Max_Brightness
2568  093d 2308          	jrule	L3201
2569                     ; 669                 if (LED_Target_WW[Group-1] > Conf_LED_Max_Brightness) LED_Target_WW[Group-1] = Conf_LED_Max_Brightness;
2571  093f 7b06          	ld	a,(OFST+0,sp)
2572  0941 cd0b14        	call	LC015
2573  0944 d70000        	ld	(_LED_Target_WW,x),a
2574  0947               L3201:
2575                     ; 670                 Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
2579  0947 7b06          	ld	a,(OFST+0,sp)
2580  0949 cd0afc        	call	LC011
2581  094c 88            	push	a
2582  094d 7b07          	ld	a,(OFST+1,sp)
2583  094f cd0af9        	call	LC010
2584  0952 97            	ld	xl,a
2585  0953 7b07          	ld	a,(OFST+1,sp)
2586  0955 ab64          	add	a,#100
2587  0957 95            	ld	xh,a
2588  0958 cd0000        	call	_Serial_Send_PWM_Bright
2589  095b 84            	pop	a
2590  095c               L577:
2591                     ; 674           for (i=0;i<4;i++)                 //limit maximum
2593  095c 4f            	clr	a
2594  095d 6b06          	ld	(OFST+0,sp),a
2596  095f               L5201:
2597                     ; 676             if (LED_Target_CW[i] > Conf_LED_Max_Brightness) LED_Target_CW[i] = Conf_LED_Max_Brightness;
2599  095f cd0aed        	call	LC008
2600  0962 c10000        	cp	a,_Conf_LED_Max_Brightness
2601  0965 2308          	jrule	L3301
2604  0967 7b06          	ld	a,(OFST+0,sp)
2605  0969 cd0aff        	call	LC012
2606  096c d70000        	ld	(_LED_Target_CW,x),a
2607  096f               L3301:
2608                     ; 677             if (LED_Target_WW[i] > Conf_LED_Max_Brightness) LED_Target_WW[i] = Conf_LED_Max_Brightness;
2610  096f 7b06          	ld	a,(OFST+0,sp)
2611  0971 cd0af3        	call	LC009
2612  0974 c10000        	cp	a,_Conf_LED_Max_Brightness
2613  0977 2308          	jrule	L5301
2616  0979 7b06          	ld	a,(OFST+0,sp)
2617  097b cd0aff        	call	LC012
2618  097e d70000        	ld	(_LED_Target_WW,x),a
2619  0981               L5301:
2620                     ; 674           for (i=0;i<4;i++)                 //limit maximum
2622  0981 0c06          	inc	(OFST+0,sp)
2626  0983 7b06          	ld	a,(OFST+0,sp)
2627  0985 a104          	cp	a,#4
2628  0987 25d6          	jrult	L5201
2630  0989 cc0ae4        	jra	L5311
2631  098c               L347:
2632                     ; 686         else if (Command == 0x0F)
2634  098c a10f          	cp	a,#15
2635  098e 26f9          	jrne	L5311
2636                     ; 688           RF_RX_MI_FirstPress = FALSE;
2638  0990 725f0036      	clr	_RF_RX_MI_FirstPress
2639                     ; 689           if (!KeyHold)                     // single press
2641  0994 7b04          	ld	a,(OFST-2,sp)
2642  0996 2703cc0a21    	jrne	L3401
2643                     ; 691             if (Group == 0)                 //global command
2645  099b 7b06          	ld	a,(OFST+0,sp)
2646  099d 264e          	jrne	L5401
2647                     ; 693               for (i=0;i<4;i++)
2649  099f 6b06          	ld	(OFST+0,sp),a
2651  09a1               L7401:
2652                     ; 695                 if (RF_RX_LED_GroupEnabled[i])
2654  09a1 cd0b0d        	call	LC014
2655  09a4 273c          	jreq	L5501
2656                     ; 697                   LED_Target_CW[i]++;
2658  09a6 5f            	clrw	x
2659  09a7 97            	ld	xl,a
2660  09a8 724c0000      	inc	(_LED_Target_CW,x)
2661                     ; 698                   if (LED_Target_CW[i] > Conf_LED_Max_Brightness) LED_Target_CW[i] = Conf_LED_Max_Brightness;
2663  09ac cd0aed        	call	LC008
2664  09af c10000        	cp	a,_Conf_LED_Max_Brightness
2665  09b2 2308          	jrule	L7501
2668  09b4 7b06          	ld	a,(OFST+0,sp)
2669  09b6 cd0aff        	call	LC012
2670  09b9 d70000        	ld	(_LED_Target_CW,x),a
2671  09bc               L7501:
2672                     ; 699                   if (LED_Target_WW[i] > 2) LED_Target_WW[i]--;
2674  09bc 7b06          	ld	a,(OFST+0,sp)
2675  09be cd0af3        	call	LC009
2676  09c1 a103          	cp	a,#3
2677  09c3 2508          	jrult	L1601
2680  09c5 7b06          	ld	a,(OFST+0,sp)
2681  09c7 5f            	clrw	x
2682  09c8 97            	ld	xl,a
2683  09c9 724a0000      	dec	(_LED_Target_WW,x)
2684  09cd               L1601:
2685                     ; 700                   Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
2687  09cd 7b06          	ld	a,(OFST+0,sp)
2688  09cf cd0af3        	call	LC009
2689  09d2 88            	push	a
2690  09d3 7b07          	ld	a,(OFST+1,sp)
2691  09d5 cd0aed        	call	LC008
2692  09d8 97            	ld	xl,a
2693  09d9 7b07          	ld	a,(OFST+1,sp)
2694  09db ab65          	add	a,#101
2695  09dd 95            	ld	xh,a
2696  09de cd0000        	call	_Serial_Send_PWM_Bright
2698  09e1 84            	pop	a
2699  09e2               L5501:
2700                     ; 693               for (i=0;i<4;i++)
2702  09e2 0c06          	inc	(OFST+0,sp)
2706  09e4 7b06          	ld	a,(OFST+0,sp)
2707  09e6 a104          	cp	a,#4
2708  09e8 25b7          	jrult	L7401
2710  09ea cc0ab7        	jra	L3701
2711  09ed               L5401:
2712                     ; 705               if (RF_RX_LED_GroupEnabled[Group-1])
2714  09ed cd0b05        	call	LC013
2715  09f0 27f8          	jreq	L3701
2716                     ; 707                 LED_Target_CW[Group-1]++;
2718  09f2 5f            	clrw	x
2719  09f3 97            	ld	xl,a
2720  09f4 5a            	decw	x
2721  09f5 724c0000      	inc	(_LED_Target_CW,x)
2722                     ; 708                 if (LED_Target_CW[Group-1] > Conf_LED_Max_Brightness) LED_Target_CW[Group-1] = Conf_LED_Max_Brightness;
2724  09f9 cd0af9        	call	LC010
2725  09fc c10000        	cp	a,_Conf_LED_Max_Brightness
2726  09ff 2308          	jrule	L7601
2729  0a01 7b06          	ld	a,(OFST+0,sp)
2730  0a03 cd0b14        	call	LC015
2731  0a06 d70000        	ld	(_LED_Target_CW,x),a
2732  0a09               L7601:
2733                     ; 709                 if (LED_Target_CW[Group-1] > 2) LED_Target_WW[Group-1]--;
2735  0a09 7b06          	ld	a,(OFST+0,sp)
2736  0a0b cd0af9        	call	LC010
2737  0a0e a103          	cp	a,#3
2738  0a10 2403cc0aa4    	jrult	L1211
2741  0a15 7b06          	ld	a,(OFST+0,sp)
2742  0a17 5f            	clrw	x
2743  0a18 97            	ld	xl,a
2744  0a19 5a            	decw	x
2745  0a1a 724a0000      	dec	(_LED_Target_WW,x)
2746                     ; 710                 Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
2748  0a1e cc0aa4        	jp	L1211
2749  0a21               L3401:
2750                     ; 716             if (Group == 0)                   //global command
2752  0a21 7b06          	ld	a,(OFST+0,sp)
2753  0a23 2652          	jrne	L5701
2754                     ; 718               for (i=0;i<4;i++)
2756  0a25 6b06          	ld	(OFST+0,sp),a
2758  0a27               L7701:
2759                     ; 720                 if (RF_RX_LED_GroupEnabled[i])
2761  0a27 cd0b0d        	call	LC014
2762  0a2a 2741          	jreq	L5011
2763                     ; 722                   LED_Target_CW[i] += RF_MILIGHT_HOLD_STEP;
2765  0a2c cd0aed        	call	LC008
2766  0a2f cd0b1b        	call	LC016
2767  0a32 7b06          	ld	a,(OFST+0,sp)
2768  0a34 97            	ld	xl,a
2769  0a35 d60000        	ld	a,(_LED_Target_CW,x)
2770  0a38 c10000        	cp	a,_Conf_LED_Max_Brightness
2771  0a3b 2308          	jrule	L7011
2772                     ; 723                   if (LED_Target_CW[i] > Conf_LED_Max_Brightness) LED_Target_CW[i] = Conf_LED_Max_Brightness;
2774  0a3d 7b06          	ld	a,(OFST+0,sp)
2775  0a3f cd0aff        	call	LC012
2776  0a42 d70000        	ld	(_LED_Target_CW,x),a
2777  0a45               L7011:
2778                     ; 724                   if (LED_Target_WW[i] > (2+RF_MILIGHT_HOLD_STEP))  LED_Target_WW[i] -= RF_MILIGHT_HOLD_STEP;
2780  0a45 7b06          	ld	a,(OFST+0,sp)
2781  0a47 cd0af3        	call	LC009
2782  0a4a a108          	cp	a,#8
2783  0a4c 250a          	jrult	L1111
2786  0a4e 7b06          	ld	a,(OFST+0,sp)
2787  0a50 cd0af3        	call	LC009
2788  0a53 a005          	sub	a,#5
2789  0a55 d70000        	ld	(_LED_Target_WW,x),a
2790  0a58               L1111:
2791                     ; 725                   Serial_Send_PWM_Bright((101+i),LED_Target_CW[i],LED_Target_WW[i]);
2793  0a58 7b06          	ld	a,(OFST+0,sp)
2794  0a5a cd0af3        	call	LC009
2795  0a5d 88            	push	a
2796  0a5e 7b07          	ld	a,(OFST+1,sp)
2797  0a60 cd0aed        	call	LC008
2798  0a63 97            	ld	xl,a
2799  0a64 7b07          	ld	a,(OFST+1,sp)
2800  0a66 ab65          	add	a,#101
2801  0a68 95            	ld	xh,a
2802  0a69 cd0000        	call	_Serial_Send_PWM_Bright
2804  0a6c 84            	pop	a
2805  0a6d               L5011:
2806                     ; 718               for (i=0;i<4;i++)
2808  0a6d 0c06          	inc	(OFST+0,sp)
2812  0a6f 7b06          	ld	a,(OFST+0,sp)
2813  0a71 a104          	cp	a,#4
2814  0a73 25b2          	jrult	L7701
2816  0a75 2040          	jra	L3701
2817  0a77               L5701:
2818                     ; 730               if (RF_RX_LED_GroupEnabled[Group-1])
2820  0a77 cd0b05        	call	LC013
2821  0a7a 273b          	jreq	L3701
2822                     ; 732                 LED_Target_CW[Group-1] += RF_MILIGHT_HOLD_STEP;
2824  0a7c ad7b          	call	LC010
2825  0a7e cd0b1b        	call	LC016
2826  0a81 7b06          	ld	a,(OFST+0,sp)
2827  0a83 cd0b29        	call	LC018
2828  0a86 c10000        	cp	a,_Conf_LED_Max_Brightness
2829  0a89 2308          	jrule	L7111
2830                     ; 733                 if (LED_Target_CW[Group-1] > Conf_LED_Max_Brightness) LED_Target_CW[Group-1] = Conf_LED_Max_Brightness;
2832  0a8b 7b06          	ld	a,(OFST+0,sp)
2833  0a8d cd0b14        	call	LC015
2834  0a90 d70000        	ld	(_LED_Target_CW,x),a
2835  0a93               L7111:
2836                     ; 734                 if (LED_Target_WW[Group-1] > (2+RF_MILIGHT_HOLD_STEP))  LED_Target_WW[Group-1] -= RF_MILIGHT_HOLD_STEP;
2838  0a93 7b06          	ld	a,(OFST+0,sp)
2839  0a95 ad65          	call	LC011
2840  0a97 a108          	cp	a,#8
2841  0a99 2509          	jrult	L1211
2844  0a9b 7b06          	ld	a,(OFST+0,sp)
2845  0a9d ad5d          	call	LC011
2846  0a9f a005          	sub	a,#5
2847  0aa1 d70000        	ld	(_LED_Target_WW,x),a
2848  0aa4               L1211:
2849                     ; 735                 Serial_Send_PWM_Bright((100+Group),LED_Target_CW[Group-1],LED_Target_WW[Group-1]);
2853  0aa4 7b06          	ld	a,(OFST+0,sp)
2854  0aa6 ad54          	call	LC011
2855  0aa8 88            	push	a
2856  0aa9 7b07          	ld	a,(OFST+1,sp)
2857  0aab ad4c          	call	LC010
2858  0aad 97            	ld	xl,a
2859  0aae 7b07          	ld	a,(OFST+1,sp)
2860  0ab0 ab64          	add	a,#100
2861  0ab2 95            	ld	xh,a
2862  0ab3 cd0000        	call	_Serial_Send_PWM_Bright
2863  0ab6 84            	pop	a
2864  0ab7               L3701:
2865                     ; 739           for (i=0;i<4;i++)                 //limit maximum
2867  0ab7 4f            	clr	a
2868  0ab8 6b06          	ld	(OFST+0,sp),a
2870  0aba               L3211:
2871                     ; 741             if (LED_Target_CW[i] > Conf_LED_Max_Brightness) LED_Target_CW[i] = Conf_LED_Max_Brightness;
2873  0aba ad31          	call	LC008
2874  0abc c10000        	cp	a,_Conf_LED_Max_Brightness
2875  0abf 2307          	jrule	L1311
2878  0ac1 7b06          	ld	a,(OFST+0,sp)
2879  0ac3 ad3a          	call	LC012
2880  0ac5 d70000        	ld	(_LED_Target_CW,x),a
2881  0ac8               L1311:
2882                     ; 742             if (LED_Target_WW[i] > Conf_LED_Max_Brightness) LED_Target_WW[i] = Conf_LED_Max_Brightness;
2884  0ac8 7b06          	ld	a,(OFST+0,sp)
2885  0aca ad27          	call	LC009
2886  0acc c10000        	cp	a,_Conf_LED_Max_Brightness
2887  0acf 2307          	jrule	L3311
2890  0ad1 7b06          	ld	a,(OFST+0,sp)
2891  0ad3 ad2a          	call	LC012
2892  0ad5 d70000        	ld	(_LED_Target_WW,x),a
2893  0ad8               L3311:
2894                     ; 739           for (i=0;i<4;i++)                 //limit maximum
2896  0ad8 0c06          	inc	(OFST+0,sp)
2900  0ada 7b06          	ld	a,(OFST+0,sp)
2901  0adc a104          	cp	a,#4
2902  0ade 25da          	jrult	L3211
2903  0ae0 2002          	jra	L5311
2904  0ae2               L723:
2905                     ; 748   else Valid = FALSE;
2907  0ae2 0f03          	clr	(OFST-3,sp)
2909  0ae4               L5311:
2910                     ; 749   ClrBit(Main_State, MAINSTATE_RFRX);
2912  0ae4 72190000      	bres	_Main_State,#4
2913                     ; 750   return Valid;
2915  0ae8 7b03          	ld	a,(OFST-3,sp)
2918  0aea 5b08          	addw	sp,#8
2919  0aec 81            	ret	
2920  0aed               LC008:
2921  0aed 5f            	clrw	x
2922  0aee 97            	ld	xl,a
2923  0aef d60000        	ld	a,(_LED_Target_CW,x)
2924  0af2 81            	ret	
2925  0af3               LC009:
2926  0af3 5f            	clrw	x
2927  0af4 97            	ld	xl,a
2928  0af5 d60000        	ld	a,(_LED_Target_WW,x)
2929  0af8 81            	ret	
2930  0af9               LC010:
2931  0af9 5f            	clrw	x
2932  0afa 202d          	jp	LC018
2933  0afc               LC011:
2934  0afc 5f            	clrw	x
2935  0afd 2030          	jp	LC019
2936  0aff               LC012:
2937  0aff 5f            	clrw	x
2938  0b00 97            	ld	xl,a
2939  0b01 c60000        	ld	a,_Conf_LED_Max_Brightness
2940  0b04 81            	ret	
2941  0b05               LC013:
2942  0b05 5f            	clrw	x
2943  0b06 97            	ld	xl,a
2944  0b07 5a            	decw	x
2945  0b08 724d0028      	tnz	(_RF_RX_LED_GroupEnabled,x)
2946  0b0c 81            	ret	
2947  0b0d               LC014:
2948  0b0d 5f            	clrw	x
2949  0b0e 97            	ld	xl,a
2950  0b0f 724d0028      	tnz	(_RF_RX_LED_GroupEnabled,x)
2951  0b13 81            	ret	
2952  0b14               LC015:
2953  0b14 5f            	clrw	x
2954  0b15 97            	ld	xl,a
2955  0b16 5a            	decw	x
2956  0b17 c60000        	ld	a,_Conf_LED_Max_Brightness
2957  0b1a 81            	ret	
2958  0b1b               LC016:
2959  0b1b ab05          	add	a,#5
2960  0b1d d70000        	ld	(_LED_Target_CW,x),a
2961                     ; 733                 if (LED_Target_CW[Group-1] > Conf_LED_Max_Brightness) LED_Target_CW[Group-1] = Conf_LED_Max_Brightness;
2963  0b20 5f            	clrw	x
2964  0b21 81            	ret	
2965  0b22               LC017:
2966  0b22 ab05          	add	a,#5
2967  0b24 d70000        	ld	(_LED_Target_WW,x),a
2968                     ; 669                 if (LED_Target_WW[Group-1] > Conf_LED_Max_Brightness) LED_Target_WW[Group-1] = Conf_LED_Max_Brightness;
2970  0b27 5f            	clrw	x
2971  0b28 81            	ret	
2972  0b29               LC018:
2973  0b29 97            	ld	xl,a
2974  0b2a 5a            	decw	x
2975  0b2b d60000        	ld	a,(_LED_Target_CW,x)
2976  0b2e 81            	ret	
2977  0b2f               LC019:
2978  0b2f 97            	ld	xl,a
2979  0b30 5a            	decw	x
2980  0b31 d60000        	ld	a,(_LED_Target_WW,x)
2981  0b34 81            	ret	
3026                     .const:	section	.text
3027  0000               L432:
3028  0000 0000ea60      	dc.l	60000
3029                     ; 754 bool RF_RX_MI_ChkAddress(uint16_t MI_Address, uint8_t MI_Command)
3029                     ; 755 {
3030                     	switch	.text
3031  0b35               _RF_RX_MI_ChkAddress:
3033  0b35 89            	pushw	x
3034       00000000      OFST:	set	0
3037                     ; 757   if (MI_Address == RF_RX_MI_ValidAddress) return TRUE;
3039  0b36 c30038        	cpw	x,_RF_RX_MI_ValidAddress
3040  0b39 2604          	jrne	L5511
3043  0b3b a601          	ld	a,#1
3045  0b3d 2029          	jra	L632
3046  0b3f               L5511:
3047                     ; 758   else if ((Uptime < RF_MI_LEARN_WINDOW_MS) && (MI_Command == 0x15))
3049  0b3f ae0000        	ldw	x,#_Uptime
3050  0b42 cd0000        	call	c_ltor
3052  0b45 ae0000        	ldw	x,#L432
3053  0b48 cd0000        	call	c_lcmp
3055  0b4b 241d          	jruge	L3611
3057  0b4d 7b05          	ld	a,(OFST+5,sp)
3058  0b4f a115          	cp	a,#21
3059  0b51 2617          	jrne	L3611
3060                     ; 760     RF_RX_MI_LearnCounter++;
3062  0b53 725c0037      	inc	_RF_RX_MI_LearnCounter
3063                     ; 761     if (RF_RX_MI_LearnCounter >= 20)          //HOLD all on for 5s
3065  0b57 c60037        	ld	a,_RF_RX_MI_LearnCounter
3066  0b5a a114          	cp	a,#20
3067  0b5c 250c          	jrult	L3611
3068                     ; 763       RF_RX_MI_ValidAddress = MI_Address;
3070  0b5e 1e01          	ldw	x,(OFST+1,sp)
3071  0b60 cf0038        	ldw	_RF_RX_MI_ValidAddress,x
3072                     ; 764       RF_RX_MI_NewRemote = TRUE;
3074  0b63 a601          	ld	a,#1
3075  0b65 c70034        	ld	_RF_RX_MI_NewRemote,a
3076                     ; 765       return TRUE;
3079  0b68               L632:
3081  0b68 85            	popw	x
3082  0b69 81            	ret	
3083  0b6a               L3611:
3084                     ; 766     } else return FALSE;
3086                     ; 769   return FALSE;
3089  0b6a 4f            	clr	a
3091  0b6b 20fb          	jra	L632
3145                     ; 773 void RF_RX_Command(uint8_t *RX_Buffer, int8_t Length)
3145                     ; 774 {
3146                     	switch	.text
3147  0b6d               _RF_RX_Command:
3149  0b6d 89            	pushw	x
3150  0b6e 89            	pushw	x
3151       00000002      OFST:	set	2
3154                     ; 778     if (RX_Buffer[0] == RF_NODEID)
3156  0b6f f6            	ld	a,(x)
3157  0b70 c1005e        	cp	a,_RF_NODEID
3158  0b73 2664          	jrne	L1121
3159                     ; 780         Item =  RX_Buffer[3];
3161  0b75 e603          	ld	a,(3,x)
3162  0b77 6b02          	ld	(OFST+0,sp),a
3164                     ; 781         Size =  RX_Buffer[2]%16;
3166                     ; 783         if ( Item == 1)
3168  0b79 a101          	cp	a,#1
3169  0b7b 2620          	jrne	L3121
3170                     ; 785           Main_Config = RX_Buffer[4]*256 + RX_Buffer[5];
3172  0b7d e604          	ld	a,(4,x)
3173  0b7f 5f            	clrw	x
3174  0b80 97            	ld	xl,a
3175  0b81 1603          	ldw	y,(OFST+1,sp)
3176  0b83 4f            	clr	a
3177  0b84 90eb05        	add	a,(5,y)
3178  0b87 2401          	jrnc	L242
3179  0b89 5c            	incw	x
3180  0b8a               L242:
3181  0b8a c70001        	ld	_Main_Config+1,a
3182  0b8d 9f            	ld	a,xl
3183  0b8e c70000        	ld	_Main_Config,a
3184                     ; 787           RF_SetNodeID(RX_Buffer[7]);
3186  0b91 1e03          	ldw	x,(OFST+1,sp)
3187  0b93 e607          	ld	a,(7,x)
3188  0b95 cd0000        	call	_RF_SetNodeID
3190                     ; 788           EE_Store_Config();
3192  0b98 cd0000        	call	_EE_Store_Config
3194  0b9b 7b02          	ld	a,(OFST+0,sp)
3195  0b9d               L3121:
3196                     ; 790         if ( Item == 2)
3198  0b9d a102          	cp	a,#2
3199  0b9f 2638          	jrne	L1121
3200                     ; 792           GR_CW_Set(0, RX_Buffer[4]<<24 + RX_Buffer[5]<<16 + RX_Buffer[6]<<8 + RX_Buffer[7]);
3202  0ba1 1e03          	ldw	x,(OFST+1,sp)
3203  0ba3 e604          	ld	a,(4,x)
3204  0ba5 5f            	clrw	x
3205  0ba6 1603          	ldw	y,(OFST+1,sp)
3206  0ba8 97            	ld	xl,a
3207  0ba9 90e605        	ld	a,(5,y)
3208  0bac ab18          	add	a,#24
3209  0bae 2704          	jreq	L252
3210  0bb0               L452:
3211  0bb0 58            	sllw	x
3212  0bb1 4a            	dec	a
3213  0bb2 26fc          	jrne	L452
3214  0bb4               L252:
3215  0bb4 90e606        	ld	a,(6,y)
3216  0bb7 ab10          	add	a,#16
3217  0bb9 2704          	jreq	L652
3218  0bbb               L062:
3219  0bbb 58            	sllw	x
3220  0bbc 4a            	dec	a
3221  0bbd 26fc          	jrne	L062
3222  0bbf               L652:
3223  0bbf 90e607        	ld	a,(7,y)
3224  0bc2 ab08          	add	a,#8
3225  0bc4 2704          	jreq	L262
3226  0bc6               L462:
3227  0bc6 58            	sllw	x
3228  0bc7 4a            	dec	a
3229  0bc8 26fc          	jrne	L462
3230  0bca               L262:
3231  0bca cd0000        	call	c_itolx
3233  0bcd be02          	ldw	x,c_lreg+2
3234  0bcf 89            	pushw	x
3235  0bd0 be00          	ldw	x,c_lreg
3236  0bd2 89            	pushw	x
3237  0bd3 4f            	clr	a
3238  0bd4 cd0000        	call	_GR_CW_Set
3240  0bd7 5b04          	addw	sp,#4
3241  0bd9               L1121:
3242                     ; 795 }
3245  0bd9 5b04          	addw	sp,#4
3246  0bdb 81            	ret	
3442                     	xref	_Uptime
3443                     	xref	_RF_TX_MotionRadar
3444                     	xref	_RF_TX_MotionIR
3445                     	xref	_AD_AirQuality
3446                     	xref	_AD_LDR_LUXD50
3447                     	xref	_AD_NTC_TempX5
3448                     	xref	_LED_LastSaved_WW
3449                     	xref	_LED_LastSaved_CW
3450                     	xref	_LED_Target_WW
3451                     	xref	_LED_Target_CW
3452                     	xref	_Conf_LED_Max_Brightness
3453                     	xref	_Main_Config
3454                     	xref	_Main_State
3455                     	xref	_RF_TX_Timer
3456                     	xref	_LED_Fade_Timer
3457                     	switch	.bss
3458  0000               _RF_TX_MotionAlarm_Sent:
3459  0000 00            	ds.b	1
3460                     	xdef	_RF_TX_MotionAlarm_Sent
3461  0001               _RF_RX_Motion:
3462  0001 00            	ds.b	1
3463                     	xdef	_RF_RX_Motion
3464  0002               _RF_TX_DataTX:
3465  0002 000000000000  	ds.b	18
3466                     	xdef	_RF_TX_DataTX
3467  0014               _RF_RX_DataRX:
3468  0014 000000000000  	ds.b	18
3469                     	xdef	_RF_RX_DataRX
3470  0026               _RF_TX_Lenght:
3471  0026 00            	ds.b	1
3472                     	xdef	_RF_TX_Lenght
3473  0027               _RF_RX_Lenght:
3474  0027 00            	ds.b	1
3475                     	xdef	_RF_RX_Lenght
3476  0028               _RF_RX_LED_GroupEnabled:
3477  0028 00000000      	ds.b	4
3478                     	xdef	_RF_RX_LED_GroupEnabled
3479  002c               _RF_RX_LED_MotionAct:
3480  002c 00000000      	ds.b	4
3481                     	xdef	_RF_RX_LED_MotionAct
3482  0030               _RF_RX_LED_NightMode:
3483  0030 00000000      	ds.b	4
3484                     	xdef	_RF_RX_LED_NightMode
3485  0034               _RF_RX_MI_NewRemote:
3486  0034 00            	ds.b	1
3487                     	xdef	_RF_RX_MI_NewRemote
3488  0035               _RF_RX_MI_PrevCommand:
3489  0035 00            	ds.b	1
3490                     	xdef	_RF_RX_MI_PrevCommand
3491  0036               _RF_RX_MI_FirstPress:
3492  0036 00            	ds.b	1
3493                     	xdef	_RF_RX_MI_FirstPress
3494  0037               _RF_RX_MI_LearnCounter:
3495  0037 00            	ds.b	1
3496                     	xdef	_RF_RX_MI_LearnCounter
3497  0038               _RF_RX_MI_ValidAddress:
3498  0038 0000          	ds.b	2
3499                     	xdef	_RF_RX_MI_ValidAddress
3500  003a               _RF_RX_MI_LastCounter:
3501  003a 00            	ds.b	1
3502                     	xdef	_RF_RX_MI_LastCounter
3503  003b               _RF_TX_Counter:
3504  003b 00            	ds.b	1
3505                     	xdef	_RF_TX_Counter
3506  003c               _RF_TX_Buffer:
3507  003c 000000000000  	ds.b	17
3508                     	xdef	_RF_TX_Buffer
3509  004d               _RF_RX_Buffer:
3510  004d 000000000000  	ds.b	17
3511                     	xdef	_RF_RX_Buffer
3512  005e               _RF_NODEID:
3513  005e 00            	ds.b	1
3514                     	xdef	_RF_NODEID
3515                     	xref	_EE_Store_Config
3516                     	xref	_GR_CW_Set
3517                     	xref	_Serial_Send_PWM_Bright
3518                     	xref	_Serial_Send_PWM_NightEN
3519                     	xref	_Serial_Send_PWM_MotionEN
3520                     	xref	_Serial_Send_PWM_Onoff
3521                     	xref	_LT8900_readRegister
3522                     	xref	_LT8900_read
3523                     	xref	_LT8900_sendPacket
3524                     	xref	_LT8900_available
3525                     	xref	_LT8900_startListening
3526                     	xref	_LT8900_setChannel
3527                     	xref	_LT8900_InitRegisters
3528                     	xdef	_RF_TX_Handle
3529                     	xdef	_RF_TX_BuildBuffer
3530                     	xdef	_RF_TX_BuildMotionAlarm
3531                     	xdef	_RF_TX_BuildPeriodic
3532                     	xdef	_RF_RX_Check_LT8900
3533                     	xdef	_RF_RX_MI_ChkAddress
3534                     	xdef	_RF_RX_Command
3535                     	xdef	_RF_RX_MIRemote
3536                     	xdef	_RF_RX_Handle
3537                     	xdef	_RF_GetNodeID
3538                     	xdef	_RF_SetNodeID
3539                     	xref	_GPIO_WriteLow
3540                     	xref	_GPIO_WriteHigh
3541                     	xref.b	c_lreg
3561                     	xref	c_itolx
3562                     	xref	c_lcmp
3563                     	xref	c_ltor
3564                     	end
