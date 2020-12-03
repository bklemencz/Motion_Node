   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
   4                     ; Optimizer V4.4.11 - 19 Nov 2019
  19                     	switch	.data
  20  0000               _ActChannel:
  21  0000 4a            	dc.b	74
  55                     ; 6 void LT8900_Init(void) {
  57                     	switch	.text
  58  0000               _LT8900_Init:
  62                     ; 9   GPIO_Init(LT8900_PKT_GPIO_PORT, LT8900_PKT_PIN, GPIO_MODE_IN_FL_NO_IT);
  64  0000 4b00          	push	#0
  65  0002 4b10          	push	#16
  66  0004 ae500a        	ldw	x,#20490
  67  0007 cd0000        	call	_GPIO_Init
  69  000a 85            	popw	x
  70                     ; 10   GPIO_Init(LT8900_NCS_GPIO_PORT, LT8900_NCS_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
  72  000b 4bf0          	push	#240
  73  000d 4b20          	push	#32
  74  000f ae5014        	ldw	x,#20500
  75  0012 cd0000        	call	_GPIO_Init
  77  0015 85            	popw	x
  78                     ; 11   GPIO_WriteHigh(LT8900_NCS_GPIO_PORT,(GPIO_Pin_TypeDef) LT8900_NCS_PIN);                        //deselect lt8900
  80  0016 4b20          	push	#32
  81  0018 ae5014        	ldw	x,#20500
  82  001b cd0000        	call	_GPIO_WriteHigh
  84  001e 84            	pop	a
  85                     ; 13   SPI_DeInit();
  87  001f cd0000        	call	_SPI_DeInit
  89                     ; 15   SPI_Init(SPI_FIRSTBIT_MSB, SPI_PRESC, SPI_MODE_MASTER, SPI_CLOCKPOLARITY_LOW,
  89                     ; 16            SPI_CLOCKPHASE_2EDGE, SPI_DATADIRECTION_2LINES_FULLDUPLEX, SPI_NSS_SOFT,(uint8_t)0x07);
  91  0022 4b07          	push	#7
  92  0024 4b02          	push	#2
  93  0026 4b00          	push	#0
  94  0028 4b01          	push	#1
  95  002a 4b00          	push	#0
  96  002c 4b04          	push	#4
  97  002e ae0018        	ldw	x,#24
  98  0031 cd0000        	call	_SPI_Init
 100  0034 5b06          	addw	sp,#6
 101                     ; 17   SPI_Cmd(ENABLE);
 103  0036 a601          	ld	a,#1
 105                     ; 18 }
 108  0038 cc0000        	jp	_SPI_Cmd
 136                     ; 20 void LT8900_InitRegisters(void) {
 137                     	switch	.text
 138  003b               _LT8900_InitRegisters:
 142                     ; 22 	LT8900_writeRegister(0, 0x6fe0);
 144  003b ae6fe0        	ldw	x,#28640
 145  003e 89            	pushw	x
 146  003f 4f            	clr	a
 147  0040 cd03cd        	call	_LT8900_writeRegister
 149  0043 85            	popw	x
 150                     ; 23   LT8900_writeRegister(1, 0x5681);
 152  0044 ae5681        	ldw	x,#22145
 153  0047 89            	pushw	x
 154  0048 a601          	ld	a,#1
 155  004a cd03cd        	call	_LT8900_writeRegister
 157  004d 85            	popw	x
 158                     ; 24   LT8900_writeRegister(2, 0x6617);
 160  004e ae6617        	ldw	x,#26135
 161  0051 89            	pushw	x
 162  0052 a602          	ld	a,#2
 163  0054 cd03cd        	call	_LT8900_writeRegister
 165  0057 85            	popw	x
 166                     ; 25   LT8900_writeRegister(4, 0x9cc9);    //why does this differ from powerup (5447)
 168  0058 ae9cc9        	ldw	x,#40137
 169  005b 89            	pushw	x
 170  005c a604          	ld	a,#4
 171  005e cd03cd        	call	_LT8900_writeRegister
 173  0061 85            	popw	x
 174                     ; 26   LT8900_writeRegister(5, 0x6637);    //why does this differ from powerup (f000)
 176  0062 ae6637        	ldw	x,#26167
 177  0065 89            	pushw	x
 178  0066 a605          	ld	a,#5
 179  0068 cd03cd        	call	_LT8900_writeRegister
 181  006b 85            	popw	x
 182                     ; 27   LT8900_writeRegister(7, 0x004c);    //ch76
 184  006c ae004c        	ldw	x,#76
 185  006f cd01a7        	call	LC001
 186                     ; 28   LT8900_writeRegister(8, 0x6c90);    //power (default 71af) UNDOCUMENTED
 188  0072 ae6c90        	ldw	x,#27792
 189  0075 89            	pushw	x
 190  0076 a608          	ld	a,#8
 191  0078 cd03cd        	call	_LT8900_writeRegister
 193  007b 85            	popw	x
 194                     ; 29   LT8900_writeRegister(9, 0x1840);		//Tx Power Level Max AAAA xBBB Bxxx xxxx A:PA current Control, B:Amplifier Gain
 196  007c ae1840        	ldw	x,#6208
 197  007f 89            	pushw	x
 198  0080 a609          	ld	a,#9
 199  0082 cd03cd        	call	_LT8900_writeRegister
 201  0085 85            	popw	x
 202                     ; 32   LT8900_writeRegister(10, 0x7ffd);   //bit 0: XTAL OSC enable
 204  0086 ae7ffd        	ldw	x,#32765
 205  0089 89            	pushw	x
 206  008a a60a          	ld	a,#10
 207  008c cd03cd        	call	_LT8900_writeRegister
 209  008f 85            	popw	x
 210                     ; 33   LT8900_writeRegister(11, 0x0008);   //bit 8: Power down RSSI (0=  RSSI operates normal)
 212  0090 ae0008        	ldw	x,#8
 213  0093 89            	pushw	x
 214  0094 a60b          	ld	a,#11
 215  0096 cd03cd        	call	_LT8900_writeRegister
 217  0099 85            	popw	x
 218                     ; 34   LT8900_writeRegister(12, 0x0000);
 220  009a 5f            	clrw	x
 221  009b 89            	pushw	x
 222  009c a60c          	ld	a,#12
 223  009e cd03cd        	call	_LT8900_writeRegister
 225  00a1 85            	popw	x
 226                     ; 35   LT8900_writeRegister(13, 0x48bd);   //(default 4855)
 228  00a2 ae48bd        	ldw	x,#18621
 229  00a5 89            	pushw	x
 230  00a6 a60d          	ld	a,#13
 231  00a8 cd03cd        	call	_LT8900_writeRegister
 233  00ab 85            	popw	x
 234                     ; 37   LT8900_writeRegister(22, 0x00ff);
 236  00ac ae00ff        	ldw	x,#255
 237  00af 89            	pushw	x
 238  00b0 a616          	ld	a,#22
 239  00b2 cd03cd        	call	_LT8900_writeRegister
 241  00b5 85            	popw	x
 242                     ; 38   LT8900_writeRegister(23, 0x8005);  //bit 2: Calibrate VCO before each Rx/Tx enable
 244  00b6 ae8005        	ldw	x,#32773
 245  00b9 89            	pushw	x
 246  00ba a617          	ld	a,#23
 247  00bc cd03cd        	call	_LT8900_writeRegister
 249  00bf 85            	popw	x
 250                     ; 39   LT8900_writeRegister(24, 0x0067);
 252  00c0 ae0067        	ldw	x,#103
 253  00c3 89            	pushw	x
 254  00c4 a618          	ld	a,#24
 255  00c6 cd03cd        	call	_LT8900_writeRegister
 257  00c9 85            	popw	x
 258                     ; 40   LT8900_writeRegister(25, 0x1659);
 260  00ca ae1659        	ldw	x,#5721
 261  00cd 89            	pushw	x
 262  00ce a619          	ld	a,#25
 263  00d0 cd03cd        	call	_LT8900_writeRegister
 265  00d3 85            	popw	x
 266                     ; 41   LT8900_writeRegister(26, 0x19e0);
 268  00d4 ae19e0        	ldw	x,#6624
 269  00d7 89            	pushw	x
 270  00d8 a61a          	ld	a,#26
 271  00da cd03cd        	call	_LT8900_writeRegister
 273  00dd 85            	popw	x
 274                     ; 42   LT8900_writeRegister(27, 0x1300);  //bits 5:0, Crystal Frequency adjust
 276  00de ae1300        	ldw	x,#4864
 277  00e1 89            	pushw	x
 278  00e2 a61b          	ld	a,#27
 279  00e4 cd03cd        	call	_LT8900_writeRegister
 281  00e7 85            	popw	x
 282                     ; 43   LT8900_writeRegister(28, 0x1800);
 284  00e8 ae1800        	ldw	x,#6144
 285  00eb 89            	pushw	x
 286  00ec a61c          	ld	a,#28
 287  00ee cd03cd        	call	_LT8900_writeRegister
 289  00f1 85            	popw	x
 290                     ; 46   LT8900_writeRegister(32, 0x4800);  //AAABBCCCDDEEFFFG  A preamble length, B, syncword length, c trailer length, d packet type
 292  00f2 ae4800        	ldw	x,#18432
 293  00f5 89            	pushw	x
 294  00f6 a620          	ld	a,#32
 295  00f8 cd03cd        	call	_LT8900_writeRegister
 297  00fb 85            	popw	x
 298                     ; 50   LT8900_writeRegister(33, 0x3fc7);
 300  00fc ae3fc7        	ldw	x,#16327
 301  00ff 89            	pushw	x
 302  0100 a621          	ld	a,#33
 303  0102 cd03cd        	call	_LT8900_writeRegister
 305  0105 85            	popw	x
 306                     ; 51   LT8900_writeRegister(34, 0x2000);  //
 308  0106 ae2000        	ldw	x,#8192
 309  0109 89            	pushw	x
 310  010a a622          	ld	a,#34
 311  010c cd03cd        	call	_LT8900_writeRegister
 313  010f 85            	popw	x
 314                     ; 52   LT8900_writeRegister(35, 0x0300);  //POWER mode,  bit 8/9 on = retransmit = 3x (default)
 316  0110 ae0300        	ldw	x,#768
 317  0113 89            	pushw	x
 318  0114 a623          	ld	a,#35
 319  0116 cd03cd        	call	_LT8900_writeRegister
 321  0119 85            	popw	x
 322                     ; 55     LT8900_writeRegister(36, 0x050A);
 324  011a ae050a        	ldw	x,#1290
 325  011d 89            	pushw	x
 326  011e a624          	ld	a,#36
 327  0120 cd03cd        	call	_LT8900_writeRegister
 329  0123 85            	popw	x
 330                     ; 56     LT8900_writeRegister(37, 0x0000);
 332  0124 5f            	clrw	x
 333  0125 89            	pushw	x
 334  0126 a625          	ld	a,#37
 335  0128 cd03cd        	call	_LT8900_writeRegister
 337  012b 85            	popw	x
 338                     ; 57     LT8900_writeRegister(38, 0x0000);
 340  012c 5f            	clrw	x
 341  012d 89            	pushw	x
 342  012e a626          	ld	a,#38
 343  0130 cd03cd        	call	_LT8900_writeRegister
 345  0133 85            	popw	x
 346                     ; 58     LT8900_writeRegister(39, 0x55AA);
 348  0134 ae55aa        	ldw	x,#21930
 349  0137 89            	pushw	x
 350  0138 a627          	ld	a,#39
 351  013a cd03cd        	call	_LT8900_writeRegister
 353  013d 85            	popw	x
 354                     ; 60   LT8900_writeRegister(40, 0x4402);  //max allowed error bits = 0 (01 = 0 error bits)
 356  013e ae4402        	ldw	x,#17410
 357  0141 89            	pushw	x
 358  0142 a628          	ld	a,#40
 359  0144 cd03cd        	call	_LT8900_writeRegister
 361  0147 85            	popw	x
 362                     ; 61   LT8900_writeRegister(41, 0xB000);
 364  0148 aeb000        	ldw	x,#45056
 365  014b 89            	pushw	x
 366  014c a629          	ld	a,#41
 367  014e cd03cd        	call	_LT8900_writeRegister
 369  0151 85            	popw	x
 370                     ; 64   LT8900_writeRegister(42, 0xfdb0);
 372  0152 aefdb0        	ldw	x,#64944
 373  0155 89            	pushw	x
 374  0156 a62a          	ld	a,#42
 375  0158 cd03cd        	call	_LT8900_writeRegister
 377  015b 85            	popw	x
 378                     ; 65   LT8900_writeRegister(43, 0x000f);
 380  015c ae000f        	ldw	x,#15
 381  015f 89            	pushw	x
 382  0160 a62b          	ld	a,#43
 383  0162 cd03cd        	call	_LT8900_writeRegister
 385  0165 85            	popw	x
 386                     ; 67 	LT8900_writeRegister(44,0x0100);		//set datarate to 1M
 388  0166 ae0100        	ldw	x,#256
 389  0169 89            	pushw	x
 390  016a a62c          	ld	a,#44
 391  016c cd03cd        	call	_LT8900_writeRegister
 393  016f 85            	popw	x
 394                     ; 68 	LT8900_writeRegister(45,0x0152);		//Option: 0x0152 or 0x0080 for 1M, 0x0552 for 250k,125k and 62.5k
 396  0170 ae0152        	ldw	x,#338
 397  0173 89            	pushw	x
 398  0174 a62d          	ld	a,#45
 399  0176 cd03cd        	call	_LT8900_writeRegister
 401  0179 a601          	ld	a,#1
 402  017b 85            	popw	x
 403                     ; 70   LT8900_setDataRate(1);
 405  017c cd032a        	call	_LT8900_setDataRate
 407                     ; 74   LT8900_writeRegister(R_FIFO, 0x0000);  //TXRX_FIFO_REG (FIFO queue)
 409  017f 5f            	clrw	x
 410  0180 89            	pushw	x
 411  0181 a632          	ld	a,#50
 412  0183 cd03cd        	call	_LT8900_writeRegister
 414  0186 85            	popw	x
 415                     ; 76   LT8900_writeRegister(R_FIFO_CONTROL, 0x8080); //Fifo Rx/Tx queue reset
 417  0187 ae8080        	ldw	x,#32896
 418  018a 89            	pushw	x
 419  018b a634          	ld	a,#52
 420  018d cd03cd        	call	_LT8900_writeRegister
 422  0190 85            	popw	x
 423                     ; 78   _delay_ms(2);
 425  0191 ae0002        	ldw	x,#2
 426  0194 cd0000        	call	__delay_ms
 428                     ; 79   LT8900_writeRegister(R_CHANNEL, _BV(CHANNEL_TX_BIT));  //set TX mode.  (TX = bit 8, RX = bit 7, so RX would be 0x0080)
 430  0197 ae0100        	ldw	x,#256
 431  019a ad0b          	call	LC001
 432                     ; 80   _delay_ms(2);
 434  019c ae0002        	ldw	x,#2
 435  019f cd0000        	call	__delay_ms
 437                     ; 81   LT8900_writeRegister(R_CHANNEL, ActChannel);  // Frequency = 2402 + channel
 439  01a2 c60000        	ld	a,_ActChannel
 440  01a5 5f            	clrw	x
 441  01a6 97            	ld	xl,a
 442                     ; 82 }
 445  01a7               LC001:
 446  01a7 89            	pushw	x
 447  01a8 a607          	ld	a,#7
 448  01aa cd03cd        	call	_LT8900_writeRegister
 450  01ad 85            	popw	x
 451  01ae 81            	ret	
 478                     ; 84 void LT8900_startListening(void) {
 479                     	switch	.text
 480  01af               _LT8900_startListening:
 484                     ; 85   LT8900_writeRegister(R_CHANNEL, ActChannel & CHANNEL_MASK);   //turn off rx/tx
 486  01af c60000        	ld	a,_ActChannel
 487  01b2 a47f          	and	a,#127
 488  01b4 5f            	clrw	x
 489  01b5 02            	rlwa	x,a
 490  01b6 89            	pushw	x
 491  01b7 a607          	ld	a,#7
 492  01b9 cd03cd        	call	_LT8900_writeRegister
 494  01bc 85            	popw	x
 495                     ; 86   _delay_ms(3);
 497  01bd ae0003        	ldw	x,#3
 498  01c0 cd0000        	call	__delay_ms
 500                     ; 87   LT8900_writeRegister(R_FIFO_CONTROL, 0x8080);  //flush rx
 502  01c3 ae8080        	ldw	x,#32896
 503  01c6 89            	pushw	x
 504  01c7 a634          	ld	a,#52
 505  01c9 cd03cd        	call	_LT8900_writeRegister
 507  01cc c60000        	ld	a,_ActChannel
 508  01cf 85            	popw	x
 509                     ; 88   LT8900_writeRegister(R_CHANNEL,  (ActChannel & CHANNEL_MASK) | _BV(CHANNEL_RX_BIT));   //enable RX
 511  01d0 5f            	clrw	x
 512  01d1 aa80          	or	a,#128
 513  01d3 02            	rlwa	x,a
 514  01d4 89            	pushw	x
 515  01d5 a607          	ld	a,#7
 516  01d7 cd03cd        	call	_LT8900_writeRegister
 518  01da 85            	popw	x
 519                     ; 90 }
 522  01db 81            	ret	
 567                     ; 92 bool LT8900_available(void) {
 568                     	switch	.text
 569  01dc               _LT8900_available:
 573                     ; 95   if (GPIO_ReadInputPin(LT8900_PKT_GPIO_PORT, (GPIO_Pin_TypeDef) LT8900_PKT_PIN) != 0)
 575  01dc 4b10          	push	#16
 576  01de ae500a        	ldw	x,#20490
 577  01e1 cd0000        	call	_GPIO_ReadInputPin
 579  01e4 5b01          	addw	sp,#1
 580  01e6 4d            	tnz	a
 581  01e7 2702          	jreq	L36
 582                     ; 97     return TRUE;
 584  01e9 a601          	ld	a,#1
 587  01eb               L36:
 588                     ; 100   return FALSE;
 592  01eb 81            	ret	
 626                     ; 103 bool LT8900_available_R(void)
 626                     ; 104 {
 627                     	switch	.text
 628  01ec               _LT8900_available_R:
 630  01ec 89            	pushw	x
 631       00000002      OFST:	set	2
 634                     ; 106   status_val = LT8900_readRegister(R_STATUS);
 636  01ed a630          	ld	a,#48
 637  01ef cd0362        	call	_LT8900_readRegister
 639  01f2 1f01          	ldw	(OFST-1,sp),x
 641                     ; 107   if (bitRead(status_val,STATUS_PKT_FLAG) == TRUE)
 643  01f4 a606          	ld	a,#6
 644  01f6               L661:
 645  01f6 54            	srlw	x
 646  01f7 4a            	dec	a
 647  01f8 26fc          	jrne	L661
 648  01fa 01            	rrwa	x,a
 649  01fb a401          	and	a,#1
 650  01fd 5f            	clrw	x
 651  01fe 97            	ld	xl,a
 652  01ff 5a            	decw	x
 653  0200 2604          	jrne	L101
 654                     ; 109         return TRUE;
 656  0202 a601          	ld	a,#1
 658  0204 2001          	jra	L071
 659  0206               L101:
 660                     ; 112   return FALSE;
 662  0206 4f            	clr	a
 664  0207               L071:
 666  0207 85            	popw	x
 667  0208 81            	ret	
 702                     ; 115 void LT8900_softReset(void)
 702                     ; 116 {
 703                     	switch	.text
 704  0209               _LT8900_softReset:
 706  0209 89            	pushw	x
 707       00000002      OFST:	set	2
 710                     ; 118   status = LT8900_readRegister(R_POWER_MODE);
 712  020a a623          	ld	a,#35
 713  020c cd0362        	call	_LT8900_readRegister
 715  020f 1f01          	ldw	(OFST-1,sp),x
 717                     ; 119   LT8900_writeRegister(R_POWER_MODE,status | POWER_DOWN_ENABLE);
 719  0211 02            	rlwa	x,a
 720  0212 aa80          	or	a,#128
 721  0214 01            	rrwa	x,a
 722  0215 ad0b          	call	LC002
 724                     ; 121   LT8900_writeRegister(R_POWER_MODE,status & POWER_DOWN_DISABLE);
 726  0217 7b01          	ld	a,(OFST-1,sp)
 727  0219 a470          	and	a,#112
 728  021b 97            	ld	xl,a
 729  021c 4f            	clr	a
 730  021d 02            	rlwa	x,a
 731  021e ad02          	call	LC002
 733                     ; 123 }
 736  0220 85            	popw	x
 737  0221 81            	ret	
 738  0222               LC002:
 739  0222 89            	pushw	x
 740  0223 a623          	ld	a,#35
 741  0225 cd03cd        	call	_LT8900_writeRegister
 743  0228 85            	popw	x
 744                     ; 120   _delay_ms(20);
 746  0229 ae0014        	ldw	x,#20
 747  022c cc0000        	jp	__delay_ms
 819                     ; 125 int LT8900_read(uint8_t *buffer, uint8_t maxBuffer) {
 820                     	switch	.text
 821  022f               _LT8900_read:
 823  022f 89            	pushw	x
 824  0230 5204          	subw	sp,#4
 825       00000004      OFST:	set	4
 828                     ; 127 	uint8_t pos =0, packetSize;
 830  0232 0f02          	clr	(OFST-2,sp)
 832                     ; 128   status_val = LT8900_readRegister(R_STATUS);
 834  0234 a630          	ld	a,#48
 835  0236 cd0362        	call	_LT8900_readRegister
 837  0239 1f03          	ldw	(OFST-1,sp),x
 839                     ; 129   if (bitRead(status_val, STATUS_CRC_BIT) == FALSE)
 841  023b 58            	sllw	x
 842  023c 5f            	clrw	x
 843  023d 59            	rlcw	x
 844  023e 264f          	jrne	L151
 845                     ; 133     data = LT8900_readRegister(R_FIFO);
 847  0240 a632          	ld	a,#50
 848  0242 cd0362        	call	_LT8900_readRegister
 850  0245 1f03          	ldw	(OFST-1,sp),x
 852                     ; 134     packetSize = data >> 8;
 854  0247 7b03          	ld	a,(OFST-1,sp)
 855  0249 6b01          	ld	(OFST-3,sp),a
 857                     ; 135     if(maxBuffer < packetSize+1)
 859  024b 5f            	clrw	x
 860  024c 97            	ld	xl,a
 861  024d 5c            	incw	x
 862  024e 7b09          	ld	a,(OFST+5,sp)
 863  0250 905f          	clrw	y
 864  0252 9097          	ld	yl,a
 865  0254 90bf00        	ldw	c_y,y
 866  0257 b300          	cpw	x,c_y
 867  0259 2d1b          	jrsle	L161
 868                     ; 137 			LT8900_startListening();
 870  025b cd01af        	call	_LT8900_startListening
 872                     ; 139         return -2;
 874  025e aefffe        	ldw	x,#65534
 876  0261 2029          	jra	L022
 877                     ; 143     buffer[pos++] = (data & 0xFF);
 879  0263               L551:
 880                     ; 146       data = LT8900_readRegister(R_FIFO);
 882  0263 a632          	ld	a,#50
 883  0265 cd0362        	call	_LT8900_readRegister
 885  0268 1f03          	ldw	(OFST-1,sp),x
 887                     ; 147       buffer[pos++] = data >> 8;
 889  026a 7b02          	ld	a,(OFST-2,sp)
 890  026c 0c02          	inc	(OFST-2,sp)
 892  026e 5f            	clrw	x
 893  026f 97            	ld	xl,a
 894  0270 72fb05        	addw	x,(OFST+1,sp)
 895  0273 7b03          	ld	a,(OFST-1,sp)
 896  0275 f7            	ld	(x),a
 897                     ; 148       buffer[pos++] = data & 0xFF;
 899  0276               L161:
 901  0276 7b02          	ld	a,(OFST-2,sp)
 902  0278 0c02          	inc	(OFST-2,sp)
 904  027a 5f            	clrw	x
 905  027b 97            	ld	xl,a
 906  027c 72fb05        	addw	x,(OFST+1,sp)
 907  027f 7b04          	ld	a,(OFST+0,sp)
 908  0281 f7            	ld	(x),a
 909                     ; 144     while (pos < packetSize)
 911  0282 7b02          	ld	a,(OFST-2,sp)
 912  0284 1101          	cp	a,(OFST-3,sp)
 913  0286 25db          	jrult	L551
 914                     ; 152     return packetSize;
 916  0288 7b01          	ld	a,(OFST-3,sp)
 917  028a 5f            	clrw	x
 918  028b 97            	ld	xl,a
 920  028c               L022:
 922  028c 5b06          	addw	sp,#6
 923  028e 81            	ret	
 924  028f               L151:
 925                     ; 157     return -1;
 927  028f aeffff        	ldw	x,#65535
 929  0292 20f8          	jra	L022
 998                     ; 161 bool LT8900_sendPacket(uint8_t *data, uint8_t packetSize)
 998                     ; 162 {
 999                     	switch	.text
1000  0294               _LT8900_sendPacket:
1002  0294 89            	pushw	x
1003  0295 5203          	subw	sp,#3
1004       00000003      OFST:	set	3
1007                     ; 163 	uint8_t pos = 0;
1009  0297 0f03          	clr	(OFST+0,sp)
1011                     ; 164   if (packetSize < 1 || packetSize > 255)
1013  0299 7b08          	ld	a,(OFST+5,sp)
1014                     ; 166     return FALSE;
1017  029b 277b          	jreq	L642
1018                     ; 169   LT8900_writeRegister(R_CHANNEL, 0x0000);
1020  029d 5f            	clrw	x
1021  029e 89            	pushw	x
1022  029f a607          	ld	a,#7
1023  02a1 cd03cd        	call	_LT8900_writeRegister
1025  02a4 85            	popw	x
1026                     ; 170   LT8900_writeRegister(R_FIFO_CONTROL, 0x8000);  //flush tx
1028  02a5 ae8000        	ldw	x,#32768
1029  02a8 89            	pushw	x
1030  02a9 a634          	ld	a,#52
1031  02ab cd03cd        	call	_LT8900_writeRegister
1033  02ae 85            	popw	x
1034                     ; 171   _delay_us(10);
1036  02af ae000a        	ldw	x,#10
1037  02b2 cd0000        	call	__delay_us
1039                     ; 176   LT8900_writeRegister2(R_FIFO, packetSize, data[pos++]);
1041  02b5 7b03          	ld	a,(OFST+0,sp)
1042  02b7 0c03          	inc	(OFST+0,sp)
1044  02b9 5f            	clrw	x
1045  02ba 97            	ld	xl,a
1046  02bb 72fb04        	addw	x,(OFST+1,sp)
1047  02be f6            	ld	a,(x)
1048  02bf 88            	push	a
1049  02c0 7b09          	ld	a,(OFST+6,sp)
1052  02c2 2019          	jra	L122
1053  02c4               L712:
1054                     ; 179     uint8_t msb = data[pos++];
1056  02c4 0c03          	inc	(OFST+0,sp)
1058  02c6 5f            	clrw	x
1059  02c7 97            	ld	xl,a
1060  02c8 72fb04        	addw	x,(OFST+1,sp)
1061  02cb f6            	ld	a,(x)
1062  02cc 6b01          	ld	(OFST-2,sp),a
1064                     ; 180     uint8_t lsb = data[pos++];
1066  02ce 7b03          	ld	a,(OFST+0,sp)
1067  02d0 0c03          	inc	(OFST+0,sp)
1069  02d2 5f            	clrw	x
1070  02d3 97            	ld	xl,a
1071  02d4 72fb04        	addw	x,(OFST+1,sp)
1072  02d7 f6            	ld	a,(x)
1073  02d8 6b02          	ld	(OFST-1,sp),a
1075                     ; 182     LT8900_writeRegister2(R_FIFO, msb, lsb);
1077  02da 88            	push	a
1078  02db 7b02          	ld	a,(OFST-1,sp)
1080  02dd               L122:
1081  02dd ae3200        	ldw	x,#12800
1082  02e0 97            	ld	xl,a
1083  02e1 cd03e4        	call	_LT8900_writeRegister2
1084  02e4 84            	pop	a
1085                     ; 177   while (pos < packetSize)
1087  02e5 7b03          	ld	a,(OFST+0,sp)
1088  02e7 1108          	cp	a,(OFST+5,sp)
1089  02e9 25d9          	jrult	L712
1090                     ; 185 	_delay_us(10);
1092  02eb ae000a        	ldw	x,#10
1093  02ee cd0000        	call	__delay_us
1095                     ; 186   LT8900_writeRegister(R_CHANNEL,  (ActChannel & CHANNEL_MASK) | _BV(CHANNEL_TX_BIT));   //enable TX
1097  02f1 c60000        	ld	a,_ActChannel
1098  02f4 a47f          	and	a,#127
1099  02f6 5f            	clrw	x
1100  02f7 97            	ld	xl,a
1101  02f8 02            	rlwa	x,a
1102  02f9 aa01          	or	a,#1
1103  02fb 01            	rrwa	x,a
1104  02fc 89            	pushw	x
1105  02fd a607          	ld	a,#7
1106  02ff cd03cd        	call	_LT8900_writeRegister
1108  0302 85            	popw	x
1109                     ; 187   _delay_us(10);
1111  0303 ae000a        	ldw	x,#10
1112  0306 cd0000        	call	__delay_us
1115  0309               L722:
1116                     ; 189   while (GPIO_ReadInputPin(LT8900_PKT_GPIO_PORT, (GPIO_Pin_TypeDef) LT8900_PKT_PIN) == 0)
1118  0309 4b10          	push	#16
1119  030b ae500a        	ldw	x,#20490
1120  030e cd0000        	call	_GPIO_ReadInputPin
1122  0311 5b01          	addw	sp,#1
1123  0313 4d            	tnz	a
1124  0314 27f3          	jreq	L722
1125                     ; 194   return TRUE;
1127  0316 a601          	ld	a,#1
1129  0318               L642:
1131  0318 5b05          	addw	sp,#5
1132  031a 81            	ret	
1166                     ; 197 void LT8900_setChannel(uint8_t channel){
1167                     	switch	.text
1168  031b               _LT8900_setChannel:
1172                     ; 198   ActChannel = channel;
1174  031b c70000        	ld	_ActChannel,a
1175                     ; 199   LT8900_writeRegister(R_CHANNEL,  (channel & CHANNEL_MASK));
1177  031e a47f          	and	a,#127
1178  0320 5f            	clrw	x
1179  0321 02            	rlwa	x,a
1180  0322 89            	pushw	x
1181  0323 a607          	ld	a,#7
1182  0325 cd03cd        	call	_LT8900_writeRegister
1184  0328 85            	popw	x
1185                     ; 200 }
1188  0329 81            	ret	
1230                     ; 202 bool LT8900_setDataRate(uint8_t rate) {
1231                     	switch	.text
1232  032a               _LT8900_setDataRate:
1234  032a 89            	pushw	x
1235       00000002      OFST:	set	2
1238                     ; 205   switch (rate)
1241                     ; 219     default:
1241                     ; 220       return FALSE;
1242  032b 4a            	dec	a
1243  032c 270b          	jreq	L742
1244  032e 4a            	dec	a
1245  032f 270d          	jreq	L152
1246  0331 4a            	dec	a
1247  0332 270f          	jreq	L352
1248  0334 4a            	dec	a
1249  0335 2711          	jreq	L552
1252  0337 2026          	jp	L303
1253  0339               L742:
1254                     ; 207     case 1:
1254                     ; 208       newValue = DATARATE_1MBPS;
1256  0339 ae0100        	ldw	x,#256
1257                     ; 209       break;
1259  033c 200d          	jra	L103
1260  033e               L152:
1261                     ; 210     case 2:
1261                     ; 211       newValue = DATARATE_250KBPS;
1263  033e ae0400        	ldw	x,#1024
1264                     ; 212       break;
1266  0341 2008          	jra	L103
1267  0343               L352:
1268                     ; 213     case 3:
1268                     ; 214       newValue = DATARATE_125KBPS;
1270  0343 ae0800        	ldw	x,#2048
1271                     ; 215       break;
1273  0346 2003          	jra	L103
1274  0348               L552:
1275                     ; 216     case 4:
1275                     ; 217       newValue = DATARATE_62KBPS;
1277  0348 ae1000        	ldw	x,#4096
1278                     ; 218       break;
1280  034b               L103:
1281  034b 1f01          	ldw	(OFST-1,sp),x
1283                     ; 223   LT8900_writeRegister(R_DATARATE, newValue);
1285  034d 89            	pushw	x
1286  034e a62c          	ld	a,#44
1287  0350 ad7b          	call	_LT8900_writeRegister
1289  0352 a62c          	ld	a,#44
1290  0354 85            	popw	x
1291                     ; 226   if (LT8900_readRegister(R_DATARATE) == newValue) return TRUE;
1293  0355 ad0b          	call	_LT8900_readRegister
1295  0357 1301          	cpw	x,(OFST-1,sp)
1296  0359 2604          	jrne	L303
1299  035b a601          	ld	a,#1
1301  035d               L262:
1303  035d 85            	popw	x
1304  035e 81            	ret	
1305  035f               L303:
1306                     ; 227     else return FALSE;
1309  035f 4f            	clr	a
1311  0360 20fb          	jra	L262
1362                     ; 230 uint16_t LT8900_readRegister(uint8_t reg) {
1363                     	switch	.text
1364  0362               _LT8900_readRegister:
1366  0362 88            	push	a
1367  0363 89            	pushw	x
1368       00000002      OFST:	set	2
1371                     ; 233   GPIO_WriteLow(LT8900_NCS_GPIO_PORT, (GPIO_Pin_TypeDef)LT8900_NCS_PIN);
1373  0364 4b20          	push	#32
1374  0366 ae5014        	ldw	x,#20500
1375  0369 cd0000        	call	_GPIO_WriteLow
1377  036c 84            	pop	a
1379  036d               L133:
1380                     ; 237   while(!(SPI->SR & (uint8_t)SPI_FLAG_TXE));
1382  036d 72035203fb    	btjf	20995,#1,L133
1383                     ; 238   SPI_SendData((REGISTER_READ | (REGISTER_MASK & reg)));
1385  0372 7b03          	ld	a,(OFST+1,sp)
1386  0374 aa80          	or	a,#128
1387  0376 cd0000        	call	_SPI_SendData
1390  0379               L733:
1391                     ; 239   while (SPI->SR & (uint8_t)SPI_FLAG_BSY);
1393  0379 720e5203fb    	btjt	20995,#7,L733
1395  037e               L543:
1396                     ; 240   while(!(SPI->SR & (uint8_t)SPI_FLAG_RXNE));
1398  037e 72015203fb    	btjf	20995,#0,L543
1399                     ; 244   SPI_ReceiveData();
1401  0383 cd0000        	call	_SPI_ReceiveData
1404  0386               L353:
1405                     ; 248   while(!(SPI->SR & (uint8_t)SPI_FLAG_TXE));
1407  0386 72035203fb    	btjf	20995,#1,L353
1408                     ; 249   SPI_SendData(0x00);
1410  038b 4f            	clr	a
1411  038c cd0000        	call	_SPI_SendData
1414  038f               L163:
1415                     ; 250   while (SPI->SR & (uint8_t)SPI_FLAG_BSY);
1417  038f 720e5203fb    	btjt	20995,#7,L163
1419  0394               L763:
1420                     ; 251   while(!(SPI->SR & (uint8_t)SPI_FLAG_RXNE));
1422  0394 72015203fb    	btjf	20995,#0,L763
1423                     ; 254   high = SPI_ReceiveData();
1425  0399 cd0000        	call	_SPI_ReceiveData
1427  039c 6b01          	ld	(OFST-1,sp),a
1430  039e               L773:
1431                     ; 257   while(!(SPI->SR & (uint8_t)SPI_FLAG_TXE));
1433  039e 72035203fb    	btjf	20995,#1,L773
1434                     ; 258   SPI_SendData(0x00);
1436  03a3 4f            	clr	a
1437  03a4 cd0000        	call	_SPI_SendData
1440  03a7               L504:
1441                     ; 259   while (SPI->SR & (uint8_t)SPI_FLAG_BSY);
1443  03a7 720e5203fb    	btjt	20995,#7,L504
1445  03ac               L314:
1446                     ; 260   while(!(SPI->SR & (uint8_t)SPI_FLAG_RXNE));
1448  03ac 72015203fb    	btjf	20995,#0,L314
1449                     ; 263   low = SPI_ReceiveData();
1451  03b1 cd0000        	call	_SPI_ReceiveData
1453  03b4 6b02          	ld	(OFST+0,sp),a
1455                     ; 266   GPIO_WriteHigh(LT8900_NCS_GPIO_PORT, (GPIO_Pin_TypeDef)LT8900_NCS_PIN);
1457  03b6 4b20          	push	#32
1458  03b8 ae5014        	ldw	x,#20500
1459  03bb cd0000        	call	_GPIO_WriteHigh
1461  03be 84            	pop	a
1462                     ; 268   return (high * 256 + low);
1464  03bf 7b01          	ld	a,(OFST-1,sp)
1465  03c1 5f            	clrw	x
1466  03c2 97            	ld	xl,a
1467  03c3 4f            	clr	a
1468  03c4 1b02          	add	a,(OFST+0,sp)
1469  03c6 2401          	jrnc	L603
1470  03c8 5c            	incw	x
1471  03c9               L603:
1472  03c9 02            	rlwa	x,a
1475  03ca 5b03          	addw	sp,#3
1476  03cc 81            	ret	
1531                     ; 271 void LT8900_writeRegister(uint8_t reg, uint16_t data) {
1532                     	switch	.text
1533  03cd               _LT8900_writeRegister:
1535  03cd 88            	push	a
1536  03ce 89            	pushw	x
1537       00000002      OFST:	set	2
1540                     ; 272   uint8_t high = data / 256;
1542  03cf 7b06          	ld	a,(OFST+4,sp)
1543  03d1 6b01          	ld	(OFST-1,sp),a
1545                     ; 273   uint8_t low = data % 256;
1547  03d3 7b07          	ld	a,(OFST+5,sp)
1548  03d5 6b02          	ld	(OFST+0,sp),a
1550                     ; 275   LT8900_writeRegister2(reg, high, low);
1552  03d7 88            	push	a
1553  03d8 7b02          	ld	a,(OFST+0,sp)
1554  03da 97            	ld	xl,a
1555  03db 7b04          	ld	a,(OFST+2,sp)
1556  03dd 95            	ld	xh,a
1557  03de ad04          	call	_LT8900_writeRegister2
1559  03e0 84            	pop	a
1560                     ; 276 }
1563  03e1 5b03          	addw	sp,#3
1564  03e3 81            	ret	
1616                     ; 278 void LT8900_writeRegister2(uint8_t reg, uint8_t high, uint8_t low) {
1617                     	switch	.text
1618  03e4               _LT8900_writeRegister2:
1620  03e4 89            	pushw	x
1621       00000000      OFST:	set	0
1624                     ; 280   GPIO_WriteLow(LT8900_NCS_GPIO_PORT, (GPIO_Pin_TypeDef)LT8900_NCS_PIN);
1626  03e5 4b20          	push	#32
1627  03e7 ae5014        	ldw	x,#20500
1628  03ea cd0000        	call	_GPIO_WriteLow
1630  03ed 84            	pop	a
1632  03ee               L364:
1633                     ; 283   while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
1635  03ee ad47          	call	LC004
1636  03f0 27fc          	jreq	L364
1637                     ; 284   SPI_SendData(REGISTER_WRITE | (REGISTER_MASK & reg));
1639  03f2 7b01          	ld	a,(OFST+1,sp)
1640  03f4 a47f          	and	a,#127
1641  03f6 cd0000        	call	_SPI_SendData
1644  03f9               L174:
1645                     ; 285   while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
1647  03f9 ad43          	call	LC005
1648  03fb 27fc          	jreq	L174
1650  03fd               L774:
1651                     ; 286   while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
1653  03fd ad46          	call	LC006
1654  03ff 27fc          	jreq	L774
1655                     ; 287   SPI_ReceiveData();
1657  0401 cd0000        	call	_SPI_ReceiveData
1660  0404               L505:
1661                     ; 291     while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
1663  0404 ad31          	call	LC004
1664  0406 27fc          	jreq	L505
1665                     ; 292     SPI_SendData(high);
1667  0408 7b02          	ld	a,(OFST+2,sp)
1668  040a cd0000        	call	_SPI_SendData
1671  040d               L315:
1672                     ; 293     while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
1674  040d ad2f          	call	LC005
1675  040f 27fc          	jreq	L315
1677  0411               L125:
1678                     ; 294     while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
1680  0411 ad32          	call	LC006
1681  0413 27fc          	jreq	L125
1682                     ; 295     SPI_ReceiveData();
1684  0415 cd0000        	call	_SPI_ReceiveData
1687  0418               L725:
1688                     ; 297     while (SPI_GetFlagStatus(SPI_FLAG_TXE)== RESET);
1690  0418 ad1d          	call	LC004
1691  041a 27fc          	jreq	L725
1692                     ; 298     SPI_SendData(low);
1694  041c 7b05          	ld	a,(OFST+5,sp)
1695  041e cd0000        	call	_SPI_SendData
1698  0421               L535:
1699                     ; 299     while (SPI_GetFlagStatus(SPI_FLAG_BSY)== SET);
1701  0421 ad1b          	call	LC005
1702  0423 27fc          	jreq	L535
1704  0425               L345:
1705                     ; 300     while (SPI_GetFlagStatus(SPI_FLAG_RXNE)== RESET);
1707  0425 ad1e          	call	LC006
1708  0427 27fc          	jreq	L345
1709                     ; 301     SPI_ReceiveData();
1711  0429 cd0000        	call	_SPI_ReceiveData
1713                     ; 304   GPIO_WriteHigh(LT8900_NCS_GPIO_PORT, (GPIO_Pin_TypeDef)LT8900_NCS_PIN);
1715  042c 4b20          	push	#32
1716  042e ae5014        	ldw	x,#20500
1717  0431 cd0000        	call	_GPIO_WriteHigh
1719                     ; 305 }
1722  0434 5b03          	addw	sp,#3
1723  0436 81            	ret	
1724  0437               LC004:
1725  0437 a602          	ld	a,#2
1726  0439 cd0000        	call	_SPI_GetFlagStatus
1728  043c 4d            	tnz	a
1729  043d 81            	ret	
1730  043e               LC005:
1731  043e a680          	ld	a,#128
1732  0440 cd0000        	call	_SPI_GetFlagStatus
1734  0443 4a            	dec	a
1735  0444 81            	ret	
1736  0445               LC006:
1737  0445 a601          	ld	a,#1
1738  0447 cd0000        	call	_SPI_GetFlagStatus
1740  044a 4d            	tnz	a
1741  044b 81            	ret	
1763                     	xdef	_ActChannel
1764                     	xdef	_LT8900_softReset
1765                     	xdef	_LT8900_setDataRate
1766                     	xdef	_LT8900_writeRegister2
1767                     	xdef	_LT8900_writeRegister
1768                     	xdef	_LT8900_readRegister
1769                     	xdef	_LT8900_read
1770                     	xdef	_LT8900_sendPacket
1771                     	xdef	_LT8900_available_R
1772                     	xdef	_LT8900_available
1773                     	xdef	_LT8900_startListening
1774                     	xdef	_LT8900_setChannel
1775                     	xdef	_LT8900_InitRegisters
1776                     	xdef	_LT8900_Init
1777                     	xref	__delay_ms
1778                     	xref	__delay_us
1779                     	xref	_SPI_GetFlagStatus
1780                     	xref	_SPI_ReceiveData
1781                     	xref	_SPI_SendData
1782                     	xref	_SPI_Cmd
1783                     	xref	_SPI_Init
1784                     	xref	_SPI_DeInit
1785                     	xref	_GPIO_ReadInputPin
1786                     	xref	_GPIO_WriteLow
1787                     	xref	_GPIO_WriteHigh
1788                     	xref	_GPIO_Init
1789                     	xref.b	c_y
1808                     	end
